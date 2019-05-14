data:extend({
  {
      type = "technology",
      name = "spacetrucktech",
      icon = "__Mining-Space-Industries__/graphics/space-truck-tec.png",
	  icon_size = 128,
      effects =
      {
        {
            type = "unlock-recipe",
            recipe = "steel-cargo"
        },
        {
            type = "unlock-recipe",
            recipe = "copper-cargo"
        },
        {
            type = "unlock-recipe",
            recipe = "crude-oil-cargo"
        },
        {
            type = "unlock-recipe",
            recipe = "heavy-oil-cargo"
        },
        {
            type = "unlock-recipe",
            recipe = "light-oil-cargo"
        },
        {
            type = "unlock-recipe",
            recipe = "petroleum-gas-cargo"
        },
        {
            type = "unlock-recipe",
            recipe = "lubricant-cargo"
        },
        {
            type = "unlock-recipe",
            recipe = "sulfuric-acid-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "uranium-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "atomic-bomb-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "battery-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "red-chip-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "blue-chip-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "rocket-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "tank-cargo"
        },	
		{
            type = "unlock-recipe",
            recipe = "uranium-shell-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "artillery-cargo"
        },
		{
            type = "unlock-recipe",
            recipe = "container"
        },	
		
		
		
		
       },
      prerequisites = {"rocket-silo"},
      unit =
      {
        count = 1000,
        ingredients =
        {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"military-science-pack", 1},
        {"utility-science-pack", 1},
        {"production-science-pack",1},		
        {"space-science-pack", 1}
        },
        time = 50
      }
  },
  
  
  
  
   {
    type = "technology",
    name = "shipwreck-scan1",
    icon = "__Mining-Space-Industries__/graphics/radar.png",
	icon_size = 128,
    prerequisites = {"advanced-electronics"},
    unit =
    {
      count = 300, 
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1}
      },
      time = 30
    },
    order = "a-d-c",
	enabled="false",
  },
 
  
   {
    type = "technology",
    name = "shipwreck-scan2",
    icon = "__Mining-Space-Industries__/graphics/radar.png",
	icon_size = 128,
    prerequisites = {"shipwreck-scan1", "robotics"},
    unit =
    {
      count = 50,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"military-science-pack", 10},
		{"glados-core", 1},
     },
      time = 40
    },
    order = "a-d-c",
	enabled="false",
  },
  
  
    {
    type = "technology",
    name = "shipwreck-scan3",
    icon = "__Mining-Space-Industries__/graphics/radar.png",
	icon_size = 128,
    prerequisites = {"shipwreck-scan2" , "nuclear-power"},
    unit =
    {
      count = 70,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"military-science-pack", 10},
        {"production-science-pack",10},
		{"glados-core", 1},
		{"gordon-freeman", 1},
		
     },
      time = 50
    },
    order = "a-d-c",
	enabled="false",
  },
  
  
  
  
    {
    type = "technology",
    name = "msi-smoke-tech",
    icon = "__Mining-Space-Industries__/graphics/msi-smoke-tech.png",
	icon_size = 128,
    prerequisites = {},
    unit =
    {
      count = 150,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"military-science-pack", 1},
     },
      time = 20
    },
    order = "a-a-a",
	enabled="false",
  },
  
  
    {
    type = "technology",
    name = "msi-smoke-scan",
    icon = "__Mining-Space-Industries__/graphics/msi-smoke-scan.png",
	icon_size = 128,
    prerequisites = {},
    unit =
    {
      count = 200,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"military-science-pack", 1},
     },
      time = 20
    },
    order = "a-a-a",
	enabled="false",
  },
  
  
  
    {
    type = "technology",
    name = "explosion_repair_time",
    icon = "__Mining-Space-Industries__/graphics/explosion-risk.png",
	icon_size = 128,
    prerequisites = {"advanced-electronics-2"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"gordon-freeman", 1},
     },
      time = 10
    },
    order = "a-d-c",
	enabled="true",
  },  

  
  
    {
    type = "technology",
    name = "msi_tech_freeman_crowbar",
    icon = "__Mining-Space-Industries__/graphics/gordon-freeman-science.png",
	icon_size = 128,
	effects =
    {
      {
        type = "character-mining-speed",
        modifier = 0.5
      }
    },
    prerequisites = {"military-3","steel-axe"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"gordon-freeman", 1},
     },
      time = 10
    },
    order = "a-d-c",
	enabled="true",
  },    
  
  
    {
    type = "technology",
    name = "explosion_risk_reduce1",
    icon = "__Mining-Space-Industries__/graphics/explosion-risk.png",
	icon_size = 128,
    prerequisites = {"nuclear-power","explosion_repair_time"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"military-science-pack", 10},
		{"gordon-freeman", 1},
     },
      time = 20
    },
    order = "a-d-c",
	enabled="true",
  }, 
  
  
     {
    type = "technology",
    name = "explosion_risk_reduce2",
    icon = "__Mining-Space-Industries__/graphics/explosion-risk.png",
	icon_size = 128,
    prerequisites = {"nuclear-power","explosion_risk_reduce1"},
    unit =
    {
      count = 30,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"military-science-pack", 10},
		{"utility-science-pack",10},
		{"gordon-freeman", 1},
     },
      time = 30
    },
    order = "a-d-c",
	enabled="true",
  }, 
  
  
     {
    type = "technology",
    name = "msi_tech_double_advanced_circuit",
    icon = "__Mining-Space-Industries__/graphics/double-advanced-circuit.png",
	icon_size = 32,
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "msi_double_advanced_circuit"
        },
      },
    prerequisites = {"advanced-electronics"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
		{"glados-core", 1},
     },
      time = 15
    },
    order = "a-b-c",
	enabled="true",
  },

  
     {
    type = "technology",
    name = "msi_tech_double_processing_unit",
    icon = "__Mining-Space-Industries__/graphics/radar_processing_unit.png",
	icon_size = 128,
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "msi_double_processing_unit"
        },
		{
          type = "unlock-recipe",
          recipe = "msi_double_processing_unit2"
        },
      },
    prerequisites = {"advanced-electronics-2"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
        {"production-science-pack",10},
		{"gordon-freeman", 1},
     },
      time = 25
    },
    order = "a-d-c",
	enabled="false",
  },
  
 
   {
    type = "technology",
    name = "msi_tech_double_modules1",
    icon_size = 128,
    icon = "__base__/graphics/technology/module.png",
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "msi_double_speed-module"
        },
		{
          type = "unlock-recipe",
          recipe = "msi_double_productivity-module"
        },
		{
          type = "unlock-recipe",
          recipe = "msi_double_effectivity-module"
        },
      },
    prerequisites = {"productivity-module","effectivity-module","speed-module"},
    unit =
    {
      count = 7,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
		{"gordon-freeman", 1},
		
     },
      time = 15
    },
    order = "i-c-m",
	enabled="true",
  },
  
 
  
   {
    type = "technology",
    name = "msi_tech_double_modules2",
    icon_size = 128,
    icon = "__base__/graphics/technology/module.png",
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "msi_double_speed-module-2"
        },
		{
          type = "unlock-recipe",
          recipe = "msi_double_productivity-module-2"
        },
		{
          type = "unlock-recipe",
          recipe = "msi_double_effectivity-module-2"
        },
      },
    prerequisites = {"productivity-module-2","effectivity-module-2","speed-module-2","msi_tech_double_modules1"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"gordon-freeman", 1},
     },
      time = 15
    },
    order = "i-c-n",
	enabled="true",
  },
    
 
   {
    type = "technology",
    name = "msi_tech_double_modules3",
    icon_size = 128,
    icon = "__base__/graphics/technology/module.png",
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "msi_double_speed-module-3"
        },
		{
          type = "unlock-recipe",
          recipe = "msi_double_productivity-module-3"
        },
		{
          type = "unlock-recipe",
          recipe = "msi_double_effectivity-module-3"
        },
      },
    prerequisites = {"productivity-module-3","effectivity-module-3","speed-module-3","msi_tech_double_modules2"},
    unit =
    {
      count = 15,
      ingredients =
      {
        {"automation-science-pack", 10},
        {"logistic-science-pack", 10},
        {"chemical-science-pack", 10},
		{"utility-science-pack", 10},
		{"gordon-freeman", 1},
     },
      time = 15
    },
    order = "i-c-o",
	enabled="true",
  },

 
    {
    type = "technology",
    name = "glados-science-tech",
    icon = "__Mining-Space-Industries__/graphics/glados-science1.png",
	icon_size = 128,
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "test-cube"
        },
    	{
          type = "unlock-recipe",
          recipe = "glados-science1"
        },
		{
          type = "unlock-recipe",
          recipe = "glados-science2"
        },
      },
    prerequisites = {"robotics","advanced-electronics"},
    unit =
    {
      count = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
--		{"military-science-pack", 10},
--       {"utility-science-pack",10},
--        {"production-science-pack",10},
		{"glados-core", 1},
--		{"gordon-freeman", 1},
		
     },
      time = 20
    },
    order = "a-d-c",
	enabled="false",
  },
 
   
   
   
     {
    type = "technology",
    name = "gordon-freeman-science-tech",
    icon = "__Mining-Space-Industries__/graphics/gordon-freeman-science.png",
	icon_size = 128,
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "gordon-freeman-science"
        },
		{
          type = "unlock-recipe",
          recipe = "gordon-freeman-science2"
        },
      },
    prerequisites = {"nuclear-power","advanced-electronics-2","explosives"},
    unit =
    {
      count = 30,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
		{"military-science-pack", 1},
        {"utility-science-pack",1},
		{"gordon-freeman", 1},
     },
      time = 25
    },
    order = "a-d-c",
	enabled="true",
  },
 

   
   
     {
    type = "technology",
    name = "hal-science-tech",
    icon = "__Mining-Space-Industries__/graphics/hal-science1.png",
	icon_size = 128,
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "hal-science1"
        },
      },
    prerequisites = {"advanced-electronics-2" , "advanced-material-processing-2"},
    unit =
    {
      count = 10,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack",1},
        {"production-science-pack",1},
		{"hal9000", 1},
		
     },
      time = 20
    },
    order = "a-d-c",
	enabled="true",
  },
 
 

 
 
   
     {
    type = "technology",
    name = "robot-science-tech",
    icon = "__Mining-Space-Industries__/graphics/hal-science2.png",
	icon_size = 128,
    effects =
      {
		{
          type = "unlock-recipe",
          recipe = "hal-science2"
        },
      },
    prerequisites = {"hal-science-tech" , "glados-science-tech"},
    unit =
    {
      count = 20,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"utility-science-pack",1},
        {"production-science-pack",1},
		{"glados-core", 1},
		{"hal9000", 1},
     },
      time = 20
    },
    order = "a-d-c",
	enabled="true",
  },

 
})



--  mod Portals
if data.raw.item["portal-gun"] then 

data:extend({

	{
      type = "technology",
      name = "portals",
      icon = "__Portals__/graphics/portal-tech.png",
      icon_size = 64,
      effects =
      {
		{
          type = "unlock-recipe",
          recipe = "portal-gun"
        },
      },
      prerequisites = {"solar-panel-equipment","automation-2"},
      unit = {
        count = 20,
        ingredients =
		{
			{"automation-science-pack", 10},
			{"logistic-science-pack", 10},
			{"chemical-science-pack", 10},
			{"glados-core", 1},
			
		},
      time = 20
      },
      order = "k-a",
    },


	




	{
      type = "technology",
      name = "portals_risk_reduce",
      icon = "__Portals__/graphics/portal-tech.png",
      icon_size = 64,
      prerequisites = {"portals"},
      unit = {
        count = 25,
        ingredients =
		{
			{"automation-science-pack", 10},
			{"logistic-science-pack", 10},
			{"chemical-science-pack", 10},
			{"production-science-pack",10},
			{"glados-core", 1},
			
		},
      time = 30
      },
      order = "k-a",
    },





	{
      type = "technology",
      name = "portals_risk_reduce2",
      icon = "__Portals__/graphics/portal-tech.png",
      icon_size = 64,
      prerequisites = {"portals_risk_reduce"},
      unit = {
        count = 30,
        ingredients =
		{
			{"automation-science-pack", 10},
			{"logistic-science-pack", 10},
			{"chemical-science-pack", 10},
			{"production-science-pack",10},
			{"utility-science-pack",10},
			{"glados-core", 1},

		},
      time = 40
      },
      order = "k-a",
    },

	
	
})
end
