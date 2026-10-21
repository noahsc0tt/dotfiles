return {
  'Wansmer/treesj', -- CSHARP DONE MANUALLY
  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    local lang_utils = require('treesj.langs.utils')

    local function group_pairs(tsj)
      local children = tsj:children()
      local newkids = {}
      local i = 1
      while i <= #children do
        local c = children[i]
        if c:type() == 'identifier' and children[i + 1] and children[i + 1]:type() == '=' then
          local key, eq, val = c, children[i + 1], children[i + 2]
          local valtext = val and val:text() or ''
          if type(valtext) == 'table' then valtext = table.concat(valtext) end
          newkids[#newkids + 1] = tsj:create_child({
            text = key:text() .. ' ' .. eq:text() .. ' ' .. valtext,
            type = 'pair',
          })
          i = i + 3
        else
          newkids[#newkids + 1] = c
          i = i + 1
        end
      end
      tsj:update_children(newkids)
    end

    require('treesj').setup({
      use_default_keymaps = false,
      langs = {
        c_sharp = {
          argument_list = lang_utils.set_preset_for_args(),
          attribute_argument_list = lang_utils.set_preset_for_args(),
          parameter_list = lang_utils.set_preset_for_args(),
          bracketed_parameter_list = lang_utils.set_preset_for_args(),
          bracketed_argument_list = lang_utils.set_preset_for_args(),
          initializer_expression = lang_utils.set_preset_for_list(),
          collection_expression = lang_utils.set_preset_for_list(),
          element_binding_expression = lang_utils.set_preset_for_list(),
          tuple_expression = lang_utils.set_preset_for_list(),
          block = lang_utils.set_preset_for_statement({
            both = {
              no_format_with = { 'block' },
              recursive = false,
            },
          }),
          object_creation_expression = {
            target_nodes = { 'argument_list', 'initializer_expression' },
          },
          invocation_expression = { target_nodes = { 'argument_list' } },
          anonymous_object_creation_expression = {
            both = {
              separator = ',',
              format_tree = group_pairs,
            },
            split = {
              last_separator = false,
              inner_indent = 'inner',
            },
            join = {
              space_in_brackets = true,
            },
          },
          attribute = { target_nodes = { 'attribute_argument_list' } },
          lambda_expression = { target_nodes = { 'parameter_list', 'block' } },
          anonymous_method_expression = {
            target_nodes = { 'parameter_list', 'block' },
          },
        },
      },
    })
  end,
  keys = { { '<space>L', '<cmd>TSJToggle<CR>' } },
}
