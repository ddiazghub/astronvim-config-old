-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map

    -- navigate buffer tabs with `H` and `L`
    -- L = {
    --   function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
    --   desc = "Next buffer",
    -- },
    -- H = {
    --   function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
    --   desc = "Previous buffer",
    -- },

    -- mappings seen under group name "Buffer"
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(
          function(bufnr) require("astronvim.utils.buffer").close(bufnr) end
        )
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- Show alpha dashboard if all buffers were closed
    ["<leader>c"] = {
      function()
        require("astronvim.utils.buffer").close(0)
        local bufs = vim.fn.getbufinfo { buflisted = true }
        print(vim.inspect(bufs))

        if require("astronvim.utils").is_available "alpha-nvim" and not bufs[2] then
          vim.cmd("Alpha")
        end
      end,
      desc = "Close buffer",
    },

    ["<C-z>"] = { "u", desc = "Undo" },
    ["<C-y>"] = { "<C-r>", desc = "Redo" },
    ["<C-C>"] = { "<Cmd>%y<CR>", desc = "Copy all lines in buffer" },
    ["<C-d>"] = { "<C-d>zz", desc = "Half page jump down" },
    ["<C-u>"] = { "<C-u>zz", desc = "Half page jump up" },
    ["<C-f>"] = { "<C-f>zz", desc = "Page jump down" },
    ["<C-b>"] = { "<C-b>zz", desc = "Page jump up" },
    ["<S-Down>"] = { "<C-d>zz", desc = "Page jump down" },
    ["<S-Up>"] = { "<C-u>zz", desc = "Page jump up" },
    ["n"] = { "nzzzv", desc = "Seek next search term" },
    ["N"] = { "Nzzzv", desc = "Seek next search term backwards" },
    ["<C-k>"] = { "10k", desc = "Fast scroll up" },
    ["<C-Up>"] = { "10k", desc = "Fast scroll up" },
    ["<C-j>"] = { "10j", desc = "Fast scroll down" },
    ["<C-Down>"] = { "10j", desc = "Fast scroll down" },
  },
  i = {
    ["<C-z>"] = { "<C-o>u", desc = "Undo" },
    ["<C-y>"] = { "<C-o><C-r>", desc = "Redo" },
    ["<C-v>"] = { "<Esc>pi", desc = "Paste" },
  },
  v = {
    [">"] = { ">gv", desc = "Shift text right" },
    ["<"] = { "<gv", desc = "Shift text left" },
    ["<C-c>"] = { "y", desc = "Copy selection" },
    ["<C-k>"] = { "10k", desc = "Fast scroll up" },
    ["<C-j>"] = { "10j", desc = "Fast scroll down" },
  },
  x = {
    ["C-v"] = { "p", desc = "Paste copied content and replace selection" },
    ["<C-k>"] = { "10k", desc = "Fast scroll up" },
    ["<C-j>"] = { "10j", desc = "Fast scroll down" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
