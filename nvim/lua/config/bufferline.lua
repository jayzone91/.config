local mocha = require("catppuccin.palettes").get_palette("mocha")
require("bufferline").setup {
  highlights = require("catppuccin.groups.integrations.bufferline").get()
}
