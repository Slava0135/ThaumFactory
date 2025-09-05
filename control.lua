local handler = require("__core__.lualib.event_handler")

handler.add_libraries({
  require("scripts.runes.fire"),
  require("scripts.runes.life"),
  require("scripts.runes.motion"),
  require("scripts.runes.order"),
})
