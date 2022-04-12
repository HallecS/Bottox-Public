BottoxManager = {}

local Project = {
--	--------------- Menu
	_Menu = {
		Name 	=					"Bottox",
		Id 		=					"BottoxManager",
		Icone = {
			Default 	= 			GetStartupPath().."\\GUI\\UI_Textures\\addon.png",
			Folder 		=			"Addons",
			Name 		=			"BottoxManager",
			Extention 	= 			"png",
			Tooltip = 				"Bottox Manager\n\t\tWelcome to Bottox world! Quality bots and free cookies.",
		},
	},
--	--------------- Addon
	_Addon = {
		Root 		= 				"LuaMods",
		Folder 		= 				"Bottox Manager",
		Installed 	= 				true,
		Name 		=				"Bottox Manager",
		Version 	= 				"1.1.0",
		VersionList = {
			"[1.0.0] - Init Release",
			"[1.1.0] - New UI {09/06/18}",
		},
	},
--	--------------- Windows
	_Windows = {
		[1] = { -- Main
			Used 	=				true,
			Name 	= 				"Main Windows",
			Open 	= 				true,
			Option 	= 				GUI.WindowFlags_ShowBorders + GUI.WindowFlags_NoResize,
			Visible = 				false,
			Size_X 	= 				284,
			Size_Y 	= 				390,
			Pos = {
				x 	= 				0,
				y 	= 				0,
			},
			Draw = 					function () BottoxManager.Draw_First() end,
		},
		[2] = { -- Second
			Used = 			true,
			Name 	= 		"Second Windows",
			Open 	= 		true,
			Option 	= 		GUI.WindowFlags_ShowBorders + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoTitleBar,
			Visible = 		false,
			-- Bar Menu
			Index = 		1,
			Lock 	= 		true,
			Reduced = 		false,
			Direction =		true, -- true = Left / false = Right
			Settings = 		true,
			-- Size Option
			Size_X 	= 		42,
			Size_Y 	= 		92,
			Min_X = 		42,
			Max_X = 		284,
			Min_Y = 		92,
			Max_Y = 		390,
			Delta_X = 		4,
			Delta_Y = 		4.2,
			-- If NoTitleBar Used (else = 0)
			Delta_Title = 	18,
			--
			Pos = {
				x 	= 		0,
				y 	= 		0,
			},
			--
			Draw 	= 		function () BottoxManager.Draw_Second() end,
		},
		[3] = { -- Settings
			Used = 			true,
			Name 	= 		"Settings Windows",
			Open 	= 		true,
			Option 	= 		GUI.WindowFlags_ShowBorders + GUI.WindowFlags_NoResize + GUI.WindowFlags_NoTitleBar,
			Visible = 		false,
			-- Bar Menu
			Index 	= 		1,
			Lock 	= 		true,
			Reduced = 		true,
			Direction =		true, -- true = Left / false = Right
			Settings = 		true,
			-- Size Option
			Size_X 	= 		42,
			Size_Y 	= 		92,
			Min_X = 		42,
			Max_X = 		284,
			Min_Y = 		92,
			Max_Y = 		390,
			Delta_X = 		4,
			Delta_Y = 		4.2,
			-- If NoTitleBar Used (else = 0)
			Delta_Title = 	18,
			--
			Pos = {
				x 	= 		0,
				y 	= 		0,
			},
			--
			Draw 	= 		function () BottoxManager.Draw_Settings() end,
		},	
	},
--	--------------- Update
	_Update = {
			Pulse = 				500,
			Timer = 				0,
			Active = 				false,
	},
--	--------------- Variable
	_Variable = {
		Current_Addon = 			nil,
		First_Open =				true,
		Lock = 						{x = -1, y = 0},
	},
}

----------------------------	[Set/Shortcuts]	-------------------------------------------
local Main_Windows =				Project._Windows[1]
local Second_Windows =				Project._Windows[2]
local Settings_Windows =			Project._Windows[3]
local Update = 						Project._Update
local Variable = 					Project._Variable

----------------------------	[Set/Get]	-------------------------------------------
function BottoxManager.SetCurrentAddon(_addon)
	Variable.Current_Addon = _addon
end

function BottoxManager.GetCurrentAddon()
	return Variable.Current_Addon
end

function BottoxManager.Get_Settings_Direction()
	return Settings_Windows.Direction
end

function BottoxManager.Set_Settings_Direction(_param)
	Settings_Windows.Direction = _param
end

function BottoxManager.Get_Second_Direction()
	return Second_Windows.Direction
end

function BottoxManager.Get_Second_Index()
	return Second_Windows.Index
end

function BottoxManager.Set_Second_Direction(_param)
	Second_Windows.Direction = _param
end

function BottoxManager.Get_MainPos()
	return Main_Windows.Pos
end
----------------------------	[Function]	-------------------------------------------
function BottoxManager.SwitchOpen()
	Main_Windows.Open = not Main_Windows.Open
end

function BottoxManager.ForceOpen()
	Main_Windows.Open = true
end

function BottoxManager.Open_Second()
	Second_Windows.Open = true
end

----------------------------	[Update]	-------------------------------------------
function BottoxManager.Update(Event, ticks)
	if (not Update.Timer or ticks - Update.Timer > Update.Pulse) then
		Update.Timer = ticks
		------------
		if Update.Active == true then

		end
		------------
	end	
end
RegisterEventHandler("Gameloop.Update", BottoxManager.Update, Project._Addon.Name)

----------------------------	[Draw]		-------------------------------------------
function BottoxManager.Update_Second_Pos()
	if Second_Windows.Lock then
		if Second_Windows.Direction then
			Second_Windows.Pos.x = Main_Windows.Pos.x - Second_Windows.Size_X
		else
			Second_Windows.Pos.x = Main_Windows.Pos.x + Main_Windows.Size_X
		end
		Second_Windows.Pos.y = Main_Windows.Pos.y + Second_Windows.Delta_Title
	end
end

function BottoxManager.Bar_Reduced()
	local PNG = "Reduce"
	local Tool = "Reduce 2nd window"
	if Second_Windows.Reduced then
		PNG = "Extend"
		Tool = "Open 2nd window"
	end
	Second_Windows.Reduced = BStyle.DrawImageButton("Reduced##BottoxManager", not Second_Windows.Reduced, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\"..PNG..".png", 16, 16, Tool, Second_Windows.Reduced)
end

function BottoxManager.Bar_Direction()
	local Sense = "Left"
	local Tool = "Switch window to the left"
	if Second_Windows.Direction then
		Tool = "Switch window to the right"
		Sense = "Right"
	end
	Second_Windows.Direction = BStyle.DrawImageButton("ChangeDirection##BottoxManager", not Second_Windows.Direction, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\"..Sense..".png", 16, 16, Tool, Second_Windows.Direction)
end

function BottoxManager.Bar_Lock()
	local PNG = "Lock"
	local Tool = "Lock window"
	if Second_Windows.Lock then
		PNG = "Unlock"
		Tool = "Unlock window"
	end
	Second_Windows.Lock = BStyle.DrawImageButton("LockSecondWindows##BottoxManager", not Second_Windows.Lock, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\"..PNG..".png", 16, 16, Tool, Second_Windows.Lock)
end

function BottoxManager.Bar_Tutorial()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_Tutorial##BottoxManager", 3, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tutorial.png", 16, 16, "Tutorial", Second_Windows.Index)
end

function BottoxManager.Bar_Tips()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_Tips##BottoxManager", 4, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tips.png", 16, 16, "Tips", Second_Windows.Index)
end

function BottoxManager.Bar_QA()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_QA##BottoxManager", 5, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Faq.png", 16, 16, "FAQ", Second_Windows.Index)
end

function BottoxManager.Bar_Empty()
	GUI:Dummy(16 + 8, 16)
end

function BottoxManager.Bar_Menu()
	local Tab = {}
	if not Second_Windows.Reduced then
		if Variable.Current_Addon then
			local PrivateBarList = Variable.Current_Addon.Get_BarList()
			if PrivateBarList then
				for id, e in ipairs(PrivateBarList) do 
					table.insert(Tab, e)
				end
				table.insert(Tab, function () BottoxManager.Bar_Reduced() return end)
				table.insert(Tab, function () BottoxManager.Bar_Direction() return end)
				table.insert(Tab, function () BottoxManager.Bar_Lock() return end)
			else
				Tab = {
					[1] = function () BottoxManager.Bar_Empty() return end,
					[2] = function () BottoxManager.Bar_Empty() return end,
					[3] = function () BottoxManager.Bar_Tutorial() return end,
					[4] = function () BottoxManager.Bar_Tips() return end,
					[5] = function () BottoxManager.Bar_QA() return end,
					[6] = function () BottoxManager.Bar_Empty() return end,
					[7] = function () BottoxManager.Bar_Reduced() return end,
					[8] = function () BottoxManager.Bar_Direction() return end,
					[9] = function () BottoxManager.Bar_Lock() return end,
				}
			end
		end
	else
		Tab = {
			[1] = function () BottoxManager.Bar_Lock() return end,
			[2] = function () BottoxManager.Bar_Direction() return end,
			[3] = function () BottoxManager.Bar_Reduced() return end,
		}
	end
	for _id, _e in ipairs(Tab) do
		if not Second_Windows.Reduced then
			GUI:SameLine()
		end
		_e()
	end
	if not Second_Windows.Reduced then
		GUI:Separator()
	end
end

function BottoxManager.Calcul_No_Reduced(_current, _max, _delta)
	if _current < _max then
		_current = _current + _delta
		if _current > _max then
			_current = _max
		end
	else
		_current = _max
	end
	return _current
end

function BottoxManager.Calcul_Reduced(_current, _min, _delta)
	if _current > _min then
		_current = _current - _delta
		if _current < _min then
			_current = _min
		end
	else
		_current = _min
	end
	return _current
end

function BottoxManager.Size_Reduced()
	if Second_Windows.Reduced then -- Reduced = true
		Second_Windows.Size_X = BottoxManager.Calcul_Reduced(Second_Windows.Size_X, Second_Windows.Min_X, Second_Windows.Delta_X)
		Second_Windows.Size_Y = BottoxManager.Calcul_Reduced(Second_Windows.Size_Y, Second_Windows.Min_Y, Second_Windows.Delta_Y)
	else -- Reduced = false
		Second_Windows.Size_X = BottoxManager.Calcul_No_Reduced(Second_Windows.Size_X, Second_Windows.Max_X, Second_Windows.Delta_X)
		Second_Windows.Size_Y = BottoxManager.Calcul_No_Reduced(Second_Windows.Size_Y, Second_Windows.Max_Y - Second_Windows.Delta_Title, Second_Windows.Delta_Y)
	end
end

function Settings_Windows.Bar_General()
	Settings_Windows.Index = BStyle.DrawImageButton("Bar_General##BottoxManager", 1, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\General.png", 16, 16, "General settings", Settings_Windows.Index)
end

function Settings_Windows.Bar_GearSet()
	Settings_Windows.Index = BStyle.DrawImageButton("Bar_GearSet##BottoxManager", 2, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\GearSet.png", 16, 16, "Gear Sets", Settings_Windows.Index)
end

function Settings_Windows.Bar_Toogle()
	Settings_Windows.Index = BStyle.DrawImageButton("Bar_Toggle##BottoxManager", 3, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Toggle.png", 16, 16, "Toggle buttons", Settings_Windows.Index)
end

function Settings_Windows.Bar_Discord()
	GUI:PushStyleColor(GUI.Col_Button, 0.12, 0.146, 0.156, 0.7)
	local Button = GUI:ImageButton("Discord##BottoxManager", GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Discord.png", 16, 16)
	GUI:PopStyleColor(1)
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Live support on Discord")
	end
	if GUI:IsItemClicked(Button) then
		io.popen([[cmd /c start https://discord.gg/cfUmUE2]])
	end
end

function Settings_Windows.Bar_Reduced()
	local PNG = "Reduce"
	local Tool = "Reduce settings window"
	if Settings_Windows.Reduced then
		Settings_Windows.Index = 1
		PNG = "Extend"
		Tool = "Open settings window"
	end
	Settings_Windows.Reduced = BStyle.DrawImageButton("Reduced##BottoxManager", not Settings_Windows.Reduced, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\"..PNG..".png", 16, 16, Tool, Settings_Windows.Reduced)
end

function Settings_Windows.Bar_Direction()
	local Sense = "Left"
	local Tool = "Switch window to the left"
	if Settings_Windows.Direction then
		Tool = "Switch window to the right"
		Sense = "Right"
	end
	Settings_Windows.Direction = BStyle.DrawImageButton("ChangeDirection##BottoxManager", not Settings_Windows.Direction, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\"..Sense..".png", 16, 16, Tool, Settings_Windows.Direction)
end

function Settings_Windows.Bar_Lock()
	local PNG = "Lock"
	local Tool = "Lock window"
	if Settings_Windows.Lock then
		PNG = "Unlock"
		Tool = "Unlock window"
	end
	Settings_Windows.Lock = BStyle.DrawImageButton("LockSecondWindows##BottoxManager", not Settings_Windows.Lock, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\"..PNG..".png", 16, 16, Tool, Settings_Windows.Lock)
end

function Settings_Windows.Bar_Empty()
	GUI:Dummy(16 + 8, 16)
end

function Settings_Windows.Bar_Menu()
	local Tab = {}
	if not Settings_Windows.Reduced then
		Tab = {
			[1] = function () Settings_Windows.Bar_General() return end,
			[2] = function () Settings_Windows.Bar_GearSet() return end,
			[3] = function () Settings_Windows.Bar_Toogle() return end,
			[4] = function () Settings_Windows.Bar_Empty() return end,
			[5] = function () Settings_Windows.Bar_Discord() return end,
			[6] = function () Settings_Windows.Bar_Empty() return end,
			[7] = function () Settings_Windows.Bar_Reduced() return end,
			[8] = function () Settings_Windows.Bar_Direction() return end,
			[9] = function () Settings_Windows.Bar_Lock() return end,
		}
	else
		Tab = {
			[1] = function () Settings_Windows.Bar_Lock() return end,
			[2] = function () Settings_Windows.Bar_Direction() return end,
			[3] = function () Settings_Windows.Bar_Reduced() return end,
		}
	end
	for _id, _e in ipairs(Tab) do
		if not Settings_Windows.Reduced then
			GUI:SameLine()
		end
		_e()
	end
	if not Settings_Windows.Reduced then
		GUI:Separator()
	end
end

function Settings_Windows.Size_Reduced()
	if Settings_Windows.Reduced then -- Reduced = true
		Settings_Windows.Size_X = BottoxManager.Calcul_Reduced(Settings_Windows.Size_X, Settings_Windows.Min_X, Settings_Windows.Delta_X)
		Settings_Windows.Size_Y = BottoxManager.Calcul_Reduced(Settings_Windows.Size_Y, Settings_Windows.Min_Y, Settings_Windows.Delta_Y)
	else -- Reduced = false
		Settings_Windows.Size_X = BottoxManager.Calcul_No_Reduced(Settings_Windows.Size_X, Settings_Windows.Max_X, Settings_Windows.Delta_X)
		Settings_Windows.Size_Y = BottoxManager.Calcul_No_Reduced(Settings_Windows.Size_Y, Settings_Windows.Max_Y - Settings_Windows.Delta_Title, Settings_Windows.Delta_Y)
	end
end

function BottoxManager.SameDirection()
	if Variable.Current_Addon then
		local Get_Used = Variable.Current_Addon.Get_Second_Used()
		-- All Time Same Direction
		if Second_Windows.Open and Get_Used and Second_Windows.Lock then
			-- if windows 2nd is Open & Used
			if Settings_Windows.Direction then
				Settings_Windows.Pos.x = Settings_Windows.Pos.x - Second_Windows.Size_X
			else
				Settings_Windows.Pos.x = Settings_Windows.Pos.x + Second_Windows.Size_X
			end
		end
	end
end

function Settings_Windows.Update_Pos()
	if Settings_Windows.Lock then
		if Settings_Windows.Direction then
			Settings_Windows.Pos.x = Main_Windows.Pos.x - Settings_Windows.Size_X
		else
			Settings_Windows.Pos.x = Main_Windows.Pos.x + Main_Windows.Size_X
		end
		Settings_Windows.Pos.y = Main_Windows.Pos.y + Settings_Windows.Delta_Title
	end
end

function BottoxManager.Draw_Settings()
	if Main_Windows.Open and Main_Windows.Visible then
		BStyle.WindowStyle()
		Settings_Windows.Size_Reduced()
		Settings_Windows.Update_Pos()
		GUI:SetNextWindowSize(Settings_Windows.Size_X,Settings_Windows.Size_Y)
		if Settings_Windows.Lock then
			if Second_Windows.Direction == Settings_Windows.Direction then
				BottoxManager.SameDirection()
			end
			GUI:SetNextWindowPos(Settings_Windows.Pos.x, Settings_Windows.Pos.y, GUI.SetCond_Always)
		end
		Settings_Windows.Visible, Settings_Windows.Open = GUI:Begin(Settings_Windows.Name.."##BottoxManager", Settings_Windows.Open, Settings_Windows.Option)
		if (Settings_Windows.Visible) then
			Settings_Windows.Bar_Menu()
			if not Settings_Windows.Reduced then
				if GUI:BeginChild(GetString("##Settings_Windows_NoBarMenu"), GUI:GetWindowSize() - 17, 324, false) then
					BottoxSettings.Draw(Settings_Windows.Index)
					GUI:EndChild()
				end
			end
		end
		GUI:PopStyleColor(BStyle.GetActiveWindowsStyle())
		GUI:End()
	end
end

function BottoxManager.Draw_Second()
	if Variable.Current_Addon then -- Have Current Addon ?
		local Get_Used = Variable.Current_Addon.Get_Second_Used()
		if Get_Used then
			if Main_Windows.Open and Main_Windows.Visible then
				BStyle.WindowStyle()
				BottoxManager.Size_Reduced()
				BottoxManager.Update_Second_Pos()
				GUI:SetNextWindowSize(Second_Windows.Size_X,Second_Windows.Size_Y)
				if Second_Windows.Lock then
					GUI:SetNextWindowPos(Second_Windows.Pos.x, Second_Windows.Pos.y, GUI.SetCond_Always)
				end
				Second_Windows.Visible, Second_Windows.Open = GUI:Begin(Second_Windows.Name.."##BottoxManager", Second_Windows.Open, Second_Windows.Option)
				if (Main_Windows.Visible) then
					BottoxManager.Bar_Menu()
					if not Second_Windows.Reduced then
						if GUI:BeginChild(GetString("##Second_Windows_NoBarMenu"), GUI:GetWindowSize() - 17, 324, false) then
							Variable.Current_Addon.Draw_Second(Second_Windows.Index)
							GUI:EndChild()
						end
					end
				end
				GUI:PopStyleColor(BStyle.GetActiveWindowsStyle())
				GUI:End()
			end
		end
	end
end

function BottoxManager.Update_Main_Pos()
	Variable.Lock.x, Variable.Lock.y = GUI:GetWindowPos()
	Main_Windows.Pos.x, Main_Windows.Pos.y = GUI:GetWindowPos()
	Second_Windows.Pos.x = Main_Windows.Pos.x - Second_Windows.Size_X
	Second_Windows.Pos.y = Main_Windows.Pos.y + 18
end

function BottoxManager.Open_Close_Windows()
	if GUI:Button("New Window##Main_Windows", (GUI:GetWindowSize() / 2) - 10, 20) == true then
		Second_Windows.Open = false
		Variable.Current_Addon.SwitchOpen()
		Variable.Current_Addon = nil
	end
	GUI:SameLine((GUI:GetWindowSize() / 2) + 1)
	if GUI:Button("Close##Main_Windows", (GUI:GetWindowSize() / 2) - 11, 20) == true then
		Variable.Current_Addon = nil
	end					
	GUI:Separator()
end

function BottoxManager.Draw_Addon()
	BottoxManager.Draw_Addon_List("Store Addons")
	BottoxManager.Draw_Addon_List("Free Addons")
	BottoxManager.Draw_Addon_List("Daily Quests")
	if BVariable.Get_DevMode() == true then
		BottoxManager.Draw_Addon_List("Dev Tools")
	end
	BottoxManager.Draw_Addon_List("Customers Addons")
end

function BottoxManager.Draw_First()
	if BVariable.Get_LockWindows() then
		if Variable.Lock.x ~= -1 then
			GUI:SetNextWindowPos(Variable.Lock.x,Variable.Lock.y)
		end
	end
	GUI:SetNextWindowSize(Main_Windows.Size_X,Main_Windows.Size_Y)
	BStyle.WindowStyle()
	Main_Windows.Visible, Main_Windows.Open = GUI:Begin("\t\t\t\t\t\t\t\t\t\t"..Project._Addon.Name.."##MainWindows_begin", Main_Windows.Open, Main_Windows.Option)
	if (Main_Windows.Visible) then
		BottoxManager.Update_Main_Pos()
		if Variable.Current_Addon == nil then
			Second_Windows.Open = false
			BottoxManager.Draw_Addon()
		else
			Variable.Current_Addon.Draw_First()
			Second_Windows.Open = true
		end
		BottoxSettings.CheckNeedSave()
	end
	GUI:PopStyleColor(BStyle.GetActiveWindowsStyle())
	GUI:End()
end

function BottoxManager.Draw(event, ticks)
	if MGetGameState() == 3 then
		-- Check Settings
		if Variable.First_Open == true then
			if BSettings ~= nil then
				if BSettings.GetReady() == true then
					Main_Windows.Open = BVariable.Get_AutoOpen()
					Variable.First_Open = false
				end
				return
			end
		end
		-- Main
		if (Main_Windows.Open) then
			for _id, _windows in pairs(Project._Windows) do
				if _windows.Used then
					_windows.Draw()
				end
			end
		end
	end
end 
RegisterEventHandler("Gameloop.Draw", BottoxManager.Draw, Project._Addon.Name)

----------------------------	[Init]		-------------------------------------------
function BottoxManager.Init()
	if ffxiv_bottoxmenu == nil then
		local Icone = Project._Menu.Icone
		local Icone_Path = GetStartupPath().."\\"..Project._Addon.Root.."\\"..Project._Addon.Folder.."\\"..Icone.Folder.."\\"..Icone.Name.."."..Icone.Extention
		local menuiconpath = Icone_Path
		if FileExists(menuiconpath) then
			ffxiv_bottoxmenu = {
			ml_gui.ui_mgr:AddMember( { id = "FFXIVBOTTOX##"..Project._Menu.Id, expanded = false, name = Project._Menu.Name, onClick = function() return BottoxManager.SwitchOpen() end, tooltip = Icone.Tooltip, texture = menuiconpath}, "FFXIVMINION##MENU_HEADER")
			}
		else
			ffxiv_bottoxmenu = {
			ml_gui.ui_mgr:AddMember( { id = "FFXIVBOTTOX##"..Project._Menu.Id, expanded = false, name = Project._Menu.Name, onClick = function() return BottoxManager.SwitchOpen() end, tooltip = Icone.Tooltip, texture = Icone.Default}, "FFXIVMINION##MENU_HEADER")
			}
		end
	end
end
RegisterEventHandler("Module.Initalize",BottoxManager.Init, Project._Addon.Name) -- Lance Init au chargement des LUA

function BottoxManager.ModuleInit()
	local menuTab = {
		name = "BottoxManager",
		openWindow = function () Main_Windows.Open = true end,
		isOpen = function () return Main_Windows.Open end
	}
	table.insert(ml_global_information.menu.windows,menutab)
end
RegisterEventHandler("Module.Initalize",BottoxManager.ModuleInit, Project._Addon.Name) -- Lance Init au chargement des LUA
