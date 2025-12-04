require('snacks').keymap.set('n', '<leader>ot', function()
    require('snacks').terminal.open(
        'mvn compile test -f /Users/nscott/UCL-OneDrive/University/second-year/Work/software/coursework-d-25-t2-s-25-ap1-java_004/backend/pom.xml')
end, { desc = 'Test', ft = "java" })

require('snacks').keymap.set('n', '<leader>om', function()
    require('snacks').terminal.open(
        'mvn compile test checkstyle:check spotbugs:check verify site -f /Users/nscott/UCL-OneDrive/University/second-year/Work/software/coursework-d-25-t2-s-25-ap1-java_004/backend/pom.xml')
end, { desc = 'Build', ft = "java" })
