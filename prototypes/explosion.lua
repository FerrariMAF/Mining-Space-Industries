data:extend({



   {
    type = "explosion",
    name = "small-atomic-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "extra-high",
        width = 112,
        height = 94,
        scale = 0.8,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.25
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.25
        }
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 60,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          },
		  {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
			force = (DISALLOW_FRIENDLY_FIRE and "enemy") or nil,
            action =
            {
              type = "area",
              target_entities = false,
			  trigger_from_target = true,
              repeat_count = 1000,
			  radius = 10,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.4
              }
            }
          }
		  
		  
        }
      }
    }
  },







   {
    type = "explosion",
    name = "atomic-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__base__/graphics/entity/medium-explosion/medium-explosion.png",
        priority = "extra-high",
        width = 112,
        height = 94,
        scale = 0.8,
        frame_count = 54,
        line_length = 6,
        shift = {-0.56, -0.96},
        animation_speed = 0.5
      }
    },
    light = {intensity = 1, size = 50, color = {r=1.0, g=1.0, b=1.0}},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.25
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.25
        }
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 60,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          },
		  {
            type = "create-entity",
            entity_name = "small-scorchmark",
            check_buildability = true
          },
          {
            type = "nested-result",
			force = (DISALLOW_FRIENDLY_FIRE and "enemy") or nil,
            action =
            {
              type = "area",
              target_entities = false,
			  trigger_from_target = true,
              repeat_count = 2000,
			  radius = 35,
              action_delivery =
              {
                type = "projectile",
                projectile = "atomic-bomb-wave",
                starting_speed = 0.5
              }
            }
          }
		  
		  
        }
      }
    }
  },





  
   {
    type = "explosion",
    name = "electric-shock",
    flags = {"not-on-map"},
    
      animations = {
        {
          scale = 2,
          axially_symmetrical = false,
          direction_count = 1,
          filename = "__Mining-Space-Industries__/graphics/electroshock-pulse-explosion.png",
          animation_speed = 1,
          frame_count = 7*5,
          line_length = 5,
          width = 1675/5,
          height = 2044/7,
          priority = "extra-high",
        }
      },
      flags = {
        "not-on-map"
      },
      light = {
        intensity = 1,
        size = 25,
        color = {a = 1,b = 1,g = 0.3,r = 0.1},
      },
      sound = {
        aggregation = {
          max_count = 1,
          remove = true
        },
        variations = {
          {
            filename = "__Mining-Space-Industries__/sound/electroshock-pulse-explosion.ogg",
            volume = 1
          }
        }
      },
	  
	created_effect =
    {
              type = "area",
              radius = 9,
              action_delivery =
              {
                type = "instant",
                target_effects = {
                  {
                    type = "create-sticker",
                    sticker = "electroshock-pulse-sticker",
                  },
                  {
                    type = "damage",
                    damage = { amount = 30, type = "laser"}
                  }
                }
              }
    }
  },


   {
    type = "explosion",
    name = "electric-shock-b",
    flags = {"not-on-map"},
    
      animations = {
        {
          scale = 1.5,
          axially_symmetrical = false,
          direction_count = 1,
          filename = "__Mining-Space-Industries__/graphics/electroshock-pulse-explosion.png",
          animation_speed = 1,
          frame_count = 7*5,
          line_length = 5,
          width = 1675/5,
          height = 2044/7,
          priority = "extra-high",
        }
      },
      flags = {
        "not-on-map"
      },
      light = {
        intensity = 1,
        size = 25,
        color = {a = 1,b = 1,g = 0.3,r = 0.1},
      },
      sound = {
        aggregation = {
          max_count = 1,
          remove = true
        },
        variations = {
          {
            filename = "__Mining-Space-Industries__/sound/electroshock-pulse-explosion.ogg",
            volume = 1
          }
        }
      },
	  
	created_effect =
    {
              type = "area",
              radius = 12,
              action_delivery =
              {
                type = "instant",
                target_effects = {
                  {
                    type = "create-sticker",
                    sticker = "electroshock-pulse-sticker",
                  },
                  {
                    type = "damage",
                    damage = { amount = 50, type = "laser"}
                  }
                }
              }
    }
  },

  
  
  
   {
    type = "explosion",
    name = "electric-shock-c",
    flags = {"not-on-map"},
    
      animations = {
        {
          scale = 3,
          axially_symmetrical = false,
          direction_count = 1,
          filename = "__Mining-Space-Industries__/graphics/electroshock-pulse-explosion.png",
          animation_speed = 1,
          frame_count = 7*5,
          line_length = 5,
          width = 1675/5,
          height = 2044/7,
          priority = "extra-high",
        }
      },
      flags = {
        "not-on-map"
      },
      light = {
        intensity = 1,
        size = 25,
        color = {a = 1,b = 1,g = 0.3,r = 0.1},
      },
      sound = {
        aggregation = {
          max_count = 1,
          remove = true
        },
        variations = {
          {
            filename = "__Mining-Space-Industries__/sound/electroshock-pulse-explosion.ogg",
            volume = 1
          }
        }
      },
	  
	created_effect =
    {
              type = "area",
              radius = 15,
              action_delivery =
              {
                type = "instant",
                target_effects = {
                  {
                    type = "create-sticker",
                    sticker = "electroshock-pulse-sticker",
                  },
                  {
                    type = "damage",
                    damage = { amount = 80, type = "laser"}
                  }
                }
              }
    }
  },
  

  
  
  {
    type = "sticker",
    name = "electroshock-pulse-sticker",
      animation = {
        scale = 1,
        filename = "__Mining-Space-Industries__/graphics/electroshock-pulse-sticker.png",
        animation_speed = 3.14,
        frame_count = 16*6,
        line_length = 16,
        width = 800/16,
        height = 240/6,
       -- priority = "extra-high",
      },
      duration_in_ticks = 60*10, --75
      --flags ={"not-on-map"},
      target_movement_modifier = 0.25,
  },
  
  
   
	
	{
		type = "simple-entity",
		name = "electric-animation",
		flags = {"not-blueprintable", "not-deconstructable","placeable-off-grid", "not-on-map"},
		map_color = {r=0.5, g=0.5, b=1},
		max_health = 1,
		collision_box = {{0, -0.2}, {0, 0.2}},
		collision_mask = { "item-layer", "object-layer", "water-tile"},
		selection_box = {{-0.5, -0.9}, {0.5, 0.9}},
		random_animation_offset = false,
		animations = {{
			scale = 1,
			filename = "__Mining-Space-Industries__/graphics/electroshock-pulse-sticker.png",
			animation_speed = 3.14,
			frame_count = 16*6,
			line_length = 16,
			width = 800/16,
			height = 240/6,
			-- priority = "extra-high",
			}},
		working_sound =
		{
			sound = { filename = "__base__/sound/accumulator-working.ogg" },
			volume = 0.9,
			audible_distance_modifier = 1,
			probability = 1
		},
		render_layer = "air-object", --render_layer = "smoke",
		tile_width = 1,
		tile_height = 1,
	},
 


 {
    type = "explosion",
    name = "msi-worm-surfacing",
    flags = {"placeable-off-grid", "not-on-map"},
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{0, 0}, {0, 0}},
    collision_mask = { "item-layer" },
    selectable_in_game = false,
    animations =
    {
      {
		filename = "__Mining-Space-Industries__/graphics/blank.png",
		width = 100,
		height = 100,
		frame_count = 1,
		line_length = 1,
		shift = {0, 0}
      }
    },
    light = {intensity = 0, size = 0},
    sound =
    {
      aggregation =
      {
        max_count = 1,
        remove = true
      },
      variations =
      {
        {
          filename = "__base__/sound/fight/large-explosion-1.ogg",
          volume = 1.25
        },
        {
          filename = "__base__/sound/fight/large-explosion-2.ogg",
          volume = 1.25
        }
      }
    },
    created_effect =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-particle",
            repeat_count = 60,
            entity_name = "explosion-remnants-particle",
            initial_height = 0.5,
            speed_from_center = 0.08,
            speed_from_center_deviation = 0.15,
            initial_vertical_speed = 0.08,
            initial_vertical_speed_deviation = 0.15,
            offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              radius = 4,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
                  type = "damage",
                  damage = { amount = 15, type = "explosion"}
                }
              }
            },
          }        
		}
      }
    }
  },
  
})

