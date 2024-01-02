local M = {}

M.keys = {
  {
    "zR",
    function()
      require("ufo").openAllFolds()
    end,
    desc = "Open all folds",
  },
  {
    "zM",
    function()
      require("ufo").closeAllFolds()
    end,
    desc = "close all folds",
  },
  {
    "zr",
    function()
      require("ufo").openFoldsExceptKinds()
    end,
    desc = "Open fold",
  },
  {
    "zm",
    function()
      require("ufo").closeFoldsWith()
    end,
    desc = "close fold",
  },
}

return M
