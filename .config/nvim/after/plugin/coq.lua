require("coq_3p")({
    { src = "builtin/syntax" },
    {
        src = "repl",
        sh = "zsh",
        shell = { p = "perl", n = "node", py = "python3" },
        max_lines = 99,
        deadline = 500,
        unsafe = { "rm", "poweroff", "mv", "cp", "dd" },
    },

    { src = "bc",            short_name = "MATH", precision = 6 },

})
