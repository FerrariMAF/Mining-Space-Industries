require("prototypes.recipe_updates")



function add_recipe_unlock(technology, recipe)
  if data.raw.technology[technology] and data.raw.recipe[recipe] then
    local addit = true
    if not data.raw.technology[technology].effects then
      data.raw.technology[technology].effects = {}
    end
    for i, effect in pairs(data.raw.technology[technology].effects) do
      if effect.type == "unlock-recipe" and effect.recipe == recipe then addit = false end
    end
    if addit then table.insert(data.raw.technology[technology].effects,{type = "unlock-recipe", recipe = recipe}) end
  else
    if not data.raw.technology[technology] then
      log("Technology " .. technology .. " does not exist.")
    end
    if not data.raw.recipe[recipe] then
      log("Recipe " .. recipe .. " does not exist.")
    end
  end
end

function update_science_pack_amount(technology, amount)
  if data.raw.technology[technology] then
	local new ={}	
	for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
		table.insert (new,{ingredient[1], ingredient[2] + amount})
    end
	data.raw.technology[technology].unit.ingredients = new
	end
end

function add_new_science_pack(technology, pack, amount)
  if data.raw.technology[technology] and data.raw.tool[pack] then
    local addit = true
    for i, ingredient in pairs(data.raw.technology[technology].unit.ingredients) do
      if ingredient[1] == pack or ingredient.name == pack then addit = false end
    end
    if addit then table.insert(data.raw.technology[technology].unit.ingredients,{pack, amount}) end
  else
    if not data.raw.technology[technology] then
      log("Technology " .. technology .. " does not exist.")
    end
    if not data.raw.tool[pack] then
      log("Science pack " .. new .. " does not exist.")
    end
  end
end


--table.insert (data.raw.lab.lab.inputs, "gordon-freeman")
--table.insert (data.raw.lab.lab.inputs, "glados-core")
--table.insert (data.raw.lab.lab.inputs, "hal9000")


update_science_pack_amount ("robotics",9)
add_new_science_pack("robotics", "glados-core", 1)
data.raw.technology["robotics"].unit.count=math.ceil(data.raw.technology["robotics"].unit.count/10)
data.raw.technology["robotics"].unit.time=math.ceil(data.raw.technology["robotics"].unit.time/2)

add_recipe_unlock("construction-robotics","msi_recipe_glados_to_robot")
add_recipe_unlock("construction-robotics","msi_recipe_robot_to_glados")
add_recipe_unlock("automation-2","msi-worker-lab")

update_science_pack_amount ("nuclear-power",9)
add_new_science_pack("nuclear-power", "gordon-freeman", 1)
data.raw.technology["nuclear-power"].unit.count=math.ceil(data.raw.technology["nuclear-power"].unit.count/10)
data.raw.technology["nuclear-power"].unit.time=math.ceil(data.raw.technology["nuclear-power"].unit.time/3)

update_science_pack_amount ("rocket-silo",19)
add_new_science_pack("rocket-silo", "hal9000", 1)
data.raw.technology["rocket-silo"].unit.count=math.ceil(data.raw.technology["rocket-silo"].unit.count/20)
data.raw.technology["rocket-silo"].unit.time=math.ceil(data.raw.technology["rocket-silo"].unit.time/4)

-- mod OmegaDrill
if data.raw.technology["omega-drill"] then 
add_new_science_pack("omega-drill", "gordon-freeman", 1)
data.raw.technology["omega-drill"].enabled="false"
end	  



	  
-- BOBs adjusts for OP weapons / armor	  
if data.raw.technology["bob-power-armor-5"] then
add_new_science_pack("bob-power-armor-3","space-science-pack", 1)
add_new_science_pack("bob-power-armor-4","space-science-pack", 1)
add_new_science_pack("bob-power-armor-5","space-science-pack", 1)
add_new_science_pack("energy-shield-equipment-3","utility-science-pack", 1)
add_new_science_pack("energy-shield-equipment-4","space-science-pack", 1)
add_new_science_pack("energy-shield-equipment-5","space-science-pack", 1)
add_new_science_pack("energy-shield-equipment-6","space-science-pack", 1)
add_new_science_pack("battery-equipment-3","production-science-pack", 1)
add_new_science_pack("battery-equipment-4","utility-science-pack", 1)
add_new_science_pack("battery-equipment-5","space-science-pack", 1)
add_new_science_pack("battery-equipment-6","space-science-pack", 1)
add_new_science_pack("fusion-reactor-equipment-2","space-science-pack", 1)
add_new_science_pack("fusion-reactor-equipment-3","space-science-pack", 1)
add_new_science_pack("fusion-reactor-equipment-4","space-science-pack", 1)
add_new_science_pack("personal-laser-defense-equipment-2","utility-science-pack", 1)
add_new_science_pack("personal-laser-defense-equipment-3","utility-science-pack", 1)
add_new_science_pack("personal-laser-defense-equipment-4","space-science-pack", 1)
add_new_science_pack("personal-laser-defense-equipment-5","space-science-pack", 1)
add_new_science_pack("personal-laser-defense-equipment-6","space-science-pack", 1)
add_new_science_pack("bob-power-armor-5","space-science-pack", 1)
add_new_science_pack("bob-power-armor-5","space-science-pack", 1)
add_new_science_pack("bob-power-armor-5","space-science-pack", 1)
--data.raw["ammo-turret"]["bob-sniper-turret-1"].attack_parameters.damage_modifier = data.raw["ammo-turret"]["bob-sniper-turret-1"].attack_parameters.damage_modifier/2
--data.raw["ammo-turret"]["bob-sniper-turret-2"].attack_parameters.damage_modifier = data.raw["ammo-turret"]["bob-sniper-turret-2"].attack_parameters.damage_modifier/2
--data.raw["ammo-turret"]["bob-sniper-turret-3"].attack_parameters.damage_modifier = data.raw["ammo-turret"]["bob-sniper-turret-3"].attack_parameters.damage_modifier/2
end	  
	  
	  
	  
-- ANTI SERVER LAG WITH NE adjusts
--[[
if data.raw["item-group"]["Natural-Evolution"] then
local red_polut = 200
data.raw["unit"]["medium-biter"].pollution_to_join_attack = data.raw["unit"]["medium-biter"].pollution_to_join_attack -red_polut
data.raw["unit"]["big-biter"].pollution_to_join_attack = data.raw["unit"]["big-biter"].pollution_to_join_attack -red_polut
data.raw["unit"]["behemoth-biter"].pollution_to_join_attack = data.raw["unit"]["behemoth-biter"].pollution_to_join_attack -red_polut*2
data.raw["unit"]["big-spitter"].pollution_to_join_attack = data.raw["unit"]["big-spitter"].pollution_to_join_attack  -red_polut
data.raw["unit"]["behemoth-spitter"].pollution_to_join_attack = data.raw["unit"]["behemoth-spitter"].pollution_to_join_attack -red_polut

data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units = math.floor(data.raw["unit-spawner"]["biter-spawner"].max_count_of_owned_units / 2)
data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn = math.floor(data.raw["unit-spawner"]["biter-spawner"].max_friends_around_to_spawn/2)
data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units = math.floor(data.raw["unit-spawner"]["spitter-spawner"].max_count_of_owned_units / 2)
data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn = math.floor(data.raw["unit-spawner"]["spitter-spawner"].max_friends_around_to_spawn/2)

if data.raw["unit-spawner"]["bob-biter-spawner"] then 
	data.raw["unit-spawner"]["bob-biter-spawner"].max_count_of_owned_units = math.floor(data.raw["unit-spawner"]["bob-biter-spawner"].max_count_of_owned_units/2)
	data.raw["unit-spawner"]["bob-biter-spawner"].max_friends_around_to_spawn = math.floor(data.raw["unit-spawner"]["bob-biter-spawner"].max_friends_around_to_spawn/2)
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_count_of_owned_units = math.floor(data.raw["unit-spawner"]["bob-spitter-spawner"].max_count_of_owned_units/2)
	data.raw["unit-spawner"]["bob-spitter-spawner"].max_friends_around_to_spawn = math.floor(data.raw["unit-spawner"]["bob-spitter-spawner"].max_friends_around_to_spawn/2)
	data.raw["unit"]["bob-big-piercing-biter"].pollution_to_join_attack = data.raw["unit"]["bob-big-piercing-biter"].pollution_to_join_attack-red_polut
	data.raw["unit"]["bob-huge-acid-biter"].pollution_to_join_attack = data.raw["unit"]["bob-huge-acid-biter"].pollution_to_join_attack-red_polut
	data.raw["unit"]["bob-huge-explosive-biter"].pollution_to_join_attack = data.raw["unit"]["bob-huge-explosive-biter"].pollution_to_join_attack-red_polut
	data.raw["unit"]["bob-giant-poison-biter"].pollution_to_join_attack = data.raw["unit"]["bob-giant-poison-biter"].pollution_to_join_attack-red_polut
	data.raw["unit"]["bob-giant-fire-biter"].pollution_to_join_attack = data.raw["unit"]["bob-giant-fire-biter"].pollution_to_join_attack-red_polut
	data.raw["unit"]["bob-titan-biter"].pollution_to_join_attack = data.raw["unit"]["bob-titan-biter"].pollution_to_join_attack-red_polut
	data.raw["unit"]["bob-behemoth-biter"].pollution_to_join_attack = data.raw["unit"]["bob-behemoth-biter"].pollution_to_join_attack-red_polut
	data.raw["unit"]["bob-leviathan-biter"].pollution_to_join_attack = data.raw["unit"]["bob-leviathan-biter"].pollution_to_join_attack	-red_polut
	data.raw["unit"]["bob-big-electric-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-big-electric-spitter"].pollution_to_join_attack-red_polut*2
	data.raw["unit"]["bob-huge-explosive-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-huge-explosive-spitter"].pollution_to_join_attack-red_polut*2
	data.raw["unit"]["bob-huge-acid-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-huge-acid-spitter"].pollution_to_join_attack-red_polut*2
	data.raw["unit"]["bob-giant-fire-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-giant-fire-spitter"].pollution_to_join_attack-red_polut*2
	data.raw["unit"]["bob-giant-poison-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-giant-poison-spitter"].pollution_to_join_attack-red_polut*2
	data.raw["unit"]["bob-titan-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-titan-spitter"].pollution_to_join_attack-red_polut*2
	data.raw["unit"]["bob-behemoth-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-behemoth-spitter"].pollution_to_join_attack-red_polut*2
	data.raw["unit"]["bob-leviathan-spitter"].pollution_to_join_attack = data.raw["unit"]["bob-leviathan-spitter"].pollution_to_join_attack	-red_polut*2		
	end	
	
end 
]]