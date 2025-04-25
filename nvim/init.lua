-- declare the path where lazy will clone plugin code
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Check to see if lazy itself has been cloned, if not clone it into the lazy.nvim directory
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- lastest statble release
        lazypath
    })
end
-- add the path to the lazy plugin repositories to the vim runtime path
vim.opt.rtp:prepend(lazypath)

-- declare a few options for lazy
local opts = {
    change_detection = {
        notify = false
    },
    checker = {
        -- Automatically check for package updates
        enable = true,
        notify = false
    }
}

require("core.options")
require("core.keymap")
require("core.autocmds")
-- Setup lazy, this should always be last
-- Tell lazy that all plugin specs are found in the plugins directory
-- Pass it the options
require("lazy").setup("plugins", opts)
