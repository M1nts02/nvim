local options = {
  PATH = "skip",
  ui = {
    icons = {
      package_uninstalled = "✗",
    },
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
  github = {
    download_url_template = vim.g.github_url .. "%s/releases/download/%s/%s",
  },
}

return options
