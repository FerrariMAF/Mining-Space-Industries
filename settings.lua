data:extend({

{
	type = "int-setting",
	name = "msi_distance1",
	setting_type = "runtime-global",
	default_value = 15,
	minimum_value = 5,
	maximum_value = 150,
	order = "ba"
}, 
{
	type = "int-setting",
	name = "msi_distance2",
	setting_type = "runtime-global",
	default_value = 25,
	minimum_value = 5,
	maximum_value = 300,
	order = "ba"
}, 
{
	type = "int-setting",
	name = "msi_distance3",
	setting_type = "runtime-global",
	default_value = 30,
	minimum_value = 5,
	maximum_value = 600,
	order = "ba"
}, 
{
	type = "int-setting",
	name = "msi_distance4",
	setting_type = "runtime-global",
	default_value = 30,
	minimum_value = 5,
	maximum_value = 1000,
	order = "ba"
}, 

{
	type = "int-setting",
	name = "msi_cargo_request_number",
	setting_type = "runtime-global",
	default_value = 5,
	minimum_value = 1,
	maximum_value = 10,
	order = "ba"
}, 


 {
	type = "int-setting",
	name = "msi_cargo_request_min",
	setting_type = "runtime-global",
	default_value = 3,
	minimum_value = 1,
	maximum_value = 99,
	order = "ba"
}, 

{
	type = "int-setting",
	name = "msi_cargo_request_max",
	setting_type = "runtime-global",
	default_value = 6,
	minimum_value = 1,
	maximum_value = 99,
	order = "ba"
}, 

{
	type = "int-setting",
	name = "msi_explosion_risk",
	setting_type = "runtime-global",
	default_value = 20,
	minimum_value = 0,
	maximum_value = 100,
	order = "ba"
}, 

{
	type = "int-setting",
	name = "msi_portal_risk",
	setting_type = "runtime-global",
	default_value = 30,
	minimum_value = 0,
	maximum_value = 100,
	order = "ba"
}, 

  {
    type = "bool-setting",
    name = "msi_worm_boss",
    setting_type = "runtime-global",
    default_value = true,
    per_user = false,
  },

  {
    type = "bool-setting",
    name = "msi_remove_start_oil",
    setting_type = "startup",
    default_value = true,
    per_user = false,
  },

})