require("notify").setup({
  background_colour = "#000000",
  fps = 30,
  render = "compact",
  timeout = 2500,
})
-- NOTE: Somethin is broken in here. Nvim keeps chrashing on save with noice active.
-- require("noice").setup({
--     lsp = {
--         override = {
--           ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--           ["vim.lsp.util.stylizy_markdown"] = true,
--           ["cmp.entry.get_documentation"] = true,
--         },
--       },
--       presets = {
--         bottom_search = true,
--         command_palette = true,
--         long_message_to_split = true,
--         inc_rename = false,
--         lsp_doc_border = false,
--       },
--       routes = {
--         {
--           filter = {
--             event = "msg_show",
--             any = {
--               { find = "%d+L, %d+B" },
--               { find = "; after #%d+" },
--               { find = "; before #%d+" },
--             },
--           },
--           view = "mini",
--         }
--       }
-- })
