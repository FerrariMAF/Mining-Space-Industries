

local recipe1 = table.deepcopy(data.raw.recipe['advanced-circuit'])
recipe1.name = "msi_double_advanced_circuit"
recipe1.icon = "__Mining-Space-Industries__/graphics/double-advanced-circuit.png"
recipe1.icon_size = 32
recipe1.normal.result_count = 2
recipe1.expensive.result_count = 2

local recipe2 = table.deepcopy(data.raw.recipe['processing-unit'])
recipe2.name = "msi_double_processing_unit"
recipe2.icon =  "__Mining-Space-Industries__/graphics/double-processing-unit.png"
recipe2.icon_size = 32
recipe2.normal.result_count = 2
recipe2.expensive.result_count = 2

local res =
    {
      {
        name = "gordon-freeman",
        amount = 1
      },
      {
        name = "processing-unit",
        amount = 4
      }
    }


local recipe3 = table.deepcopy(data.raw.recipe['processing-unit'])
recipe3.name = "msi_double_processing_unit2"
recipe3.icon =  "__Mining-Space-Industries__/graphics/double-processing-unit.png"
recipe3.icon_size = 32

local ing = recipe3.normal.ingredients
table.insert (ing, {"gordon-freeman", 1})
recipe3.normal.ingredients = ing

local ing = recipe3.expensive.ingredients
table.insert (ing, {"gordon-freeman", 1})
recipe3.expensive.ingredients = ing

recipe3.normal.results = res
recipe3.expensive.results = res
recipe3.subgroup = "intermediate-product"
   

local recipefreeman = 
		{	{"gordon-freeman", 1},
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"uranium-238",1},
			{"explosives", 1},
		}

local recipefreeman2 = 
		{	{"gordon-freeman", 1},
			{"speed-module", 1},
			{"chemical-science-pack", 1},
			{"processing-unit",1},
		}


		
if data.raw.item["alien-artifact"] then
table.insert(recipefreeman,{"alien-artifact", 1})	
end
if data.raw.item["alien-artifact-yellow"] then
table.insert(recipefreeman2,{"alien-artifact-yellow", 1})	
end


data:extend({

recipe1,
recipe2,
recipe3,

  {
    type = "recipe",
    name = "msi-worker-lab",
    icon = "__Mining-Space-Industries__/graphics/worker-lab.png",
    icon_size = 64,
    subgroup = "production-machine",	
    energy_required = 4,
    ingredients =
    {
      {"advanced-circuit", 50},
	  {"steel-plate", 50},
      {"iron-gear-wheel", 40},
      {"fast-inserter", 20},
	  {"glados-core", 1},
    },
	enabled = "false",
    results = { {type="item", name="msi-worker-lab", amount=1}, {type="item", name="glados-core", amount=1}}
  },



 {
    type = "recipe",
    name = "container",
    energy_required = 30,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"steel-plate",100}
    },
    result = "container"
  },


 {
    type = "recipe",
    name = "uranium-shell-cargo",
    energy_required = 100,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"uranium-cannon-shell",10000},
	  {"container",10}
    },
    result = "uranium-shell-cargo"
  },  
  
 {
    type = "recipe",
    name = "steel-cargo",
    energy_required = 100,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"steel-plate",50000},
	  {"container",10}
    },
    result = "steel-cargo"
  },
  
  
  {
    type = "recipe",
    name = "copper-cargo",
    energy_required = 100,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"copper-cable",60000},
	  {"container",10}
    },
    result = "copper-cargo"
  },
 
  {
    type = "recipe",
    name = "crude-oil-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
		{"crude-oil-barrel",1000},	
		{"container",10}
    },
    result = "crude-oil-cargo"
  },
  

  
  {
    type = "recipe",
    name = "heavy-oil-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"heavy-oil-barrel",1000},
		{"container",10}
    },
    result = "heavy-oil-cargo"
  },

  {
    type = "recipe",
    name = "light-oil-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"light-oil-barrel",1000},
		{"container",10}
    },
    result = "light-oil-cargo"
  },
    
   {
    type = "recipe",
    name = "petroleum-gas-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"petroleum-gas-barrel",1000},
		{"container",10}
    },
    result = "petroleum-gas-cargo"
  },


  
   {
    type = "recipe",
    name = "lubricant-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"lubricant-barrel",1000},
		{"container",10}
    },
    result = "lubricant-cargo"
  },
 
  
 
   {
    type = "recipe",
    name = "sulfuric-acid-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"sulfuric-acid-barrel",1000},
		{"container",10}
    },
    result = "sulfuric-acid-cargo"
  },   

    
   {
    type = "recipe",
    name = "atomic-bomb-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"atomic-bomb",1000},
	  {"container",10}
    },
    result = "atomic-bomb-cargo"
  },   

  
    {
    type = "recipe",
    name = "battery-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"battery-mk2-equipment",1000},
		{"container",10}
    },
    result = "battery-cargo"
  },   

  
    {
    type = "recipe",
    name = "red-chip-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"advanced-circuit",10000},
		{"container",10}
    },
    result = "red-chip-cargo"
  },   
    
  
    {
    type = "recipe",
    name = "blue-chip-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"processing-unit",5000},
		{"container",10}
    },
    result = "blue-chip-cargo"
  },   
    
    {
    type = "recipe",
    name = "rocket-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
      {"explosive-rocket",10000},
		{"container",10}
    },
    result = "rocket-cargo"
  },   
  
    {
    type = "recipe",
    name = "tank-cargo",
    energy_required = 1000,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
		{"tank",500},
		{"container",50}
    },
    result = "tank-cargo"
  },
  
  
  
    {
    type = "recipe",
    name = "artillery-cargo",
    energy_required = 500,
    category = "advanced-crafting",
    enabled = "false",
    ingredients = 
    {
		{"artillery-turret",500},
		{"container",50}
    },
    result = "artillery-cargo"
  },
    
  
  
 
 {
    type = "recipe",
    name = "msi_recipe_glados_to_robot",
    energy_required = 20,
    category = "crafting-with-fluid",
    enabled = "false",
--	icon = "__Mining-Space-Industries__/graphics/glados-robot.png",
--	icon_size = 32,
    subgroup = "logistic-network",
	ingredients = 
		{
			{"construction-robot",1},
			{"steel-plate",10},
			{"glados-core", 1},
			{type="fluid", name="lubricant", amount=80},
		},
    result = "msi-glados-construction-robot"
  },
 

    {
    type = "recipe",
    name = "msi_recipe_robot_to_glados",
    energy_required = 20,
    category = "crafting",
    enabled = "false",
    ingredients = 
    {
		{"msi-glados-construction-robot",1}
    },
    result = "glados-core"
  },
    




  
   {
    type = "recipe",
    name = "uranium-cargo",
    energy_required = 1000,
    category = "centrifuging",
    icon = "__Mining-Space-Industries__/graphics/uranium-cargo.png",
	icon_size = 32,
    enabled = "false",
    ingredients = 
    {
      {"uranium-fuel-cell",10000},
		{"container",10}
    },
    results =
    {
      {
        name = "uranium-cargo",
        amount = 1
      }
    },
    allow_decomposition = false
},   
 
 

  
 
   {
    type = "recipe",
    name = "test-cube",
    energy_required = 3,
    category = "advanced-crafting",
    enabled = "false",
	icon = "__Mining-Space-Industries__/graphics/test-cube-64.png",
	icon_size = 64,
	subgroup = "science-pack",
    ingredients = 
    {
      {"plastic-bar",1},
      {"iron-plate",1},
      {"steel-plate",1},
	  {"cube-plans",1},
    },
    results =
    {
      {
        name = "test-cube",
        amount = 1
      },
      {
        name = "cube-plans",
        amount = 1
      }
    }
   },  
 

 {
    type = "recipe",
    name = "glados-science1",
    energy_required = 30,
    category = "advanced-crafting",
    enabled = "false",
	icon = "__Mining-Space-Industries__/graphics/glados-science1-64.png",
	icon_size = 64,
    subgroup = "science-pack",
	ingredients = 
		{
			{"solid-fuel", 1},
			{"advanced-circuit",1},
			{"glados-core", 1},
			{"test-cube",4},
		},
    results =
    {
      {
        name = "glados-core",
        amount = 1
      },
      {
        name = "chemical-science-pack",
        amount = 2
      }
    }
  },
 
 
 
 {
    type = "recipe",
    name = "glados-science2",
    energy_required = 35,
    category = "advanced-crafting",
    enabled = "false",
	icon = "__Mining-Space-Industries__/graphics/glados-science2-64.png",
	icon_size = 64,
    subgroup = "science-pack",
	ingredients = 
		{
			{"logistic-science-pack", 1},
			{"flying-robot-frame", 1},
			{"glados-core", 1},
			{"wheatley-core", 1},
			{"test-cube",6},
		},
    results =
    {
      {
        name = "glados-core",
        amount = 1
      },
      {
        name = "wheatley-core",
        amount = 1
      },
      {
        name = "utility-science-pack",
        amount = 3
      }
    }
  },
 
 
 
 
 {
    type = "recipe",
    name = "hal-science1",
    energy_required = 40,
    category = "advanced-crafting",
    enabled = "false",
	icon = "__Mining-Space-Industries__/graphics/hal-science1-64.png",
	icon_size = 64,
    subgroup = "science-pack",
	ingredients = 
		{
			{"logistic-science-pack", 1},
			{"productivity-module",1},
			{"rail",5},
			{"hal9000", 1},
		},
    results =
    {
      {
        name = "hal9000",
        amount = 1
      },
      {
        name = "production-science-pack",
        amount = 2
      }
    }
  },


  

 {
    type = "recipe",
    name = "gordon-freeman-science",
    energy_required = 45,
    category = "advanced-crafting",
    enabled = "false",
	icon = "__Mining-Space-Industries__/graphics/gordon-freeman-science-64.png",
	icon_size = 64,
    subgroup = "science-pack",
	ingredients = recipefreeman,
    results =
    {
      {
        name = "gordon-freeman",
        amount = 1
      },
      {
        name = "atomic-bomb",
        amount = 1,
		probability = 0.01,
      },
      {
        name = "chemical-science-pack",
        amount = 2,
	   probability = 0.20,
      },

      {
        name = "utility-science-pack",
        amount = 3,
	   probability = 0.30,
      },
      {
        name = "production-science-pack",
        amount = 4,
	   probability = 0.40,
      },
    }
  },

  
 {
    type = "recipe",
    name = "gordon-freeman-science2",
    energy_required = 50,
    category = "advanced-crafting",
    enabled = "false",
	icon = "__Mining-Space-Industries__/graphics/gordon-freeman-science-64.png",
	icon_size = 64,
    subgroup = "science-pack",
	ingredients = recipefreeman2,
    results =
    {
      {
        name = "gordon-freeman",
        amount = 1
      },
      {
        name = "processing-unit",
        amount = 1,
		probability = 0.20,
      },
      {
        name = "utility-science-pack",
        amount = 5,
	   probability = 0.60,
      },
      {
        name = "production-science-pack",
        amount = 3,
	   probability = 0.40,
      },
    }
  },

    
  
  
 {
    type = "recipe",
    name = "hal-science2",
    energy_required = 60,
    category = "crafting-with-fluid",
    enabled = "false",
	icon = "__Mining-Space-Industries__/graphics/hal-science2-64.png",
	icon_size = 64,
    subgroup = "science-pack",
	ingredients = 
		{
			{"automation-science-pack", 1},
			{"logistic-science-pack", 1},
			{"wheatley-core",1},
			{"glados-core", 1},
			{"hal9000", 1},
			{"test-cube",10},
			{type="fluid", name="lubricant", amount=80},
		},
    results =
    {
      {
        name = "wheatley-core",
        amount = 1
      },
      {
        name = "glados-core",
        amount = 1
      },
      {
        name = "hal9000",
        amount = 1
      },
      {
        name = "chemical-science-pack",
        amount = 6,
	    probability = 0.30,
      },
      {
        name = "utility-science-pack",
        amount = 8,
	    probability = 0.50,
      },
      {
        name = "production-science-pack",
        amount = 7,
	   probability = 0.40,
      },
    }
  },

 
 

 
})







--[[
if data.raw.item["alien-artifact"] and 
 data.raw.item["alien-artifact-red"] and 
 data.raw.item["alien-artifact-orange"] and 
 data.raw.item["alien-artifact-yellow"] and 
 data.raw.item["alien-artifact-green"] and 
 data.raw.item["alien-artifact-blue"] and 
 data.raw.item["alien-artifact-purple"] then 


data:extend({
 
 
 {
 
    type = "recipe",
    name = "alien-sample",
	category = "crafting-with-fluid",
    enabled = "true",
    energy_required = 100,
    ingredients = 
    {
      {"alien-artifact",4000},
      {"alien-artifact-red",200},
      {"alien-artifact-orange",200},
      {"alien-artifact-yellow",200},
      {"alien-artifact-green",200},
	  {"alien-artifact-blue",200},
	  {type="fluid", name="water", amount=1000}
	  
    },
    result = "alien-sample"
  }
})
end
]]


-- from mod Portals
if data.raw.item["portal-gun"] then 

data:extend({

 {
    type = "recipe",
    name = "portal-gun",
    energy_required = 500,
    category = "advanced-crafting",
    enabled = "false",
	icon = "__Portals__/graphics/portal-gun.png",
	icon_size = 32,
	subgroup = "transport",
	ingredients = 
		{
			{"advanced-circuit",50},
			{"plastic-bar", 50},
			{"solar-panel-equipment", 10},
			{"wheatley-core", 1},
		},
    results =
    {
      {
        name = "wheatley-core",
        amount = 1
      },
      {
        name = "portal-gun",
        amount = 1
      }
    }
  },


})
end
