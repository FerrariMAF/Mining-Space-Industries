
Resistances = {
	boss_fire_only = {
	  {type = "fire", decrease = -10, percent = -110},
      {type = "physical", decrease = 40, percent = 95},
      {type = "impact", decrease = 20, percent = 80},
      {type = "explosion", decrease = 20, percent = 50},
      {type = "acid", decrease = 10, percent = 70},
      {type = "poison", decrease = 10, percent = 70},
      {type = "laser", decrease = 10, percent = 90},
	  {type = "electric", decrease = 10, percent = 90},
	  },
	  
	boss_physical_only = {
      {type = "physical", decrease = -10, percent = -30},
	  {type = "fire", decrease = 50, percent = 100},
      {type = "impact", decrease = 50, percent = 80},
      {type = "explosion", decrease = 10, percent = 95},
      {type = "acid", decrease = 10, percent = 60},
      {type = "poison", decrease = 10, percent = 80},
      {type = "laser", decrease = 20, percent = 80},
	  {type = "electric", decrease = 10, percent = 80},
	  },

	boss_explosion_only = {
	  {type = "fire", decrease = -10, percent = -10},
      {type = "physical", decrease = 40, percent = 95},
      {type = "impact", decrease = 20, percent = 80},
      {type = "explosion", decrease = -20, percent = -100},
      {type = "acid", decrease = 10, percent = 70},
      {type = "poison", decrease = 10, percent = 70},
      {type = "laser", decrease = 10, percent = 90},
	  {type = "electric", decrease = 10, percent = 80},
	  },

	boss_fireworm = {
      {type = "physical", decrease = -10, percent = -30},
	  {type = "electric", decrease = -10, percent = -30},
      {type = "laser", decrease = -10, percent = -30},
	  {type = "fire", decrease = 50, percent = 100},
      {type = "impact", decrease = 20, percent = 40},
      {type = "explosion", decrease = 20, percent = 30},
      {type = "acid", decrease = 10, percent = 20},
      {type = "poison", decrease = 10, percent = 20},
	  },
	  
}

if data.raw["damage-type"]["bob-pierce"] then
	table.insert(Resistances.boss_fire_only,{type = "bob-pierce", decrease = 20, percent = 90})
	end



	
Spawn_units = {
	boss_all_units = {
      {"small-biter", {{0.0, 0.3}, {0.25, 0.3}, {0.35, 0.0}}},
      {"small-spitter", {{0.25, 0.3}, {0.5, 0.3}, {0.7, 0.0}}},
	  {"medium-biter", 		 {{0.30, 0.0}, {0.50, 0.3}, {0.60, 0.0}}},
      {"medium-spitter", {{0.4, 0.0}, {0.5, 0.3}, {0.6, 0.0}}},
      {"big-spitter", {{0.59, 0.0}, {0.6, 0.4}, {0.7, 0.0}}},
	  {"big-biter",	{{0.59, 0.0}, {0.6, 0.3}, {0.7, 0.0}}}
	  }
}

if data.raw["unit"]["bob-big-electric-spitter"] then
	table.insert(Spawn_units.boss_all_units,{"bob-big-electric-spitter", {{0.6, 0.0}, {0.7, 0.4}, {0.8, 0.0}}})
	table.insert(Spawn_units.boss_all_units,{"bob-big-piercing-biter", {{0.6, 0.0}, {0.7, 0.4}, {0.8, 0.0}}})

	table.insert(Spawn_units.boss_all_units,{"bob-huge-explosive-spitter", {{0.6, 0.0}, {0.7, 0.2}}})

	table.insert(Spawn_units.boss_all_units,{"bob-huge-acid-spitter", {{0.6, 0.0}, {0.7, 0.1}}})
	table.insert(Spawn_units.boss_all_units,{"bob-huge-acid-biter", {{0.6, 0.0}, {0.7, 0.2}}})

	table.insert(Spawn_units.boss_all_units,{"bob-giant-fire-spitter", {{0.7, 0.0}, {0.8, 0.2}}})
	table.insert(Spawn_units.boss_all_units,{"bob-giant-fire-biter", {{0.7, 0.0}, {0.8, 0.2}}})
	
	table.insert(Spawn_units.boss_all_units,{"bob-giant-poison-spitter", {{0.7, 0.0}, {0.8, 0.1}}})
	table.insert(Spawn_units.boss_all_units,{"bob-giant-poison-biter", {{0.7, 0.0}, {0.8, 0.1}}})

	
	table.insert(Spawn_units.boss_all_units,{"bob-titan-spitter", {{0.8, 0.0}, {0.9, 0.3}}})
	table.insert(Spawn_units.boss_all_units,{"bob-titan-biter", {{0.8, 0.0}, {0.9, 0.3}}})

	table.insert(Spawn_units.boss_all_units,{"bob-behemoth-spitter", {{0.90, 0.0}, {0.91, 0.3}}})
	table.insert(Spawn_units.boss_all_units,{"bob-behemoth-biter", {{0.90, 0.0}, {0.91, 0.3}}})

	table.insert(Spawn_units.boss_all_units,{"bob-leviathan-spitter", {{0.95, 0.0}, {0.96, 0.05}}})
	table.insert(Spawn_units.boss_all_units,{"bob-leviathan-biter", {{0.95, 0.0}, {0.96, 0.05}}})
end



--[[
original	
Spawn_units = {
	boss_all_units = {
      {"small-biter", {{0.0, 0.3}, {0.25, 0.3}, {0.35, 0.0}}},
      {"small-spitter", {{0.25, 0.3}, {0.5, 0.3}, {0.7, 0.0}}},
	  {"medium-biter", 		 {{0.30, 0.0}, {0.60, 0.3}, {0.70, 0.0}}},
      {"medium-spitter", {{0.4, 0.0}, {0.6, 0.3}, {0.8, 0.0}}},
      {"big-spitter", {{0.6, 0.0}, {0.7, 0.4}, {0.8, 0.0}}},
	  {"big-biter",	{{0.60, 0.0}, {0.90, 0.3}, {1.00, 0.0}}}
	  }
}

if data.raw["unit"]["bob-big-electric-spitter"] then
	table.insert(Spawn_units.boss_all_units,{"bob-big-electric-spitter", {{0.7, 0.0}, {0.8, 0.4}, {0.9, 0.0}}})
	table.insert(Spawn_units.boss_all_units,{"bob-big-piercing-biter", {{0.7, 0.0}, {0.8, 0.4}, {0.9, 0.0}}})

	table.insert(Spawn_units.boss_all_units,{"bob-huge-explosive-spitter", {{0.7, 0.0}, {0.8, 0.2}}})

	table.insert(Spawn_units.boss_all_units,{"bob-huge-acid-spitter", {{0.7, 0.0}, {0.8, 0.1}}})
	table.insert(Spawn_units.boss_all_units,{"bob-huge-acid-biter", {{0.7, 0.0}, {0.8, 0.2}}})

	table.insert(Spawn_units.boss_all_units,{"bob-giant-fire-spitter", {{0.8, 0.0}, {0.9, 0.2}}})
	table.insert(Spawn_units.boss_all_units,{"bob-giant-fire-biter", {{0.8, 0.0}, {0.9, 0.2}}})
	
	table.insert(Spawn_units.boss_all_units,{"bob-giant-poison-spitter", {{0.8, 0.0}, {0.9, 0.1}}})
	table.insert(Spawn_units.boss_all_units,{"bob-giant-poison-biter", {{0.8, 0.0}, {0.9, 0.1}}})

	
	table.insert(Spawn_units.boss_all_units,{"bob-titan-spitter", {{0.9, 0.0}, {1.0, 0.3}}})
	table.insert(Spawn_units.boss_all_units,{"bob-titan-biter", {{0.9, 0.0}, {1.0, 0.3}}})

	table.insert(Spawn_units.boss_all_units,{"bob-behemoth-spitter", {{0.99, 0.0}, {1.0, 0.3}}})
	table.insert(Spawn_units.boss_all_units,{"bob-behemoth-biter", {{0.99, 0.0}, {1.0, 0.3}}})

	table.insert(Spawn_units.boss_all_units,{"bob-leviathan-spitter", {{0.99, 0.0}, {1.0, 0.05}}})
	table.insert(Spawn_units.boss_all_units,{"bob-leviathan-biter", {{0.99, 0.0}, {1.0, 0.05}}})
end


--]]
