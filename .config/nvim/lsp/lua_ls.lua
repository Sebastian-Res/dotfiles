local lua_ls_config = {}

local lua_version = _VERSION

-- modify runtime path
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

lua_ls_config = {
    settings = {
        Lua = {
            runtime = {
                version = lua_version,
                path = runtime_path
            },
            workspace = {
                library = {
                    vim.fn.getcwd(),
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library"
                },
                checkThirdParty = false,
                ignoreDir = {
                    "build"
                }
            },
            diagnostics = {
                globals = { "vim" }
            },
            telemetry = {
                enable = false
            }
        }
    }
}

return lua_ls_config
