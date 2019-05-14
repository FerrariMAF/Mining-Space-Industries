

local labinputs = table.deepcopy(data.raw.lab.lab.inputs)
table.insert (labinputs,"gordon-freeman")
table.insert (labinputs,"glados-core")
table.insert (labinputs,"hal9000")



data:extend({
-- a lab for glados and freeman
  {
    type = "lab",
    name = "msi-worker-lab",
    icon = "__base__/graphics/icons/lab.png",
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "hidden"},
    minable = {mining_time = 2, result = "msi-worker-lab"},
    map_color = {r = 0, g = 0.365, b = 0.58, a = 1},
    max_health = 500,
    corpse = "big-remnants",
    dying_explosion = "medium-explosion",
    collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
    light = {intensity = 1, size = 12, color = {r = 1.0, g = 1.0, b = 1.0}},
    on_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab-red.png",
          width = 98,
          height = 87,
          frame_count = 33,
          line_length = 11,
          animation_speed = 1 / 3,
          shift = util.by_pixel(0, 1.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-red.png",
            width = 194,
            height = 174,
            frame_count = 33,
            line_length = 11,
            animation_speed = 1 / 3,
            shift = util.by_pixel(0, 1.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 122,
          height = 68,
          frame_count = 1,
          line_length = 1,
          repeat_count = 33,
          animation_speed = 1 / 3,
          shift = util.by_pixel(13, 11),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-shadow.png",
            width = 242,
            height = 136,
            frame_count = 1,
            line_length = 1,
            repeat_count = 33,
            animation_speed = 1 / 3,
            shift = util.by_pixel(13, 11),
            scale = 0.5,
            draw_as_shadow = true
          }
        }
      }
    },
    off_animation =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/lab/lab-red.png",
          width = 98,
          height = 87,
          frame_count = 1,
          shift = util.by_pixel(0, 1.5),
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-red.png",
            width = 194,
            height = 174,
            frame_count = 1,
            shift = util.by_pixel(0, 1.5),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/lab/lab-shadow.png",
          width = 122,
          height = 68,
          frame_count = 1,
          shift = util.by_pixel(13, 11),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/lab/hr-lab-shadow.png",
            width = 242,
            height = 136,
            frame_count = 1,
            shift = util.by_pixel(13, 11),
            draw_as_shadow = true,
            scale = 0.5
          }
        }
      }
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/lab.ogg",
        volume = 0.7
      },
      apparent_volume = 1
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input"
    },
    energy_usage = "200kW",
    researching_speed = 1,
    inputs = labinputs,
	module_specification =
    {
      module_slots = 4,
    }
  },





  {
    type = "flying-text",
    name = "timer-label",
    flags = {"not-on-map"},
    time_to_live = 150,
    speed = 0.05
  },
  
 
	{
		type = "simple-entity",
		name = "msi-huge-smoke",
		flags = {"not-repairable", "not-blueprintable", "not-deconstructable", "not-on-map"},
		map_color = { r = 0.1, g = 0.1, b = 0.1, a = 0.8 },
		max_health = 1,
		collision_box = {{0, -0.2}, {0, 0.2}},
		collision_mask = { "item-layer", "object-layer", "water-tile"},
		selection_box = {{-0.5, -0.9}, {0.5, 0.9}},
		random_animation_offset = false,
		animations = {		{
			filename = "__base__/graphics/entity/fire-flame/fire-smoke-source-1.png",
			priority = "high",
			width = 808/8,
			height = 552/4,
			frame_count = 31,
			line_length = 8,
			animation_speed = 0.3,
			scale = 12,
		}},
		render_layer =  "smoke", --render_layer = "smoke",
		tile_width = 2,
		tile_height = 2,
	},
 
  
  
  {
    type = "electric-energy-interface",
    name = "msi-hidden-energy1",
    icon = "__base__/graphics/icons/ship-wreck/big-ship-wreck-3.png",
    icon_size = 32,
    localised_name = {"missions.shipwreck"},
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "accumulator"},
    max_health = 800,
    corpse = "medium-remnants",
    collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
    selection_box = {{-1, -1}, {1, 1}},
    selectable_in_game = false,
    energy_source =
    {
      type = "electric",
      buffer_capacity = "5GJ", -- era 10
      usage_priority = "secondary-output", --"terciary",
      input_flow_limit = "0kW",
      output_flow_limit = "400GW" -- era 500
    },
    energy_production = "4MW", -- era 5
    energy_usage = "0kW",
    picture =
    {
      filename = "__Mining-Space-Industries__/graphics/msi-accumulator.png",
      priority = "extra-high",
      width = 124,
      height = 103,
      shift = {0.6875, -0.203125},
    },
    charge_animation =
    {
      filename = "__Mining-Space-Industries__/graphics/msi-accumulator-charge-animation.png",
      width = 138,
      height = 135,
      line_length = 8,
      frame_count = 24,
      shift = {0.46875, -0.640625},
      animation_speed = 0.5
    },

    charge_cooldown = 30,
    charge_light = {intensity = 0.3, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
    discharge_animation =
    {
      filename = "__Mining-Space-Industries__/graphics/msi-accumulator-discharge-animation.png",
      width = 147,
      height = 128,
      line_length = 8,
      frame_count = 24,
      shift = {0.390625, -0.53125},
      animation_speed = 0.5
    },
    discharge_cooldown = 60,
    discharge_light = {intensity = 0.7, size = 7, color = {r = 1.0, g = 1.0, b = 1.0}},
	
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/accumulator-working.ogg",
        volume = 1
      },
      idle_sound =
      {
        filename = "__base__/sound/accumulator-idle.ogg",
        volume = 0.4
      },
      max_sounds_per_type = 5
    },
	order = "h-e-e-i",
  },
  
  
})

