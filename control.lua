local handler = require("__core__.lualib.event_handler")

handler.add_libraries({
  require("scripts.runes.fire"),
  require("scripts.runes.life"),
  require("scripts.runes.motion"),
  require("scripts.runes.order"),
  require("scripts.runes.light"),
  require("scripts.runes.mine"),
  require("scripts.runes.tool"),
  require("scripts.runes.craft"),

  require("scripts.aura-pylon.plant"),
  require("scripts.aura-pylon.mine"),
})
