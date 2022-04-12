DailiesKojin = {}

local Project = {
--	--------------- Addon
	_Addon = {
		Root 		= 		"LuaMods",
		Folder 		= 		"Bottox Manager",
		Installed 	= 		true,
		Name 		=		"Dailies Vol.9",
		Version 	= 		"1.0.0",
		VersionList = {
			"[1.0.0] - Init Release",
		},
	},
--	--------------- Icone
	_Icone = {
		Default 	= 		GetStartupPath().."\\GUI\\UI_Textures\\addon.png",
		Root 		= 		"Bottox Manager",
		Folder 		=		"Addons",
		Name 		=		"DailiesVol9",
		Extention 	=	 	"png",
		Tooltip 	=		"Dailies Vol.9 (Kojin)",
	},
--	--------------- Windows
	_Windows = {
		[1] = { -- First
			Used 	= 		true,
			Draw 	= 		function () DailiesKojin.Draw_First() end,
		},
		[2] = { -- Second
			Used = 			true,
			Draw 	= 		function () DailiesKojin.Draw_Second() end,
			--
			Index 	=		 1,
			DrawInside = {
				[1] = function() return DailiesKojin.Draw_Tutorial() end,
				[2] = function() return DailiesKojin.Draw_Tips() end,
				[3] = function() return DailiesKojin.Draw_QA() end,
			},
			Tab = {
				[1] = function () DailiesKojin.Bar_Tutorial() return end,
				[2] = function () DailiesKojin.Bar_Tips() return end,
				[3] = function () DailiesKojin.Bar_QA() return end,
				[4] = function () BottoxManager.Bar_Empty() return end,
				[5] = function () BottoxManager.Bar_Empty() return end,
				[6] = function () BottoxManager.Bar_Empty() return end,
			},
		},
	},
--	--------------- Update
	_Update = {
			Pulse = 		350,
			Timer = 		0,
			Active = 		false,
	},
--	--------------- Variable
	_Variable = {
		Module = 			1,
		Break = 			false,
		NbQuest_List = {"1 quest", "2 quests", "3 quests"},
		NbQuestIndex = 3,
		JobList = {"Select your job"},
		JobIndex = 1,
		Rank_List = {"Rank quests", "Rank 3 to 4","Rank 4 to 5","Rank 5 to 6"},
		RankIndex = 1,
------ Data
		Data_Npc = nil,
		Data_Quest = nil,
		Data_Rank_Npc = nil,
		Data_Rank_Quest = nil,
------ Rank
		IdQuestBonus = 0,
		Rank_Quest = { -- ID, Mount
			[1] = {2974, false, 0},
			[2] = {2975, false, 0},
			[3] = {2976, false, 0},
		},
------ Settings
		MaponTp = 613,
		AethId = 105,
------ Mount
		QuestMountList = {2982,2990},
		MountSkill = 10013,
	},
--	--------------- Data
	_Data = {},
}

----------------------------	[Set/Shortcuts]	-------------------------------------------
local Icone = 				Project._Icone
local Addon =				Project._Addon
local Main_Windows =		Project._Windows[1]
local Second_Windows =		Project._Windows[2]
local Update = 				Project._Update
local Variable = 			Project._Variable
local Data = 				Project._Data

----------------------------	[Set/Get]	-------------------------------------------
function DailiesKojin.Get_Icone() -- Used by Bottox Manager
	return Icone
end

function DailiesKojin.Get_Addon() -- Used by Bottox Manager
	return Addon
end

function DailiesKojin.Bar_Tutorial()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_Tutorial##DailiesKojin", 1, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tutorial.png", 16, 16, "Tutorial", Second_Windows.Index)
end

function DailiesKojin.Bar_Tips()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_Tips##DailiesKojin", 2, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tips.png", 16, 16, "Tips", Second_Windows.Index)
end

function DailiesKojin.Bar_QA()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_QA##DailiesKojin", 3, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Faq.png", 16, 16, "FAQ", Second_Windows.Index)
end

function DailiesKojin.Get_BarList()
	return Second_Windows.Tab
end

function DailiesKojin.Get_Second_Used()
	return Second_Windows.Used
end

function DailiesKojin.GetNbQuestIndex()
	return Variable.NbQuestIndex
end

----------------------------	[Function]	-------------------------------------------
function DailiesKojin.SwitchOpen() -- Used by Bottox Manager
	Main_Windows.Open = not Main_Windows.Open
end

----------------------------	[DailiesKojin.Variable.Module 5]	---------------------------------------
function DailiesKojin.NeedReturnQuest(_Data)
	if BQuest.FindXQuestInsideJournal(_Data.questidmin, _Data.questidmax) == 0 then
		BDebug.Log("Well Done", 1)
		if BottoxManager.GetCurrentAddon() == DailiesKojin then
			BUtility.WaitingAeth()
			DailiesKojin.StopAddon()
		else
			DailiesKojin.StopAddon()
		end
		return
	end
	local qList = Quest:GetQuestList()
	if (table.valid(qList)) then
		for id, e in pairs(qList) do
			if e.id >= _Data.questidmin and e.id <= _Data.questidmax then
				BLoad.Quest(e.id, Variable.Data_Quest[e.id])
				BQuest.ReturnQuest(_Data)
				return
			end
		end
	end
end

----------------------------	[DailiesKojin.Variable.Module 3]	---------------------------------------
function DailiesKojin.IsMountQuest(_id)
	for id, e in pairs(Variable.QuestMountList) do
		if e == _id then
			return true
		end
	end
	return false
end

function DailiesKojin.NeedDoQuest(_Data)
	BDebug.Log("NeedDoQuests", 2)
	local qList = Quest:GetQuestList()
	if (table.valid(qList)) then
		for id, e in pairs(qList) do
			if e.id >= _Data.questidmin and e.id <= _Data.questidmax then
				Variable.Module = 4
				if e.completed == false then
					-- Load Quest
					BLoad.Quest(e.id, Variable.Data_Quest[e.id])
					-- Check if Mount Quest
					if DailiesKojin.IsMountQuest(e.id) == true then
						BQuest.SetType("Mount")
						BQuest.SetMountSkill(Variable.MountSkill)
					end
					return
				end
			end
		end
		Variable.Module = 5
	end
end

--[[---------------------------------------------------------------------------------------
----------------------------	[DailiesKojin.Variable.Module 1]	---------------------------------------
-----------------------------------------------------------------------------------------]]
function DailiesKojin.NeedTakeQuest(_Data)
	BDebug.Log("NeedTakeQuest", 2)
	if tonumber(Variable.NbQuestIndex) == BQuest.FindXQuestInsideJournal(_Data.questidmin, _Data.questidmax) then
		Variable.Module = 3
	else
		BQuest.TakeQuest(_Data)
	end
end

----------------------------	[DailiesKojin.UPDATE]	-----------------------------------
------------------------------------------ Update ----------------------------------------
local ModuleStep = {}
ModuleStep[1] = function() DailiesKojin.NeedTakeQuest(Variable.Data_Npc) end
------------------------------------------------------------------------------------------
ModuleStep[3] = function() DailiesKojin.NeedDoQuest(Variable.Data_Npc) end
ModuleStep[4] = function() if BQuest.DoQuest() == true then Variable.Module = 3 end end
------------------------------------------------------------------------------------------
ModuleStep[5] = function() DailiesKojin.NeedReturnQuest(Variable.Data_Npc) end
------------------------------------------------------------------------------------------
ModuleStep[6] = function() if BQuest.TakeQuest(Variable.Data_Rank_Npc[Variable.IdQuestBonus]) == true then Variable.Module = 7 end end
ModuleStep[7] = function() if BQuest.DoQuest() == true then BVariable.SetMapID(Variable.MaponTp) BVariable.SetAethID(Variable.AethId) Variable.Module = 8 end end
ModuleStep[8] = function() if BQuest.ReturnQuest(Variable.Data_Rank_Npc[Variable.IdQuestBonus]) == true then DailiesKojin.StopAddon() end end
------------------------------------------------------------------------------------------

----------------------------	[Update]	-------------------------------------------
function DailiesKojin.Update(Event, ticks)
	if (not Update.Timer or ticks - Update.Timer > Update.Pulse) then
		Update.Timer = ticks
		------------
		if Update.Active == true then
			------------
			-- Check if rien ne bloque l'addon
			if 	(BCommun.InsideDialog() == false) and
				(BCommun.IsCasting() == false) and 
				(BCommun.PlayerIsNotDead() == true) and
				(BInteract.SelectYes() == false) then
				-- Chose string Quest
				local Quest = BQuest.GetCurrentQuest()
				if Quest ~= nil then
					if BCommun.SelectString(Quest.id) == true then
						return
					end
					if Quest.id == 2974 then
						local tar = Player:GetTarget()
						if table.valid(tar) then
							if tar.contentid == 1024231 then
								BInteract.SelectConversation(1)
							end
							if tar.contentid == 1024244 then
								BInteract.SelectConversation(1)
							end
						end
					end
				end
				-- Check Good Map (after Raise)
				if BMovement.doTp(Variable.MaponTp, Variable.AethId) == true then
					-- Do Dailies Function
					ModuleStep[Variable.Module]()
				end
			end
			------------
		end
		------------
	end	
end
RegisterEventHandler("Gameloop.Update", DailiesKojin.Update, Addon.Name)

function DailiesKojin.Start_Rank(_id, _mount)
	BLoad.Quest(_id, Variable.Data_Rank_Quest[_id])
	Variable.IdQuestBonus = _id
	if _mount == true then
		BQuest.SetType("Mount")
		BQuest.SetMountSkill(Variable.MountSkill)
	end
	Variable.Module = 6
end

function DailiesKojin.StopAddon()
	-- Reset BottoxLib()
	BQuest.RemoveQuest()
	BStep.RemoveStep()
	-- Update
	Update.Active = false
	Variable.Break = false
end

function DailiesKojin.StartAddon()
	-- Recup Data
	Variable.Data_Npc = DailiesKojin.Get_Data_Npc()
	Variable.Data_Quest = DailiesKojin.GetData_Quest()
	Variable.Data_Rank_Npc = DailiesKojin.GetData_Rank_Npc()
	Variable.Data_Rank_Quest = DailiesKojin.GetData_Rank()
	-------------------------- End Recup Data
	Variable.Module = 1
	------ Init BottoxLib
	--- Map for TP
	BVariable.SetMapID(Variable.MaponTp)
	BVariable.SetAethID(Variable.AethId)
	--- Step & Quest
	BStep.RemoveStep()
	BQuest.RemoveQuest()
	BUtility.SetGear(BVariable.Get_GearSet(Variable.JobList[Variable.JobIndex]))
	--- Set Assist Mode
	BCommun.SwitchMode(GetString("assistMode"))
	FFXIV_Assist_ModeIndex = 1
	gAssistFollowTarget = false
	gAssistTrackTarget = false
	gAssistUseAutoFace = true
	gStartCombat = true
	----
	gAvoidAOE = true
	----
	gAssistConfirmDuty = false
	gQuestHelpers = false
	if Variable.RankIndex ~= 1 then
		DailiesKojin.Start_Rank(Variable.Rank_Quest[Variable.RankIndex - 1][1], Variable.Rank_Quest[Variable.RankIndex - 1][2])
	end
	BDebug.Log("Start Addon", 2)
	Update.Active = true
	Variable.Break = false
end

------------------ Dailies Manager ----------
function DailiesKojin.ReturnActiveForDailiesManager(_ACTIVE)
	if _ACTIVE == nil then
		return Update.Active
	else
		Update.Active = _ACTIVE
		return Update.Active
	end
end

function DailiesKojin.StartFromDailiesManager(_NBQ)
	Variable.NbQuestIndex = _NBQ
	DailiesKojin.StartAddon()
end

function DailiesKojin.StartStopPause()
	if Update.Active == false then
		if Variable.Break == true then
			if (GUI:Button("Stop", GUI:GetWindowSize() - 19, 20)) then
				local p = Player
				if p then 
					p:Stop()
				end
				BDebug.Log("Stop", 2)
				DailiesKojin.StopAddon()
			end
			if (GUI:Button("Continue", GUI:GetWindowSize() - 19, 20)) then
				BDebug.Log("Continue", 2)
				Update.Active = true
				Variable.Break = false
			end
		else
			if (GUI:Button("Start", GUI:GetWindowSize() - 19, 20)) then
				DailiesKojin.StartAddon()
				BDebug.Log("Start", 2)
			end
		end
	else
		if (GUI:Button("Stop", GUI:GetWindowSize() - 19, 20)) then
			local p = Player
			if p then 
				p:Stop()
			end
			BDebug.Log("Stop", 2)
			DailiesKojin.StopAddon()
		end
		if (GUI:Button("Pause", GUI:GetWindowSize() - 19, 20)) then
			local p = Player
			if p then 
				p:Stop()
			end
			BDebug.Log("Pause", 2)
			Update.Active = false
			Variable.Break = true
		end
	end
end

----------------------------	[Draw]		-------------------------------------------
function DailiesKojin.Draw_Tips()
	GUI:Text("Tips :\n\nLattys Questpacks unlock all tribes!\nIt's considered as side quests.\n\nThe addon needs at least 15 fps,\nbut for more stability that\npreferable to run the game with\n30+ fps.\n\nThe addon runs a way better when\nyou're running the quests with a\nlevel 50 job, or more.\n\nFates are very difficult in solo\nif you are low level, and you will\nget aggro from too many mobs.")	
end

function DailiesKojin.Draw_QA()
	GUI:Text("\"I pressed start and it's now talking\nto a npc that doesnt give any quest\"\n\nYou're asking for quests you can't\nrun without a better rank.\nPlease select the level that fits\nwith your rank.")
	GUI:Text("\n\"My character is stuck front of the\nquest npc, and can only grabs\nred quests.\"\n\nYou still have old daily quests\nin your journal.\nFinish them first, or leave them.")
	GUI:Text("\n\"Are the rank quests included?\"\n\nYes, take a look at the rank quests\ntab, and select the one you need to\nreach the next rank.\n\nThen press Start button.")
end

function DailiesKojin.Draw_Tutorial()
	GUI:Text("Tutorial :\n\nBefore to start with Kojin quests,\nmake sure you already unlocked the \ntribe.\nWhen a tribe is unlocked, you can see \nit in the Reputation menu.\n\nYou're starting at Rank 1, and you\nwill need to repeat the quests to\nreach better ranks.\n\nSelect how many quests you want to run\n(3 maximum per day).\n\nThen press start.\n\nThe bot will stop after the quests\nare done.")	
end

function DailiesKojin.Draw_Second() -- Second Windows
	Second_Windows.DrawInside[Second_Windows.Index]()
end

function DailiesKojin.BuildJobList()
	if table.size(Variable.JobList) == 1 then
		local tmp_list = BVariable.Get_JobList(false, false, true)
		local NameList = BVariable.Get_NameJob(tmp_list)
		for id, e in pairs(NameList) do
			table.insert(Variable.JobList, e)
		end
	end
end

function DailiesKojin.Draw_First() -- First Windows
	if BottoxManager.GetCurrentAddon() ~= DailiesManager then -- Not Inside Dailies Manager
		BStyle.DrawAddonButton("Dailies Vol.9 - Kojin")
		BStyle.Draw_Space()
	end
-------------------------------------- Settings -------------------------------------------
	GUI:PushItemWidth(GUI:GetWindowSize() - 17); Variable.NbQuestIndex = GUI:Combo("##NBQuestIndex_Amal",Variable.NbQuestIndex,Variable.NbQuest_List,GUI:GetWindowSize() - 17); GUI:PopItemWidth()
	-- Recup Job List
	DailiesKojin.BuildJobList()
	GUI:PushItemWidth(GUI:GetWindowSize() - 17); Variable.JobIndex = GUI:Combo("##JobIndex_Amal",Variable.JobIndex,Variable.JobList,GUI:GetWindowSize() - 17); GUI:PopItemWidth()
	GUI:PushItemWidth(GUI:GetWindowSize() - 17); Variable.RankIndex = GUI:Combo("##RankIndex_Amal",Variable.RankIndex,Variable.Rank_List,GUI:GetWindowSize() - 17); GUI:PopItemWidth()
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Select a rank quest ONLY if you need to do it")
	end
	BStyle.Draw_Space()
	GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Addons\\DailiesVol9.png", 40, 40)
	GUI:SameLine(); GUI:Text("Updated for FFXIV 5.4\nQuests: 30/30\nRank: 1/6")
	BStyle.Draw_Space()
	if BottoxManager.GetCurrentAddon() ~= DailiesManager then -- Not Inside Dailies Manager
		GUI:Text("\"Dailies\" are daily quests that \nrequire the players to perform tasks\ndictated by various Beast Tribes.\nPlayers will not only earn experience,\ngil, items, Tomestones and ventures\nfor completing these quests, they\nwill also earn Reputation points.\nBy increasing your reputation, you\nwill gain access to the Beastmen tribe \nvendor which sells unique mounts,\nminions, furnishings and other items.")
	end
	if BottoxManager.GetCurrentAddon() ~= DailiesManager then
		BStyle.Draw_Space()
		DailiesKojin.StartStopPause()
	end
end

function DailiesKojin.Draw(event, ticks) -- Draw when Windows Open
	if Main_Windows.Open then
		BStyle.WindowStyle()
		GUI:SetNextWindowSize(Main_Windows.Size_X,Main_Windows.Size_Y)
		Main_Windows.Visible, Main_Windows.Open = GUI:Begin(Addon.Name.."##MainWindows_DailiesKojin", Main_Windows.Open, Main_Windows.Option)
		if (Main_Windows.Visible) then
			-- Draw All Windows
			for _id, _windows in pairs(Project._Windows) do
				if _windows.Used then
					_windows.Draw()
				end
			end
		end
		GUI:PopStyleColor(BStyle.GetActiveWindowsStyle())
		GUI:End()
	end
end 
RegisterEventHandler("Gameloop.Draw", DailiesKojin.Draw, Addon.Name)
