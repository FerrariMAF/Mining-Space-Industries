require("utils")
require "stdlib/area/chunk"
require "stdlib/area/position"
require "stdlib/table"
require "stdlib/string"
require "mod-gui"

global_timer = 20000 --- def 20000   --25000 = 1 game day
global.version = "0.17.24" 

function Migrations()

if global.version < "0.15.12" then

	local temp = {}
	for k, Entidade in pairs (global.monitorar_entidates) do
		if Entidade.valid then
	
			if Entidade.name=="big-ship-wreck-1" then
				table.insert(temp,{ent=Entidade,evento="glados-wheatley",tabEvento=nil})
				end
			if Entidade.name=="big-ship-wreck-3" then
				table.insert(temp,{ent=Entidade,evento="wheatley-cubeplans",tabEvento=nil})
				end
			end
	end
	global.monitorar_entidates = temp	
	global.version = "0.15.12"
	end

	
if global.version <"0.16.23"	then -- dividir por 10 carga atomica
	if global.mission_cargo_request~=nil then 
		for k, Carga in pairs(global.mission_cargo_request) do
			if Carga.item=='atomic-bomb-cargo' then 
				table.insert(global.mission_cargo_request, { item =Carga.item, quant=Carga.quant/10, nome=Carga.nome, enviados=Carga.enviados } )
				table.remove(global.mission_cargo_request, k)
				break
				end
			end
		end
	global.version = "0.16.23"
	end
	
end	


function add_rocket_item(item)
if not global.silo_script then return end
local list = global.silo_script.tracked_items
if not list then return end
local add = true
  for k, name in pairs (list) do
	 if name==item then add=false end
	end
if add then
	table.insert(global.silo_script.tracked_items,item)
	end
end

function update_rocket_list()
for k=1,#global.MSI_cargo_list do
	add_rocket_item(global.MSI_cargo_list[k])
	end
add_rocket_item("hal9000")
end



function Check_MSI_Techs()

if not game then 
	table.insert(global.timed_events,{evento='check_msi_tech',entidade=nil, label=nil, last_tick=10})
	return
	end

if game.forces["player"].technologies['automation-2'].researched then
   game.forces["player"].recipes['msi-worker-lab'].enabled = true 
   end	

if global.MSI_Techs == nil then
   global.MSI_Techs={} 
   if game.forces["player"].technologies['shipwreck-scan1'].enabled then
      table.insert(global.MSI_Techs,'shipwreck-scan1')
	  end
   if game.forces["player"].technologies['shipwreck-scan2'].enabled then
      table.insert(global.MSI_Techs,'shipwreck-scan2')
	  end
   if game.forces["player"].technologies['shipwreck-scan3'].enabled then
      table.insert(global.MSI_Techs,'shipwreck-scan3')
	  end
   if game.forces["player"].technologies['msi-smoke-tech'].enabled then
      table.insert(global.MSI_Techs,'msi-smoke-tech')
	  end
   if game.forces["player"].technologies['msi-smoke-scan'].enabled then
      table.insert(global.MSI_Techs,'msi-smoke-scan')
	  end
   if game.forces["player"].technologies['msi_tech_double_processing_unit'].enabled then
      table.insert(global.MSI_Techs,'msi_tech_double_processing_unit')
	  end
   if game.forces["player"].technologies['glados-science-tech'].enabled then
      table.insert(global.MSI_Techs,'glados-science-tech')
	  end
   if game.item_prototypes["omega-drill"] then 
      if game.forces["player"].technologies['omega-drill'].enabled then
        table.insert(global.MSI_Techs,'omega-drill')
	    end
	  end
	if game.item_prototypes["portal-gun"] then 
      if game.forces["player"].technologies['portals'].enabled then
        table.insert(global.MSI_Techs,'portals')
	    end
	  end
	end 
  
  for k, tech in pairs (global.MSI_Techs) do
    local vai = true
	if tech=='portals' then if not game.item_prototypes["portal-gun"] then vai=false end end
	if tech=='omega-drill' then if not game.item_prototypes["omega-drill"] then vai=false end end
    if vai then game.forces["player"].technologies[tech].enabled = true end
	end
	
end


function VersionChange()

global.MSI_cargo_list = {
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
	[17] = "artillery-cargo",
	}


if global.msi_Accomplished_Mission==nil then global.msi_Accomplished_Mission={} end 
if global.bosses == nil then global.bosses={} end 
if global.version == nil then global.version = "0.0.0" end
if global.delay_actions==nil then global.delay_actions={} end
if global.TotalScanned==nil then global.TotalScanned=0 end
if global.units_invasion==nil then global.units_invasion={} end
if global.worms==nil then global.worms={} end
if global.destrocosnave_ini==nil then global.destrocosnave_ini={} end
if global.shock_entities==nil then global.shock_entities={} end
if global.repair_quests==nil then global.repair_quests={} end
if global.secondary_quests==nil then global.secondary_quests={} end
if global.tick_secondary_mission==nil then global.tick_secondary_mission=0 end
if global.available_secondary_mission==nil then global.available_secondary_mission={} end
if global.monitorar_entidates==nil then global.monitorar_entidates={} end
if global.timed_events==nil then global.timed_events={} end
if global.explosion_risk==nil then global.explosion_risk = settings.global["msi_explosion_risk"].value end
if global.PortalRisk_Invasion==nil then global.PortalRisk_Invasion=settings.global["msi_portal_risk"].value end
if global.msi_personal_minicam==nil then global.msi_personal_minicam={} end

mod_cargo_request_number = settings.global["msi_cargo_request_number"].value
mod_cargo_request_min	 = settings.global["msi_cargo_request_min"].value
mod_cargo_request_max	 = settings.global["msi_cargo_request_max"].value
mod_distance1			 = settings.global["msi_distance1"].value
mod_distance2			 = settings.global["msi_distance2"].value
mod_distance3			 = settings.global["msi_distance3"].value
mod_distance4			 = settings.global["msi_distance4"].value

if mod_cargo_request_max<mod_cargo_request_min then 
   mod_cargo_request_min=mod_cargo_request_max 
   end

MSI_Itens = {
	[1] = "glados-core",
	[2] = "wheatley-core",
	[3] = "gordon-freeman",
	[4] = "hal9000",
	[5] = "cube-plans"
	}
   
Migrations()
update_rocket_list()	
Check_MSI_Techs()
end



VersionChange()



-- logs each mission
local function Register_Accomplished_Mission(extraInfo, mainText,fullText)
if mainText==nil then mainText = global.PanelMission end
if fullText==nil then fullText = global.MissionTXT end

table.insert (global.msi_Accomplished_Mission, {tick=game.tick,
												evolution=game.forces.enemy.evolution_factor, 
												mainText = mainText,
												fullText = fullText,
												extraInfo = extraInfo} )
end





--## CAMERAS
function CreateTempCameraForPlayer(player,posit,size,seconds)
local tick=game.tick
local guileft
if not player.gui.left.MSIflowCameras then
   guileft = player.gui.left.add({type="flow", name="MSIflowCameras", direction="horizontal"})
   else
   guileft = player.gui.left.MSIflowCameras end

while guileft["MSI_framecam"..tick] do
	  tick=tick+1
      end
local frname="MSI_framecam"..tick
	  
	  
local frame = guileft.add({ type="frame", name=frname, direction="vertical"})   
	frame.style.minimal_height = size+55
  	--frame.style.maximal_height = size+55
	frame.style.minimal_width = size+10
	frame.style.maximal_width = size+10

local cam = frame.add({ type="camera", name="msi_cam"..game.tick, position = posit, zoom = 0.15 })
      cam.style.width = size
	  cam.style.height = size

--local frameb = frame.add({ type="frame", name='msicam_frameb', direction="horizontal"}) 	  
frame.add{name="msi_bt_cameraclose"..tick, type="button", style = mod_gui.button_style, caption={"labels.btClose"}}

end

function CreateTempCamera(posit,size,seconds)
local created=false
	for p, pl in pairs(game.players) do
		if pl.connected then
		--if global.msi_personal_minicam[pl.name] then
			CreateTempCameraForPlayer(pl,posit,size,seconds) 
			created=true
			--end
		end
		end
if created then 
   local tick=game.tick
   table.insert(global.timed_events,{evento='destroy-cam-4allplayers',entidade="MSI_framecam"..tick, label=nil, last_tick=tick+(60*seconds)})
   end
end

function CameraClose(player,num)
if player.gui.left.MSIflowCameras then
if player.gui.left.MSIflowCameras["MSI_framecam"..num] then
   player.gui.left.MSIflowCameras["MSI_framecam"..num].destroy() 
   end end
end

function DestroyCamForAll(name)
	for p, pl in pairs(game.players) do
		if pl.connected then
		if pl.gui.left.MSIflowCameras then
		if pl.gui.left.MSIflowCameras[name] then
			pl.gui.left.MSIflowCameras[name].destroy() end end
		end
		end
end

-- Give XP to mod CharacterXP 
function GrantXP(XPPerc)

--if global.CharXPMOD ~= nil then
--if global.CharXPMOD==1 then
if remote.interfaces["RPG"] then
	remote.call("RPG","TeamXPPerc","player",XPPerc)
    end
end


local function Cria_GUI(event)

local player = game.players[event.player_index]
if player.gui.top.btmissao then player.gui.top.btmissao.destroy() end
if player.gui.top.btavisos then player.gui.top.btavisos.destroy() end
if player.gui.left.MSIflowCameras then player.gui.left.MSIflowCameras.destroy()  end
if player.gui.top.MSITopFrame then player.gui.top.MSITopFrame.destroy()  end	

--version 16.16
if not player.gui.top.MSITopFrame then
local MSITopFrame = player.gui.top.add({ type="frame", name="MSITopFrame", direction="horizontal"})
	--MSITopFrame.style.minimal_height = 51
  	--MSITopFrame.style.maximal_height = 51
	--frame.style.minimal_width = size+10
	--frame.style.maximal_width = size+10
MSITopFrame.add{type="sprite", name="msi_top_logo32", sprite = "msi32"}	
MSITopFrame.add{name="btmissao", type="button", style = mod_gui.button_style, caption={"labels.guibutton"}, tooltip = {"labels.guibuttontip"}}
MSITopFrame.add{name="btavisos", type="sprite-button", sprite = "virtual-signal/signal-T", style = mod_gui.button_style, tooltip = {"labels.guibuttontip2"}}
end


if global.msi_personal_minicam[player.name]==nil then
   global.msi_personal_minicam[player.name]=true
	end
		
end


function atualiza_tabela_missao(tabela,array)
local envtxt={"sent_cargo"}
local Conteudo
local Quant
local Nome 
local enviados

	for k, Carga in pairs(array) do
		Conteudo = Carga.item
		Quant    = Carga.quant
		Nome	 = Carga.nome
		enviados = Carga.enviados
	    tabela.add{type="sprite", name=1049+k, sprite = "item/"..Conteudo}
		tabela.add{type="label",  name=2049+k, caption={"print-2-var",Quant,Nome}}
		tabela.add{type="label",  name=3049+k, caption={"print-2-var",envtxt,enviados}}
		end

end


function update_mission_panel(player)
  local painel = player.gui.center["painel-missao"]
  local frame = painel.tabBarScroll
  
  
  if (global.mission_master==0 and global.mission_status <=2) then 
	local img = frame.add{type = "sprite", sprite = "msi_welcome"}
	end  

  if (global.mission_master==100) then 
	local img = frame.add{type = "sprite", sprite = "msi_win"}
	end  
  
	
  local tempo = {"missions.time-played" ,string.format("%d:%02d:%02d", math.floor(game.tick / 216000), math.floor(game.tick / 3600) % 60, math.floor(game.tick / 60) % 60)}
  local evo   = {"missions.evolution-factor", string.format("%.2f", math.floor(game.forces["enemy"].evolution_factor * 10000) / 100)}
 
  --style.font = "default-bold"
  --frame.add{type="label", name=39, caption={"",global.MissionTXT}}
-- frame.add{type="label", name=40, caption={"",global.PanelMission}}



  local tabPM = frame.add{type = "table", name = "tab_pm", column_count = 2}
  tabPM.add{type="label", name=30, caption={"","",{"missions.primary_mission"}}}.style.font_color={r=1, g=1, b=0}
  tabPM.add{type="sprite", name="msi_logo32", sprite = "msi32"}
 
  
  --local txtPM =  tabPM.add{type="label", name=40, caption={"missions.secmission_4_txt"}}   teste texto longo
  local txtPM =  tabPM.add{type="label", name=40, caption={"",global.PanelMission}}
  txtPM.style.single_line = false
  

  local btPM= tabPM.add{name="btPM", type="button", style = mod_gui.button_style, caption={"labels.btView"}}
  if (global.mission_master==0 and global.mission_status <=2) then 
	if global.TotalScanned>0 and global.TotalScanned<201 then 
		tabPM.add{type="label", name="radarscanslabel", caption="Radar Scan: " .. math.floor(global.TotalScanned/2).. "%"}   --style.font_color={r=0, g=1, b=1}
		end
	end  
 
  if (global.mission_master ==10 and global.mission_status ==10) or global.mission_master == 100 then  
	local tabela = frame.add{type = "table", name = "tabela_cargas", column_count = 3}
	atualiza_tabela_missao(tabela,global.mission_cargo_request)
	end

	
-- secondary_missions	
if #global.secondary_quests>0 then	
	frame.add{type="label", name=31, caption={"","",{"missions.secondary_mission"}}}.style.font_color={r=0, g=1, b=0}
	local tabSM = frame.add{type = "table", name = "tab_sm", column_count = 2}
	for m, SM in pairs(global.secondary_quests) do
		local SecMission = SM.num
--		local tableQuest = SM.tableQuest
		tabSM.add{type="label", name="secm_"..m, caption={"missions.secmission_"..SecMission}}
		local btSM= tabSM.add{name="secmission_"..SecMission.."-"..m, type="button", style = mod_gui.button_style, caption={"labels.btView"}}
		end
	end

	
--painel.direction = "vertical"
  frame.add{type="label", name=80, caption={"",""}} 
  frame.add{type="label", name=90, caption={"",""}} 
  frame.add{type="label", name=100, caption={"","___________________________________________"}}.style.font_color={r=1, g=1, b=1}
  
  local tabEvo = frame.add{type = "table", name = "tabEvo", column_count = 2}
  tabEvo.add{type="label", name="time-played", caption=tempo}.style.font_color={r=0, g=1, b=1}
  tabEvo.add{type="label", name="evolution-factor", caption=evo}.style.font_color={r=1, g=0, b=0} 
  
--  local cbShowCam = frame.add{type = "checkbox", name = "cbShowCam", caption={'msi_cbShowCam'},
--        state = global.msi_personal_minicam[player.name]}
  end



function expand_tag_gui(player)
    local frame = player.gui.center["painel-missao"]
    if frame then
        frame.destroy()
		player.set_goal_description ("",true)
    else
		frame = player.gui.center.add{type="frame", name="painel-missao", direction = "vertical", style=mod_gui.frame_style, caption={"labels.paneltitle"}} 
		frame.style.minimal_height = 430
  		--frame.style.maximal_height = 430
		frame.style.minimal_width = 495
		frame.style.maximal_width = 495
		local tabBarScroll = frame.add{type = "scroll-pane", name= "tabBarScroll", vertical_scroll_policy="auto", horizontal_scroll_policy="auto"}
		tabBarScroll.style.minimal_height = 400
		--tabBarScroll.style.maximal_height = 1000
		tabBarScroll.style.minimal_width = 465
		tabBarScroll.style.maximal_width = 465		
		update_mission_panel(player) 
    end
end



function update_panel_avisos(player)
  local painel = player.gui.center["painel-avisos"]
  local frame = painel.tabBarScroll2
  local tabela = frame.add{type = "table", name = "tabela_botoes_av", column_count = 3}
  
  local btCancel= tabela.add{name="btCancel", type="button", style = mod_gui.button_style, caption={"labels.btCancel"}}
  tabela.add{type="label", name="last_user", caption={"print-2-var",{"last_user"},global.text_last_user}} 
  local btOK= tabela.add{name="btOK", type="button", style = mod_gui.button_style, caption={"labels.btOK"}}
 
  local texto = frame.add{type="text-box", name="aviso_memo",text=global.avisos_time}
  texto.style.minimal_width=465  
  texto.style.minimal_height=300 --300
  
  local tabplayers = frame.add{type = "table", name = "tabplayers", column_count = 5}
  tabplayers.add{type="label", name="lab_players", caption={"players_online"}} 
	for p, pl in pairs(game.players) do
		if pl.connected then
		tabplayers.add{type="label", name="lab_players"..p, caption=pl.name}.style.font_color=pl.color 
		end
		end
  
  --[[
  local tabtag = frame.add{type = "table", name = "tabtags", column_count = 3}	
  tabtag.add{type="label", name="lab_tag", caption={"players_tag"}}
  tabtag.add{type="textfield", name="tag_field", text=player.tag}
  local btTagOK= tabtag.add{name="btTagOK", type="button", style = mod_gui.button_style, caption={"labels.btOK"}}
  ]]
  
end


local function expand_tag_gui_avisos(player)
    local frame = player.gui.center["painel-avisos"]
    if frame then
        frame.destroy()
    else
		frame = player.gui.center.add{type="frame", name="painel-avisos", direction = "vertical", style=mod_gui.frame_style, caption={"labels.panelavisostitle"}} 
		frame.style.minimal_height = 400
--  		frame.style.maximal_height = 400
		frame.style.minimal_width = 465
		frame.style.maximal_width = 465
		local tabBarScroll = frame.add{type = "scroll-pane", name= "tabBarScroll2", vertical_scroll_policy="auto", horizontal_scroll_policy="auto"}
		tabBarScroll.style.minimal_height = 400
		--tabBarScroll.style.maximal_height = 400
		tabBarScroll.style.minimal_width = 465
		tabBarScroll.style.maximal_width = 465		
		update_panel_avisos(player) 
    end
end

function AvisoBtOK(player)
    local frame = player.gui.center["painel-avisos"]
    if frame then
	local ptexto = frame.tabBarScroll2.aviso_memo
	if global.avisos_time ~= ptexto.text then
	global.avisos_time = ptexto.text 
	global.text_last_user = player.name
	message_all({"warnings-updated"})
	message_all("===>"..player.name)

	for _, pl in pairs(game.players) do
		if pl.connected and pl~=player then
			local fram = pl.gui.center["painel-avisos"]
			    if fram then 
					fram.destroy()
					expand_tag_gui_avisos(pl)
					end
		end
	end
	end

    frame.destroy()

	end
	--atualiza painel dos demais
end

local function VerificaRadar()

local posicao
local chunk
local tag
local text
local piece=""

--message_all("verificando radar")

for k, Nave in pairs(global.destrocosnave) do
	if Nave.entity.valid then
		chunk = Nave.chunk
		tag=Nave.map_flag

		text = "Spaceship Wreck"
	
		if Nave.entity.name=="big-ship-wreck-1" then piece = " (GlaDOS)"
		elseif Nave.entity.name=="big-ship-wreck-2" then piece = " (Freeman)"
		elseif Nave.entity.name=="big-ship-wreck-3" then piece = " (Hal-9000)" end
		text = text .. piece
		
		if tag==nil then
		posicao = Nave.entity.position
		if game.forces["player"].is_chunk_charted(global.surface,(chunk)) then
			tag = game.forces["player"].add_chart_tag(game.surfaces.nauvis,{icon={type="virtual",name="signal-yellow"}, text=text,position=posicao})
			if tag~=nil then
			table.insert(global.destrocosnave, { entity = Nave.entity, chunk=chunk, map_flag=tag} )
			table.remove(global.destrocosnave, k)
			message_all({"missions.shipwreck-found"})
			
			if global.mission_status==0 and global.mission_master==1 then 
				global.mission_status=4 
				global.ticks=700
				CreateTempCamera(posicao,210,60)
				end
			if global.mission_status==4 and global.mission_master==2 then 
				global.ticks=700
				global.mission_status=5 
				CreateTempCamera(posicao,210,60)
				end
			if global.mission_status==2 and global.mission_master==3 then 
				global.ticks=700
				global.mission_status=3 
				CreateTempCamera(posicao,210,60)
				end
			break
			end
			
			else  --- verificar se fez as pesquisas reveladoras de destroços
			if game.forces["player"].technologies['shipwreck-scan1'].researched then  
			if global.mission_status==0 and global.mission_master==1 then 
			if Nave.entity.name=="big-ship-wreck-1" then 
				RelevaMapa(global.surface,Nave.entity.position) end end end
			
			
			if game.forces["player"].technologies['shipwreck-scan2'].researched then
			if global.mission_status==4 and global.mission_master==2 then 
			if Nave.entity.name=="big-ship-wreck-2" then 
				RelevaMapa(global.surface,Nave.entity.position) end end end
				
			if game.forces["player"].technologies['shipwreck-scan3'].researched then
			if global.mission_status==2 and global.mission_master==3 then 
			if Nave.entity.name=="big-ship-wreck-3" then 
				RelevaMapa(global.surface,Nave.entity.position) end end end
			
			end

		else
		if not Nave.map_flag.valid then
			table.insert(global.destrocosnave, { entity = Nave.entity, chunk=chunk, map_flag=nil} )
			table.remove(global.destrocosnave, k)
			end
		end
		
		end
	end

-- verificar marcador de foguete	
for k, LocalFoguete in pairs(global.launch_location) do
  	chunk = LocalFoguete.chunk
	if LocalFoguete.map_flag then
	tag=LocalFoguete.map_flag 	
	posicao=LocalFoguete.position
		if not tag.valid then
			tag = game.forces["player"].add_chart_tag(global.surface,{icon={type="item",name="rocket-silo"}, text="Rocket-Silo",position=posicao}) --{"missions.silo-loc"}
			table.insert(global.launch_location, { position = posicao, chunk=chunk, map_flag=tag} )
			table.remove(global.launch_location, k)
			global.ticks = 300
			global.mission_advance = 0.2
			break
		end
	end
	end
	
-- verificar marcador de boss	
for k, B in pairs(global.bosses) do
	local Boss = B.ent
	local NameB= B.name
	
	if Boss ~=nil then 
	if Boss.valid then
	local tableBoss = B.tableBoss
  	chunk = B.chunk
	tag=B.map_flag 

	local criatag=false
	if tag==nil then criatag=true 
	   elseif not tag.valid then criatag=true  
	   end
	   
	if criatag then
		local TagTxt=""
	    if NameB == "msi-night-boss-spawner" then TagTxt="Smoke-Source" end
		if NameB == "msi-worm-boss-fire-shooter" then TagTxt="Fire-Shooter" end
		tag = game.forces["player"].add_chart_tag(game.surfaces.nauvis,{icon={type="virtual",name="signal-everything"}, text=TagTxt,position=Boss.position})
		table.insert(global.bosses,{ent=Ent,chunk=chunk, map_flag=tag,name=NameB, tableBoss=tableBoss})
		table.remove(global.bosses, k)
		break
	end
	
	else
	 table.remove(global.bosses,k)
	 end
	end
	
	end
	
	
end


local function ExibirMissaoP(player)

			
if global.mission_master == 3 then
	if global.mission_status == 8 then -- mandou contruir silo no local x
		CreateTempCameraForPlayer(player,global.launch_location[1].position,210,50) end
	end
	

	player.set_goal_description (global.MissionTXT,false)
end


local function ExibirMissaoTodos(texto,CamPos)

if CamPos then 
   CreateTempCamera(CamPos,210,60)
   end 

local Conteudo
local Quant
local Nome=""

if texto == nil then texto = global.MissionTXT end

	for _, player in pairs(game.players) do
		if player.connected then
		
			player.set_goal_description (texto,false)
	
			local frame = player.gui.center["painel-missao"]
			    if frame then 
					frame.destroy()
					expand_tag_gui(player)
					end
		end
	end
	
end


--try to find a randon charted chunk 100 times. If not. return an uncharted, but requested chunck
local function FindRandomChunk(surface,MinDist,MaxDist)

local X_Min = MinDist
local X_Max = MaxDist
local Y_Min = MinDist
local Y_Max = MaxDist

local maxX = surface.map_gen_settings.width
local maxY = surface.map_gen_settings.height
if maxX>0 then
	maxX=math.floor(maxX/32)
	if MaxDist>maxX then 
		X_Max=maxX 
		X_Min=X_Max-10
		end
	end
if maxY>0 then
	maxY=math.floor(maxY/32)
	if MaxDist>maxY then 
		Y_Max=maxY 
		Y_Min=Y_Max-10
		end
	end


local X,Y
  for a=1,100 do
	X=math.random(X_Min, X_Max) * math.random(-1,0)
	Y=math.random(Y_Min, Y_Max) * math.random(-1,0)
	if surface.is_chunk_generated({X,Y}) then break end
   end 
 

if not surface.is_chunk_generated({X,Y}) then
    surface.request_to_generate_chunks({X*32+15,Y*32+15}, 1)
--    message_all("requesting to generate at " .. X .. ',' .. Y)
	end

return Position.construct (X,Y)
 
end


local function FindUnchartedChunk(surface, MinDist,MaxDist)


local X1=0
local X2=0
local Y1=0
local Y2=0

	for chunk in surface.get_chunks() do
		local X,Y = chunk.x, chunk.y
		if game.forces["player"].is_chunk_charted(surface,({X,Y})) then
			if X<X1 then X1=X end
			if X>X2 then X2=X end
			if Y<Y1 then Y1=Y end
			if Y>Y2 then Y2=Y end
			end
	end

	
 local dX1 = MinDist*-1
 local dX2 = MinDist
 local dY1 = MinDist*-1
 local dY2 = MinDist
 
 if X1*-1>=MinDist then dX1 = X1 -1 end
 if X2>=MinDist then dX2 = 1 + X2 end
 if Y1*-1>=MinDist then dY1 = Y1-1 end
 if Y2>=MinDist then dY2 = 1 + Y2 end
 
 
 local Max = MaxDist
 
 
local t 
local novoX
local novoY

  for a=1,100 do
	t = math.random(1,4)

	if t==1 then  
		if Max<dX1*-1 then Max=1 end
		novoX=math.random(dX1-Max,dX1) 
		novoY=math.random(dY1-Max,dY2+Max)
	elseif t==2 then 	
		if Max<dX2 then Max=1 end
		novoX=math.random(dX2,dX2+Max) 
		novoY=math.random(dY1-Max,dY2+Max)
	elseif t==3 then		
		if Max<dY1*-1 then Max=1 end
		novoY=math.random(dY1-Max,dY1) 
		novoX=math.random(dX1-Max,dX2+Max)
	elseif t==4 then
		if Max<dY2 then Max=1 end
		novoY=math.random(dY2,dY2+Max) 
		novoX=math.random(dX1-Max,dX2+Max)
	end
	--message_all("tentativa " .. a)
	if surface.is_chunk_generated({novoX,novoY}) then break end
   end --for
 
if not surface.is_chunk_generated({novoX,novoY}) then
   surface.request_to_generate_chunks({novoX*32+15,novoY*32+15}, 1)
    --message_all("requesting to generate at " .. novoX .. ',' .. novoY)
   end
   
-- message_all("retornando chunk " .. novoX .. ',' .. novoY)  
 return Position.construct (novoX,novoY)
	
end		  



function Cria_DestrocosPequenos(surface,n,pos,dist)

local tipoterreno
local posicao
local dest

for a=1,n do
	
	posicao = Position.construct (math.random(pos.x-dist,pos.x+dist), math.random(pos.y-dist,pos.y+dist))
	if a%2==0 then surface.create_entity{name ="small-ship-wreck", position= posicao, force= game.forces.neutral} 
		else
		dest = surface.create_entity{name ="medium-ship-wreck", position= posicao, force= game.forces.neutral}
		end
	
	tipoterreno = surface.get_tile(posicao.x, posicao.y).name
	if tipoterreno ~= "water" and tipoterreno ~= "deepwater" then
		surface.create_entity{name ="small-scorchmark", position= posicao, force= game.forces.neutral}
		surface.create_entity{name="explosion", position=posicao, game.forces.neutral}
		surface.create_entity{name="fire-flame", position=posicao, game.forces.neutral}
		end
	end
end


function CriaDestrocosIniciais()

local conteudo1 = {
	[1] = "iron-plate",
	[2] = "copper-plate",
	[3] = "firearm-magazine",
	[4] = "iron-gear-wheel",
	[5] = "copper-cable",
	[6] = "stone-wall",
	[7] = "shotgun-shell"}

local conteudo2 = {
	[1] = "repair-pack",
	[2] = "piercing-rounds-magazine",
	[3] = "grenade",
	[4] = "automation-science-pack",
	[5] = "steel-furnace",
	[6] = "burner-mining-drill",
	[7] = "electric-mining-drill",
	}
	
local conteudo3 = {
	[1] = "submachine-gun",
	[2] = "light-armor",
	[3] = "shotgun",
	[4] = "lab",
	[5] = "assembling-machine-1",
	[6] = "light-armor",
	[7] = "heavy-armor",
	}
		

local prox_ore=10	
local radi=40
local Nave

local surface = global.surface

local pos
for t=1,15 do
 pos = Position.construct (math.random(-radi,radi), math.random(-radi,radi))	
 local tipoterreno = surface.get_tile(pos.x, pos.y).name
 local Iron = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="iron-ore"})
 local Stone = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="stone"})
 local Copper = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="copper-ore"})
 local Coal = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="coal"})
 if #Iron+#Stone+#Copper+#Coal<1 and tipoterreno ~= "deepwater" then break end
 end


Nave = surface.create_entity{name ="big-ship-wreck-1", position= pos, force= game.forces.neutral}
if Nave ~= nil then 
	surface.create_entity{name="big-explosion", position=pos, game.forces.neutral}
	surface.create_entity{name="fire-flame", position=pos, game.forces.neutral}
	surface.spill_item_stack(pos, {name="iron-plate", count=math.random(100,180)}, false)
	Cria_DestrocosPequenos(surface,math.random(2,5),pos,4 )
	Nave.destructible = false
	Nave.insert{name=conteudo1[math.random(1,#conteudo1)], count=math.random(50,100)}
	Nave.insert{name=conteudo2[math.random(1,#conteudo2)], count=math.random(4,20)}
	Nave.insert{name=conteudo3[math.random(1,#conteudo3)], count=1}
	LimpaArvoresArea(Nave,6)
	table.insert (global.shock_entities,{ entity = Nave, anima=nil} )
	table.insert (global.destrocosnave_ini,Nave)
	end

	
for t=1,15 do
 pos = Position.construct (math.random(-radi,radi), math.random(-radi,radi))	
 local tipoterreno = surface.get_tile(pos.x, pos.y).name
 Iron = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="iron-ore"})
 Stone = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="stone"})
 Copper = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="copper-ore"})
 Coal = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="coal"})
 local Ship1 = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="big-ship-wreck-1"})
 if #Iron+#Stone+#Copper+#Coal+#Ship1<1 and tipoterreno ~= "deepwater" then break end
 end
 
	
Nave = surface.create_entity{name ="big-ship-wreck-2", position= pos, force= game.forces.neutral}
if Nave ~= nil then
	surface.create_entity{name="big-explosion", position=pos, game.forces.neutral}
	surface.spill_item_stack(pos, {name="iron-plate", count=math.random(100,180)}, false)
	surface.create_entity{name="fire-flame", position=pos, game.forces.neutral}
	Nave.destructible = false 
	Cria_DestrocosPequenos(surface,math.random(2,5),pos,4 )
	Nave.insert{name=conteudo1[math.random(1,#conteudo1)], count=math.random(50,100)}
	Nave.insert{name=conteudo2[math.random(1,#conteudo2)], count=math.random(4,20)}
	Nave.insert{name=conteudo3[math.random(1,#conteudo3)], count=1}
	LimpaArvoresArea(Nave,6)
	table.insert (global.shock_entities,{ entity = Nave, anima=nil} )
	table.insert (global.destrocosnave_ini,Nave)
	end
	
 
for t=1,15 do
 pos = Position.construct (math.random(-radi,radi), math.random(-radi,radi))	
 local tipoterreno = surface.get_tile(pos.x, pos.y).name
 Iron = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="iron-ore"})
 Stone = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="stone"})
 Copper = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="copper-ore"})
 Coal = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="coal"})
 Ship1 = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="big-ship-wreck-1"})
 local Ship2 = surface.find_entities_filtered({area={{pos.x-prox_ore, pos.y-prox_ore},{pos.x+prox_ore, pos.y+prox_ore}},name="big-ship-wreck-2"})
 if #Iron+#Stone+#Copper+#Coal+#Ship1+#Ship2<1 and tipoterreno ~= "deepwater" then break end
 end

Nave = surface.create_entity{name ="big-ship-wreck-3", position= pos, force= game.forces.neutral}
if Nave ~= nil then 
	surface.create_entity{name="big-explosion", position=pos, game.forces.neutral}
	surface.create_entity{name="fire-flame", position=pos, game.forces.neutral}
	Nave.destructible = false

	local pos1 = surface.find_non_colliding_position("msi-hidden-energy1", pos, 0, 1)
	local ship_energy = surface.create_entity{name="msi-hidden-energy1", position=pos1, force=game.forces.player}
	ship_energy.minable=false
--	ship_energy.destructible = false

    Cria_DestrocosPequenos(surface,math.random(2,5),pos,4 )
	Nave.insert{name=conteudo1[math.random(1,#conteudo1)], count=math.random(50,100)}
	Nave.insert{name=conteudo2[math.random(1,#conteudo2)], count=math.random(4,20)}
	Nave.insert{name=conteudo3[math.random(1,#conteudo3)], count=1}
	LimpaArvoresArea(Nave,6)
--	table.insert (global.shock_entities,{ entity = Nave, anima=nil} )
	table.insert (global.destrocosnave_ini,Nave)
	
	surface.spill_item_stack(pos, {name="iron-plate", count=math.random(100,180)}, false)

	local pos1 = surface.find_non_colliding_position("steel-chest", pos, 0, 1)
	local chest = surface.create_entity{name="steel-chest", position=pos1, force=game.forces.player}
	chest.insert{name='iron-plate', count=math.random(500,1000)}
	chest.insert{name='copper-plate', count=math.random(500,1000)}
	chest.insert{name='transport-belt', count=math.random(200,500)}
	chest.insert{name='inserter', count=math.random(50,100)}
	end
	
-- plates fragments, scorchs
for a=1,math.random(20,40) do
	table.insert (global.delay_actions,{action="addplatefalling", tick=a*math.random(20,40), tabAction=nil})
	end

if settings.startup["msi_remove_start_oil"].value then
for _, entity in ipairs(surface.find_entities_filtered{area={{-100, -100},{100,100}},name="crude-oil"}) do
	entity.destroy() end end
	
end


-- plates fragments, scorchs
function PlatesFalling()
	local pos = Position.construct (math.random(-10,10), math.random(-10,10))	
	local tipoterreno = global.surface.get_tile(pos.x, pos.y).name
	if tipoterreno ~= "water" and tipoterreno ~= "deepwater" then
		global.surface.create_entity{name ="small-scorchmark", position= pos, force= game.forces.neutral}
		global.surface.spill_item_stack(Position.construct(pos.x+0.4,pos.y+0.4), {name="iron-plate", count=1}, false)
		global.surface.create_entity{name="msi-worm-surfacing", position=pos, game.forces.neutral}
		end
		
for k, Nave in ipairs(global.destrocosnave_ini) do
	pos = Nave.position
	local x = pos.x + math.random(-13,13)
	local y = pos.y + math.random(-13,13)
	pos = Position.construct (x, y)	
	tipoterreno = global.surface.get_tile(pos.x, pos.y).name
	if tipoterreno ~= "water" and tipoterreno ~= "deepwater" then
		global.surface.create_entity{name ="small-scorchmark", position= pos, force= game.forces.neutral}
		global.surface.spill_item_stack(Position.construct(pos.x+0.4,pos.y+0.4), {name="iron-plate", count=1}, false)
		global.surface.create_entity{name="msi-worm-surfacing", position=pos, game.forces.neutral}
		end
	end

end



function RemoveSecQuest(num)
for m, quest in pairs (global.secondary_quests) do
	if quest.num==num then table.remove(global.secondary_quests,m) end
	end
end


function CriaEntidadeMissao2(num)
local distancia = 8
local nome_ent  =""
local force
if num==5 then 
		nome_ent = "msi-night-boss-spawner" 
		distancia = mod_distance2
		force=game.forces.enemy
	elseif num==6 then  -- bluechip
		distancia = mod_distance2
	elseif num==10 then 
		nome_ent = "msi-worm-boss-fire-shooter" 
		distancia = mod_distance2
		force=game.forces.enemy
	end	


local chunk	

if global.wait_chunk == nil then
	chunk = FindUnchartedChunk(global.surface,distancia,5)
	else 
	chunk = global.wait_chunk
	end
	
if not global.surface.is_chunk_generated(chunk) then 
	global.wait_chunk = chunk
	return 
	end

global.wait_chunk = nil
local Ent
local posicao = {x=32*chunk.x+12,y=32*chunk.y+12}

if nome_ent ~= '' then
	posicao = global.surface.find_non_colliding_position(nome_ent, posicao, 0, 1) end

if posicao ~= nil then
	tipoterreno = global.surface.get_tile(posicao.x, posicao.y).name
	if tipoterreno ~= "water" and tipoterreno ~= "deepwater" then
		if num==6 then
			global.mission_creating_entity =0
			global.MSI_DoubleBlue_Posit = posicao
			RelevaMapa(global.surface,posicao)
			CreateTempCamera(posicao,210,60)
			table.insert (global.delay_actions,{action="addmaptag", tick=game.tick+100, tabAction={icon={type="item",name="processing-unit"}, text="",position=posicao}})
			global.MissionTXT   = {"missions.secmission_9B_txt"}
			ExibirMissaoTodos()
			end
		
		if nome_ent ~= '' then 
		Ent = global.surface.create_entity{name =nome_ent, position= posicao, force= force} end
		if Ent ~= nil then
			global.mission_creating_entity =0
			if num==5 then 
				global.PanelMission = {"missions.mission_3_0_3"}
				global.MissionTXT   = {"missions.mission_3_0_3_txt"}
				ExibirMissaoTodos()
				CallWormAttack(Ent.surface,{x=posicao.x, y=posicao.y-25})
				CallWormAttack(Ent.surface,{x=posicao.x, y=posicao.y+25})
				CallWormAttack(Ent.surface,{x=posicao.x-25, y=posicao.y})
				CallWormAttack(Ent.surface,{x=posicao.x+25, y=posicao.y})
				table.insert(global.monitorar_entidates,{ent=Ent,evento="boss-worm-reinforce",tabEvento=nil})
				local smoke = global.surface.create_entity{name ="msi-huge-smoke", position={x=posicao.x, y=posicao.y-20}, force=game.forces.neutral}
				smoke.destructible = false
				--local smoke = global.surface.create_trivial_smoke{name ="msi-huge-smoke", position={x=posicao.x, y=posicao.y-20}}
				local tableBoss = {}
				table.insert(tableBoss,smoke)
				table.insert(global.bosses,{ent=Ent,chunk=chunk, map_flag=nil,name=nome_ent, tableBoss=tableBoss})
				RelevaMapa(global.surface,Ent.position)
				CreateTempCamera(Ent.position,210,60)
				end
			if num==10 then 
				local texto = {"missions.secmission_10_txt"}
				ExibirMissaoTodos(texto)
				table.insert(global.secondary_quests,{num="10",tableQuest=nil,camera=Ent.position})
				CallWormAttack(Ent.surface,{x=posicao.x, y=posicao.y-25})
				CallWormAttack(Ent.surface,{x=posicao.x, y=posicao.y+25})
				CallWormAttack(Ent.surface,{x=posicao.x-25, y=posicao.y})
				CallWormAttack(Ent.surface,{x=posicao.x+25, y=posicao.y})
				table.insert(global.monitorar_entidates,{ent=Ent,evento="boss-fireworm",tabEvento=nil})
				table.insert(global.bosses,{ent=Ent,chunk=chunk, map_flag=nil,name=nome_ent, tableBoss=nil})
				RelevaMapa(global.surface,Ent.position)
				CreateTempCamera(Ent.position,210,60)
				LaunchFire()
				sound_all('msi_sound_alert2')
				end
			end
		end
	end

end





function CriaEntidadeMissao()

local distancia = 8
local nome_ent  =""
local conteudo  =""
local extra1=""
local extra2=""
local surface = global.surface

if global.mission_master==1 then 
	nome_ent = "big-ship-wreck-1" 
	conteudo = "glados-core"
	extra1="military-science-pack"
	extra2="chemical-science-pack"
	distancia = mod_distance1
	end

if global.mission_master==2 then 
	nome_ent = "big-ship-wreck-2" 
	conteudo = "gordon-freeman"
	extra1="utility-science-pack"
	extra2="chemical-science-pack"
	distancia = mod_distance2
	end

if global.mission_master==3 then 
	nome_ent = "big-ship-wreck-3"
	conteudo = "hal9000"
	extra1="utility-science-pack"
	extra2="production-science-pack"
	distancia = mod_distance3
	end	

	
local chunk = FindUnchartedChunk(surface,distancia,5)   -- deveria ter uma protecao aqui...
local Nave
posicao = {x=32*chunk.x+10,y=32*chunk.y+10}
Nave = surface.create_entity{name =nome_ent, position= posicao, force= game.forces.neutral}
if Nave ~= nil then 
	
	if nome_ent=="big-ship-wreck-1" then
		Nave.insert{name=conteudo, count=1}
		else
		table.insert (global.shock_entities,{ entity = Nave, anima=nil} )
		table.insert(global.monitorar_entidates,{ent=Nave,evento="freeing-ship-npc",tabEvento=conteudo})
		end
	
	Nave.insert{name=extra1, count=math.random(100,200) }
	Nave.insert{name=extra2, count=math.random(100,200) }
	Nave.destructible = false
	LimpaArvoresArea(Nave,6)
	--message_all("NAVE CRIADA em " .. posicao.x+10 .. ',' .. posicao.y+10) 
	table.insert(global.destrocosnave, {entity = Nave, chunk=chunk, map_flag=nil} )
	global.mission_creating_entity = 0
		
	Cria_DestrocosPequenos(surface,math.random(2,5),posicao,math.random(3,5))
	
	local tipoterreno
	local pos	
	-- plates fragments, scorchs
	for a=1,math.random(10,20) do
		pos = Position.construct (math.random(posicao.x-10,posicao.x+10), math.random(posicao.y-10,posicao.y+10))	
		tipoterreno = surface.get_tile(pos.x, pos.y).name
		if tipoterreno ~= "water" and tipoterreno ~= "deepwater" then
			surface.create_entity{name ="small-scorchmark", position= pos, force= game.forces.neutral}
			surface.spill_item_stack(Position.construct(pos.x+0.4,pos.y+0.4), {name="iron-plate", count=1}, false)
			end
		end
	else
	--message_all("Nao foi possivel criar em " .. posicao.x+10 .. ',' .. posicao.y+10) 
	end


end

function RelevaMapa(surface,posicao)
game.forces["player"].chart(surface, {lefttop = {posicao.x -10, posicao.y -10}, rightbottom = {posicao.x +10, posicao.y +10}})
end




function CriaLocalFoguete()
local tag
local posicao
local chunk

--message_all("global.mission_creating_entity=".. global.mission_creating_entity)

if global.mission_creating_entity ==10 then
	local distancia = mod_distance4
	chunk = FindRandomChunk(global.surface,distancia,distancia+10)
	global.launch_location={}
	table.insert(global.launch_location, { position = nil, chunk=chunk, map_flag=nil} )
	global.mission_creating_entity =11
	end
	
if global.mission_creating_entity >=10 and global.mission_creating_entity <=50 then

	if global.mission_creating_entity >= 50 then  -- tentou 10 vezes - desiste desse chunk
		global.launch_location={}
		global.mission_creating_entity =10
		return 
		end
		
	chunk = global.launch_location[1].chunk

    if not global.surface.is_chunk_generated(chunk) then 
		global.mission_creating_entity = global.mission_creating_entity+1
		return 
		end

	global.mission_creating_entity = 51
	end

if global.mission_creating_entity>= 51 then   -- chunk criado
	local pos1
	local pos2
	local pos3
	
	chunk = global.launch_location[1].chunk
	
	--message_all("chunk gerado.. tentando alocar posica." .. global.mission_creating_entity)
	
	pos1 = {x=32*chunk.x+16,y=32*chunk.y+16}
	pos1 = global.surface.find_non_colliding_position("iron-chest", pos1, 0, 1)
	pos2 = {x=32*chunk.x+13,y=32*chunk.y+13}
	pos2 = global.surface.find_non_colliding_position("iron-chest", pos1, 0, 1)
	pos3 = {x=32*chunk.x+19,y=32*chunk.y+19}
	pos3 = global.surface.find_non_colliding_position("iron-chest", pos1, 0, 1)

	if pos1 ~= nil and pos2 ~= nil and pos3 ~= nil then
		posicao = pos1
		
		tipoterreno = global.surface.get_tile(posicao.x, posicao.y).name
		if tipoterreno == "water" or tipoterreno == "deepwater" then
			global.mission_creating_entity =10  -- water - restart location routine
			return
			end

		tag = game.forces["player"].add_chart_tag(global.surface,{icon={type="item",name="rocket-silo"}, text="Rocket-Silo",position=posicao})	
		if tag~=nil then
			global.launch_location={}
			table.insert(global.launch_location, { position = posicao, chunk=chunk, map_flag=tag} )
		    global.mission_creating_entity = 0
			global.mission_status = 7
			CreateTempCamera(posicao,210,60)
			--message_all("posicao do foguete em " .. posicao.x .. ',' .. posicao.y) 
			return
			else
			global.launch_location={}
			RelevaMapa(global.surface,posicao)
			table.insert(global.launch_location, { position = posicao, chunk=chunk, map_flag=nil} )
			global.mission_creating_entity = global.mission_creating_entity+1
			end

		else
		global.mission_creating_entity =10  -- restart location routine
		return
		end
		
	if global.mission_status >= 71 then
		global.mission_creating_entity =10  -- restart location routine - 
		return
		end		
		
	end


end


local function DefinirCargasExigidas(total)

local Lista= global.MSI_cargo_list

--if game.item_prototypes["alien-sample"] then Lista[#Lista+1]="alien-sample" end
	
local adiciona
local nome=""	
local e
local t=0
local q
local missaodefinida={}
	
  for a=1,100 do
	e=math.random(1,#Lista)
	
--	message_all(Lista[e])
	adiciona=true
	for k, Carga in pairs(missaodefinida) do
		item = Carga.item
		if item==Lista[e] then 
			adiciona=false
			break
			end
		end

	if adiciona then 
		t=t+1
		nome={"item-name."..Lista[e]}
		q= math.random(mod_cargo_request_min,mod_cargo_request_max)
		if e==1 then q=q*10 end
		table.insert(missaodefinida, { item =Lista[e], quant=q, nome=nome, enviados=0 } )
		if t==total then break end
		end
	end

if t==total then 
   return missaodefinida 
   else
	return nil
   end
   
   
end








-- avanca missao   avancamissao
local function VerificaStatusMissao()

if global.mission_master == 0 then
	if global.mission_status == 0 then
		global.PanelMission = {"missions.mission_1_1"}
		global.MissionTXT   = {"missions.mission_1_1_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 2 -- em dias de jogo
		global.mission_status =1
		return
		end
	
	if global.mission_status == 1 then
		global.PanelMission = {"missions.mission_1_2"}
		global.MissionTXT   = {"missions.mission_1_2_txt"}
		ExibirMissaoTodos()
		global.mission_status = 2
		global.mission_advance = 2 -- manda instalar radares (event scan)
		return
		end

		
	if global.mission_status == 10 then
		global.PanelMission = {"missions.mission_1_3"}
		global.MissionTXT   = {"missions.mission_1_3_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 10 --  manda localizar dest
		game.forces["player"].technologies['shipwreck-scan1'].enabled=true
		table.insert(global.MSI_Techs,'shipwreck-scan1')
		global.mission_status=0
		global.mission_master=1
		global.mission_creating_entity = 1
		return
		end
	end

	
if global.mission_master == 1 then
	if global.mission_status == 4 then
		global.PanelMission = {"missions.mission_1_4"}
		global.MissionTXT   = {"missions.mission_1_4_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 10 -- em dias de jogo
		global.mission_status =5
		game.forces["player"].technologies['shipwreck-scan1'].researched = true
		return
		end
	end




 -- MISSAO 2


if global.mission_master == 2 then
	
	if global.mission_status == 0 and  game.forces["player"].technologies['plastics'].researched then
		global.PanelMission = {"missions.mission_2_1"}
		global.MissionTXT   = {"missions.mission_2_1_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 0.2 -- em dias de jogo
		global.mission_status =1
		return
		end
	
	if global.mission_status == 1 then
		global.PanelMission = {"missions.mission_2_2"}
		global.MissionTXT   = {"missions.mission_2_2_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 0.2 -- em dias de jogo
		global.mission_status =2
		return
		end
		
	if global.mission_status == 2 then
		global.PanelMission = {"missions.mission_2_3"}
		global.MissionTXT   = {"missions.mission_2_3_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 0.2 -- em dias de jogo
		global.mission_status =3
		return
		end
		
	if global.mission_status == 3 then
		global.PanelMission = {"missions.mission_2_4"}
		global.MissionTXT   = {"missions.mission_2_4_txt"}
		ExibirMissaoTodos()
		game.forces["player"].technologies['shipwreck-scan2'].enabled=true
		table.insert(global.MSI_Techs,'shipwreck-scan2')
		global.mission_advance = 10 -- localizar Freeman
		global.mission_status=4
		global.mission_creating_entity = 1
		return
		end
		
	if global.mission_status == 5 then
		global.PanelMission = {"missions.mission_2_5"}
		global.MissionTXT   = {"missions.mission_2_5_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 10 -- em dias de jogo
		global.mission_status=6
		game.forces["player"].technologies['shipwreck-scan2'].researched = true
		return
		end		
		
	end




if global.mission_master == 3 then


	   if global.mission_status == 0 then
		global.PanelMission = {"missions.mission_3_0_1"}
		global.MissionTXT   = {"missions.mission_3_0_1_txt"}
		ExibirMissaoTodos() -- Inicio da quest Boss - Fumaca
		global.mission_advance = 10  
		global.mission_status =50	
		game.forces["player"].technologies['msi-smoke-tech'].enabled=true
		table.insert(global.MSI_Techs,'msi-smoke-tech')
		return
		end

	   if global.mission_status == 51 then  -- escuridao 
		global.surface.always_day = true
		global.surface.daytime = 0.5
		game.forces.player.worker_robots_speed_modifier = -0.5
		local texto = {"missions.mission_3_0_2_smoke"}
		ExibirMissaoTodos(texto) 
		global.mission_advance = 10  
		global.mission_status =52
		return
		end

	   if global.mission_status == 60 and  
	   game.forces["player"].technologies['speed-module-2'].researched and
	   game.forces["player"].technologies['productivity-module-2'].researched then
		global.PanelMission = {"missions.mission_3_1"}
		global.MissionTXT   = {"missions.mission_3_1_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 0.2 -- em dias de jogos
		global.mission_status =1
		return
		end
	
	if global.mission_status == 1 then
		global.PanelMission = {"missions.mission_3_2"}
		global.MissionTXT   = {"missions.mission_3_2_txt"}
		ExibirMissaoTodos()
		game.forces["player"].technologies['shipwreck-scan3'].enabled=true
		table.insert(global.MSI_Techs,'shipwreck-scan3')
		global.mission_advance = 10 -- em dias de jogo
		global.mission_status =2 -- ACHAR NO RADAR
		global.mission_creating_entity = 1
		return
		end
		
	if global.mission_status == 3 then
		global.PanelMission = {"missions.mission_3_3"}
		global.MissionTXT   = {"missions.mission_3_3_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 10 -- em dias de jogo
		global.mission_status =4 -- ACHOU RADAR - pede resgate e pesquisa
		game.forces["player"].technologies['shipwreck-scan3'].researched = true
		return
		end
		
	if global.mission_status == 5 then
		global.mission_creating_entity = 10 -- escolher local do silo
		global.mission_advance = 0.5 -- em dias de jogo
		global.mission_status =6 
		return
		end	
		
	if global.mission_status == 7 then
		global.PanelMission = {"missions.mission_3_5"}
		global.MissionTXT   = {"missions.mission_3_5_txt"}
		global.mission_advance = 10 -- em dias de jogo
		global.mission_status =8 -- MANDOU CONTRUIR SILO NO LOCAL
		ExibirMissaoTodos(nil,global.launch_location[1].position)
		return
		end			

	end	

 -- SILO DE FOGUETE CONSTRUIDO
if global.mission_master == 10 then
	if global.mission_status == 0 then
		global.PanelMission = {"missions.mission_10_1"}
		global.MissionTXT   = {"missions.mission_10_1_txt"}
		global.mission_advance = 10 -- em dias de jogo
		global.mission_status =1
		ExibirMissaoTodos(nil,global.launch_location[1].position)
		return
		end

	if global.mission_status == 2 then
		global.PanelMission = {"missions.mission_10_2"}
		global.MissionTXT   = {"missions.mission_10_2_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 0.4 -- em dias de jogo
		global.mission_status =3
		return
		end		

	if global.mission_status == 3 then
		global.PanelMission = {"missions.mission_10_3"}
		global.MissionTXT   = {"missions.mission_10_3_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 0.4  -- em dias de jogo
		global.mission_status =4
		return
		end		

	if global.mission_status == 4 then
		global.PanelMission = {"missions.mission_10_4"}
		global.MissionTXT   = {"missions.mission_10_4_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 10  -- em dias de jogo
		global.mission_status =5 -- lancar HAL
		return
		end		

	if global.mission_status == 6 then
		global.PanelMission = {"missions.mission_10_5"}
		global.MissionTXT   = {"missions.mission_10_5_txt"}
		ExibirMissaoTodos()
		global.mission_advance = 1  -- em dias de jogo
		global.mission_status =7 -- lancar HAL
		return
		end		
		
	if global.mission_status == 7 then
		global.mission_cargo_request = DefinirCargasExigidas(mod_cargo_request_number)
		if global.mission_cargo_request ~= nil then
			global.mission_status =10
			global.PanelMission = {"missions.mission_10_6"}
			global.MissionTXT   = {"missions.mission_10_6_txt"}
			ExibirMissaoTodos()
			global.mission_advance = 30  -- em dias de jogo
			end
		return
		end			
		
	end	
	
end

-- remove electricity shock effect
function RemoveElectric(entidade)
	for e, Eletric in pairs (global.shock_entities) do
		local entity = Eletric.entity
		local anima  = Eletric.anima
		if entidade==entity then
			if anima~=nil then anima.destroy() end
			table.remove (global.shock_entities,e)
			break
			end
	end
end
			



function EntityShockPulse()
local Entity
local Anima

for k, lista in pairs (global.shock_entities) do
	Entity = lista.entity
	Anima  = lista.anima
	
	if Anima == nil and Entity ~= nil then
		Anima = global.surface.create_entity{name = "electric-animation", position = Entity.position}
		Anima.destructible = false,
		--Anima = global.surface.create_trivial_smoke{name = "electric-animation", position = Entity.position}
		table.remove(global.shock_entities,k)
		table.insert (global.shock_entities,{ entity = Entity, anima=Anima} )
		end
	
	if Entity.valid then
		if math.random(1,3)==1 and game.tick>60*100 then 

			if game.forces.enemy.evolution_factor < 0.4 then
					global.surface.create_entity{name = "electric-shock", position = Entity.position}
				elseif game.forces.enemy.evolution_factor >= 0.4 and game.forces.enemy.evolution_factor < 0.75 then
					global.surface.create_entity{name = "electric-shock-b", position = Entity.position}
				else
					global.surface.create_entity{name = "electric-shock-c", position = Entity.position}
				end
			end
	else
	if Anima ~= nil then Anima.destroy() end
	table.remove(global.shock_entities,k)
	end
end
	
end


function getRandonPlayerMachine()
Machines = global.surface.find_entities_filtered({force= "player", type="assembling-machine"}) 
if #Machines>0 then 
return Machines[math.random(1,#Machines)]
else return nil end
end

function getRandonLocationNear(object, radius)
if object~=nil and object.valid then
local pos =object.position
local x = math.random(0-radius,radius)
local y = math.random(0-radius,radius)
local pX = pos.x+x
local pY = pos.y+y
return Position.construct (pX,pY)
else return nil end
end


function LaunchFire()
local pos = getRandonLocationNear(getRandonPlayerMachine(),5)
if pos~=nil then
   global.surface.create_entity{name ="maf-cluster-fire-projectile", target_position=pos, position=pos, source_position ={x=pos.x+20,y=pos.y-200}, force= game.forces.enemy, speed=5}
   CreateTempCamera(pos,210,40)
   end
end

function GetPlayerNear(Pos,area)
local pl=nil
	for p, player in pairs(game.connected_players) do
		if player.valid and player.character then
			if player.character.valid then
			if distance(Pos,player.character.position)<150 then
				pl = player
				break
				end
			end
			end
	end
return pl
end



function MonitorarEntidades()

for k, ME in pairs (global.monitorar_entidates) do
	local Entidade= ME.ent
	local evento  = ME.evento
	local tabEvento=ME.tabEvento
	
	
	if Entidade.valid then

	
	if evento=="freeing-ship-npc" then
		if Entidade.get_item_count("repair-pack") >= 200 then
			Entidade.remove_item({name="repair-pack", count=200})
			local last_tick = game.tick + math.random(5*60*60,10*60*60)
			local remaining_ticks = last_tick - game.tick
			local texto = string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60)
			local cor = {r = 1, g = 1, b = 1}
			local new_label = global.surface.create_entity({name="timer-label", position = Entidade.position, text=texto, color=cor})
			new_label.active = false
			table.insert(global.timed_events,{evento=evento,entidade=Entidade, label=new_label, last_tick=last_tick})
			table.remove(global.monitorar_entidates,k)
			CallFrenzyAttack(Entidade.position)
		end
	end
	
	
	if evento=="nave_militar" then
		if Entidade.get_item_count("repair-pack") >= 20 then
			Entidade.remove_item({name="repair-pack", count=20})
			GrantXP(10)
			local Pcount = #game.connected_players
			
			if game.item_prototypes["bob-sniper-turret-1"] then 
				global.surface.spill_item_stack(Entidade.position,{name="bob-sniper-turret-1", count=math.random(10,20)}, false)
				global.surface.spill_item_stack(Entidade.position,{name="sniper-rifle", count=2}, false)
				global.surface.spill_item_stack(Entidade.position,{name="rifle", count=2}, false)
				global.surface.spill_item_stack(Entidade.position,{name="gatling-gun", count=2}, false)
				else
				global.surface.spill_item_stack(Entidade.position,{name="gun-turret", count=math.random(10,20)}, false)
				end
			
			global.surface.spill_item_stack(Entidade.position,{name="gun-turret", count=math.random(20,40)}, false)
			global.surface.spill_item_stack(Entidade.position,{name="military-science-pack", count=math.random(100,200)}, false)
			global.surface.spill_item_stack(Entidade.position,{name="piercing-rounds-magazine", count=math.random(300,500)}, false)
			global.surface.spill_item_stack(Entidade.position,{name="land-mine", count=math.random(30,50)}, false)
			
			table.remove(global.monitorar_entidates,k)
			CallFrenzyAttack(Entidade.position)
			local texto = {"missions.secmission_6_success"}
			ExibirMissaoTodos(texto)
			RemoveSecQuest("6")
		end
	end



	-- when glados is taken back to shipwreck 1
	if evento=="glados-wheatley" then
		if Entidade.get_item_count("glados-core") > 0 and Entidade.get_item_count("construction-robot")>0 then
			Entidade.remove_item({name="glados-core"})
			Entidade.remove_item({name="construction-robot"})
			table.insert (global.shock_entities,{ entity = Entidade, anima=nil} )
			
			local last_tick = game.tick + math.random(8*60*60,15*60*60)
			local remaining_ticks = last_tick - game.tick
			local texto = "GlaDOS: " .. string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60)
			local cor = {r = 1, g = 1, b = 1}
			local new_label = global.surface.create_entity({name="timer-label", position = Entidade.position, text=texto, color=cor})
			new_label.active = false
			table.insert(global.timed_events,{evento="glados-wheatley",entidade=Entidade, label=new_label, last_tick=last_tick})
			table.remove(global.monitorar_entidates,k)
			CallFrenzyAttack(Entidade.position)
		end
	end

	
	
	-- when glados is taken back to shipwreck 1
	if evento=="freeman-drill" then
		if Entidade.get_item_count("gordon-freeman") > 0 and Entidade.get_item_count("repair-pack")>=200 then
			Entidade.remove_item({name="gordon-freeman"})
			Entidade.remove_item({name="repair-pack", count=200})
			table.insert (global.shock_entities,{ entity = Entidade, anima=nil} )
			
			local last_tick = game.tick + math.random(6*60*60,12*60*60)
			local remaining_ticks = last_tick - game.tick
			local texto = "Freeman: " .. string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60)
			local cor = {r = 1, g = 1, b = 0}
			local new_label = global.surface.create_entity({name="timer-label", position = Entidade.position, text=texto, color=cor})
			new_label.active = false
			table.insert(global.timed_events,{evento="freeman-drill",entidade=Entidade, label=new_label, last_tick=last_tick})
			table.remove(global.monitorar_entidates,k)
			CallFrenzyAttack(Entidade.position)
		end
	end	
	
	
	if evento=="wheatley-cubeplans" then
		if Entidade.get_item_count("wheatley-core") > 0 and Entidade.get_item_count("advanced-circuit")>=20 then
			Entidade.remove_item({name="wheatley-core"})
			Entidade.remove_item({name="advanced-circuit",count=20})

			local last_tick = game.tick + math.random(4*60*60,8*60*60)
			local remaining_ticks = last_tick - game.tick
			local texto = "Wheatley: " .. string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60)
			local cor = {r = 0, g = 0, b = 1}
			local new_label = global.surface.create_entity({name="timer-label", position = Entidade.position, text=texto, color=cor})
			new_label.active = false
			table.insert(global.timed_events,{evento="wheatley-cubeplans",entidade=Entidade, label=new_label, last_tick=last_tick})
			table.remove(global.monitorar_entidates,k)
		end
	end
	
	
	--Boss
	if evento=="boss-worm-reinforce" then
		if math.random(1,10)<=2 then
			local pl = GetPlayerNear(Entidade.position,150)
			if pl~=nil then 
				CallWormAttack(pl.character.surface,pl.character.position) 
				end
			end
		end
		
		
	if evento=="boss-fireworm" then
		if math.random(1,20)<=1 then
			local pl = GetPlayerNear(Entidade.position,200)
			if pl~=nil then -- attack near player
				global.surface.create_entity{name ="maf-cluster-fire-projectile", target_position=pl.position, position=pl.position, source_position=Entidade.position, force= game.forces.enemy, speed=5}
				end
		elseif math.random(1,300)==1 then 
			LaunchFire()
			end
		end
	else
	table.remove(global.monitorar_entidates,k)
	end
	
end

end


function MalfunctionRisk()
if game.forces["player"].technologies['advanced-electronics-2'].researched then
if game.tick % (global_timer * 6)  ==0 then
	local Pcount = #game.connected_players
	if math.random(1,100)<=global.explosion_risk+(Pcount*2) then
		global.tick_secondary_mission = game.tick + math.floor(1000 * (math.random(80,130)/100))
		table.insert(global.available_secondary_mission,"2")
	end
	end
	end
end


function CreateNPCWantWork() 
	local Npc = {"glados-core"}
	if game.forces["player"].technologies['nuclear-power'].researched then 
		table.insert(Npc,"gordon-freeman") end

	local oNPC = Npc[math.random(1,#Npc)]
		
	local itens = CreateItemList()
	local itens2 = {[1] = "logistic-robot", [2]="construction-robot"}
	
	local oItem = itens[math.random(1,#itens-#Npc)]
	local oItem2 = itens2[math.random(1,#itens2)]

	local quant = math.random (40,250)
	local Nave = global.destrocosnave[math.random(1,#global.destrocosnave)].entity
	
	local lista ={  {name=oNPC, count=1},
					{name=oItem2, count=math.random(1,3)},	
					{name=oItem, count=quant} }
	
	local tableQuest={Nave, lista}
		
	table.insert(global.secondary_quests,{num="5",tableQuest=tableQuest})
	table.insert(global.monitorar_entidates,{ent=Nave,evento="CreateNPCWantWork",tabEvento=nil})
end



function NPCWantWork()
if game.forces["player"].technologies['robotics'].researched then return end
if game.tick % (global_timer * 6)  ==0 then

	local Pcount = #game.connected_players
	if math.random(1,100)<=40+(Pcount*2) then

		global.tick_secondary_mission = game.tick + math.floor(1000 * (math.random(80,130)/100))
		table.insert(global.available_secondary_mission,"5")
	end
	end
end



function PortalRiskInvasion()
if game.item_prototypes["portal-gun"] then 
if game.tick % (global_timer * 4)  ==0 then
	if math.random(1,100)<=global.PortalRisk_Invasion then

	local ab = "portal-a"
	if math.random(1,2)==1 then ab = "portal-b" end
	
local Portals = {}
for k, surface in pairs (game.surfaces) do
    local tmp = surface.find_entities_filtered({force= "player", name=ab})
		for p=1, #tmp do 
			table.insert(Portals,tmp[p])
			end
	end

	if #Portals<1 then return end	

	local oPortal = Portals[math.random(1,#Portals)]
	local texto = {"portal_invasion"}
	ExibirMissaoTodos(texto)

	if math.random(1,2)==1 then
	CallWormAttack(oPortal.surface, oPortal.position)
	else
	CallUnitAttack(oPortal.surface, oPortal.position)
	end
end
end
end
end



function RadarScan(event)


if global.mission_master == 0 then
global.TotalScanned = global.TotalScanned + 1

 local oRadar = event.radar 
 local surface = oRadar.surface
	
	if global.TotalScanned == 40 or global.TotalScanned == 110 then
		CallFrenzyAttack(surface,oRadar.position)
		global.MissionTXT   = {"missions.mission_1_2A_txt"}
		ExibirMissaoTodos()
		end
		
	if global.TotalScanned == 80 then	
		local chunk = event.chunk_position 
		local posicao = {x=32*chunk.x+10,y=32*chunk.y+10}
		posicao = surface.find_non_colliding_position("big-ship-wreck-2", posicao, 0, 1)
		local Nave = surface.create_entity{name="big-ship-wreck-2", position= posicao, force= game.forces.neutral}
		if Nave ~= nil then
			Nave.destructible = false
			CallWormAttack(surface,posicao)
			CallFrenzyAttack(surface,posicao)
			CreateTempCamera(posicao,210,60)
			surface.spill_item_stack(posicao, {name="iron-plate", count=math.random(100,180)}, false)
	
			table.insert (global.delay_actions,{action="addmaptag", tick=game.tick+100, tabAction={icon={type="virtual",name="signal-green"}, text="Spaceship Wreck (machines)",position=posicao}})
	
			local last_tick = game.tick + global_timer * 4
			local remaining_ticks = last_tick - game.tick
			local stime = string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60) 
			local texto = {"print-2-var",{"remaining_time"},stime}
			local cor = {r = 1, g = 1, b = 1}
			local new_label = surface.create_entity({name="timer-label", position = posicao, text=texto, color=cor})
			new_label.active = false
			table.insert(global.timed_events,{evento="nave_maquinas",entidade=Nave, label=new_label, last_tick=last_tick})

			
			Nave.insert{name="solar-panel", count=math.random(25,50)}
			Nave.insert{name="assembling-machine-2", count=math.random(25,50)}
			Nave.insert{name="electric-mining-drill", count=math.random(25,50)}
			surface.spill_item_stack(Nave.position,{name="steel-furnace", count=math.random(20,30)}, false)
			surface.spill_item_stack(Nave.position,{name="accumulator", count=math.random(20,30)}, false)
			surface.spill_item_stack(Nave.position,{name="steam-engine", count=math.random(5,15)}, false)
			surface.spill_item_stack(Nave.position,{name="boiler", count=math.random(5,10)}, false)
				
			global.MissionTXT   = {"missions.secmission_7_txt"}
			ExibirMissaoTodos()
			end
		end
		
		
	if global.TotalScanned == 140 then
		local chunk = event.chunk_position 
		local posicao = {x=32*chunk.x+10,y=32*chunk.y+10}
		posicao = surface.find_non_colliding_position("big-ship-wreck-1", posicao, 0, 1)
		local Nave = surface.create_entity{name="big-ship-wreck-1", position= posicao, force= game.forces.neutral}
		if Nave ~= nil then
			Nave.destructible = false
		    CallWormAttack(surface,posicao)
			CallFrenzyAttack(surface,posicao)
			CreateTempCamera(posicao,210,60)
			surface.spill_item_stack(posicao, {name="iron-plate", count=math.random(100,180)}, false)
			table.insert (global.delay_actions,{action="addmaptag", tick=game.tick+100, tabAction={icon={type="virtual",name="signal-yellow"}, text="Spaceship Wreck (military)",position=posicao}})
			
			table.insert(global.secondary_quests,{num="6",tableQuest=nil,camera=posicao})
			table.insert(global.monitorar_entidates,{ent=Nave,evento="nave_militar",tabEvento=nil})
		
			local last_tick = game.tick + global_timer * 4
			local remaining_ticks = last_tick - game.tick
			local stime = string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60) 
			local texto = {"print-2-var",{"remaining_time"},stime}
			local cor = {r = 1, g = 1, b = 1}
			local new_label = surface.create_entity({name="timer-label", position = posicao, text=texto, color=cor})
			new_label.active = false
			table.insert(global.timed_events,{evento="nave_militar",entidade=Nave, label=new_label, last_tick=last_tick})

			if game.item_prototypes["heavy-armor-2"] then 
				Nave.insert{name="heavy-armor-2", count=2}
				else Nave.insert{name="heavy-armor", count=2} end
				
				
			Nave.insert{name="gun-turret", count=10}
			Nave.insert{name="piercing-rounds-magazine", count=200}

			global.MissionTXT   = {"missions.secmission_6_txt"}
			ExibirMissaoTodos()
			end
		end
		
	if global.TotalScanned == 200 then
		global.mission_status = 10
		global.mission_advance = 3
		global.ticks = math.floor( global_timer * global.mission_advance * (math.random(80,130)/100))
		global.PanelMission = {"missions.mission_1_2F"}
		global.MissionTXT   = {"missions.mission_1_2F_txt"}
		ExibirMissaoTodos()
		Register_Accomplished_Mission()
	end

end

end


function DelayActions()
if game.tick % 10 == 0 then
	for k, Action in pairs (global.delay_actions) do
		local action = Action.action
		local tick =Action.tick
		local tabAction=Action.tabAction
		
		if tick<=game.tick then
			if action=="addmaptag" then
				game.forces["player"].add_chart_tag(game.surfaces.nauvis,tabAction)
				end
			
			if action=='addinitialwreck' then
				CriaDestrocosIniciais()
				end
		
			if action=='addplatefalling' then
				PlatesFalling()
				end
		
			table.remove (global.delay_actions,k)
			end
		end
end		
end



function KillRobotsArea(position,area)
a1 = {x=position.x - area, y=position.y - area}
a2 = {x=position.x + area, y=position.y + area}
local Machines = global.surface.find_entities_filtered({area={a1,a2}, type="logistic-robot"})
if #Machines>0 then 
   message_all({"msi_robots_in_wrong_area"}) 
   CreateTempCamera(position,210,60)
   end
for k, M in pairs(Machines) do
	M.surface.create_entity{name="explosion", position=M.position, game.forces.neutral} 
	M.damage(500,game.forces.neutral,"explosion")
	end
end



function CheckDoubleBonusRecipes()
local Machines = {}
local tmp

for s,surface in pairs (game.surfaces) do
	tmp = surface.find_entities_filtered({force= "player", type="assembling-machine"})
	for k=1,#tmp do 
		table.insert (Machines, tmp[k])
		end
	end
	
local alert=true
for k, M in pairs(Machines) do 
	if M.is_crafting() then		
		local recipe = M.get_recipe()
		if string.sub(recipe.name,1,10)=='msi_double' then
		local X = M.position.x
		local Y = M.position.y
		local area = 50
		local posvalid = false
		if M.surface == global.surface then
			if string.sub(recipe.name,1,21)=='msi_double_processing' and global.MSI_DoubleBlue_Posit ~=nil then
				local fX=global.MSI_DoubleBlue_Posit.x
				local fY=global.MSI_DoubleBlue_Posit.y
				if X>=fX-area and X<=fX+area and Y>=fY-area and Y<=fY+area then posvalid = true end
				end
			if recipe.name=='msi_double_advanced_circuit' and #global.destrocosnave>=1 then
				local fX=global.destrocosnave[1].entity.position.x
				local fY=global.destrocosnave[1].entity.position.y
				if X>=fX-area and X<=fX+area and Y>=fY-area and Y<=fY+area then posvalid = true end
				end
			if string.find(recipe.name, "-module") ~= nil and #global.destrocosnave>=2 then
				local fX=global.destrocosnave[2].entity.position.x
				local fY=global.destrocosnave[2].entity.position.y
				if X>=fX-area and X<=fX+area and Y>=fY-area and Y<=fY+area then posvalid = true end
				end
			end
		if not posvalid then
			if alert then
				message_all({"msi_wrong_recipe_loc"})
				if M.valid then 
					CreateTempCamera(M.position,210,60) 
					end;
				alert=false
				end
			M.surface.create_entity{name="big-explosion", position=M.position, game.forces.neutral}
			M.damage(400,game.forces.neutral,"explosion")
			end	
		end
	end
end
end





local function on_tick(event)


global.ticks=global.ticks-1


if global.MSI_DoubleBlue_Posit ~=nil or 
   game.forces["player"].technologies['msi_tech_double_advanced_circuit'].researched or  
   game.forces["player"].technologies['msi_tech_double_modules1'].researched then  
	if game.tick % (60 * 50) == 0 then
		CheckDoubleBonusRecipes()
		end

   	if game.tick % (60 * 120) == 0 then
		if global.MSI_DoubleBlue_Posit ~=nil then
			KillRobotsArea(global.MSI_DoubleBlue_Posit,50)
			end
		if game.forces["player"].technologies['msi_tech_double_advanced_circuit'].researched then
			KillRobotsArea(global.destrocosnave[1].entity.position,50)
			end
		if game.forces["player"].technologies['msi_tech_double_modules1'].researched then
			KillRobotsArea(global.destrocosnave[2].entity.position,50)
			end			
		end
	end


if #global.delay_actions>0 then
	DelayActions()
	end

if global.explosion_risk>0 then
	MalfunctionRisk()
	end
	
if global.PortalRisk_Invasion>0 then
	PortalRiskInvasion()
	end

	
if #global.units_invasion>0 then
	if game.tick %60 == 0 then
		BringNextUnit()
		end
	end
if #global.worms>0 then
	if game.tick %60 == 0 then
		BringNextWorm()
		end
	end
	
-- Secondary missions  
 if global.tick_secondary_mission>0 and #global.available_secondary_mission>0 then
 if global.tick_secondary_mission<game.tick then
 
	if global.available_secondary_mission[1] == "1" then 
		SecMission1()
		table.remove(global.available_secondary_mission,1)
	
	elseif global.available_secondary_mission[1] == "2" then 
		CreateRandomRepairEvent()
		table.remove(global.available_secondary_mission,1)

--	elseif global.available_secondary_mission[1] == "5" then 
--		CreateNPCWantWork()
--		table.remove(global.available_secondary_mission,1)
		
	elseif global.available_secondary_mission[1] == "3" then 
		local texto = {"missions.secmission_3_txt"}
		ExibirMissaoTodos(texto)
		CreateTempCamera(global.destrocosnave[1].entity.position,210,60)
		table.insert(global.secondary_quests,{num="3",tableQuest=nil,camera=global.destrocosnave[1].entity.position})
		table.insert(global.monitorar_entidates,{ent=global.destrocosnave[1].entity,evento="glados-wheatley",tabEvento=nil})
		table.remove(global.available_secondary_mission,1)

	elseif global.available_secondary_mission[1] == "8" then 
		local texto = {"missions.secmission_8_txt"}
		ExibirMissaoTodos(texto)
		CreateTempCamera(global.destrocosnave[2].entity.position,210,60)
		table.insert(global.secondary_quests,{num="8",tableQuest=nil,camera=global.destrocosnave[2].entity.position})
		table.insert(global.monitorar_entidates,{ent=global.destrocosnave[2].entity,evento="freeman-drill",tabEvento=nil})
		table.remove(global.available_secondary_mission,1)

	elseif global.available_secondary_mission[1] == "9" then 
		local texto = {"missions.secmission_9_txt"}
		ExibirMissaoTodos(texto)
		table.insert(global.secondary_quests,{num="9",tableQuest=nil})
		game.forces["player"].technologies['msi_tech_double_processing_unit'].enabled=true
		table.insert(global.MSI_Techs,'msi_tech_double_processing_unit')
		table.remove(global.available_secondary_mission,1)
		
	elseif global.available_secondary_mission[1] == "10" then 
		table.remove(global.available_secondary_mission,1)
		global.mission_creating_entity = 10 -- Cria Boss Darkness
		global.wait_chunk = nil
		CriaEntidadeMissao2(10)
		
	elseif global.available_secondary_mission[1] == "4" then 
		if #global.destrocosnave_ini>1 then
		local texto = {"missions.secmission_4_txt"}
		ExibirMissaoTodos(texto)
		CreateTempCamera(global.destrocosnave_ini[3].position,210,60)
		table.insert(global.secondary_quests,{num="4",tableQuest=nil,camera=global.destrocosnave_ini[3].position})
		table.insert(global.monitorar_entidates,{ent=global.destrocosnave_ini[3],evento="wheatley-cubeplans",tabEvento=nil})
		table.remove(global.available_secondary_mission,1)
		end
	end
	
		
	if #global.available_secondary_mission>0 then 
		tick_secondary_mission = game.tick + math.floor(global_timer * 2 *(math.random(80,130)/100))
		else 
		tick_secondary_mission = 0
		end
	end
	end

	
 if #global.monitorar_entidates > 0 then
	if game.tick %100 == 0 then
		MonitorarEntidades()
		end
	end	
	
if #global.timed_events >0 then
	if game.tick %60 == 0 then
		TimerEvents()
		end
	end	

	
 if #global.shock_entities > 0 then
	if game.tick %600 == 0 then
		EntityShockPulse()
		end
	end
 
 if #global.repair_quests > 0 then
	if game.tick %60 == 0 then
		TimerRepairQuest()
		end	
	end



	
  if global.mission_master>0 and global.mission_master<=3 then

	if global.ticks %359 == 0 then
		if global.mission_master==3 and  global.mission_status == 52 then
		   game.forces.player.worker_robots_speed_modifier = -0.5 end
		VerificaRadar()
		end
		
 	if global.mission_creating_entity == 1 then
		if global.ticks %210 then
			CriaEntidadeMissao()
			end
		end

		
 	if global.mission_creating_entity==5 or global.mission_creating_entity==6 then
		if global.ticks %400 then
			CriaEntidadeMissao2(global.mission_creating_entity)
			end
		end

		
 	if global.mission_creating_entity >= 10 then
		if global.ticks %500 then  
			CriaLocalFoguete()
			end
		end		
	end
 
  
  if global.ticks<=0 then 
	VerificaStatusMissao()
	global.ticks = math.floor( global_timer * global.mission_advance * (math.random(80,130)/100))
	if global.ticks<700 then global.ticks=700 end
	end
	
  
--chunk  -- Chunk.from_position (position)
 
end



function BringNextWorm()
local radius = 10
local W= global.worms[1]
local worm = W.worm
local pos =W.position

local x = math.random(0-radius,radius)
local y = math.random(0-radius,radius)

local pX = pos.x+x
local pY = pos.y+y

if worm.valid then
	local name=worm.name
	pos = global.surface.find_non_colliding_position(name, {x=pX,y=pY}, radius, 1)
	if pos~=nil then
		global.surface.create_entity{name="msi-worm-surfacing", position=pos, game.forces.enemy}
		worm.teleport(pos)
		end
	end
table.remove(global.worms,1)
end


function BringNextUnit()
local radius = 10
local U= global.units_invasion[1]
local unit = U.unit
local pos =U.position


if unit.valid then
	local name=unit.name
	pos = global.surface.find_non_colliding_position(name, pos, radius, 1)
	if pos~=nil then
		--global.surface.create_entity{name="explosion", position=pos, game.forces.enemy}
		unit.teleport(pos)
		end
	end
table.remove(global.units_invasion,1)
end


function CallUnitAttack(surface,target)
local Min = 4
local Max = 30

local num = Max * game.forces.enemy.evolution_factor
if num < Min then num=Min end

local Units = surface.find_enemy_units(target, 9999)
for k, U in pairs(Units) do 
	if k>num then break end
	table.insert (global.units_invasion, {unit=U,position=target})
	end
end


function CallWormAttack(surface,target)
local Min = 2
local Max = 20

local numworms = Max * game.forces.enemy.evolution_factor
if numworms < Min then numworms=Min end

local Units = surface.find_enemy_units(target, 3000)
if #Units>0 then
	local force=Units[1].force
	local Worms = surface.find_entities_filtered({force=force, limit=numworms, type= "turret"})

	for k, W in pairs(Worms) do 
		if not string.find(W.name, "boss") then
		table.insert (global.worms, {worm=W,position=target}) end
		end
	end
end


function CallFrenzyAttack(target)

local Min = 20
local Max = 1000
local Dist = 1500

local aliens = Max * game.forces.enemy.evolution_factor
if aliens < Min then aliens=Min end

local sent = global.surface.set_multi_command({
			command = {type=defines.command.attack_area, destination=target, radius=50, distraction = defines.distraction.by_anything },
			unit_count = aliens,
			force = game.forces.enemy,
			unit_search_distance = Dist,
		})
end


function InvChange(event) 

local player = game.players[event.player_index]

 if global.itemrecovered==0 then
 if player.get_item_count("glados-core") >= 1  then
	global.itemrecovered=1
 	CallFrenzyAttack(player.position)
	end
	end
   
 if global.itemrecovered==1 then
 if player.get_item_count("gordon-freeman") >= 1  then
	global.itemrecovered=2
 	CallFrenzyAttack(player.position)
 	CallWormAttack(player.surface,player.position)
	end
	end

 if global.itemrecovered==2 then
 if player.get_item_count("hal9000") >= 1  then
	global.itemrecovered=3
 	CallFrenzyAttack(player.position)
    CallWormAttack(player.surface,player.position)
	end
	end
	
end


function Cria_Player(event) 
local player = game.players[event.player_index]

player.set_goal_description ({"msg-welcome"},false)

end


function on_console_command(event) 
local comando = event.command
if event.player_index ==nil then return end
player = game.players[event.player_index]
if player.admin then
	if comando == "clear_msi_2quest" then global.secondary_quests={} return end
	end
end

script.on_event(defines.events.on_player_created, Cria_Player)
script.on_event(defines.events.on_player_joined_game, Cria_GUI)
script.on_event(defines.events.on_tick, on_tick )
script.on_event(defines.events.on_sector_scanned, RadarScan)
script.on_event(defines.events.on_player_main_inventory_changed, InvChange)
script.on_event(defines.events.on_console_command, on_console_command )

---------------------------------------------------------------------------------------


function LimpaArvoresArea(coisa,dist)
for key, entity in pairs(coisa.surface.find_entities_filtered({area={{coisa.position.x - dist, coisa.position.y - dist}, {coisa.position.x + dist, coisa.position.y + dist}}, type= "tree"})) do
	entity.destroy()
	end
end

--------------------------------------------------------------------------------------



function inicia_globais()
	-- initialize or update general globals of the mod
	
	global.itemrecovered=0
	
	global.surface = game.surfaces.nauvis
	global.mission_master = 0
	global.mission_status = 0
	global.mission_text   = ""
	global.mission_advance = 0

	global.PanelMission = {"missions.mission_1_1"}
	global.MissionTXT   = {"missions.mission_1_1_txt"}
	global.text_last_user=""
	
    global.mission_creating_entity = 0
	global.ticks=global_timer * 2

	global.destrocosnave = {}
	global.launch_location = {}	

VersionChange()	

table.insert (global.delay_actions,{action="addinitialwreck", tick=2, tabAction=nil})

end

--------------------------------------------------------------------------------------

local function on_cargo_rocket_launched(event)
local struct = event.struct
--game.print('strut' .. struct.container.name)
--Log(struct)
end



-- control of mod Portals - not allowed in different surfaces
local function on_portal_built_event(event)

local player_index = event.player_index
local portal = event.portal
local portal_type 
if portal.name=='portal-a' then portal_type='b' else portal_type='a' end

if global.portals and global.portals[player_index] and global.portals[player_index][portal_type] then
	local surface = portal.surface
	local other_portal = global.portals[player_index][portal_type]
	if surface~=other_portal.surface then
		game.players[player_index].print({"cant-reach"})
		remote.call("portals", "destroy_portal", portal)
		end
	end
end



local function RegisterEvents()

if remote.interfaces["portals"] then 
	remote.call("portals", "disable_long_distance_placing", true)
	
  script.on_event(remote.call("portals", "get_on_player_placed_portal_event"), function(event)
    on_portal_built_event(event)
  end)	
	end

if remote.interfaces["space-exploration"] then 
   script.on_event(remote.call("space-exploration", "get_on_cargo_rocket_launched_event"), function (event)
	on_cargo_rocket_launched(event)
   end)
end
end


function On_Init_MAF() 
	-- called once, the first time the mod is loaded on a game (new or existing game)
	debug_print( "on_init" )
	RegisterEvents()
	inicia_globais()
end

function add_rocket_item(item)

if not global.silo_script then return end
local list = global.silo_script.tracked_items
if not list then return end
local add = true
  for k, name in pairs (list) do
	 if name==item then add=false end
	end
if add then
	table.insert(global.silo_script.tracked_items,item)
	end
end

function update_rocket_list()
for k=1,#global.MSI_cargo_list do
	add_rocket_item(global.MSI_cargo_list[k])
	end
end




local function on_configuration_changed(data)

RegisterEvents()

VersionChange()
	-- detect any mod or game version change
--	if data.mod_changes ~= nil then
--		local changes = data.mod_changes[debug_mod_name]
--		if changes ~= nil then
--			debug_print( "update mod: ", debug_mod_name, " ", tostring(changes.old_version), " to ", tostring(changes.new_version) )
--		end
--	end

local silo_interface = "silo_script"
if remote.interfaces[silo_interface] then 
for k=1,#global.MSI_cargo_list do
	remote.call(silo_interface, "add_tracked_item", global.MSI_cargo_list[k])
	end
end

remote.call("silo_script","set_no_victory", true)

end


local function On_Load()
RegisterEvents()
end


script.on_configuration_changed(on_configuration_changed)
script.on_init(On_Init_MAF)
script.on_load(On_Load)


function CreateItemList()

local items = {
	[1] = "repair-pack",
	[2] = "iron-plate",
	[3] = "copper-cable",
	[4] = "iron-gear-wheel",
	[5] = "copper-plate",
	[6] = "stone",
	[7] = "electronic-circuit",  -- "advanced-circuit"
	[8] = "stone-brick",
	[9] = "pipe"}

if game.forces["player"].technologies['steel-processing'].researched then
	items[#items+1]= "steel-plate" 
	end
if game.forces["player"].technologies['plastics'].researched then
   items[#items+1]="plastic-bar" end	
if game.forces["player"].technologies['concrete'].researched then
   items[#items+1]="concrete" end	

return items

end





function SecMission1()

for n=1,3 do

local entidades = global.surface.find_entities_filtered({area={{-50,-50}, {50,50}},name="big-ship-wreck-"..n}) 

if  #entidades>0 then

local broken_entity = entidades[1]

if broken_entity==nil then return end

local items = CreateItemList()

local repairs = {}
local Min = 20
local Max = 200	
local ratio = Min + math.floor( (Max-Min) * game.forces["enemy"].evolution_factor/2)
	
for a=1,2 do	
	local quant= math.random(ratio, ratio*2)
	local it = math.random(1, #items)
	if items[it]=="gordon-freeman" or items[it]=="glados-core" then quant=1 end
	table.insert(repairs, {index=a, name=items[it], count=quant} )
	table.remove(items, it)	
	end

local posicao = global.surface.find_non_colliding_position("iron-chest", broken_entity.position , 0, 1)

local repair_chest = global.surface.create_entity{
  name = "logistic-chest-requester", position = posicao, force= game.forces.neutral, 
  request_filters=repairs }
repair_chest.destructible = false
repair_chest.minable = false

local last_tick = game.tick + math.floor(25000 * (2-game.forces["enemy"].evolution_factor)) + math.random(1,10000)
local remaining_ticks = last_tick - game.tick
local stime = string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60) 
local texto = {"print-2-var",{"remaining_time"},stime}
local cor = {r = 1, g = 1, b = 1}
local new_label = global.surface.create_entity({name="timer-label", position = posicao, text=texto, color=cor})
new_label.active = false
CreateTempCamera(posicao,210,60)

local tag = game.forces["player"].add_chart_tag(global.surface,{icon={type="item",name="repair-pack"}, text="",position=repair_chest.position})

table.insert(global.repair_quests, {broken_entity = broken_entity,  repair_chest = repair_chest, label=new_label, repairs = repairs, tag=tag, last_tick=last_tick, effect="explode", n_mission="1" } )
if n==3 then -- remove energy from the 3rd wreck
   for k,ent in pairs(global.surface.find_entities_filtered({force= "player", name='msi-hidden-energy1', limit=1}) ) do 
      ent.destroy()	
	  end
   end
break
end
end

texto = {"missions.secmission_1_txt"}
ExibirMissaoTodos(texto)
--table.insert(global.secondary_quests,{num="1",tableQuest=nil})

end



function RemoveEntidadeComRandomLoot(entidade)

local loot = {
	[1] = "speed-module",
	[2] = "effectivity-module",
	[3] = "productivity-module",
	[4] = "solid-fuel",
	[5] = "advanced-circuit",
	[6] = "processing-unit",
	[7] = "construction-robot",
	[8] = "logistic-robot",
	[9] = "electric-engine-unit"}
local basico = {
	[1] = "copper-cable",
	[2] = "iron-plate",
	[3] = "steel-plate",
	[4] = "electronic-circuit"}
	
local science = {
	[1] = "chemical-science-pack",
	[2] = "utility-science-pack",
	[3] = "production-science-pack",
	[4] = "electric-mining-drill"}
	

local pos = entidade.position
CheckMissionItem(entidade)	
entidade.destroy()	

for x=1,#basico do
	global.surface.spill_item_stack(pos,{name=basico[x], count=math.random(20,100)}, false)
	global.surface.spill_item_stack(pos,{name=science[x], count=math.random(50,100)}, false)
	global.surface.spill_item_stack(pos,{name=loot[math.random(1,#loot)], count=math.random(5,15)}, false)
	end
global.surface.spill_item_stack(pos,{name='roboport', count=math.random(1,3)}, false)
	
end


function TimerEvents()

for k, Eve in pairs (global.timed_events) do
	local evento = Eve.evento
	local entidade= Eve.entidade
	local last_tick= Eve.last_tick
	local label= Eve.label
	local texto=""

	
	if evento=="destroy-cam-4allplayers" then
		if last_tick < game.tick then
		DestroyCamForAll(entidade)
		table.remove (global.timed_events, k)
		end
	break	
	end		
	
	
if evento=="check_msi_tech" then
	Check_MSI_Techs()
	table.remove (global.timed_events, k)
	break
	end
	
	
if not entidade.valid then	
	label.destroy()
	table.remove (global.timed_events, k)	
	if evento=="nave_militar" then
		RemoveSecQuest("6")
		end
	break
	end
	
	
	if last_tick > game.tick then
	
		local remaining_ticks = last_tick - game.tick
		if evento=="glados-wheatley" then texto = "GlaDOS: " 
		elseif evento=="wheatley-cubeplans" then texto = "Wheatley: " 
		elseif evento=="freeman-drill" then texto = "Freeman: " end
		
		local timetxt = string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60) 
		texto = texto .. timetxt
		label.text = texto
		
		
		if evento=="glados-wheatley" or evento=="freeing-ship-npc" or evento=="freeman-drill" then
		if timetxt == "01:30" or timetxt=="03:00" or timetxt=="05:00" or timetxt=="07:25" then
			CallFrenzyAttack(entidade.position)
			CallWormAttack(entidade.surface, entidade.position)		
			end
			end

			
		if evento=="wheatley-cubeplans" then
		if "03:10" == timetxt then
			global.surface.create_entity{name = "small-atomic-explosion", position = entidade.position}
			texto ={"missions.secmission_4_fail"}
			message_all(texto)
			end
			end
		else
		
		
		if evento=="nave_militar" then
			entidade.destructible = true
			texto = {"missions.secmission_6_fail"}
			ExibirMissaoTodos(texto)		
			global.surface.create_entity{name = "small-atomic-explosion", position = entidade.position}
			RemoveSecQuest("6")
			end
	
		if evento=="nave_maquinas" then
			entidade.destructible = true
			texto = {"missions.secmission_6_fail"}
			ExibirMissaoTodos(texto)	
			global.surface.create_entity{name = "small-atomic-explosion", position = entidade.position}
			end
		
		if evento=="freeing-ship-npc" then
			CheckMissionItem(entidade)
			entidade.clear_items_inside()
			if entidade.name=="big-ship-wreck-2" then 
				entidade.insert{name="gordon-freeman", count=1}
				else
				entidade.insert{name="hal9000", count=1}
				end
			RemoveElectric(entidade)
			CallFrenzyAttack(entidade.position)
			CallWormAttack(entidade.surface,entidade.position)
			end


			
			
		if evento=="glados-wheatley" then
			CheckMissionItem(entidade)
			entidade.clear_items_inside()
			entidade.insert{name="glados-core", count=1}
			entidade.insert{name="wheatley-core", count=1}
			texto = {"missions.secmission_3_success"}
			ExibirMissaoTodos(texto)
			
			game.forces["player"].technologies['glados-science-tech'].enabled=true	
			table.insert(global.MSI_Techs,'glados-science-tech')

			
			if game.item_prototypes["portal-gun"] then 
				game.forces["player"].technologies['portals'].enabled=true
				table.insert(global.MSI_Techs,'portals')
				end
			
			RemoveSecQuest("3")
			RemoveElectric(entidade)
			
			CallFrenzyAttack(entidade.position)
			CallWormAttack(entidade.surface,entidade.position)
			GrantXP(3)
			end			
			
			
		if evento=="freeman-drill" then
			CheckMissionItem(entidade)
			entidade.clear_items_inside()
			entidade.insert{name="gordon-freeman", count=1}
			entidade.insert{name="omega-drill", count=2}
			texto = {"missions.secmission_8_success"}
			ExibirMissaoTodos(texto)
			
			game.forces["player"].technologies['omega-drill'].enabled=true	
			table.insert(global.MSI_Techs,'omega-drill')
	
			RemoveSecQuest("8")
			RemoveElectric(entidade)
			
			CallFrenzyAttack(entidade.position)
			CallWormAttack(entidade.surface,entidade.position)
			GrantXP(3)
			end	
			
			
		if evento=="wheatley-cubeplans" then
			CheckMissionItem(entidade)
			entidade.clear_items_inside()
			entidade.insert{name="cube-plans", count=1}
			entidade.insert{name="wheatley-core", count=1}
			texto = {"missions.secmission_4_success"}
			ExibirMissaoTodos(texto)
			RemoveSecQuest("4")
			global.tick_secondary_mission = game.tick + math.floor(global_timer * 3 * (math.random(80,130)/100))
			table.insert (global.available_secondary_mission,"1") 
			GrantXP(3)
			end			


			
		label.destroy()
		table.remove (global.timed_events, k)
		end
	end
end



function TimerRepairQuest()

for k, Quest in pairs (global.repair_quests) do
	local entidade =  Quest.broken_entity
	local chest = Quest.repair_chest
	local label = Quest.label
	local tag = Quest.tag
	local repairs = Quest.repairs
	local last_tick = Quest.last_tick
	local effect= Quest.effect
	local n_mission= Quest.n_mission
	local remove_quest = false
	local again = false
	
	if entidade.valid then
	local name_ent = entidade.name
	if last_tick > game.tick then
		local remaining_ticks = last_tick - game.tick
		local stime = string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60) 
		local texto = {"print-2-var",{"remaining_time"},stime}
		label.text = texto
		
		--check if it is fixed by materials
		local fixed = true
		for i, items in pairs (repairs) do
			local item=items.name
			local quant=items.count
			
			if chest.get_item_count(item) < quant then
				fixed = false
				break
				end
			end

			if fixed then 
				GrantXP(2)
				remove_quest=true 
				local texto = {"missions.secmission_"..n_mission.."_success"}
				ExibirMissaoTodos(texto)
								
				if name_ent=="big-ship-wreck-1" then again = true  end
				if name_ent=="big-ship-wreck-1" or name_ent=="big-ship-wreck-2" or name_ent=="big-ship-wreck-3" then
				RemoveEntidadeComRandomLoot(entidade) end
				end
		
		else -- bad consequences
		if effect=="explode" then
			if name_ent=="big-ship-wreck-1" then again = true  end
			local texto = {"missions.secmission_"..n_mission.."_fail"}
			ExibirMissaoTodos(texto)
			remove_quest=true
			entidade.destructible = true
			global.surface.create_entity{name = "small-atomic-explosion", position = entidade.position}
			end
		end
	else remove_quest=true end
	
	if remove_quest then
		for m, SecMission in pairs(global.secondary_quests) do
			if SecMission.num=="1" or SecMission.num=="2" then 
			if SecMission.tableQuest == Quest then 
				table.remove (global.secondary_quests,m)
				end
			end
		end


		MinableVizinhos(10,chest.position,true)
		CheckMissionItem(chest)
		chest.destroy()
		label.destroy()
		tag.destroy()
		table.remove (global.repair_quests, k)
		if again then
			global.tick_secondary_mission = game.tick + math.floor(global_timer * 5 * (math.random(80,130)/100))
			table.insert (global.available_secondary_mission,"1") 
			end
	end
	
	end

end


function MinableVizinhos(area,pos,minab)

local p1={x= pos.x - area, y= pos.y - area}
local p2={x= pos.x + area, y= pos.y + area}

-- buldings aroung - minable or not if destructible
for k, entity in pairs(global.surface.find_entities_filtered({area={p1, p2}, force= "player"})) do
	if entity.destructible then
		entity.minable = minab
		end
	end

end


function CreateRandomRepairEvent()

local risktype = ""
local riskname = ""
local m=4

if game.forces["player"].technologies['electric-energy-accumulators'].researched then m=5 end
if game.forces["player"].technologies['nuclear-power'].researched then m=8 end

local entidades={}

for t=1,10 do

local i = math.random(1,m)

   if i==1 then risktype = "storage-tank"
   elseif i==2 then riskname = "oil-refinery"
   elseif i==3 then riskname = "chemical-plant"
   elseif i==4 then risktype = "generator"
   
   elseif i==5 then risktype = "accumulator"
   
   elseif i==6 then risktype = "reactor"
   elseif i==7 then riskname = "centrifuge"
   elseif i==8 then riskname = "electric-furnace"

 end	
	--"rocket-silo" ??
	

if risktype~="" then 
	entidades = global.surface.find_entities_filtered({force= "player", type=risktype}) 
	else 
	entidades = global.surface.find_entities_filtered({force= "player", name=riskname}) 
	end

if #entidades>0 then break end	
end	 -- for t

if #entidades<1 then return end
broken_entity=entidades[math.random(1,#entidades)]	


sound_all('msi_sound_alert1')

-- just some electrict_problem
if riskname=="electric-furnace" or risktype == "accumulator" or risktype == "generator" then
	table.insert (global.shock_entities,{ entity = broken_entity, anima=nil} )
	local texto = {"electrict_problem"}
	message_all(texto)
	-- 50% de ter q reparar ou nao
	if math.random(1,2)==1 then return end  
	end

	
local items = CreateItemList()

local repairs = {}
local Min = 30
local Max = 200	
local ratio = Min + math.floor( (Max-Min) * game.forces["enemy"].evolution_factor/2)
	
for a=1,3 do	
	local quant= math.random(ratio, ratio*2)
	local it = math.random(1, #items)
	if items[it]=="gordon-freeman" or items[it]=="glados-core" then quant=1 end
	--message_all("item:".. items[it] .. " i:" .. a .. " c:" ..quant  )	
	table.insert(repairs, {index=a, name=items[it], count=quant} )
	table.remove(items, it)	
	end

broken_entity.minable = false	
local posicao = global.surface.find_non_colliding_position("iron-chest", broken_entity.position, 0, 1)

local repair_chest = global.surface.create_entity{
  name = "logistic-chest-requester", position = posicao, force= game.forces.neutral, 
  request_filters=repairs }
repair_chest.destructible = false
repair_chest.minable = false

local last_tick = game.tick + math.floor(25000 * (2-game.forces["enemy"].evolution_factor)) + math.random(1,10000)
if game.forces["player"].technologies['explosion_repair_time'].researched then last_tick =last_tick + global_timer end
local remaining_ticks = last_tick - game.tick

local stime = string.format("%02d:%02d", math.floor(remaining_ticks / 3600) % 60, math.floor(remaining_ticks / 60) % 60) 
local texto = {"print-2-var",{"remaining_time"},stime}
local cor = {r = 1, g = 1, b = 1}
local new_label = global.surface.create_entity({name="timer-label", position = posicao, text=texto, color=cor})
new_label.active = false

CreateTempCamera(posicao,210,60)

if riskname~="electric-furnace" and risktype ~= "accumulator" and risktype ~= "generator" then
	MinableVizinhos(10,{x=repair_chest.position.x,y=repair_chest.position.y}, false)
	end


local tag = game.forces["player"].add_chart_tag(global.surface,{icon={type="item",name="repair-pack"}, text="",position=repair_chest.position})

local tableQuest = {broken_entity = broken_entity,  repair_chest = repair_chest, label=new_label, repairs = repairs, tag=tag, last_tick=last_tick, effect="explode", n_mission="2"}
table.insert(global.repair_quests, tableQuest )
table.insert(global.secondary_quests,{num="2",tableQuest=tableQuest,camera=broken_entity.position})

texto = {"missions.secmission_2_txt"}

ExibirMissaoTodos(texto)

end




local function on_gui_click(event)

--	message_all(global.debug)
local player = game.players[event.element.player_index]
local name = event.element.name

    if (name == "btmissao") then
        expand_tag_gui(player)
    end

    if (name == "btavisos") or (name == "btCancel") then
        expand_tag_gui_avisos(player)
 		end
	
    if (name == "btOK")   then
        AvisoBtOK(player)
    elseif (name == "btPM")   then
        ExibirMissaoP(player)
	end
	
                                         
	if string.sub(name,1,10)=="secmission" then
		local s, e = string.find(name, "-")
		local mn = string.sub(name,12,s-1)
		local qi =tonumber( string.sub(name,s+1,s+4))
		player.set_goal_description ({"missions.secmission_"..mn.."_txt"},false)
		if #global.secondary_quests>=qi then
		if global.secondary_quests[qi].num==mn then
		if global.secondary_quests[qi].camera then	
			CreateTempCameraForPlayer(player,global.secondary_quests[qi].camera,210,50)
			expand_tag_gui(player)
			end end end
		end
		
	if string.sub(name,1,18)=="msi_bt_cameraclose" then
		CameraClose(player,string.sub(name,19,string.len(name)))
		end

--	 if (name == "cbShowCam") then
--		global.msi_personal_minicam[player.name]=event.element.state
	    --end

end
script.on_event(defines.events.on_gui_click, on_gui_click)





function CheckEntityInv(ent)

for k=1,#MSI_Itens do
   if ent.get_item_count(MSI_Itens[k]) >= 1  then
    message_all({"missions.mission_item_drop", {"item-name."..MSI_Itens[k]} })
    ent.remove_item({name=MSI_Itens[k]})
	ent.surface.spill_item_stack(ent.position, MSI_Itens[k], true)
	end
end

end


function CheckMissionItem(ent)

CheckEntityInv(ent)

-- verifica se é uma assembling machine 
if ent.type=='assembling-machine' then 
	if ent.is_crafting() then
		local recipe = ent.get_recipe()
		local ingredients = recipe.ingredients 
		
		for k=1,#MSI_Itens do
			for r=1,#ingredients do
				if ingredients[r].name == MSI_Itens[k] then
					ent.surface.spill_item_stack(ent.position, MSI_Itens[k], true)
					message_all({"missions.mission_item_drop", {"item-name."..MSI_Itens[k]} })
					end
			end
			end
		end
	end
	
end





function RestauraVelocidadeRobo()
if game.forces["player"].technologies['worker-robots-speed-5'].researched then game.forces.player.worker_robots_speed_modifier = 2.4
elseif game.forces["player"].technologies['worker-robots-speed-4'].researched then game.forces.player.worker_robots_speed_modifier = 1.75
elseif game.forces["player"].technologies['worker-robots-speed-3'].researched then game.forces.player.worker_robots_speed_modifier = 1.2
elseif game.forces["player"].technologies['worker-robots-speed-2'].researched then game.forces.player.worker_robots_speed_modifier = 0.75
elseif game.forces["player"].technologies['worker-robots-speed-1'].researched then game.forces.player.worker_robots_speed_modifier = 0.35
end
end


script.on_event(defines.events.on_entity_died, function(event)

CheckMissionItem(event.entity)

-- explosao nuclear
if event.entity.name=="nuclear-reactor" then
	global.surface.create_entity{name = "atomic-explosion", position = event.entity.position}
	message_all({"reactor_explode"})
	sound_all('msi_sound_alert2')
	end

if event.entity.name=="msi-glados-construction-robot" then
    message_all({"missions.mission_item_drop", {"item-name.glados-core"} })
	event.entity.surface.spill_item_stack(event.entity.position, "glados-core", true)
	end
	
if event.entity.name=="msi-night-boss-spawner" then	
		global.PanelMission = {"missions.mission_3_0_4"}
		global.MissionTXT   = {"missions.mission_3_0_4_txt"}
		ExibirMissaoTodos() -- Final da quest Boss - Fumaca
		global.mission_advance = 5  
		global.mission_status =60	
		global.surface.always_day = false
		RestauraVelocidadeRobo()
		for k, B in pairs(global.bosses) do
			local Boss = B.ent
			local Name = B.name
			if Name=="msi-night-boss-spawner" then
				B.tableBoss[1].destroy()
				table.remove(global.bosses,k)
				break
				end
			end	
		GrantXP(15)	
		end

		
if event.entity.name=="msi-worm-boss-fire-shooter" then	
		local texto = {"missions.secmission_10V_txt"}
		ExibirMissaoTodos(texto)  -- end quest Fire Worm Boss 
		RemoveSecQuest("10")
		GrantXP(15)	
			for k, B in pairs(global.bosses) do
			local Boss = B.ent
			local Name = B.name
			if Name=="msi-worm-boss-fire-shooter" then
				table.remove(global.bosses,k)
				break
				end
			end	
		end
		
end)

script.on_event(defines.events.on_pre_player_died, function(event)

local player = game.players[event.player_index]
CheckEntityInv(player)

end)

script.on_event(defines.events.on_player_dropped_item, function(event)
local player = game.players[event.player_index]
local item = event.entity.stack.name
   if item=="glados-core" or  item=="gordon-freeman" or item=="hal9000" then
   message_all({"missions.mission_item_drop", {"item-name."..item} })
   end
   
   
end)


---------------------------------------------------------------------------------------
--
--
--	* ROCKET *
--
--
---------------------------------------------------------------------------------------


function On_Built(event)

local ent = event.created_entity
local surface = ent.surface
local force = ent.force
local tipo = ent.type
local name=ent.name 

if tipo=='entity-ghost' then name=ent.ghost_name end
	
	if (name == "rocket-silo" or name == "rsc-silo-stage1") and surface==global.surface then
	
	X = ent.position.x
	Y = ent.position.y
	
	local posvalid = false	
	for k, LocalFoguete in pairs(global.launch_location) do
		posicao=LocalFoguete.position
		fY=posicao.y
		fX=posicao.x
		if X>=fX-20 and X<=fX+20 and Y>=fY-20 and Y<=fY+20 then posvalid = true end
		end	

	local item=event.stack.name
	local player_index=event.player_index
	if not posvalid then  -- 
		if tipo ~= 'entity-ghost' then 
			if player_index and game.players[player_index].valid and game.players[player_index].character and game.players[player_index].character.valid then
				game.players[player_index].insert{name=item, count=1}
				else
				global.surface.spill_item_stack(Position.construct (X+1,Y+1), {name=item, count=1}, false)
				end
			end
		ent.destroy()
		message_all({"missions.warning-silo-work-place"})
		else

		if global.mission_master<10 then 
			global.PanelMission = {"missions.mission_3_6"}
			global.MissionTXT   = {"missions.mission_3_6_txt"}
			ExibirMissaoTodos()
			global.mission_master = 10
			global.mission_status = 0
			global.mission_advance= 1
			global.ticks = math.floor( global_timer * global.mission_advance * (math.random(80,130)/100))

			end
		end
	end

end		
		
		
local build_events = {defines.events.on_built_entity, defines.events.on_robot_built_entity}
script.on_event(build_events, On_Built)



function VerificaMissaoCumprida()

local Conteudo
local Quant
local Nome
local Enviados
local termina=true
	
	for k, Carga in pairs(global.mission_cargo_request) do
		Conteudo = Carga.item
		Quant    = Carga.quant
		Nome	 = Carga.nome
		Enviados = Carga.enviados
		if Enviados<Quant then 
			termina=false
			break
			end
		end  

if termina then
	global.mission_master = 100
	global.PanelMission = {"missions.mission_final"}
	global.MissionTXT   = {"missions.mission_final_txt"}
	ExibirMissaoTodos()
	game.set_game_state{game_finished = true, player_won = true, can_continue = true}
	else
	global.MissionTXT   = {"missions.mission_final_part"}
	ExibirMissaoTodos()
	end

end


script.on_event(defines.events.on_rocket_launched, function(event)

  local rocket = event.rocket

  
  if rocket.get_item_count("satellite") > 0  then
--	game.set_game_state{game_finished=false}
	 if global.mission_master == 10 and global.mission_status == 1 then
		global.mission_status = 2
		global.mission_advance= 0.6
		global.ticks = global_timer * global.mission_advance
		return
		end
	end

  if rocket.get_item_count("hal9000") > 0 and 
  	 global.mission_master == 10 and global.mission_status == 5 then
		global.mission_status = 6
		global.mission_advance= 0.6
		global.ticks = global_timer * global.mission_advance
		return
		end

local verificar_final=false	
local Conteudo
local Quant
local Nome
local Enviados

	
  if global.mission_master == 10 and global.mission_status == 10 then
 	for k, Carga in pairs(global.mission_cargo_request) do
		Conteudo = Carga.item
		Quant    = Carga.quant
		Nome	 = Carga.nome
		Enviados = Carga.enviados
		if rocket.get_item_count(Conteudo)>0 then
			env = rocket.get_item_count(Conteudo)
			Enviados = Enviados + env
			table.insert(global.mission_cargo_request, { item =Conteudo, quant=Quant, nome=Nome, enviados=Enviados} )
			table.remove(global.mission_cargo_request, k)	
			verificar_final=true
			break
			end
		end  

	if verificar_final then VerificaMissaoCumprida() end
	end


--  game.set_game_state{game_finished = true, player_won = true, can_continue = true}

--   game.print({"no-satellite"})

end)



script.on_event(defines.events.on_research_finished, function(event)


-- unlocks secondary missions 
if event.research.name == "engine" then 
	global.tick_secondary_mission = game.tick + math.floor(global_timer * (math.random(80,130)/100))
	table.insert (global.available_secondary_mission,"1") 
   end
   
if event.research.name == "explosion_risk_reduce1" then 
	global.explosion_risk = math.floor(global.explosion_risk/2)
	texto = {"missions.secmission_risk_reduce1"}
	ExibirMissaoTodos(texto)
	end     
	
if event.research.name == "portals_risk_reduce" then 
	global.PortalRisk_Invasion = math.floor(global.PortalRisk_Invasion/2)
	texto = {"missions.secmission_portal_risk_reduce1"}
	ExibirMissaoTodos(texto)
	end     

if event.research.name == "portals_risk_reduce2" then 
	global.PortalRisk_Invasion = 0
	texto = {"missions.secmission_portal_risk_reduce2"}
	ExibirMissaoTodos(texto)
	end     
	
if event.research.name == "explosion_risk_reduce2" then 
	global.explosion_risk = 0
	texto = {"missions.secmission_risk_reduce2"}
	ExibirMissaoTodos(texto)
	end     

-- primary missions 	
if event.research.name == "robotics" then 
	global.PanelMission = {"missions.mission_1_5"}
	global.MissionTXT   = {"missions.mission_1_5_txt"}
	ExibirMissaoTodos()
	global.mission_advance = 11 
	global.mission_status =0	
	global.mission_master =2

	--secondary - portal
	global.tick_secondary_mission = game.tick + math.floor(global_timer * 2 * (math.random(80,130)/100))
	table.insert (global.available_secondary_mission,"3") 
	global.ticks = math.floor(global_timer * global.mission_advance * (math.random(80,130)/100))
	GrantXP(10)
	end


if event.research.name == "glados-science-tech" then 
	global.tick_secondary_mission = game.tick + math.floor(global_timer * 2 * (math.random(80,130)/100))
	table.insert (global.available_secondary_mission,"4") 
   end   

	--secondary - worm boss
if event.research.name == "productivity-module-3" or event.research.name == "speed-module-3" then 
	if game.forces["player"].technologies['productivity-module-3'].researched and
		game.forces["player"].technologies['speed-module-3'].researched and 
		settings.global["msi_worm_boss"].value then
			global.tick_secondary_mission = game.tick + math.floor(global_timer * 3 * (math.random(80,130)/100))
			table.insert (global.available_secondary_mission,"10") 
		end
	end
	
	
if event.research.name == "nuclear-power" then 
	global.PanelMission = {"missions.mission_2_6"}
	global.MissionTXT   = {"missions.mission_2_6_txt"}
	ExibirMissaoTodos()
	global.mission_advance = 16 -- em dias de jogo - proxima main quest é o SMOKE BOSS
	global.mission_status =0	
	global.mission_master =3	
	global.ticks = math.floor(global_timer * global.mission_advance * (math.random(80,130)/100))
	GrantXP(10)

	global.tick_secondary_mission = game.tick + math.floor(global_timer * 4 * (math.random(80,130)/100))
	--secondary - omega drill 
	if game.item_prototypes["omega-drill"] then 
		table.insert (global.available_secondary_mission,"8") 
		end

	--secondary - double blue chip
	table.insert (global.available_secondary_mission,"9") 
		
	global.ticks = math.floor(global_timer * global.mission_advance * (math.random(80,130)/100))
	end

if event.research.name == "msi-smoke-tech" then 
	global.PanelMission = {"missions.mission_3_0_2"}
	global.MissionTXT   = {"missions.mission_3_0_2_txt"}
	ExibirMissaoTodos()
	game.forces["player"].technologies['msi-smoke-scan'].enabled=true
	table.insert(global.MSI_Techs,'msi-smoke-scan')
	global.mission_advance = 3 -- dias para escuridao
	global.mission_status =51	
	global.ticks = math.floor(global_timer * global.mission_advance * (math.random(80,130)/100))
	end

if event.research.name == "msi-smoke-scan" then 
	global.mission_creating_entity = 5 -- Cria Boss Darkness
	global.wait_chunk = nil
	CriaEntidadeMissao2(5)
	end

	
if event.research.name == "msi_tech_double_processing_unit" then 
	global.mission_creating_entity = 6 -- Local para Produzir Chip azul
	global.wait_chunk = nil
	CriaEntidadeMissao2(6)
	RemoveSecQuest("9")
	end

	
if event.research.name == "rocket-silo" then 
	global.PanelMission = {"missions.mission_3_4"}
	global.MissionTXT   = {"missions.mission_3_4_txt"}
	ExibirMissaoTodos()
	global.mission_advance =1 -- em dias de jogo
	global.mission_status  =5	
	global.ticks = math.floor(global_timer * global.mission_advance * (math.random(80,130)/100))
	GrantXP(10)
	end


	if event.research.name == "msi_double_advanced_circuit" then 
	game.forces.player.set_hand_crafting_disabled_for_recipe('msi_double_advanced_circuit',false)
	end	
	
end)

script.on_event("key-O", function(event) expand_tag_gui(game.players[event.player_index]) end)
script.on_event("key-Y", function(event) expand_tag_gui_avisos(game.players[event.player_index]) end)


--------------------------------------------------------------------------------------------------------

local interface = {}

function interface.addquest(quest_n)
-- accepts missions "1","2","3","4","8","9"
global.tick_secondary_mission = game.tick + 100
table.insert(global.available_secondary_mission,quest_n)

end

function interface.explosion_risk(perc)
global.explosion_risk=perc
message_all("Risk of explosion changed to %" ..perc)
end

function interface.portal_risk(perc)
global.PortalRisk_Invasion=perc
message_all("Risk of Portal invasion changed to %" ..perc)
end

-- '
remote.add_interface( "msi", interface )
