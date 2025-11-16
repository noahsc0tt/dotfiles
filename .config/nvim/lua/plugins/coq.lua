return {
    {
         'ms-jpq/coq.thirdparty',
         enabled = false,
opts = {
    { src = "builtin/syntax" },
    {
        src = "repl",
        sh = "zsh",
        shell = { py = "python3" },
        max_lines = 99,
        deadline = 500,
        unsafe = { "sudo", "rm", "poweroff", "mv", "cp", "dd" },
    },
    { src = "bc", short_name = "MATH", precision = 6 },
},
}
}


