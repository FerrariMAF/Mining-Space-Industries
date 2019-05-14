
local bm_Fire = table.deepcopy(data.raw["fire"]["fire-flame"])
bm_Fire.name = "bm_Fire"
bm_Fire.initial_lifetime = 700
bm_Fire.damage_per_tick = { amount = 100 / 60, type = "fire" }
bm_Fire.on_fuel_added_action = nil
bm_Fire.damage_multiplier_decrease_per_tick = 0.0005
bm_Fire.maximum_damage_multiplier = 1
bm_Fire.fade_out_duration = 60
bm_Fire.lifetime_increase_by = 0


function fire_stream(data)
  return
  {
    type = "stream",
    name = data.name,
    flags = {"not-on-map"},
    stream_light = {intensity = 1, size = 6}, -----
    ground_light = {intensity = 0.8, size = 6}, ---
    particle_buffer_size = 90,
    particle_spawn_interval = data.particle_spawn_interval,
    particle_spawn_timeout = data.particle_spawn_timeout,
    particle_vertical_acceleration = 0.005 * 0.60 *1.5, --x
    particle_horizontal_speed = 0.2* 0.75 * 1.5 * 1.5, --x
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_alpha_per_part = 0.8,
    particle_scale_per_part = 0.8,
    particle_loop_frame_count = 15,
    --particle_fade_out_threshold = 0.95,
    particle_fade_out_duration = 2, 
    particle_loop_exit_threshold = 0.25,
    special_neutral_target_damage = {amount = 1, type = "acid"},
    initial_action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "play-sound",
              sound =
              {
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                  volume = 0.8
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                  volume = 0.8
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                  volume = 0.8
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                  volume = 0.8
                }
              }
            },
            {
              type = "create-fire",
              entity_name = data.splash_fire_name
            },
			{
			  type = "create-fire",
			  entity_name = "bm_Fire",
			  initial_ground_flame_count = 30,
			},			

          }
        }
      },
      {
        type = "area",
        radius = data.spit_radius,
        force = "enemy",
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = data.sticker_name
            },
            {
              type = "damage",
              damage = {amount = 30, type = "fire"}
            }
          }
        }
      }
    },
    particle = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-head.png",
      line_length = 5,
      width = 22,
      height = 84,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(-2, 30), data.scale),
      tint = data.tint,
      priority = "high",
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-head.png",
        line_length = 5,
        width = 42,
        height = 164,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
        tint = data.tint,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },
    spine_animation = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png",
      line_length = 5,
      width = 66,
      height = 12,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(0, -2), data.scale),
      tint = data.tint,
      priority = "high",
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-tail.png",
        line_length = 5,
        width = 132,
        height = 20,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(0, -1), data.scale),
        tint = data.tint,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },
    shadow = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
      line_length = 15,
      width = 22,
      height = 84,
      frame_count = 15,
      priority = "high",
      shift = util.mul_shift(util.by_pixel(-2, 30), data.scale),
      draw_as_shadow = true,
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-shadow.png",
        line_length = 15,
        width = 42,
        height = 164,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
        draw_as_shadow = true,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },

    oriented_particle = true,
    shadow_scale_enabled = true,
  }
end

function fire_stream_cluster(data)
  return
  {
    type = "stream",
    name = data.name,
    flags = {"not-on-map"},
    stream_light = {intensity = 1, size = 4}, -----
    ground_light = {intensity = 0.8, size = 4}, ---
    particle_buffer_size = 90,
    particle_spawn_interval = data.particle_spawn_interval,
    particle_spawn_timeout = data.particle_spawn_timeout,
    particle_vertical_acceleration = 0.005 * 0.60 *1.5, --x
    particle_horizontal_speed = 0.2* 0.75 * 1.5 * 1.5, --x
    particle_horizontal_speed_deviation = 0.005 * 0.70,
    particle_start_alpha = 0.5,
    particle_end_alpha = 1,
    particle_alpha_per_part = 0.8,
    particle_scale_per_part = 0.8,
    particle_loop_frame_count = 15,
    --particle_fade_out_threshold = 0.95,
    particle_fade_out_duration = 2, 
    particle_loop_exit_threshold = 0.25,
    special_neutral_target_damage = {amount = 1, type = "acid"},
    initial_action =
    {
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "play-sound",
              sound =
              {
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
                  volume = 0.8
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-2.ogg",
                  volume = 0.8
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-long-1.ogg",
                  volume = 0.8
                },
                {
                  filename = "__base__/sound/creatures/projectile-acid-burn-long-2.ogg",
                  volume = 0.8
                }
              }
            },
            {
              type = "create-fire",
              entity_name = data.splash_fire_name
            },
			{
			  type = "create-fire",
			  entity_name = "bm_Fire",
			  initial_ground_flame_count = 30,
			},			
			{
				type = "nested-result",
				action =
						{
							type = "cluster",
							cluster_count = 5,
							distance = 5,
							distance_deviation = 20,
							action_delivery =
							{
								type = "stream",
								stream = "msi-fire-stream",
								starting_speed = 0.1,
								max_range = 20
							},
						}
			},
          }
        }
      },
      {
        type = "area",
        radius = data.spit_radius,
        force = "enemy",
        ignore_collision_condition = true,
        action_delivery =
        {
          type = "instant",
          target_effects =
          {
            {
              type = "create-sticker",
              sticker = data.sticker_name
            },
            {
              type = "damage",
              damage = {amount = 30, type = "fire"}
            }
          }
        }
      }
    },
    particle = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-head.png",
      line_length = 5,
      width = 22,
      height = 84,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(-2, 30), data.scale),
      tint = data.tint,
      priority = "high",
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-head.png",
        line_length = 5,
        width = 42,
        height = 164,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
        tint = data.tint,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },
    spine_animation = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-tail.png",
      line_length = 5,
      width = 66,
      height = 12,
      frame_count = 15,
      shift = util.mul_shift(util.by_pixel(0, -2), data.scale),
      tint = data.tint,
      priority = "high",
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-tail.png",
        line_length = 5,
        width = 132,
        height = 20,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(0, -1), data.scale),
        tint = data.tint,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },
    shadow = {
      filename = "__base__/graphics/entity/acid-projectile/acid-projectile-shadow.png",
      line_length = 15,
      width = 22,
      height = 84,
      frame_count = 15,
      priority = "high",
      shift = util.mul_shift(util.by_pixel(-2, 30), data.scale),
      draw_as_shadow = true,
      scale = data.scale,
      animation_speed = 1,
      hr_version =
      {
        filename = "__base__/graphics/entity/acid-projectile/hr-acid-projectile-shadow.png",
        line_length = 15,
        width = 42,
        height = 164,
        frame_count = 15,
        shift = util.mul_shift(util.by_pixel(-2, 31), data.scale),
        draw_as_shadow = true,
        priority = "high",
        scale = 0.5 * data.scale,
        animation_speed = 1,
      }
    },

    oriented_particle = true,
    shadow_scale_enabled = true,
  }
end
	
local boss_scale = 3.5	
local fire_tint = {r = 1.0, g = 0.3, b = 0.1, a = 1.000}	
	
data:extend(
{
bm_Fire,	

  acid_sticker({
    name = "msi-fire-sticker",
    tint = fire_tint,
    slow_player_movement = 0.5,
    slow_vehicle_speed = 0.5,
    slow_vehicle_friction = 1.5,
    slow_seconds = 5
  }),
  
  acid_splash_fire({
    name = "msi-fire-splash",
    scale = (boss_scale-1),
    tint = fire_tint,
    ground_patch_scale = (boss_scale-1) * ground_patch_scale_modifier,
    patch_tint_multiplier = patch_opacity,
    splash_damage_per_tick = 1,
    sticker_name = "msi-fire-sticker"
  }),

  fire_stream({
    name = "msi-fire-stream",
    scale = boss_scale-1,
    tint = fire_tint,
    corpse_name = "msi-fire-splash-corpse",
    spit_radius = stream_radius_worm_behemoth, --2
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "msi-fire-splash",
    sticker_name = "msi-fire-sticker"
  }),

  fire_stream_cluster({
    name = "maf-cluster-fire-projectile",
    scale = boss_scale,
    tint = fire_tint,
    corpse_name = "msi-fire-splash-corpse",
    spit_radius = stream_radius_worm_behemoth, --2
    particle_spawn_interval = 1,
    particle_spawn_timeout = 6,
    splash_fire_name = "msi-fire-splash",
    sticker_name = "msi-fire-sticker"
  }),

	

})

