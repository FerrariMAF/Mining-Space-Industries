require ("prototypes.msi_spawner_animations")
--demo-worm-animations.lua
require ("values")

local night_boss_tint = {r=0.1, g=0.2, b=0.1, a=1.0}
local boss_red_tint = {r=1, g=0.2, b=0.1, a=1.0}
local boss_green_tint = {r=0.3, g=1, b=0.2, a=1.0}
local boss_scale = 3.5

data:extend({
 
  {
    type = "unit-spawner",
    name = "msi-night-boss-spawner",
    icon = "__base__/graphics/icons/biter-spawner.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "not-repairable"},
    max_health = 100000,
    order="b-b-j",
    subgroup="enemies",
    working_sound =
    {
      sound =
      {
        {
          filename = "__base__/sound/creatures/spawner.ogg",
          volume = 2
        }
      },
      apparent_volume = 2
    },
    dying_sound =
    {
      {
        filename = "__Mining-Space-Industries__/sound/death-z.wav",
        volume = 2
      }
    },
    resistances = Resistances.boss_fire_only,
    healing_per_tick = 0.02,
    collision_box = {{-3*boss_scale, -2*boss_scale}, {2*boss_scale, 2*boss_scale}},
    selection_box = {{-3*boss_scale, -2*boss_scale}, {2*boss_scale, 2*boss_scale}},
    -- in ticks per 1 pu
    pollution_absorption_absolute = 15, -- v20,
    pollution_absorption_proportional = 0.005, -- v0.01,
    pollution_to_enhance_spawning = 200,
    corpse = "msi-night-boss-spawner-corpse",
    dying_explosion = "blood-explosion-huge",
    loot = {},
    max_count_of_owned_units = 500,
    max_friends_around_to_spawn = 300,
    animations =
    {
      msi_spawner_idle_animation(0, night_boss_tint,boss_scale),
      msi_spawner_idle_animation(1, night_boss_tint,boss_scale),
      msi_spawner_idle_animation(2, night_boss_tint,boss_scale),
      msi_spawner_idle_animation(3, night_boss_tint,boss_scale)
    },
    integration =
    {
      sheet = msi_spawner_integration(boss_scale)
    },	
    result_units = Spawn_units.boss_all_units,
    -- With zero evolution the spawn rate is 2 seconds, with max evolution it is .5 seconds
    spawning_cooldown = {120, 30},
    spawning_radius = 15,
    spawning_spacing = 3,
    max_spawn_shift = 0,
    max_richness_for_spawn_shift = 100,
  --  autoplace = enemy_spawner_autoplace(1),
    call_for_help_radius = 250
  },

  {
    type = "corpse",
    name = "msi-night-boss-spawner-corpse",
    flags = {"placeable-neutral", "placeable-off-grid", "not-on-map"},
    icon = "__base__/graphics/icons/biter-spawner-corpse.png",
	icon_size = 32,
    collision_box = {{-2*boss_scale, -2*boss_scale}, {2*boss_scale, 2*boss_scale}},
    selection_box = {{-2*boss_scale, -2*boss_scale}, {2*boss_scale, 2*boss_scale}},
    selectable_in_game = false,
	time_before_removed = 15 * 60 * 60,
    dying_speed = 0.01,
    subgroup="corpses",
    order = "c[corpse]-c[big-spitter-spawner]",
    final_render_layer = "remnants",
    animation =
    {
      msi_spawner_die_animation(0, night_boss_tint,boss_scale),
      msi_spawner_die_animation(1, night_boss_tint,boss_scale),
      msi_spawner_die_animation(2, night_boss_tint,boss_scale),
      msi_spawner_die_animation(3, night_boss_tint,boss_scale)
    },
	ground_patch =
    {
      sheet = msi_spawner_integration(boss_scale)
    }
  },
  
 
  
  
 
  {
    type = "turret",
    name = "msi-worm-boss-fire-shooter",
    icon = "__base__/graphics/icons/big-worm.png",
	icon_size = 32,
    flags = {"placeable-player", "placeable-enemy", "not-repairable", "breaths-air"},
    max_health = 80000,
    order="b-b-f",
    subgroup="enemies",
    resistances = fire_resistances,
    healing_per_tick = 0.02,
    collision_box = {{-4, -4}, {4, 4}},
    selection_box = {{-4, -4}, {4, 4}},
    shooting_cursor_size = 4,
    rotation_speed = 1,
    corpse = "msi-worm-boss-fire-shooter-corpse",
    dying_explosion = "blood-explosion-big",
    dying_sound = make_worm_dying_sounds(2.0),
    inventory_size = 2,
    folded_speed = 0.01,
    folded_speed_secondary = 0.024,
    folded_animation = worm_folded_animation(boss_scale, red),
    preparing_speed = 0.024,
    preparing_animation = worm_preparing_animation(boss_scale, red, "forward"),
    preparing_sound = make_worm_standup_sounds(2),
    prepared_speed = 0.024,
    prepared_speed_secondary = 0.012,
    prepared_animation = worm_prepared_animation(boss_scale, red),
    prepared_sound = make_worm_breath(2),
    prepared_alternative_speed = 0.014,
    prepared_alternative_speed_secondary = 0.010,
    prepared_alternative_chance = 0.2,
    prepared_alternative_animation = worm_prepared_alternative_animation(boss_scale, red),
    prepared_alternative_sound = make_worm_roar_alternative(2),
    starting_attack_speed = 0.034,
    starting_attack_animation = worm_start_attack_animation(boss_scale, red),
    starting_attack_sound = make_worm_roars(2),
    ending_attack_speed = 0.016,
    ending_attack_animation = worm_end_attack_animation(boss_scale, red),
    folding_speed = 0.015,
    folding_animation =  worm_preparing_animation(boss_scale, red, "backward"),
    folding_sound = make_worm_fold_sounds(2),
    integration = worm_integration(boss_scale),
    secondary_animation = true,
    random_animation_offset = true,
    attack_from_start_frame = true,
    prepare_range = range_worm_behemoth + prepare_range_worm_behemoth,
    allow_turning_when_starting_attack = true,
    loot = {},
	call_for_help_radius = 300,
    attack_parameters =
    {
      type = "stream",
      ammo_category = "biological",
      damage_modifier = 1,
      cooldown = 120,
      range = 80,
      min_range = 0,
      projectile_creation_parameters = worm_shoot_shiftings(boss_scale, boss_scale * scale_worm_stream),
      use_shooter_direction = true,
      lead_target_for_projectile_speed = 0.2* 0.75 * 1.5 * 1.5, -- this is same as particle horizontal speed of flamethrower fire stream
      ammo_type =
      {
        category = "biological",
        action =
        {
          type = "direct",
          action_delivery =
          {
            type = "stream",
            stream = "maf-cluster-fire-projectile",
            duration = 100,
            source_offset = {0.15, -0.5}
          }
        }
      },
    },
  },
 


   {
    type = "corpse",
    name = "msi-worm-boss-fire-shooter-corpse",
    icon = "__base__/graphics/icons/behemoth-worm-corpse.png",
    icon_size = 32,
    selection_box = {{-0.8, -0.8}, {0.8, 0.8}},
    selectable_in_game = false,
    subgroup="corpses",
    order = "c[corpse]-c[worm]-d[big]",
    flags = {"placeable-neutral", "placeable-off-grid", "building-direction-8-way", "not-repairable", "not-on-map"},
    dying_speed = 0.01,
    time_before_removed = 15 * 60 * 60,
    final_render_layer = "lower-object-above-shadow",
    animation = worm_die_animation(boss_scale, red),
    ground_patch =
    {
      sheet = worm_integration(boss_scale)
    }
  },
  
 


  
})
