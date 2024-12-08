local lspconfig = require('lspconfig')

-- -- GLSL INSTALLIEREN: https://github.com/nolanderc/glsl_analyzer/releases
-- lspconfig.glsl_analyzer.setup({})

-- This is not needed for godot if --> see 'after/ftplugin/gdscript.lua'
lspconfig.gdscript.setup({})
