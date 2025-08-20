local item_sounds = require("__base__.prototypes.item_sounds")

data:extend({
  {
    type = "ammo",
    name = "thaumfactory-fire-firearm-magazine",
    icons = {
      {
        icon = "__base__/graphics/icons/firearm-magazine.png",
      },
      {
        icon = "__thaumfactory__/graphics/icons/fire.png",
        icon_size = 64,
        scale = 0.25,
        shift = { -8, -8 },
      }
    },
    ammo_category = "bullet",
    ammo_type =
    {
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = { { 0, 1 } },
                  offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } }
                },
                {
                  type = "damage",
                  damage = { amount = 5, type = "physical" }
                },
                {
                  type = "damage",
                  damage = { amount = 3, type = "fire" },
                },
                {
                  type = "activate-impact",
                  deliver_category = "bullet"
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]-t-f",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 10 * kg
  },
  {
    type = "ammo",
    name = "thaumfactory-air-firearm-magazine",
    icons = {
      {
        icon = "__base__/graphics/icons/firearm-magazine.png",
      },
      {
        icon = "__thaumfactory__/graphics/icons/air.png",
        icon_size = 64,
        scale = 0.25,
        shift = { -8, -8 },
      }
    },
    ammo_category = "bullet",
    ammo_type =
    {
      action =
      {
        {
          type = "direct",
          action_delivery =
          {
            {
              type = "instant",
              source_effects =
              {
                {
                  type = "create-explosion",
                  entity_name = "explosion-gunshot"
                }
              },
              target_effects =
              {
                {
                  type = "create-entity",
                  entity_name = "explosion-hit",
                  offsets = { { 0, 1 } },
                  offset_deviation = { { -0.5, -0.5 }, { 0.5, 0.5 } }
                },
                {
                  type = "damage",
                  damage = { amount = 5, type = "physical" }
                },
                {
                  type = "damage",
                  damage = { amount = 3, type = "electric" },
                },
                {
                  type = "activate-impact",
                  deliver_category = "bullet"
                }
              }
            }
          }
        }
      }
    },
    magazine_size = 10,
    subgroup = "ammo",
    order = "a[basic-clips]-a[firearm-magazine]-t-a",
    inventory_move_sound = item_sounds.ammo_small_inventory_move,
    pick_sound = item_sounds.ammo_small_inventory_pickup,
    drop_sound = item_sounds.ammo_small_inventory_move,
    stack_size = 100,
    weight = 10 * kg
  },
})
