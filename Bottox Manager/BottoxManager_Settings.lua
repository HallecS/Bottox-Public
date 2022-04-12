BottoxSettings = {}

local Variable = {
	VarToSave = {
		-- General
		{ value = nil, Get = function() return BVariable.Get_AutoOpen() end, Set = function(_param) return BVariable.Set_AutoOpen(_param) end},
		{ value = nil, Get = function() return BVariable.Get_DevMode() end, Set = function(_param) return BVariable.Set_DevMode(_param) end },
		{ value = nil, Get = function() return BVariable.Get_NoSettings() end, Set = function(_param) return BVariable.Set_NoSettings(_param) end },
		--
		{ value = nil, Get = function() return BVariable.Get_MountIndex() end, Set = function(_param) return BVariable.Set_MountIndex(_param) end },
		{ value = nil, Get = function() return BVariable.Get_IdleIndex() end, Set = function(_param) return BVariable.Set_IdleIndex(_param) end },
		{ value = nil, Get = function() return BVariable.Get_FoodIndex() end, Set = function(_param) return BVariable.Set_FoodIndex(_param) end },
		{ value = nil, Get = function() return BVariable.Get_Language() end, Set = function(_param) return BVariable.Set_Language(_param) end },
		--
		{ value = nil, Get = function() return BVariable.Get_UseGysahl() end, Set = function(_param) return BVariable.Set_UseGysahl(_param) end },
		{ value = nil, Get = function() return BVariable.Get_ReleaseFish() end, Set = function(_param) return BVariable.Set_ReleaseFish(_param) end },
		{ value = nil, Get = function() return BVariable.Get_AutoReduce() end, Set = function(_param) return BVariable.Set_AutoReduce(_param) end },
		--
		{ value = nil, Get = function() return BVariable.Get_UseCordial() end, Set = function(_param) return BVariable.Set_UseCordial(_param) end },
		{ value = nil, Get = function() return BVariable.Get_CordialIndex() end, Set = function(_param) return BVariable.Set_CordialIndex(_param) end },
		{ value = nil, Get = function() return BVariable.Get_NoExceed() end, Set = function(_param) return BVariable.Set_NoExceed(_param) end },
		{ value = nil, Get = function() return BVariable.Get_FirstHQ() end, Set = function(_param) return BVariable.Set_FirstHQ(_param) end },
		-- Gear Set
		{ value = nil, Get = function() return BVariable.Get_GearSet("Carpenter") end, Set = function(_param) return BVariable.Set_GearSet("Carpenter", _param) end},
		{ value = nil, Get = function() return BVariable.Get_GearSet("Blacksmith") end, Set = function(_param) return BVariable.Set_GearSet("Blacksmith", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Armorer") end, Set = function(_param) return BVariable.Set_GearSet("Armorer", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Goldsmith") end, Set = function(_param) return BVariable.Set_GearSet("Goldsmith", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Leatherworker") end, Set = function(_param) return BVariable.Set_GearSet("Leatherworker", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Weaver") end, Set = function(_param) return BVariable.Set_GearSet("Weaver", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Alchemist") end, Set = function(_param) return BVariable.Set_GearSet("Alchemist", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Culinarian") end, Set = function(_param) return BVariable.Set_GearSet("Culinarian", _param) end },
		--
		{ value = nil, Get = function() return BVariable.Get_GearSet("Miner") end, Set = function(_param) return BVariable.Set_GearSet("Miner", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Botanist") end, Set = function(_param) return BVariable.Set_GearSet("Botanist", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Fisher") end, Set = function(_param) return BVariable.Set_GearSet("Fisher", _param) end },
		--
		{ value = nil, Get = function() return BVariable.Get_GearSet("Paladin") end, Set = function(_param) return BVariable.Set_GearSet("Paladin", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Warrior") end, Set = function(_param) return BVariable.Set_GearSet("Warrior", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Dark Knight") end, Set = function(_param) return BVariable.Set_GearSet("Dark Knight", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("White Mage") end, Set = function(_param) return BVariable.Set_GearSet("White Mage", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Scholar") end, Set = function(_param) return BVariable.Set_GearSet("Scholar", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Astrologian") end, Set = function(_param) return BVariable.Set_GearSet("Astrologian", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Monk") end, Set = function(_param) return BVariable.Set_GearSet("Monk", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Dragoon") end, Set = function(_param) return BVariable.Set_GearSet("Dragoon", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Ninja") end, Set = function(_param) return BVariable.Set_GearSet("Ninja", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Samurai") end, Set = function(_param) return BVariable.Set_GearSet("Samurai", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Bard") end, Set = function(_param) return BVariable.Set_GearSet("Bard", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Machinist") end, Set = function(_param) return BVariable.Set_GearSet("Machinist", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Black Mage") end, Set = function(_param) return BVariable.Set_GearSet("Black Mage", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Summoner") end, Set = function(_param) return BVariable.Set_GearSet("Summoner", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Red Mage") end, Set = function(_param) return BVariable.Set_GearSet("Red Mage", _param) end },
		-- Toggle
		{ value = nil, Get = function() return BVariable.Get_Toggle_Used(1) end, Set = function(_param) return BVariable.Set_Toggle_Used(1, _param) end },
		{ value = nil, Get = function() return BVariable.Get_Toggle_Size(1) end, Set = function(_param) return BVariable.Set_Toggle_Size(1, _param) end },
		--
		{ value = nil, Get = function() return BVariable.Get_Toggle_Used(2) end, Set = function(_param) return BVariable.Set_Toggle_Used(2, _param) end },
		{ value = nil, Get = function() return BVariable.Get_Toggle_Size(2) end, Set = function(_param) return BVariable.Set_Toggle_Size(2, _param) end },
		-- Menu Windows
		{ value = nil, Get = function() return BottoxManager.Get_Second_Direction() end, Set = function(_param) return BottoxManager.Set_Second_Direction(_param) end },
		{ value = nil, Get = function() return BottoxManager.Get_Settings_Direction() end, Set = function(_param) return BottoxManager.Set_Settings_Direction(_param) end },
		-- New Settings
		{ value = nil, Get = function() return BVariable.Get_GearSet("Blue Mage") end, Set = function(_param) return BVariable.Set_GearSet("Blue Mage", _param) end },
		-- RevoltEngine
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("Size") end, Set = function(_param) return RevoltEngine.Set_Settings("Size", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("JobIndex") end, Set = function(_param) return RevoltEngine.Set_Settings("JobIndex", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("Loot") end, Set = function(_param) return RevoltEngine.Set_Settings("Loot", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("DataIndex") end, Set = function(_param) return RevoltEngine.Set_Settings("DataIndex", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("Rendering") end, Set = function(_param) return RevoltEngine.Set_Settings("Rendering", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("UseReadyCheck") end, Set = function(_param) return RevoltEngine.Set_Settings("UseReadyCheck", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("UseWelcomeString") end, Set = function(_param) return RevoltEngine.Set_Settings("UseWelcomeString", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("WelcomeString") end, Set = function(_param) return RevoltEngine.Set_Settings("WelcomeString", _param) end, String = true},
		-- Toggle Navigator
		{ value = nil, Get = function() return BVariable.Get_Toggle_Used(3) end, Set = function(_param) return BVariable.Set_Toggle_Used(3, _param) end },
		{ value = nil, Get = function() return BVariable.Get_Toggle_Size(3) end, Set = function(_param) return BVariable.Set_Toggle_Size(3, _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Gunbreaker") end, Set = function(_param) return BVariable.Set_GearSet("Gunbreaker", _param) end },
		{ value = nil, Get = function() return BVariable.Get_GearSet("Dancer") end, Set = function(_param) return BVariable.Set_GearSet("Dancer", _param) end },
--		{ value = nil, Get = function() return BVariable.Get_UseFood("FishingPoolHub") end, Set = function(_param) return BVariable.Set_UseFood(FishingPoolHub, "FishingPoolHub") end, String = true},
--		{ value = nil, Get = function() return BVariable.Get_UseFood("RevoltEngine") end, Set = function(_param) return BVariable.Set_UseFood(RevoltEngine, "RevoltEngine") end, String = true},
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("UseLimitBreak") end, Set = function(_param) return RevoltEngine.Set_Settings("UseLimitBreak", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("IgnoreChest") end, Set = function(_param) return RevoltEngine.Set_Settings("IgnoreChest", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("TakeLastChest") end, Set = function(_param) return RevoltEngine.Set_Settings("TakeLastChest", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("UseAutoEquip") end, Set = function(_param) return RevoltEngine.Set_Settings("UseAutoEquip", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("UseTrade") end, Set = function(_param) return RevoltEngine.Set_Settings("UseTrade", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("AutoLevel") end, Set = function(_param) return RevoltEngine.Set_Settings("AutoLevel", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("AutoSymb") end, Set = function(_param) return RevoltEngine.Set_Settings("AutoSymb", _param) end },
		{ value = nil, Get = function() return BVariable.Get_Toggle_Used(4) end, Set = function(_param) return BVariable.Set_Toggle_Used(4, _param) end },
		{ value = nil, Get = function() return BVariable.Get_Toggle_Size(4) end, Set = function(_param) return BVariable.Set_Toggle_Size(4, _param) end },
		{ value = nil, Get = function() return BVariable.Get_LockWindows() end, Set = function(_param) return BVariable.Set_LockWindows(_param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("UseAutoRepair") end, Set = function(_param) return RevoltEngine.Set_Settings("UseAutoRepair", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("RepairMode") end, Set = function(_param) return RevoltEngine.Set_Settings("RepairMode", _param) end },
		{ value = nil, Get = function() return RevoltEngine.Get_Settings("Repair") end, Set = function(_param) return RevoltEngine.Set_Settings("Repair", _param) end },
	},
}

function BottoxSettings.Get_VarToSave()
	return Variable.VarToSave
end

function BottoxSettings.UpdateVarToSave()
	for id, e in pairs(Variable.VarToSave) do
		e.value = e.Get()
	end
end

function BottoxSettings.CheckNeedSave()
	-- Check all Var who can be saved
	for id, e in pairs(Variable.VarToSave) do
		-- Check Value -> GetValue()
		if e.value ~= e.Get() then
			-- Need Save
			BottoxSettings.UpdateVarToSave()
			BSettings.SaveSettings()
			return
		end
	end
	return
end

------------------------------ Toggle ----------------------------------------
function BottoxSettings.NavigatorSwitchOpen()
	if BottoxManager.GetCurrentAddon() ~= Navigator then
		-- Open it
		BottoxManager.SetCurrentAddon(Navigator)
		BottoxManager.ForceOpen()
	else
		-- Close it
		BottoxManager.SetCurrentAddon(nil)
		BottoxManager.SwitchOpen()
	end
end

function BottoxSettings.RunHandOver()
	local ToggleList = BVariable.Get_ToggleList()
	for id, e in pairs(ToggleList) do
		if e.Name == "Hand Over" then
			if e.Actived then
				Exorcism.HandOver()
			end
		end
	end
end

function BottoxSettings.HandOverSwitchOpen()
	local ToggleList = BVariable.Get_ToggleList()
	for id, e in pairs(ToggleList) do
		if e.Name == "Hand Over" then
			e.Actived = not e.Actived
		end
	end
end

function BottoxSettings.MinionSwitchOpen()
	ffxivminion.GUI.main.open = not ffxivminion.GUI.main.open
end

function BottoxSettings.Draw_AllToogle()
	local ToggleList = BVariable.Get_ToggleList()
	for id, e in pairs(ToggleList) do
		if e.Used then
			if e.Open then
				------------------------------ Init Windows ----------------------------------------
				GUI:SetNextWindowPosCenter(GUI.SetCond_FirstUseEver)
				if e.BottoxStyle then
					if e.Actived then
						BStyle.WindowStyle(true)
					else
						BStyle.WindowStyle(false)
					end
				end
				GUI:PushStyleVar(GUI.StyleVar_WindowPadding, 0, 0)
				GUI:PushStyleVar(GUI.StyleVar_WindowBorderSize, 1)
				GUI:PushStyleVar(GUI.StyleVar_WindowRounding, 0)
				e.Visible, e.Open = GUI:Begin("##"..e.Id, e.Open, e.Option)
				if (e.Visible) then
					------------------------------ Style ----------------------------------------	
					if GUI:ImageButton("##"..e.Id, e.Icone, e.Size, e.Size) then
						e.Function()
					end
					if GUI:IsWindowHovered() then
						if GUI:IsMouseClicked(1) then
							e.InMove = true
						end
						if GUI:IsMouseReleased(1) then
							e.InMove = false
						end
					end
					if e.InMove == true then
						local xpos, ypos = GUI:GetMousePos()
						GUI:SetWindowPos(xpos - e.Size / 2, ypos - e.Size / 2)
					end
				---------------------------------------------------------------------------------
				end
				GUI:PopStyleVar(3)
				if e.BottoxStyle then
					GUI:PopStyleColor(BStyle.GetActiveWindowsStyle())
				end
				GUI:End()
			end
			if e.Name == "Hand Over" then
				BottoxSettings.RunHandOver()
			end
		end
	end
	BVariable.Set_ToggleList(ToggleList)
end
RegisterEventHandler("Gameloop.Draw", BottoxSettings.Draw_AllToogle)

function BottoxSettings.Draw_Toogle()
	local ToggleList = BVariable.Get_ToggleList()
	for id, e in pairs(ToggleList) do
		-- Use Bottox Toggle
		e.Used = GUI:Checkbox("##"..e.Id,e.Used)
		GUI:SameLine(); GUI:Image(e.Icone, 20, 20)
		GUI:SameLine(60); GUI:Text(e.Name)
		-- Bottox Size
		GUI:SameLine(140); GUI:PushItemWidth(130); e.Size = GUI:SliderInt("##Size_"..e.Id, e.Size, 26, 50); GUI:PopItemWidth()
	end
	BVariable.Set_ToggleList(ToggleList)
end

function BottoxSettings.Draw_Job(_tab)
	GUI:Text("\t\t"); GUI:SameLine()
	GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\".._tab.Name..".png", 20, 20)
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip(_tab.Name)
	end
	GUI:SameLine()
	GUI:PushItemWidth(25)
	local String = GUI:InputText("##".._tab.Name, tostring(_tab.GearSet), GUI.InputTextFlags_AutoSelectAll)
	_tab.GearSet = tonumber(String)
	GUI:PopItemWidth()
	return _tab
end

function BottoxSettings.Draw_GearSet()
	-- Recup List
	local JobList = BVariable.Get_JobList()
	-- Ligne 1
	GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Disciples of the Hand.png", 20, 20)
	GUI:SameLine(); GUI:Text("DoH")
	GUI:SameLine(80); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tank.png", 20, 20)
	GUI:SameLine(); GUI:Text("Tank")
	GUI:SameLine(155); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Melee DPS.png", 20, 20)
	GUI:SameLine(); GUI:Text("Melee DPS")
	-- Ligne 2
	JobList["Crafter"][1] = BottoxSettings.Draw_Job(JobList["Crafter"][1]); GUI:SameLine()
	JobList["Combat"][1] = BottoxSettings.Draw_Job(JobList["Combat"][1]); GUI:SameLine()
	JobList["Combat"][8] = BottoxSettings.Draw_Job(JobList["Combat"][8])
	-- Ligne 3
	JobList["Crafter"][2] = BottoxSettings.Draw_Job(JobList["Crafter"][2]); GUI:SameLine()
	JobList["Combat"][2] = BottoxSettings.Draw_Job(JobList["Combat"][2]); GUI:SameLine()
	JobList["Combat"][9] = BottoxSettings.Draw_Job(JobList["Combat"][9])
	-- Ligne 4
	JobList["Crafter"][3] = BottoxSettings.Draw_Job(JobList["Crafter"][3]); GUI:SameLine()
	JobList["Combat"][3] = BottoxSettings.Draw_Job(JobList["Combat"][3]); GUI:SameLine()
	JobList["Combat"][10] = BottoxSettings.Draw_Job(JobList["Combat"][10])
	-- Ligne 5
	JobList["Crafter"][4] = BottoxSettings.Draw_Job(JobList["Crafter"][4]); GUI:SameLine()
	JobList["Combat"][4] = BottoxSettings.Draw_Job(JobList["Combat"][4]); GUI:SameLine()
	JobList["Combat"][11] = BottoxSettings.Draw_Job(JobList["Combat"][11])
	-- Ligne 6
	JobList["Crafter"][5] = BottoxSettings.Draw_Job(JobList["Crafter"][5]); GUI:SameLine()
	GUI:SameLine(80); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Healer.png", 20, 20)
	GUI:SameLine(); GUI:Text("Healer")
	GUI:SameLine(155); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Magical Ranged DPS.png", 20, 20)
	GUI:SameLine(); GUI:Text("Magical")
	-- Ligne 7
	JobList["Crafter"][6] = BottoxSettings.Draw_Job(JobList["Crafter"][6]); GUI:SameLine()
	JobList["Combat"][5] = BottoxSettings.Draw_Job(JobList["Combat"][5]); GUI:SameLine()
	JobList["Combat"][15] = BottoxSettings.Draw_Job(JobList["Combat"][15]);
	-- Ligne 8
	JobList["Crafter"][7] = BottoxSettings.Draw_Job(JobList["Crafter"][7]); GUI:SameLine()
	JobList["Combat"][6] = BottoxSettings.Draw_Job(JobList["Combat"][6]); GUI:SameLine()
	JobList["Combat"][16] = BottoxSettings.Draw_Job(JobList["Combat"][16]);
	-- Ligne 9
	JobList["Crafter"][8] = BottoxSettings.Draw_Job(JobList["Crafter"][8]); GUI:SameLine()
	JobList["Combat"][7] = BottoxSettings.Draw_Job(JobList["Combat"][7]); GUI:SameLine()
	JobList["Combat"][17] = BottoxSettings.Draw_Job(JobList["Combat"][17])
	-- Ligne 10
	GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Disciples of the Land.png", 20, 20)
	GUI:SameLine(); GUI:Text("DoL");
	GUI:SameLine(80); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Physical Ranged DPS.png", 20, 20)
	GUI:SameLine(); GUI:Text("Physical"); GUI:SameLine(145)
	JobList["Combat"][18] = BottoxSettings.Draw_Job(JobList["Combat"][18])
	-- Ligne 11
	JobList["Gather"][1] = BottoxSettings.Draw_Job(JobList["Gather"][1]); GUI:SameLine()
	JobList["Combat"][12] = BottoxSettings.Draw_Job(JobList["Combat"][12]);
	-- Ligne 12
	JobList["Gather"][2] = BottoxSettings.Draw_Job(JobList["Gather"][2]); GUI:SameLine()
	JobList["Combat"][13] = BottoxSettings.Draw_Job(JobList["Combat"][13]);
	-- Ligne 13
	JobList["Gather"][3] = BottoxSettings.Draw_Job(JobList["Gather"][3]); GUI:SameLine()
	JobList["Combat"][14] = BottoxSettings.Draw_Job(JobList["Combat"][14]);
	-- Push List
	BVariable.Set_JobList(JobList)
end

function BottoxSettings.RecupNameFoodList(_list)
	local Tmp = {}
	for id, e in pairs(_list) do
		if e.name then
			table.insert(Tmp, e.name)
		end
	end
	return Tmp
end

function BottoxSettings.RecupNameList(_list)
	local Tmp = {}
	for id, e in pairs(_list) do
		if e[1] then
			table.insert(Tmp, e[1])
		end
	end
	return Tmp
end

function BottoxSettings.BuildFoodList()
	local FoodList = BVariable.Get_FoodList()
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.class == 5 then
								local Finded = false
								for iid, ie in pairs(FoodList) do
									if item.name == ie.name then
										Finded = true
										break
									end
								end
								if Finded == false then
									table.insert(FoodList, item)
								end
							end
						end
					end
				end
			end
		end
	end
	local Tmp = {}
	for id, e in pairs(FoodList) do
		if e.name == "" then
			table.remove(FoodList, id)
		end
		Tmp[id] = e.name
	end
	return FoodList
end

function BottoxSettings.Draw_General()
	-- Auto Open
	BVariable.Set_AutoOpen(GUI:Checkbox("##AutoOpen",BVariable.Get_AutoOpen()))
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Addons\\BottoxManager.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Open Bottox Manager"))
	-- Developper
	BVariable.Set_DevMode(GUI:Checkbox("##DevMode",BVariable.Get_DevMode()))
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Dev.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Show Dev Tools"))
	-- Fix Window
	BVariable.Set_LockWindows(GUI:Checkbox("##LockWindows",BVariable.Get_LockWindows()))
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Faq.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Lock Bottox Manager Windows"))
	-- Next
	BStyle.Draw_Space()
	-- Mount
	GUI:PushItemWidth(GUI:GetWindowSize() - 1);
	BVariable.Set_MountIndex(GUI:Combo("##MountList",BVariable.Get_MountIndex(),BottoxSettings.RecupNameList(BVariable.Get_MountList()),12)); GUI:PopItemWidth()
	-- Idle Location
	GUI:PushItemWidth(GUI:GetWindowSize() - 1);
	BVariable.Set_IdleIndex(GUI:Combo("##IdleIndex",BVariable.Get_IdleIndex(),BottoxSettings.RecupNameList(BVariable.Get_IdleList()),11)); GUI:PopItemWidth()
	-- Current Active Food
	GUI:PushItemWidth(GUI:GetWindowSize() - 1);
	BVariable.Set_FoodIndex(GUI:Combo("##Food",BVariable.Get_FoodIndex(), BottoxSettings.RecupNameFoodList(BottoxSettings.BuildFoodList()), 10)); GUI:PopItemWidth()
	BVariable.Set_UseFood(FishingPoolHub, "FishingPoolHub")
	-- Navigator Language
	GUI:PushItemWidth(GUI:GetWindowSize() - 1);
	BVariable.Set_Language(GUI:Combo("##Language",BVariable.Get_Language(), BVariable.Get_LanguageList(), 6)); GUI:PopItemWidth()
	-- Next
	BStyle.Draw_Space()
	BStyle.Draw_Space()
	-- Gysahl
	BVariable.Set_UseGysahl(GUI:Checkbox("##UseGysahl",BVariable.Get_UseGysahl()))
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Gysahl.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Summon Chocobo when fighting"))
	-- Keep Useless Fish
	BVariable.Set_ReleaseFish(GUI:Checkbox("##KeepFish",BVariable.Get_ReleaseFish()))
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Addons\\FishingPoolHub.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Release useless fish (FPH)"))
	-- Auto Reduce
	BVariable.Set_AutoReduce(GUI:Checkbox("##AutoReduce",BVariable.Get_AutoReduce()))
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Addons\\FishingPoolHub.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto-reduce fish (FPH)"))

	-- Cordial
	BVariable.Set_UseCordial(GUI:Checkbox("##UseCordial", BVariable.Get_UseCordial()))
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Cordial.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Use Cordial"))
	GUI:SameLine(); GUI:PushItemWidth(125);
	BVariable.Set_CordialIndex(GUI:Combo("##CordialIndex", BVariable.Get_CordialIndex(), BVariable.Get_CordialList()[0])); GUI:PopItemWidth()
	GUI:Text(""); GUI:SameLine(60); BVariable.Set_NoExceed(GUI:Checkbox("Never exceed max GP", BVariable.Get_NoExceed()))
	GUI:Text(""); GUI:SameLine(60); BVariable.Set_FirstHQ(GUI:Checkbox("Use HQ cordial first", BVariable.Get_FirstHQ()))
end

local Func_Draw = {
	[1] = function () return BottoxSettings.Draw_General() end,
	[2] = function () return BottoxSettings.Draw_GearSet() end,
	[3] = function () return BottoxSettings.Draw_Toogle() end,
}

function BottoxSettings.Draw(_index)
	Func_Draw[_index]()
end



