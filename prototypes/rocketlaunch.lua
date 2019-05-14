local MSI_cargo_list = {
	[1] = "copper-cargo",
	[2] = "atomic-bomb-cargo",
	[3] = "steel-cargo",
	[4] = "crude-oil-cargo",
	[5] = "heavy-oil-cargo",
	[6] = "light-oil-cargo",
	[7] = "petroleum-gas-cargo",
	[8] = "lubricant-cargo",
	[9] = "sulfuric-acid-cargo",
	[10] = "uranium-cargo",
	[11] = "battery-cargo",
	[12] = "red-chip-cargo",
	[13] = "blue-chip-cargo",
	[14] = "rocket-cargo",
	[15] = "tank-cargo",
	[16] = "uranium-shell-cargo",
	[17] = "artillery-cargo"
	}

for k=1,#MSI_cargo_list do
	if data.raw["item"][MSI_cargo_list[k]].rocket_launch_product then
		table.insert( data.raw["item"][MSI_cargo_list[k]].rocket_launch_product, { "space-science-pack", 300 } )
	else
		data.raw["item"][MSI_cargo_list[k]].rocket_launch_product = { "space-science-pack", 300 }
	end
	end

	if data.raw["tool"]["hal9000"].rocket_launch_product then
		table.insert( data.raw["tool"]["hal9000"].rocket_launch_product, { "space-science-pack", 500 } )
	else
		data.raw["tool"]["hal9000"].rocket_launch_product = { "space-science-pack", 500 }
	end
