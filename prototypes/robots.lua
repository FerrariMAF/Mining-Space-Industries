function robot_picture(filename)
return {
  filename = filename,
  priority = "high",
  width = 32,
  height = 32,
  frame_count = 1,
  direction_count = 1
}
end

msi_glados_robot_png = "__Mining-Space-Industries__/graphics/glados-robot.png"

msi_glados_shadow = {
  filename = "__Mining-Space-Industries__/graphics/glados-shadow.png",
  priority = "high",
  width = 52,
  height = 37,
  frame_count = 1,
  direction_count = 1
}


msi_glados_robot_smoke = {
  filename = "__base__/graphics/entity/smoke-construction/smoke-01.png",
  width = 39,
  height = 32,
  frame_count = 19,
  line_length = 19,
  shift = {0.078125, -0.15625},
  animation_speed = 0.3,
}

msi_glados_robot_sparks = {
  {
    filename = "__base__/graphics/entity/sparks/sparks-01.png",
    width = 39,
    height = 34,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.3125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-02.png",
    width = 36,
    height = 32,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-03.png",
    width = 42,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.203125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-04.png",
    width = 40,
    height = 35,
    frame_count = 19,
    line_length = 19,
    shift = {-0.0625, 0.234375},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-05.png",
    width = 39,
    height = 29,
    frame_count = 19,
    line_length = 19,
    shift = {-0.109375, 0.171875},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
  {
    filename = "__base__/graphics/entity/sparks/sparks-06.png",
    width = 44,
    height = 36,
    frame_count = 19,
    line_length = 19,
    shift = {0.03125, 0.3125},
    tint = { r = 1.0, g = 0.9, b = 0.0, a = 1.0 },
    animation_speed = 0.3,
  },
}



data:extend({

  {
    type = "construction-robot",
    name = "msi-glados-construction-robot",
    icon = msi_glados_robot_png,
    icon_size = 32,
    flags = {"placeable-player", "player-creation", "placeable-off-grid", "not-on-map"},
    minable = {hardness = 0.1, mining_time = 0.1, result = "msi-glados-construction-robot"},
    resistances = { { type = "fire", percent = 100 } },
    max_health = 2000,
    max_payload_size = 10,
    speed = 0.30,
    max_energy = "5000kJ",
    energy_per_tick = "80J",
    energy_per_move = "5000J",
    collision_box = {{0, 0}, {0, 0}},
    selection_box = {{-0.5, -1.5}, {0.5, -0.5}},
    transfer_distance = 0.5,
    speed_multiplier_when_out_of_energy = 0.3,
    min_to_charge = 0.2,
    max_to_charge = 0.95,
    working_sound = flying_robot_sounds(),
    working_light = {intensity = 1, size = 6},
    cargo_centered = {0.0, 0.2},
    construction_vector = {0.30, 0.22},
    repair_pack = "repair-pack",
    idle = robot_picture(msi_glados_robot_png),
    in_motion = robot_picture(msi_glados_robot_png),
    working = robot_picture(msi_glados_robot_png),
    shadow_idle = msi_glados_shadow,
    shadow_in_motion = msi_glados_shadow,
    shadow_working = msi_glados_shadow,
    smoke = msi_glados_robot_smoke,
    sparks = msi_glados_robot_sparks
  },
  
  
})

