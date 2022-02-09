-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/nerdjp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/nerdjp/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/nerdjp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/nerdjp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/nerdjp/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-vsnip"] = {
    after_files = { "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-vsnip/after/plugin/cmp_vsnip.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/cmp-vsnip",
    url = "https://github.com/hrsh7th/cmp-vsnip"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nk\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vselect\1\0\0\fbackend\1\0\0\1\2\0\0\fbuiltin\nsetup\rdressing\frequire\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["flutter-tools.nvim"] = {
    config = { "\27LJ\2\n?\0\2\5\0\3\0\0066\2\0\0'\4\1\0B\2\2\0029\2\2\2B\2\1\1K\0\1\0\14on_attach\18lsp_signature\frequire7\2\0\3\0\3\0\0066\0\0\0009\0\1\0009\0\2\0G\2\0\0A\0\0\1K\0\1\0\20nvim_set_keymap\bapi\bvimý\2\1\0\b\0\21\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0003\4\3\0=\4\5\3=\3\a\2B\0\2\0016\0\b\0009\0\t\0)\1\2\0=\1\n\0006\0\b\0009\0\t\0+\1\2\0=\1\v\0003\0\f\0005\1\r\0\18\2\0\0'\4\14\0'\5\15\0'\6\16\0\18\a\1\0B\2\5\1\18\2\0\0'\4\14\0'\5\17\0'\6\18\0\18\a\1\0B\2\5\0016\2\b\0009\2\19\2'\4\20\0B\2\2\1K\0\1\0Lautocmd BufWritePre *.dart execute ':lua vim.lsp.buf.formatting_sync()'\bcmd\28<cmd>FlutterRestart<CR>\t<F6>\24<cmd>FlutterRun<CR>\t<F5>\6n\1\0\2\fnoremap\2\vsilent\2\0\14expandtab\ftabstop\6o\bvim\blsp\1\0\0\14on_attach\1\0\0\0\nsetup\18flutter-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/flutter-tools.nvim",
    url = "https://github.com/akinsho/flutter-tools.nvim",
    wants = { "nvim-cmp", "nvim-treesitter", "nvim-lspconfig", "lsp_signature.nvim" }
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22themes.statusline\frequire\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    url = "https://github.com/NTBBloodbath/galaxyline.nvim"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\nì\a\0\0\14\0$\0f6\0\0\0009\0\1\0009\0\2\0005\1\3\0005\2\4\0006\3\5\0\18\5\2\0B\3\2\4X\6Z€\18\b\0\0\18\n\a\0'\v\6\0'\f\a\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\b\0'\f\t\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\n\0'\f\v\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\f\0'\f\r\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\14\0'\f\15\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\16\0'\f\17\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\18\0'\f\19\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\20\0'\f\21\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\22\0'\f\23\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\24\0'\f\25\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\26\0'\f\27\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\28\0'\f\29\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\30\0'\f\31\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v \0'\f!\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\"\0'\f#\0\18\r\1\0B\b\5\1E\6\3\3R\6¤K\0\1\0\22:HopPatternBC<CR>\23<leader><leader>Kg\22:HopPatternAC<CR>\23<leader><leader>Jg\20:HopPattern<CR>\22<leader><leader>g\24:HopLineStartBC<CR>\22<leader><leader>k\24:HopLineStartAC<CR>\22<leader><leader>j\22:HopLineStart<CR>\29<leader><leader><leader>\20:HopChar2BC<CR>\23<leader><leader>KC\20:HopChar2AC<CR>\23<leader><leader>JC\18:HopChar2<CR>\22<leader><leader>C\20:HopChar1BC<CR>\23<leader><leader>Kc\20:HopChar1AC<CR>\23<leader><leader>Jc\18:HopChar1<CR>\22<leader><leader>c\19:HopWordBC<CR>\23<leader><leader>Kw\19:HopWordAC<CR>\23<leader><leader>Jw\17:HopWord<CR>\22<leader><leader>w\vipairs\1\3\0\0\6n\6v\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nÃ\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\20buftype_exclude\1\0\4\31show_current_context_start\2\25show_current_context\2\25space_char_blankline\6 \19use_treesitter\2\1\2\0\0\rterminal\nsetup\21indent_blankline\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "vim-vsnip", "cmp-buffer", "vim-vsnip-integ", "cmp-nvim-lsp", "cmp-nvim-lsp-signature-help", "cmp-vsnip" },
    commands = { "cmp" },
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimJ\0\2\a\1\4\0\n6\2\1\0009\2\2\2'\4\3\0-\5\0\0009\6\0\0018\5\6\0059\6\0\1B\2\4\2=\2\0\1L\1\2\0\1À\n%s %s\vformat\vstring\tkindÄ\a\1\0\n\0+\0J6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0006\1\0\0009\1\1\0019\1\4\1'\2\5\0&\1\2\1=\1\4\0006\0\6\0'\2\a\0B\0\2\0025\1\b\0009\2\t\0005\4\15\0009\5\n\0009\5\v\0054\a\4\0005\b\f\0>\b\1\a5\b\r\0>\b\2\a5\b\14\0>\b\3\aB\5\2\2=\5\v\0045\5\22\0009\6\16\0009\6\17\0065\b\20\0009\t\18\0009\t\19\t=\t\21\bB\6\2\2=\6\23\0059\6\16\0009\6\24\0065\b\25\0009\t\18\0009\t\19\t=\t\21\bB\6\2\2=\6\26\0059\6\16\0009\6\27\0065\b\28\0009\t\18\0009\t\19\t=\t\21\bB\6\2\2=\6\29\0059\6\16\0009\6\30\0065\b!\0009\t\31\0009\t \t=\t\21\bB\6\2\2=\6\"\5=\5\16\0045\5$\0003\6#\0=\6%\5=\5&\0045\5(\0003\6'\0=\6)\5=\5*\4B\2\2\0012\0\0€K\0\1\0\15formatting\vformat\1\0\0\0\fsnippet\vexpand\1\0\0\0\t<CR>\1\0\1\vselect\1\fReplace\20ConfirmBehavior\fconfirm\14<C-Space>\1\0\0\rcomplete\f<S-Tab>\1\0\0\21select_prev_item\n<Tab>\1\0\0\rbehavior\1\0\0\vInsert\19SelectBehavior\21select_next_item\fmapping\1\0\0\1\0\1\tname\28nvim_lsp_signature_help\1\0\1\tname\rnvim_lsp\1\0\1\tname\nvsnip\fsources\vconfig\nsetup\1\0\25\tFile\bïœ˜\vMethod\bïš¦\14Reference\bï’\tText\bî˜’\vFolder\bïŠ\nColor\bï£—\15EnumMember\bï…\fSnippet\bï‘\fKeyword\bï Š\tEnum\bï…\nValue\bï¢Ÿ\tUnit\bîˆŸ\rProperty\bï° \vModule\bï’‡\18TypeParameter\bï™±\14Interface\bïƒ¨\rOperator\bïš”\nClass\bï´¯\nEvent\bïƒ§\rVariable\bï– \vStruct\bï†³\nField\bï›¼\rConstant\bï£¾\16Constructor\bï£\rFunction\bïž”\bcmp\frequire\6c\14shortmess\30menuone,noinsert,noselect\16completeopt\6o\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-ui" },
    config = { "\27LJ\2\ng\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimg\0\0\5\0\a\0\f6\0\0\0009\0\1\0009\0\2\0'\2\3\0006\3\0\0009\3\1\0039\3\4\3B\3\1\2'\4\5\0&\3\4\3'\4\6\0D\0\4\0\tfile\6/\vgetcwd\25Path to executable: \ninput\afn\bvimÁ\a\1\0\b\0\29\0B6\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\f\0'\6\r\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\14\0'\6\r\0\18\a\1\0B\2\5\0016\2\15\0'\4\16\0B\2\2\0029\3\17\0025\4\19\0=\4\18\0039\3\20\0024\4\3\0005\5\22\0003\6\23\0=\6\24\5>\5\1\0045\5\25\0003\6\26\0=\6\24\5>\5\2\4=\4\21\0039\3\20\0029\4\20\0029\4\21\4=\4\27\0039\3\20\0029\4\20\0029\4\21\4=\4\28\3K\0\1\0\trust\6c\0\1\0\a\ttype\vcppdbg\bcwd\23${workspaceFolder}\19miDebuggerPath\17/usr/bin/gdb\frequest\vlaunch\28miDebuggerServerAddress\19localhost:1234\tname\30Attach to gdbserver :1234\vMIMode\bgdb\fprogram\0\1\0\5\16stopOnEntry\2\ttype\vcppdbg\bcwd\23${workspaceFolder}\frequest\vlaunch\tname\16Launch file\bcpp\19configurations\1\0\3\ttype\15executable\fcommandM/home/nerdjp/.local/bin/cpp-dap/extension/debugAdapters/bin/OpenDebugAD7\aid\vcppdbg\vcppdbg\radapters\bdap\frequire\t<F6>,<cmd>lua require(\"dap\").step_into()<CR>\16<leader>ldS\t<F5>,<cmd>lua require(\"dap\").step_over()<CR>\16<leader>lds+<cmd>lua require(\"dap\").continue()<CR>\16<leader>ldc4<cmd>lua require(\"dap\").toggle_breakpoint()<CR>\16<leader>ldb\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    config = { "\27LJ\2\n3\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ndapui\frequire\0" },
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-gps"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-gps",
    url = "https://github.com/SmiteshP/nvim-gps"
  },
  ["nvim-lsp-installer"] = {
    config = { "\27LJ\2\n%\0\1\6\0\1\0\0064\1\0\0\18\4\0\0009\2\0\0\18\5\1\0B\2\3\1K\0\1\0\nsetupO\1\0\4\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\1\2\0003\3\3\0B\1\2\1K\0\1\0\0\20on_server_ready\23nvim-lsp-installer\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-gps", "trouble.nvim", "nvim-dap", "indent-blankline.nvim", "nvim-autopairs", "nvim-lsp-installer" },
    config = { "\27LJ\2\n7\2\0\3\0\3\0\0066\0\0\0009\0\1\0009\0\2\0G\2\0\0A\0\0\1K\0\1\0\20nvim_set_keymap\bapi\bvim7\2\0\3\0\3\0\0066\0\0\0009\0\1\0009\0\2\0G\2\0\0A\0\0\1K\0\1\0\20nvim_set_option\bapi\bvim?\0\2\5\0\3\0\0066\2\0\0'\4\1\0B\2\2\0029\2\2\2B\2\1\1K\0\1\0\14on_attach\18lsp_signature\frequire¶\r\1\0\18\0007\0‡\0016\0\0\0'\2\1\0B\0\2\0023\1\2\0003\2\3\0005\3\4\0\18\4\1\0'\6\5\0'\a\6\0'\b\a\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\b\0'\b\t\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\n\0'\b\v\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\f\0'\b\r\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\14\0'\b\15\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\16\0'\b\17\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\18\0'\b\19\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\20\0'\b\21\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\22\0'\b\23\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\24\0'\b\25\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\26\0'\b\27\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\28\0'\b\29\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\30\0'\b\31\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a \0'\b!\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a\"\0'\b#\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a$\0'\b%\0\18\t\3\0B\4\5\1\18\4\1\0'\6\5\0'\a&\0'\b'\0\18\t\3\0B\4\5\0013\4(\0005\5)\0006\6*\0\18\b\5\0B\6\2\4X\t\18€8\v\n\0009\v+\v5\r,\0=\4-\r6\14\0\0'\16.\0B\14\2\0029\14/\0146\0160\0009\0161\0169\0162\0169\0163\16B\16\1\0A\14\0\2=\0144\r5\0145\0=\0146\rB\v\2\1E\t\3\3R\tìK\0\1\0\nflags\1\0\1\26debounce_text_changes\3–\1\17capabilities\29make_client_capabilities\rprotocol\blsp\bvim\24update_capabilities\17cmp_nvim_lsp\14on_attach\1\0\0\nsetup\vipairs\1\b\0\0\vclangd\vtexlab\18rust_analyzer\ncssls\thtml\16sumneko_lua\17intelephense\0*<cmd>lua vim.lsp.buf.formatting()<CR>\15<leader>lf-<cmd>lua vim.diagnostic.setloclist()<CR>\15<leader>lq,<cmd>lua vim.diagnostic.goto_next()<CR>\15<leader>lk,<cmd>lua vim.diagnostic.goto_prev()<CR>\15<leader>lj-<cmd>lua vim.diagnostic.open_float()<CR>\15<leader>le*<cmd>lua vim.lsp.buf.references()<CR>\16<leader>lgr+<cmd>lua vim.lsp.buf.code_action()<CR>\15<leader>lc&<cmd>lua vim.lsp.buf.rename()<CR>\15<leader>lr/<cmd>lua vim.lsp.buf.type_definition()<CR>\15<leader>lDJ<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>\16<leader>lwl7<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>\16<leader>lwr4<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>\16<leader>lwa.<cmd>lua vim.lsp.buf.signature_help()<CR>\15<leader>ls.<cmd>lua vim.lsp.buf.implementation()<CR>\16<leader>lgi%<cmd>lua vim.lsp.buf.hover()<CR>\15<leader>ll*<cmd>lua vim.lsp.buf.definition()<CR>\16<leader>lgd+<cmd>lua vim.lsp.buf.declaration()<CR>\16<leader>lgD\6n\1\0\2\fnoremap\2\vsilent\2\0\0\14lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig",
    wants = { "nvim-cmp", "nvim-treesitter", "nvim-lsp-installer" }
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n…\2\0\0\b\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0005\1\v\0\18\2\0\0'\4\f\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1K\0\1\0\27<cmd>NvimTreeFocus<cr>\14<leader>n\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\tview\1\0\2\16auto_resize\2\nwidth\3(\16diagnostics\1\0\1\venable\2\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "playground" },
    commands = { "ts" },
    config = { "\27LJ\2\nÑ\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\1\26incremental_selection\fkeymaps\1\0\4\19init_selection\bgnn\22scope_incremental\bgrc\21node_incremental\bgrn\21node_decremental\bgrm\1\0\1\venable\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\1\0\1\21ensure_installed\15maintained\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["registers.nvim"] = {
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/registers.nvim",
    url = "https://github.com/tversteeg/registers.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÈ\2\0\0\b\0\r\0\0296\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1K\0\1\0!<cmd>Telescope live_grep<cr>\15<leader>fg!<cmd>Telescope help_tags<cr>\15<leader>fh\31<cmd>Telescope buffers<cr>\15<leader>fb\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    config = { "\27LJ\2\nc\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\nnight\21tokyonight_style\6g\bvim\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n7\2\0\3\0\3\0\0066\0\0\0009\0\1\0009\0\2\0G\2\0\0A\0\0\1K\0\1\0\20nvim_set_keymap\bapi\bvim§\1\1\0\b\0\b\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\0013\0\3\0005\1\4\0\18\2\0\0'\4\5\0'\5\6\0'\6\a\0\18\a\1\0B\2\5\1K\0\1\0001<cmd>TroubleToggle workspace_diagnostics<CR>\14<leader>t\6n\1\0\2\fnoremap\2\vsilent\2\0\nsetup\ftrouble\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-vsnip"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    after_files = { "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ",
    url = "https://github.com/hrsh7th/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["yuck.vim"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/nerdjp/.local/share/nvim/site/pack/packer/opt/yuck.vim",
    url = "https://github.com/elkowar/yuck.vim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22themes.statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: tokyonight.nvim
time([[Config for tokyonight.nvim]], true)
try_loadstring("\27LJ\2\nc\0\0\3\0\6\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0'\2\5\0B\0\2\1K\0\1\0\27colorscheme tokyonight\bcmd\nnight\21tokyonight_style\6g\bvim\0", "config", "tokyonight.nvim")
time([[Config for tokyonight.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n…\2\0\0\b\0\15\0\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\0016\0\b\0009\0\t\0009\0\n\0005\1\v\0\18\2\0\0'\4\f\0'\5\r\0'\6\14\0\18\a\1\0B\2\5\1K\0\1\0\27<cmd>NvimTreeFocus<cr>\14<leader>n\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\tview\1\0\2\16auto_resize\2\nwidth\3(\16diagnostics\1\0\1\venable\2\1\0\1\15auto_close\2\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÈ\2\0\0\b\0\r\0\0296\0\0\0009\0\1\0009\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\t\0'\6\n\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\v\0'\6\f\0\18\a\1\0B\2\5\1K\0\1\0!<cmd>Telescope live_grep<cr>\15<leader>fg!<cmd>Telescope help_tags<cr>\15<leader>fh\31<cmd>Telescope buffers<cr>\15<leader>fb\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\nì\a\0\0\14\0$\0f6\0\0\0009\0\1\0009\0\2\0005\1\3\0005\2\4\0006\3\5\0\18\5\2\0B\3\2\4X\6Z€\18\b\0\0\18\n\a\0'\v\6\0'\f\a\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\b\0'\f\t\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\n\0'\f\v\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\f\0'\f\r\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\14\0'\f\15\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\16\0'\f\17\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\18\0'\f\19\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\20\0'\f\21\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\22\0'\f\23\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\24\0'\f\25\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\26\0'\f\27\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\28\0'\f\29\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\30\0'\f\31\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v \0'\f!\0\18\r\1\0B\b\5\1\18\b\0\0\18\n\a\0'\v\"\0'\f#\0\18\r\1\0B\b\5\1E\6\3\3R\6¤K\0\1\0\22:HopPatternBC<CR>\23<leader><leader>Kg\22:HopPatternAC<CR>\23<leader><leader>Jg\20:HopPattern<CR>\22<leader><leader>g\24:HopLineStartBC<CR>\22<leader><leader>k\24:HopLineStartAC<CR>\22<leader><leader>j\22:HopLineStart<CR>\29<leader><leader><leader>\20:HopChar2BC<CR>\23<leader><leader>KC\20:HopChar2AC<CR>\23<leader><leader>JC\18:HopChar2<CR>\22<leader><leader>C\20:HopChar1BC<CR>\23<leader><leader>Kc\20:HopChar1AC<CR>\23<leader><leader>Jc\18:HopChar1<CR>\22<leader><leader>c\19:HopWordBC<CR>\23<leader><leader>Kw\19:HopWordAC<CR>\23<leader><leader>Jw\17:HopWord<CR>\22<leader><leader>w\vipairs\1\3\0\0\6n\6v\1\0\2\fnoremap\2\vsilent\2\20nvim_set_keymap\bapi\bvim\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: dressing.nvim
time([[Config for dressing.nvim]], true)
try_loadstring("\27LJ\2\nk\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\vselect\1\0\0\fbackend\1\0\0\1\2\0\0\fbuiltin\nsetup\rdressing\frequire\0", "config", "dressing.nvim")
time([[Config for dressing.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file cmp lua require("packer.load")({'nvim-cmp'}, { cmd = "cmp", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ts lua require("packer.load")({'nvim-treesitter'}, { cmd = "ts", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType yuck ++once lua require("packer.load")({'yuck.vim'}, { ft = "yuck" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "tex" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-lspconfig'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType dart ++once lua require("packer.load")({'nvim-lspconfig', 'flutter-tools.nvim'}, { ft = "dart" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/nerdjp/.local/share/nvim/site/pack/packer/opt/yuck.vim/ftdetect/yuck.vim]], true)
vim.cmd [[source /home/nerdjp/.local/share/nvim/site/pack/packer/opt/yuck.vim/ftdetect/yuck.vim]]
time([[Sourcing ftdetect script at: /home/nerdjp/.local/share/nvim/site/pack/packer/opt/yuck.vim/ftdetect/yuck.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
