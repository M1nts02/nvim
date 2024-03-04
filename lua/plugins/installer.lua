-- Install tool
return {
  "williamboman/mason.nvim",
  cmd = {
    "Mason",
    "MasonInstall",
    "MasonLog",
    "MasonUninstall",
    "MasonUninstallAll",
    "MasonUpdate",
  },
  main = "mason",
  opts = {
    PATH = "skip",
    ui = {
      border = "rounded",
      keymaps = {
        toggle_package_expand = "<CR>",
        install_package = "i",
        update_package = "u",
        check_package_version = "c",
        update_all_packages = "U",
        check_outdated_packages = "C",
        uninstall_package = "X",
        cancel_installation = "<C-c>",
        apply_language_filter = "<C-f>",
      },
    },
    max_concurrent_installers = 10,
  },
}
