local Database = require("cmp-dbee.database")

local Parser = {}

Parser.filetype = "sql"
Parser.query_cte_references = "(cte (identifier) @cte)"

function Parser.get_root()
  local bufnr = vim.api.nvim_get_current_buf()
  if vim.bo[bufnr].filetype ~= Parser.filetype then
    return nil
  end

  local ok, parser = pcall(vim.treesitter.get_parser, bufnr, Parser.filetype, {})
  if not ok then
    return nil
  end

  return parser:parse()[1]:root()
end

function Parser.get_cursor_node()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor_row = vim.api.nvim_win_get_cursor(0)[1]

  if vim.bo[bufnr].filetype ~= Parser.filetype then
    return nil
  end

  local root = Parser.get_root()
  if not root then
    return nil
  end

  for node in root:iter_children() do
    if node:type() == "statement" then
      local row_start, _, row_end, _ = node:range()
      if cursor_row >= row_start and cursor_row <= row_end + 2 then
        return node
      end
    end
  end
  return nil
end

local function get_cte_references(node)
  local captures = {}
  local query = vim.treesitter.query.parse(Parser.filetype, Parser.query_cte_references)
  local bufnr = vim.api.nvim_get_current_buf()

  for _, n in query:iter_captures(node, bufnr) do
    table.insert(captures, { cte = vim.treesitter.get_node_text(n, bufnr) })
  end

  return captures
end

local function split_object_reference(text)
  local parts = vim.split(text, ".", { plain = true })
  if #parts == 1 then
    return "", parts[1]
  end
  return parts[#parts - 1], parts[#parts]
end

local function build_table_schema_map()
  local connection_id = require("dbee.api.core").get_current_connection()
  if not connection_id then
    return {}
  end

  local structure = Database.cache[connection_id.id]
  if not structure then
    return {}
  end

  local map = {}
  for _, schema in ipairs(structure) do
    for _, model in ipairs(schema.children or {}) do
      map[model.name] = schema.name
    end
  end
  return map
end

local function get_schema_table_alias_references(node)
  local out = {}
  local bufnr = vim.api.nvim_get_current_buf()
  local table_schema_map = nil

  local query = vim.treesitter.query.parse(Parser.filetype, "(relation) @rel")
  for _, rel in query:iter_captures(node, bufnr) do
    local pending = nil

    for child in rel:iter_children() do
      local child_type = child:type()
      if child_type == "object_reference" then
        local schema, model = split_object_reference(vim.treesitter.get_node_text(child, bufnr))
        pending = { schema = schema, model = model, alias = "" }
      elseif child_type == "identifier" and pending and pending.alias == "" then
        pending.alias = vim.treesitter.get_node_text(child, bufnr)
      end
    end

    if pending then
      if pending.schema == "" then
        table_schema_map = table_schema_map or build_table_schema_map()
        pending.schema = table_schema_map[pending.model] or ""
      end
      pending.alias = pending.alias ~= "" and pending.alias or pending.model
      table.insert(out, pending)
    end
  end

  return out
end

function Parser.get_references_at_cursor()
  local current_node = Parser.get_cursor_node()
  if not current_node then
    return nil
  end

  return {
    cte_references = get_cte_references(current_node),
    schema_table_references = get_schema_table_alias_references(current_node),
  }
end

return Parser