--[[ Fast and feature-rich surround actions.
--For text that includes surrounding characters
--like brackets or quotes, this allows you to select the
--text inside, change or modify the surrounding
--characters, and more. ]]

return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "gsa",           -- Add surroundings in Normal and Visual mode
      delete = "gsd",        -- Delete sorrouding
      find = "gsf",          -- Find surrounding to the right
      find_left = "gsF",     -- find surrounding to the left
      highlight = "gsh",     -- Highlight surrounding
      replace = "gsr",       -- Replace surrounding
      update_n_lines = "gsn" -- Update 'n_lines'
    },
  },
}
