local durability = {}

-- restore durability
function durability:register_restore_handler(rune_name, crystal_name)
  script.on_event(defines.events.on_tick,
    function(_)
      for _, player in pairs(game.players) do
        if player.controller_type == defines.controllers.character then
          local rune = player.get_main_inventory().find_item_stack(rune_name)
          local crystal = player.get_main_inventory().find_item_stack(crystal_name)
          if rune and crystal then
            local old_durability = rune.durability
            rune.add_durability(1)
            if old_durability ~= rune.durability then
              crystal.drain_durability(1)
            end
          end
        end
      end
    end
  )
end

return durability
