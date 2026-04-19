local M = {}

M.setup = function()
    -- See `:help vim.lsp.start` for an overview of the supported `config` options.
    local config = {
        name = "jdtls",


        -- `cmd` defines the executable to launch eclipse.jdt.ls.
        -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
        --
        -- As alternative you could also avoid the `jdtls` wrapper and launch
        -- eclipse.jdt.ls via the `java` executable
        -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
        cmd = {
            'java', -- must be in $PATH (change JDK version with sdkman)
            '-Declipse.application=org.eclipse.jdt.ls.core.id1',
            '-Dosgi.bundles.defaultStartLevel=4',
            '-Declipse.product=org.eclipse.jdt.ls.core.product',
            '-Dlog.level=ALL',
            '-Xmx1G',
            '--add-modules=ALL-SYSTEM',
            '--add-opens', 'java.base/java.util=ALL-UNNAMED',
            '--add-opens', 'java.base/java.lang=ALL-UNNAMED',

            -- TODO: path prefix
            '-jar',
            '/home/sp/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar',
             -- TODO: path prefix
            '-configuration',
            '/home/sp/.local/share/nvim/mason/packages/jdtls/config_linux',

            '-data', '/tmp/jdtls_data', -- TODO: vim.fn.getcwd()
        },


        -- `root_dir` must point to the root of your project.
        -- See `:help vim.fs.root`
        -- root_dir = vim.fs.root(0, {'gradlew', '.git', 'mvnw'}),
        root_dir = vim.fn.getcwd(),


        -- Here you can configure eclipse.jdt.ls specific settings
        -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
        -- for a list of options
        settings = {
            java = {
            }
        },


        -- This sets the `initializationOptions` sent to the language server
        -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
        -- you'll need to set the `bundles`
        --
        -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
        --
        -- If you don't plan on any eclipse.jdt.ls plugins you can remove this
        init_options = {
            bundles = {}
        },
    }

    require('jdtls').start_or_attach(config)
end

return M
