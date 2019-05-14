
local van_ing = table.deepcopy(data.raw["recipe"]["advanced-circuit"]["normal"]["ingredients"])
local msi_ing = table.deepcopy(data.raw["recipe"]["msi_double_advanced_circuit"]["normal"]["ingredients"] )
if msi_ing ~= van_ing then
   data.raw["recipe"]["msi_double_advanced_circuit"]["normal"]["ingredients"]=van_ing 
   data.raw["recipe"]["msi_double_advanced_circuit"]["expensive"]["ingredients"]=data.raw["recipe"]["advanced-circuit"]["expensive"]["ingredients"]

   local ingn = table.deepcopy( data.raw["recipe"]["processing-unit"]["normal"]["ingredients"])
   local inge = table.deepcopy( data.raw["recipe"]["processing-unit"]["expensive"]["ingredients"])
   
   data.raw["recipe"]["msi_double_processing_unit"]["normal"]["ingredients"]=ingn
   data.raw["recipe"]["msi_double_processing_unit"]["expensive"]["ingredients"]=inge

   local ingn = table.deepcopy( data.raw["recipe"]["processing-unit"]["normal"]["ingredients"])
   local inge = table.deepcopy( data.raw["recipe"]["processing-unit"]["expensive"]["ingredients"])
      
   table.insert(ingn, {"gordon-freeman", 1})
   table.insert(inge, {"gordon-freeman", 1})
 
   data.raw["recipe"]["msi_double_processing_unit2"]["normal"]["ingredients"]=ingn
   data.raw["recipe"]["msi_double_processing_unit2"]["expensive"]["ingredients"]=inge
   end