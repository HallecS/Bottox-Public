local Variable = {
	Addon_List = {
		["Store Addons"] = {
			{"RevoltEngine", function() return RevoltEngine end},
			{"Dominion", function() return Dominion end},
			{"Fishing Pool Hub", function() return FishingPoolHub end},
			{"Scenery", function() return Scenery end},
			{"Dailies Manager", function() return DailiesManager end},
			{"Navigator", function() return Navigator end},
		},
		["Free Addons"] = {
			{"Poacher", function() return Poacher end},
			{"Exorcism", function() return Exorcism end},
			{"Gather Assist", function() return GatherAssist end},
			{"Hunt Radar", function() return HuntRadar end},
			{"Spellbook", function() return SpellBook end},
			{"Real Estate", function() return RealEstate end},
		},
		["Daily Quests"] = {
			{
				IsFile = true,
				Name = "A Realm Reborn (2.0)",
				Icone = GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\ARR2.png",
				Liste = {
					{"Dailies Vol.1", function() return DailiesAmal end},
					{"Dailies Vol.2", function() return DailiesSylph end},
					{"Dailies Vol.3", function() return DailiesKobold end},
					{"Dailies Vol.4", function() return DailiesSahagin end},
					{"Dailies Vol.5", function() return DailiesIxal end},					
				},
			},
			{
				IsFile = true,
				Name = "Heavensward (3.0)",
				Icone = GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\HW.png",
				Liste = {
					{"Dailies Vol.6", function() return DailiesVanu end},
					{"Dailies Vol.7", function() return DailiesGnath end},
					{"Dailies Vol.8", function() return DailiesMog end},
				},
			},
			{
				IsFile = true,
				Name = "Stormblood (4.0)",
				Icone = GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\SB.png",
				Liste = {
					{"Dailies Vol.9", function() return DailiesKojin end},
					{"Dailies Vol.10", function() return DailiesAnanta end},
					{"Dailies Vol.11", function() return DailiesNamazu end},
				},
			},
			{
				IsFile = true,
				Name = "Shadowbringers (5.0)",
				Icone = GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\SHB.png",
				Liste = {
					{"Dailies Vol.12", function() return DailiesPixie end},
					{"Dailies Vol.13", function() return DailiesQitari end},
					{"Dailies Vol.14", function() return DailiesDwarf end},
				},
			},
		},
		["Dev Tools"] = {
			{"Data Record", function() return DataRecord end},
			{"FindEntity", function() return FindEntity end},
		},
		["Customers Addons"] = {
			{"BTemplate", function() return BTemplate end},
		},
	},
	Space_Icone = { nil, 55, 100, 145, 190, 235},
}

function BottoxManager.Add_Customers(_name, _addon)
	if (type(_name) == "string") then
		for id, e in pairs(Variable.Addon_List["Customers Addons"]) do
			if e[1] == _name then
				return false
			end
		end
		local tab = {_name, _addon}
		BDebug.Log(_name.." Added Inside Customers",1)
		table.insert(Variable.Addon_List["Customers Addons"], tab)
		return true
	end
	return false
end

function BottoxManager.Draw_File(_info)
	-- Init Icone
	GUI:PushStyleColor(GUI.Col_Button, 0.12, 0.146, 0.156, 0.7)
	if GUI:ImageButton(_info.Name, _info.Icone, 32, 32) then
		GUI:OpenPopup(_info.Name)
		local Position = {}
		Position.x, Position.y = GUI:GetMousePos()
		GUI:SetNextWindowPos(Position.x + 10, Position.y + 10)
	end
	GUI:PopStyleColor(1)
	if GUI:IsItemHovered() and not GUI:IsPopupOpen(_info.Name) then
		GUI:SetTooltip(_info.Name)
	end
	if GUI:BeginPopup(_info.Name) then
		for id, e in pairs(_info.Liste) do
			if table.valid(e) then
				local Lign = 0
				if (id > 6) and (id <= 12) then
					Lign = 6
				else
					if id > 12 then
						Lign = 12
					end
				end
				if (type(e[1]) == "string") then
					if Variable.Space_Icone[id - Lign] ~= nil then
						GUI:SameLine(Variable.Space_Icone[id - Lign])
					end
					if type(e[2]) == "function" then
						BStyle.Draw_Launcher(e[1], e[2]())
					else
						BStyle.Draw_Launcher(e[1], e[2])
					end
				end
			end
		end
		GUI:EndPopup()
	end
end

function BottoxManager.Draw_Addon_List(_name)
	if table.valid(Variable.Addon_List) and (type(_name) == "string") then
		if table.size(Variable.Addon_List[_name]) >= 1 then
			GUI:Text(_name)
			for id, e in pairs(Variable.Addon_List[_name]) do
				if table.valid(e) then
					local Lign = 0
					if (id > 6) and (id <= 12) then
						Lign = 6
					else
						if id > 12 then
							Lign = 12
						end
					end
					if (type(e[1]) == "string") or e.IsFile then
						if Variable.Space_Icone[id - Lign] ~= nil then
							GUI:SameLine(Variable.Space_Icone[id - Lign])
						end
						if e.IsFile then
							BottoxManager.Draw_File(e)
						else
							if type(e[2]) == "function" then
								BStyle.Draw_Launcher(e[1], e[2]())
							else
								BStyle.Draw_Launcher(e[1], e[2])
							end
						end
					end
				end
			end
		end
	end
end
