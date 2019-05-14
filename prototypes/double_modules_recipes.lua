

function double_recipe_result(recipe_name,new_name)
local recipe = table.deepcopy(data.raw.recipe[recipe_name])
recipe.result_count = 2
recipe.name= new_name
return recipe
end


data:extend(
{

double_recipe_result("speed-module","msi_double_speed-module"),
double_recipe_result("speed-module-2","msi_double_speed-module-2"),
double_recipe_result("speed-module-3","msi_double_speed-module-3"),

double_recipe_result("productivity-module","msi_double_productivity-module"),
double_recipe_result("productivity-module-2","msi_double_productivity-module-2"),
double_recipe_result("productivity-module-3","msi_double_productivity-module-3"),

double_recipe_result("effectivity-module","msi_double_effectivity-module"),
double_recipe_result("effectivity-module-2","msi_double_effectivity-module-2"),
double_recipe_result("effectivity-module-3","msi_double_effectivity-module-3"),

})
