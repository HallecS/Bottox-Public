RevoltEngine = {}

local Project = {
--	--------------- Addon
	_Addon = {
		Root 		= 		"LuaMods",
		Folder 		= 		"Revolt Engine",
		Installed 	= 		true,
		Name 		=		"Revolt Engine",
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
		Name 		=		"RevoltEngine",
		Extention 	=	 	"png",
		Tooltip 	=		"Revolt Engine\n\t\tAutomated Dungeons, Trials & Raids",
	},
--	--------------- Windows
	_Windows = {
		[1] = { -- First
			Used 	= 		true,
			Draw 	= 		function () RevoltEngine.Draw_First() end,
		},
		[2] = { -- Second
			Used 	= 		true,
			Draw 	= 		function () RevoltEngine.Draw_Second() end,
			--
			Index 	=		1,
			DrawInside = {
				[1] = 		function() return RevoltEngine.Draw_Settings() end,
				[2] = 		function() return RevoltEngine.Draw_ChatLog() end,
				[3] = 		function() return RevoltEngine.Draw_SlaveMode() end,
				[4] = 		function() return RevoltEngine.Draw_Selected() end ,
				[5] = 		function() return RevoltEngine.Draw_NeededList() end,
				[6] = 		function() return RevoltEngine.Draw_TrustList() end,
			},
			Tab = {
				[1] = 		function () RevoltEngine.Bar_Settings() return end,
				[2] = 		function () RevoltEngine.Bar_ChatLog() return end,
				[3] = 		function () RevoltEngine.Bar_SlaveMode() return end,
				[4] = 		function () RevoltEngine.Bar_Selected() return end,
				[5] = 		function () RevoltEngine.Bar_List() return end,
				[6] = 		function () RevoltEngine.Bar_Trust() return end,
			},
		},
	},
--	--------------- Update
	_Update = {
		[1] = {
			Pulse = 		333,
			Timer = 		nil,
			Active = 		false,
			Pause = 		false,
		},
		[2] = {	-- Avoid
			Pulse = 		100,
			Timer = 		nil,
			Active = 		false,
			Pause = 		false,
		},
		[3] = {	-- Behevior
			Pulse = 		100,
			Timer = 		0,
			Active = 		false,
			Pause = 		false,
		},
		[4] = {	-- Move
			Pulse = 		100,
			Timer = 		nil,
			Active = 		false,
		},
	},
--	--------------- Variable
	_Variable = {
		-- Boss System
		RandomWait = nil,
		RandomSens = nil,
		-----
		ShortcutsID = 2000700,
		-----
		TeamList = nil,
		CurrentDuty = nil,
		CurrentStep = 1,
		Save_CurrentStep = nil,
		InDuty = false,
		CheckStart = true,
		Objectif = nil,
		Finish = false,
		TrustType = false,
		CheckSetting = true,
		Unsync = false,
		Squadron = false,
		Public = false,
		DataIndex = 1,
		Objectif_Table = nil,
		Timer_MoveTank_Max = 2,
		Timer_MoveTankInFight_Max = 1,
		Loot = 1,
		LootList = {"Loot Setting", "Need", "Greed", "Pass"},
		JobRange = {
			[1] = 3, -- Tank
			[2] = 4, -- Melee
			[3] = 5.5, -- Distance
			[4] = 6, -- Heal
		},
		Boss_Table = nil,
		Avoid_Data = nil,
		Animation_Data = nil,
		Buff_Data = nil,
		Casting_Data = nil,
		Argus_Data = nil,
		Casting_Boss = nil,
		Argus_Boss = nil,
		InCasting = false,
		Boss_Init = false,
		SaveLastID = {},
		TransitionZone = nil,
		InTransition = false,
		AfterShortCut = false,
		StopAvoid = false,
		NeedWait = true,
		Boss_Find = nil,
		Boss_ID = 0,
		Tmp_Percent = nil,
		RunType = {
			[1] = function() return RevoltEngine.Run_Dungeons() end, -- Dungeon
			[2] = function() return RevoltEngine.Run_Trials() end, -- Trial
			[3] = function() return RevoltEngine.Run_Raids() end, -- Raid
			[4] = function() return RevoltEngine.Run_Guildhests() end, -- Guildhest
			[5] = function() return RevoltEngine.Run_Duty() end, -- Duty (For Quest)
		},
		Timer = 0,
		PulseCheck = 0,
		CheckMax = 10,
		WaitReTag = 0,
		PulseTag = 0,
		TagMin = 75,
		TagMax = 150,
		PrioTarget = nil,
		InLoot = nil,
		EntityInSide = false,
		CurrentLoot = 0,
		WaitRoll = 0,
		AutoSymb = false,
		InBehevior = false,
		Random_Wait = 0,
		Random_Min = 3,
		Random_Max_Rapat = 4,
		Random_Max_Sprint = 9,
		Random_UseString = nil,
		RunBehevior = {
			[1] = function () return RevoltEngine.RunBehevior_Tank() end,
			[2] = function () return RevoltEngine.RunBehevior_Melee() end,
			[3] = function () return RevoltEngine.RunBehevior_Distance() end,
			[4] = function () return RevoltEngine.RunBehevior_Healer() end,
		},
		InitCast = false,
		WaitInit = 1,
		-- GUI
		MenuIndex = 1,
		VersionIndex = 1,
		VersionList = {"A Realm Reborn", "Heavensward", "Stormblood", "Shadowbringers"},
		Loaded = false,
		Size = 1,
		JobList = {"Select your job"},
		JobIndex = 1,
		NeededList = {},
		DefaultRange = 40,
		WalkingUsed = false,
		Rendering = false,
		UseReadyCheck = true,
		UseAutoRepair = true,
		RepairMode = 1,
		Repair = 1,
		RepairList = {"Gridania", "Limsa", "Ul'Dah", "Mor Dhona", "Idyllshire", "Rhalgr's Reach", "Kugane", "Crystarium", "Eulmore"},
		UseWelcomeString = false,
		WelcomeString = "Hi",
		Selected = nil,
		DutyMode = 2,
		DutyJob = nil,
		-- Trust
		SpecificTrust = false,
		TrustTankList = {
			[1] = {
				name = "Thancred",
				number = 2,
				rawdataId = 37,
			},
			[2] = {
				name = "G'Raha Tia",
				number = 6,
				rawdataId = 41,
			},
		},
		TrustTankListSelected = 1,
		TrustHealList = {
			[1] = {
				name = "Alphinaud",
				number = 0,
				rawdataId = 35,
			},
			[2] = {
				name = "Urianger",
				number = 3,
				rawdataId = 38,
			},
			[3] = {
				name = "G'Raha Tia",
				number = 6,
				rawdataId = 41,
			},
		},
		TrustHealListSelected = 1,
		TrustFirstDpsList = {
			[1] = {
				name = "Alisaie",
				number = 1,
				rawdataId = 36,
			},
			[2] = {
				name = "Y'shtola",
				number = 4,
				rawdataId = 39,
			},
			[3] = {
				name = "G'Raha Tia",
				number = 5,
				rawdataId = 40,
			},
			[4] = {
				name = "Ryne",
				number = 6,
				rawdataId = 41,
			},
		},
		TrustFirstDpsListSelected = 1,
		TrustSecondDpsList = {
			[1] = {
				name = "Alisaie",
				number = 1,
				rawdataId = 36,
			},
			[2] = {
				name = "Y'shtola",
				number = 4,
				rawdataId = 39,
			},
			[3] = {
				name = "G'Raha Tia",
				number = 5,
				rawdataId = 40,
			},
			[4] = {
				name = "Ryne",
				number = 6,
				rawdataId = 41,
			},
		},
		TrustSecondDpsListSelected = 1,
		-- Avoid
		Avoid_Function = {
			["GoAvoidView"] 			= function(_entity, _data) return RevoltEngine.Go_View_Entity(_entity) end,
			["GoAwayEntity"] 			= function(_entity, _data) return RevoltEngine.Go_Away_Entity(_entity, _data.Range, _data) end,
			["GoBehind"] 				= function(_entity, _data) return RevoltEngine.Go_Behind(_entity, _data, false) end,
			["GoBehindAll"] 			= function(_entity, _data) return RevoltEngine.Go_Behind(_entity, _data, true) end,
			["StopDpsBoss"] 			= function(_entity, _data) return RevoltEngine.Go_StopDps(_entity, _data) end,
			["GoCloseEntity"] 			= function(_entity, _data) return RevoltEngine.Go_Close_Entity(_entity, _data.Range, _data) end,
			["GoPack"] 					= function(_entity, _data) return RevoltEngine.Go_Pack(_data) end,
			["GoFromAngle"] 			= function(_entity, _data) return RevoltEngine.Go_From_Angle(_entity, _data.Range, _data.Angle) end,
			["GoSide"] 					= function(_entity, _data) return RevoltEngine.Go_Side(_entity, _data.Range, _data.Sens) end,
			["MoveThenMove"]			= function(_entity, _data) return RevoltEngine.Go_Move_Then_Move(_data) end,
			["MoveWhenBuff"] 			= function(_entity, _data) return RevoltEngine.Go_Move_When_Buff(_data) end,
			["EntityBetweenBoss"] 		= function(_entity, _data) return RevoltEngine.Go_EntityBetweenBoss(_entity, _data) end,
			["EntityCheck"] 			= function(_entity, _data) return RevoltEngine.Go_EntityCheck(_data, _entity) end,
			["MultiEntityCasting"] 		= function(_entity, _data) return RevoltEngine.Go_MultiEntityCasting(_data, _entity) end,
			["GoTargetSide"] 			= function(_entity, _data) return RevoltEngine.Go_TargetSide(_entity, _data) end,
			["GoTargetSemiSide"]		= function(_entity, _data) return RevoltEngine.Go_TargetSemiSide(_entity, _data) end,
			["GoTargetSemiSemiSide"]	= function(_entity, _data) return RevoltEngine.Go_TargetSemiSemiSide(_entity, _data) end,
			["GoTargetAngleSide"] 		= function(_entity, _data) return RevoltEngine.Go_TargetAngleSide(_entity, _data) end,
			["GoFollowTrust"] 			= function(_entity, _data) return RevoltEngine.Go_FollowTrust(_entity, _data) end,
			["GoTargetAngle"] 			= function(_entity, _data) return RevoltEngine.Go_TargetAngle(_entity, _data) end,
			["GoSpread"] 				= function(_entity, _data) return RevoltEngine.Go_Spread(_data) end,
			["FakeAvoid"] 				= function(_entity, _data) return RevoltEngine.Go_FakeAvoid(_data) end,
			["Special_Avoid"] 			= function(_entity, _data) return RevoltEngine.Go_SpecialAvoid(_data) end,
		},
		InAoe = false,
		InAnimation = false,
		InBuff = false,
		Save_Avoid_ID = nil,
		Save_Avoid_Data = nil,
		Save_Entity = nil,
		Save_Prio = nil,
		NextPulseIsAfterAvoid = false,
		ReturnPosition = nil,
		Check_Move = nil,
		Save_Counter = 1,
		NeedTimerWait = nil,
		TeamSize = nil,
		ReadyCheckDone = nil,
		Save_Pulse = nil,
		BeforeTag = true,
		WelcomeUsed = false,
		-- Spe Move
		Need_SpeMove = nil,
		LastAvoid = {},
		LastAnimation = {},
		NotDpsTarget = false,
		UnlockStopDps = false,
		Save_Position = nil,
		ReturnDone = false,
		UseCountdown = true,
		Countdown = 10,
		Trust = false,
		Save_Follow_Trust = nil,
		MoveRange = nil,
		UseLimitBreak = false,
		--
		IgnoreChest = false,
		TakeLastChest = false,
		UseTrade = false,
		StartExorcism = false,
		AutoLevel = false,
		AutoLevelDuty = false,
		StartRetainer = false,
		AutoRetainer = false,
		TradeIsDone = false,
		RetainerIsDone = false,
		--
		NeedWait = false,
		ReadyCheckDone_BeforeBoss = false,
		UseReadyCheck = false,
		CountdownUsed = false,
		Countdown = 0,
		UseCountdown = false,
		Phase = 1,
		PhaseInit = false,
		ResetAvoid = 15,
		Aoe_Boss = nil,
		Animation_Boss = nil,
		Buff_Boss = nil,
		Save_ListEntity = {},
		DistanceStop = nil,
		CurrentTask = nil,
		Distance_Tank = nil,
		Position_1 = nil,
		Position_2 = nil,
		Behevior = {
			CurrentTask = nil,
		},
		LastPosition = nil,
		Entity_WaitBefore = nil,
		MoveRange = nil,
		-- Trials
		TrialMode = 1,
		AfterInteract = false,
		--
		UseAutoEquip = false,
		AutoEquipDone = false,
		SpecialPhase = nil,
		--
		AutoDes = false,
		ListOldItems = {},
		ListNewItems = {},
		HadCreatedOldListItem = false,
		HadCreatedNewListItem = false,
		HadCheckNewItemOnList = false,
		DesIsDone = false,
		IsAfter = false,
		SaveCheck_Movement = nil,
		Save_MoveThenMove_Index = nil,
		--
		Raid24_Index = 0,
		InitFormation = false,
		WallMoob = {6999, 7001},
		SavePhase = nil,
		SaveBossEntity = nil,
		--
		InTakeAndDrop = false,
		TakeCoord = nil,
		DropCoord = nil,
		EntityToTake = nil,
		SoloDuty = false,
		WaitGuild = 15,
		LastTankDistance = 0,
		--
		CountSpecialMove = 1,
		TargetSpeMove = nil,
		SaveMove = nil,
		InsideArgus = false,
		WaitReturnArgus = nil,
		--
		RouletteData = {
			[202] = {
				{ -- Ifrit
					-- Info Detect
					Type = "HP_Boss",
					ID = 1185,
					Value = 13884,
					-- Data
					Info = function() return Bottox_Ifrit.Get_Info() end,
					Data = function() return Bottox_Ifrit.Get_Data_Normal() end,
					Boss = function() return Bottox_Ifrit.Get_Boss_Duty() end,
				},
				{ -- Ifrit HM
					-- Info Detect
					Type = "HP_Boss",
					ID = 1185,
					Value = 321831,
					-- Data
					Info = function() return Bottox_IfritHM.Get_Info() end,
					Data = function() return Bottox_IfritHM.Get_Data_Normal() end,
					Boss = function() return Bottox_IfritHM.Get_Boss_Duty() end,
				},
		 	},
			[332] = {
				{ -- Cap vendouest
					-- Data
					Info = function() return Bottox_Westwind.Get_Info() end,
					Data = function() return Bottox_Westwind.Get_Data_Normal() end,
					Boss = function() return Bottox_Westwind.Get_Boss_Duty() end,					
				}
			},
			[884] = {
				{ -- Grand Cosmos
					-- Data
					Info = function() return Bottox_Cosmos.Get_Info() end,
					Data = function() return Bottox_Cosmos.Get_Data_Speed() end,
					Boss = function() return Bottox_Cosmos.Get_Boss_Duty() end,					
				}
			},
			[898] = {
				{ -- Anamnesis
					-- Data
					Info = function() return Bottox_Anamnesis.Get_Info() end,
					Data = function() return Bottox_Anamnesis.Get_Data_Speed() end,
					Boss = function() return Bottox_Anamnesis.Get_Boss_Duty() end,					
				}
			},
		},
		-- SlaveMode
		ActiveSlaveMode = false,
		DataByMapId = {
			[150] = function() return Bottox_Keeper end,
			[157] = function() return Bottox_Sastasha end,
			[158] = function() return Bottox_Brayflox end,
			[159] = function() return Bottox_Wanderers end,
			[160] = function() return Bottox_Sirius end,
			[161] = function() return Bottox_Copperbell end,
			[162] = function() return Bottox_Halatali end,
			[163] = function() return Bottox_Qarn end,
			[164] = function() return Bottox_Tamtara end,
			[166] = function() return Bottox_Haukke end,
			[167] = function() return Bottox_AmdaporKeep end,
			[168] = function() return Bottox_StoneVigil end,
			[169] = function() return Bottox_Totorak end,
			[170] = function() return Bottox_Cutter end,
			[171] = function() return Bottox_Dzemael end,
			[172] = function() return Bottox_Aurum end,
			[188] = function() return Bottox_WanderersHM end,
			[349] = function() return Bottox_Copperbell_Mines_Hard end,
			[350] = function() return Bottox_HaukkeHM end,
			[360] = function() return Bottox_HalataliHM end,
			[362] = function() return Bottox_BrayfloxHM end,
			[367] = function() return Bottox_Sunken_Temple_Qarn_HM end,
		 	[371] = function() return Bottox_Snow end,
			[387] = function() return Bottox_SastashaHard end,
			[416] = function() return Bottox_Gubal end,
		 	[421] = function() return Bottox_Vault end,
		 	[430] = function() return Bottox_Fractal end,
		 	[434] = function() return Bottox_Dusk end,
			[435] = function() return Bottox_Aery end,
			[438] = function() return Bottox_Aetherochemical end,
		 	[441] = function() return Bottox_SohmAl end,
		 	[511] = function() return Bottox_Arboretum end,
		 	[516] = function() return Bottox_Antitower end,
		 	[557] = function() return Bottox_HullbreakerHM end,
		 	[616] = function() return Bottox_Shisui end,
		 	[617] = function() return Bottox_SohmAlHard end,
		 	[623] = function() return Bottox_Bardam end,
		 	[626] = function() return Bottox_Sirensong end,
		 	[660] = function() return Bottox_Doma end,
		 	[661] = function() return Bottox_Castrum_Abania end,
		 	[662] = function() return Bottox_Kugane end,
			[689] = function() return Bottox_Alamhigo end,
			[731] = function() return Bottox_Skalla end,
			[742] = function() return Bottox_Hell end,
			[768] = function() return Bottox_Swallow end,
			[789] = function() return Bottox_Burn end,
			[788] = function() return Bottox_ArboretumHard end,
			[793] = function() return Bottox_Ghimlyt end,
			[821] = function() return Bottox_Dohnmheg end,
			[822] = function() return Bottox_Gulg end,
			[823] = function() return Bottox_Qitana end,
			[836] = function() return Bottox_Malikah end,
			[837] = function() return Bottox_Holminster end,
			[838] = function() return Bottox_Amaurot end,
			[840] = function() return Bottox_Twinning end,
		 	[841] = function() return Bottox_Akadaemia end,
			[884] = function() return Bottox_Cosmos end,
			[898] = function() return Bottox_Anamnesis end,
			[916] = function() return Bottox_Norvrandt end,
			[933] = function() return Bottox_Matoya end,
			[938] = function() return Bottox_Paglth end,
		},
	},
--	--------------- Data
	_Data = {},
}

----------------------------	[Set/Shortcuts]	-------------------------------------------
local Menu = 				Project._Menu
local Icone = 				Project._Icone
local Addon =				Project._Addon
local Main_Windows =		Project._Windows[1]
local Second_Windows =		Project._Windows[2]
local Update = 				Project._Update[1]
local AvoidUpdate = 		Project._Update[2]
local BeheviorUpdate = 		Project._Update[3]
local MoveUpdate = 			Project._Update[4]
local Variable = 			Project._Variable
local Data = 				Project._Data
local Behevior = 			Project._Variable.Behevior

----------------------------	[Bar Windows]	-------------------------------------------
function RevoltEngine.Bar_Settings()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_Settings##RevoltEngine", 1, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tool.png", 16, 16, "Settings 1/2", Second_Windows.Index)
end

function RevoltEngine.Bar_ChatLog()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_ChatLog##RevoltEngine", 2, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tool.png", 16, 16, "Settings 2/2", Second_Windows.Index)
end

function RevoltEngine.Bar_SlaveMode()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_SlaveMode##RevoltEngine", 3, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\SlaveMode.png", 16, 16, "Slave Mode", Second_Windows.Index)
end

function RevoltEngine.Bar_List()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_List##RevoltEngine", 5, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\List.png", 16, 16, "List", Second_Windows.Index)
end

function RevoltEngine.Bar_Selected()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_Selected##RevoltEngine", 4, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Faq.png", 16, 16, "Duty Info", Second_Windows.Index)
end

function RevoltEngine.Bar_Trust()
	Second_Windows.Index = BStyle.DrawImageButton("Bar_Trust##RevoltEngine", 6, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Trust.png", 16, 16, "Trust Info", Second_Windows.Index)
end

----------------------------	[Set/Get]	-------------------------------------------
function RevoltEngine.Get_Icone() -- Used by Bottox Manager
	return Icone
end

function RevoltEngine.Get_Addon() -- Used by Bottox Manager
	return Addon
end

function RevoltEngine.Get_BarList() -- Used by Bottox Manager
	return Second_Windows.Tab
end

function RevoltEngine.Get_Second_Used() -- Used by Bottox Manager
	return Second_Windows.Used
end

----------------------------	[Bottox Manager]	-------------------------------------------
function RevoltEngine.SwitchOpen() -- Used by Bottox Manager
	Main_Windows.Open = not Main_Windows.Open
end

function RevoltEngine.GetAddonStarted()
	return Update.Active
end

function RevoltEngine.Get_CurrentStep()
	return Variable.CurrentStep
end

function RevoltEngine.Set_CurrentStep(_nb)
	Variable.CurrentStep = _nb
end

function RevoltEngine.Set_Settings(_index, _value)
	if Variable[_index] ~= nil then
		if _index == "WelcomeString" then
			Variable[_index] = tostring(_value)
		else
			Variable[_index] = _value
		end
		return true
	end
	return false
end

function RevoltEngine.Get_Settings(_index)
	if Variable[_index] ~= nil then
		return Variable[_index]
	end
	return nil
end

----------------------------	[Function]	-------------------------------------------
function RevoltEngine.Reset_Behevior()
	Behevior.CurrentTask = nil
end

function RevoltEngine.Reset_Boss()
	Variable.RandomWait = nil
	Variable.RandomSens = nil
	--
	Variable.InBehevior = false
	Variable.Boss_Init = false
	Variable.Boss_Find = nil
	Variable.Boss_ID = 0
	Variable.NeedWait = true
	Variable.PrioTarget = nil
	Variable.Tmp_Percent = nil
	Variable.Need_SpeMove = nil
	Variable.NotDpsTarget = false
	Variable.UnlockStopDps = false
	Variable.Save_Position = nil
	Variable.Phase = 1
	Variable.PhaseInit = false
	Variable.Aoe_Boss = nil
	Variable.Animation_Boss = nil
	Variable.Buff_Boss = nil
	Variable.Casting_Boss = nil
	Variable.Argus_Boss = nil
	Variable.Save_ListEntity = {}
	Variable.AfterInteract = false
	Variable.InitCast = false
	Variable.SpecialPhase = nil
	Variable.Save_MoveThenMove_Index = nil
	Variable.SavePhase = nil
	Variable.SaveBossEntity = nil
	--
	BVariable.Set_MeshMove(nil)
end

function RevoltEngine.Reset_Avoid(_fullreset)
	-- Reset Avoid Variable
	Variable.Save_Avoid_ID = nil
	Variable.Save_Avoid_Data = nil
	Variable.Save_Entity = nil
	Variable.Save_Prio = nil
	--
	Variable.SaveLastID = nil 
	Variable.SaveLastID = {}
	--
	Variable.Entity_WaitBefore = nil
	--
	Variable.NextPulseIsAfterAvoid = false
	Variable.ReturnPosition = nil
	Variable.IsAfter = false
	Variable.StopAvoid = false
	--
	--
	Variable.Check_Move = nil
	Variable.MoveRange = nil
	Variable.DistanceStop = nil
	--
	Variable.CurrentTask = nil
	Variable.Distance_Tank = nil
	Variable.EntityInSide = false
	Variable.SaveMove = nil
	Variable.InsideArgus = false
	Variable.WaitReturnArgus = nil
	-- Reset Wait
	Variable.Save_Pulse = nil
	Variable.Save_Counter = 1
	BUtility.ResetWait("MoveThenMove")
	BUtility.ResetWait("MoveThenMove-WaitBefore")
	Variable.NeedTimerWait = nil
	BUtility.ResetWait("Entity_WaitBefore")
	BUtility.ResetWait("Wait_WhenAnimationFinish")
	BUtility.ResetWait("WaitDuringUntil")
	BUtility.ResetWait("WaitBeforeReturn")
	BUtility.ResetWait("AvoidSystem")
	--
	if _fullreset then
		-- Need Here ? sure not before
		Variable.InAoe = false
		Variable.InBuff = false
		Variable.InAnimation = false
		Variable.InCasting = false
		--
		Variable.LastAnimation = nil
		Variable.LastAnimation = {}
		Variable.LastAvoid = nil
		Variable.LastAvoid = {}
		--
		Variable.Save_Follow_Trust = nil
		--
		Variable.InTakeAndDrop = false
		Variable.TakeCoord = nil
		Variable.DropCoord = nil
		Variable.EntityToTake = nil
	end
end

function RevoltEngine.Reset_Death()
	Variable.InTransition = false
	Variable.AfterShortCut = false
	RevoltEngine.Reset_Boss()
	-- Reset Target & Step
	BTarget.RemoveEntityInTarget()
end

function RevoltEngine.Reset_NewRun()
	-- Bottox
	BTarget.RemoveEntityInTarget()
	BStep.RemoveStep()
	--
	Variable.CheckStart = true
	Variable.BeforeTag = true
	Variable.CurrentStep = 1
	Variable.Save_CurrentStep = nil
	Variable.Objectif = nil
	Variable.Finish = false
	Variable.PulseCheck = 0
	Variable.PulseTag = 0
	Variable.Random_Wait = 0
	Variable.WaitReTag = 0
	Variable.CheckSetting = true
	Variable.Timer = 0
	Variable.Timer_MoveTank = 3
	Variable.NeedTakeAggro = false
	Variable.WelcomeUsed = false
	Variable.Random_UseString = nil
	Variable.NeedWait = false
	Variable.TeamList = nil
	Variable.AutoEquipDone = false
	Variable.TradeIsDone = false
	Variable.WalkingUsed = false
	Variable.RetainerIsDone = false
	Variable.DesIsDone = false
	Variable.InitFormation = false
	Variable.MoveRange = nil
	Variable.CountSpecialMove = 1
	Variable.TargetSpeMove = nil
	--
	BUtility.ResetWait("InitFirstAction2")
	Exorcism.ResetVariableCollecTrade()
	--
	RevoltEngine.Reset_Boss()
	-- Debug
	d("Reset NewRun")
end

function RevoltEngine.ResetVariable()
	-- Data
	Variable.TransitionZone = RevoltEngine.Get_TransitionZone()
	Variable.Avoid_Data = RevoltEngine.Get_Avoid_Data()
	Variable.Animation_Data = RevoltEngine.Get_Animation_Data()
	Variable.Buff_Data = RevoltEngine.Get_Buff_Data()
	Variable.Casting_Data = RevoltEngine.Get_Casting_Data()
	Variable.Argus_Data = RevoltEngine.Get_Argus_Data()
	-- Variable
	Variable.CurrentDuty = nil
	Variable.InDuty = false
	Variable.TeamSize = nil
	Variable.ReadyCheckDone = nil
	Variable.CountWasDown = false
	Variable.StartRetainer = false
	Variable.StartExorcism = false
	Variable.SoloDuty = false
	Variable.WaitGuild = 15
	--
	d("Reset Variable")
	RevoltEngine.Reset_NewRun()
	RevoltEngine.Reset_Death()
	RevoltEngine.Reset_Avoid(true)
end

function RevoltEngine.ResetAutoDes()
	Variable.DesIsDone = false
	Variable.HadCreatedOldListItem = false
	Variable.ListOldItems = {}
	Variable.HadCreatedNewListItem = false
	Variable.ListNewItems = {}
	Variable.HadCheckNewItemOnList = false
end

function RevoltEngine.SwitchToDesAddon()
	d("SwitchToDesAddon")
	if Variable.DesIsDone == false then
		if BCommun.EmptySlotInInventory() > 2 then
			if Exorcism.GetNeedList() ~= 0 then
				d("DESYNTH !")
				BottoxManager.SetCurrentAddon(Exorcism)
				Exorcism.DesynthItem()
				return true
			else
			Variable.DesIsDone = true
			end
			BottoxManager.SetCurrentAddon(RevoltEngine)
			return true
		else
			d("Inventory is FULL ! I can't desynth.")
			Variable.DesIsDone = true
			BottoxManager.SetCurrentAddon(RevoltEngine)
			return true
		end
	end
	return false
end

function RevoltEngine.SwitchToExorcismAddon()
	if Variable.TradeIsDone == false then
		if not Variable.StartExorcism then
			d("SwitchToExorcismAddon")
			Exorcism.InitListCollecTrade()
			Variable.StartExorcism = true
			BCommun.RunMinion(false, "switch Exorcism 1")
		end	
		if Exorcism.GetDoingCollecTrade() == false then
			d("NPC Trades - Exorcism OFF")
			Variable.TradeIsDone = true		
			BCommun.RunMinion(false, "switch Exorcism 2")
		else
			Exorcism.CollecTrade()
		end
		return true
	end
	return false
 end

 function RevoltEngine.SwitchToRetainerAddon()
	 if Variable.RetainerIsDone == false then
		if not Variable.StartRetainer then
			d("SwitchToRetainersAddon")
			Exorcism.RetainerInitList()
			Variable.StartRetainer = true
			BCommun.RunMinion(false, "switch Retainer 1")
			BottoxManager.SetCurrentAddon(Exorcism)
		end	
		if Exorcism.GetDoingRetainer() == false then
			d("Auto-Retainer OFF")
			Variable.RetainerIsDone = true	
			BCommun.RunMinion(false, "switch Retainer 2")
			BottoxManager.SetCurrentAddon(RevoltEngine)
		else
			Exorcism.RetainerDoYourJob()
		end
		return true
	end
	return false
 end

----------------------------	[Argus]		-------------------------------------------
function RevoltEngine.AvoidCircle_Argus(_aoe, _data, _angle)
	local AoePosition = {
		x = _aoe.x,
		y = _aoe.y,
		z = _aoe.z,
	}
	local AoeRange = _aoe.aoeLength
	if _data.OnTarget then
		if _aoe.targetAttach then
			local entity = BTarget.FindEntity(_aoe.targetAttach)
			if table.valid(entity) then
				AoePosition = entity.pos
				AoeRange = _data.OnTarget
			end
		end
	end
	if _data.AddRange then
		AoeRange = AoeRange + _data.AddRange
	end
	-- Go Math
	local _PlayerPosition = Player.pos
	local Vecteur_Target_Player = {
		x = _PlayerPosition.x - AoePosition.x,
		z = _PlayerPosition.z - AoePosition.z,
	}
	local Norme_Vecteur_Target_Player = math.sqrt((Vecteur_Target_Player.x * Vecteur_Target_Player.x)
												+ (Vecteur_Target_Player.z * Vecteur_Target_Player.z))
	if Norme_Vecteur_Target_Player <= AoeRange then
		local Distance = AoeRange + 1.5
		local _newposition = {
			x = AoePosition.x + ( Vecteur_Target_Player.x * Distance / Norme_Vecteur_Target_Player),
			y = (AoePosition.y + _PlayerPosition.y) / 2,
			z = AoePosition.z + ( Vecteur_Target_Player.z * Distance / Norme_Vecteur_Target_Player),
		}
		-- Angle
		local angle = -1.5708
		if _angle then
			angle = _angle
		end
		_newposition = BMath.AngleFromPosition(_newposition, angle)
		local closest = NavigationManager:GetClosestPointOnMesh(_newposition)
		if 	Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, closest.x, closest.y, closest.z) <=
			(Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, _newposition.x, _newposition.y, _newposition.z) - 0.2) then
			-- Error -> change angle
			if angle ~= 1.5708 then
				angle = 1.5708
				-- New avoid with angle
				return RevoltEngine.AvoidCircle_Argus(_aoe, _data, angle)
			end
		end
		-- Got Avoid Position
		Variable.InsideArgus = true
		if _data.WaitReturn then
			Variable.WaitReturnArgus = _data.WaitReturn
		end
		Variable.MoveRange = 0.8
		Variable.Need_SpeMove = _newposition
		return true
	else
		return false
	end
end

function RevoltEngine.CheckAvoid_Argue(_aoe, _data)
	local FunctionTab = {
		[2] = function(_aoe) return RevoltEngine.AvoidCircle_Argus(_aoe,_data) end,
	}
	if FunctionTab[_aoe.aoeCastType] then
		return FunctionTab[_aoe.aoeCastType](_aoe, _data)
	end
end

function RevoltEngine.Got_Argus(_data)
	if Argus and table.valid(_data) then
		if table.valid(Variable.Argus_Boss) then
			_data = Variable.Argus_Boss
		end
		--
		local GroundAoe = Argus.getCurrentGroundAOEs()
		if table.valid(GroundAoe) then
			for id, e in pairs(GroundAoe) do
				if table.valid(_data) then
					for iid, ie in pairs(_data) do
						if ie.ID == e.aoeID then
							-- Check Priority
							local Prio_Data = 1
							if ie.Priority then
								Prio_Data = ie.Priority
							end
							local Prio_Task = 0
							if table.valid(Variable.CurrentTask) then
								Prio_Task = Variable.CurrentTask.Priority
							end
							if Prio_Data > Prio_Task then
								if not Variable.Need_SpeMove then
									if RevoltEngine.CheckAvoid_Argue(e, _data) then
										Variable.NextPulseIsAfterAvoid = true
									else
										Variable.NextPulseIsAfterAvoid = false
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return
end

----------------------------	[Move]		-------------------------------------------
function RevoltEngine.Check_SpeMove()
	-- Check If player can move
	if BAction.HaveBuff(608) or BAction.HaveBuff(1153) then -- Sastasha Hard 2eme Boss Add
		d("SpeMove Reset -> Got Buff")
		Variable.Need_SpeMove = nil
		return false
	end
	--
	local Range = 1.2
	-- Check FollowTrust
	if table.valid(Variable.Save_Follow_Trust) then
		Variable.Need_SpeMove = Variable.Save_Follow_Trust.pos
		Range = 0.5
	end
	if table.valid(Variable.CurrentTask) then
		if Variable.CurrentTask.Type == "GoTargetSide" and (Variable.CurrentTask.Sens or Variable.CurrentTask.Refresh) then
			RevoltEngine.Go_TargetSide(Variable.CurrentTask.Entity, Variable.CurrentTask)
		end
	end
	if Variable.InBehevior then
		local TankEntity = RevoltEngine.GotTankEntity()
		if (Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, TankEntity.pos.x, TankEntity.pos.y, TankEntity.pos.z) <= (Variable.InBehevior.range - 2)) and (Variable.InBehevior:IsReady(TankEntity.id) or (Variable.InBehevior.cost >= Player.mp.current) or Variable.InBehevior.isoncd) then
			d("Behevior - Spe Move Finish")
			Player:Stop()
			Variable.Need_SpeMove = nil
			Variable.InBehevior = false
			return true
		end
	end
	if Variable.CurrentTask then
		if not Variable.CurrentTask.WaitBeforeDone then
			local Wait = 0
			if Variable.CurrentTask.WaitBefore then
				Wait = Variable.CurrentTask.WaitBefore
			end
			if BUtility.Wait(Wait, "AvoidSystem") then
				Variable.CurrentTask.WaitBeforeDone = true
				if Variable.SaveMove then
					Variable.Need_SpeMove = Variable.SaveMove
					Variable.SaveMove = nil
				end
			else
				d("Avoid System -> Wait Before")
				if Variable.CurrentTask.ActiveArgusDuringWait then
					Variable.SaveMove = Variable.Need_SpeMove
					RevoltEngine.Got_Argus(RevoltEngine.Get_Argus_Data())
				end
				return true
			end
		end
	end
	if Variable.Entity_WaitBefore then
		if BUtility.Wait(Variable.Entity_WaitBefore, "Entity_WaitBefore") then
			Variable.Entity_WaitBefore = nil
		end
		return false
	end
	if table.valid(Variable.Need_SpeMove) then
		-- Check OnMesh
	--	d("Before Closest Point = ")
	--	d(Variable.Need_SpeMove)
		Variable.Need_SpeMove = NavigationManager:GetClosestPointOnMesh(Variable.Need_SpeMove)
	--	d("After Closest Point = ")
	--	d(Variable.Need_SpeMove)
		if not table.valid(Variable.Need_SpeMove) then
			d("SpeMove Reset -> GetClosestPoint Fail")
			Variable.Need_SpeMove = nil
			return false
		end
		Variable.Need_SpeMove.y = Player.pos.y
		d("Move To { x = "..Variable.Need_SpeMove.x..", y = "..Variable.Need_SpeMove.y..", z = "..Variable.Need_SpeMove.z)
		--
		if table.valid(Variable.CurrentTask)  then
			if Variable.CurrentTask.MoveRange then
				Range = Variable.CurrentTask.MoveRange
			end
		end
		if Variable.MoveRange then
			Range = Variable.MoveRange
		end
		if Variable.Save_Pulse then
			Variable.Save_Pulse = Variable.Save_Pulse + 1
		end
		--
		if table.valid(Variable.CurrentTask)  then
			if Variable.CurrentTask.WalkToDistance then
				if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, Variable.Need_SpeMove.x, Variable.Need_SpeMove.y, Variable.Need_SpeMove.z) <= Variable.CurrentTask.WalkToDistance then
					-- Go Walk -> or not (no function)
					if not Variable.WalkingUsed then
						PressKey(0x6F)
						Variable.WalkingUsed = true
					end
				end
			end
		end
		--
		NavigationManager:ResetPath()
		if BMovement.doMoveToPosition(Variable.Need_SpeMove, Range) then
			d("Spe Move Finish")
			--
			if Variable.WalkingUsed then
				PressKey(0x6F)
				Variable.WalkingUsed = false
			end
			 -- Need Run Fast -> Cut Cast (Need Add cancel cast ?)
			-- Check wait argus
			if Variable.InsideArgus then
				BCommun.RunMinion(true, "MinionArgusStart_SpeMove")
				local Wait = 5
				if Variable.WaitReturnArgus then
					Wait =  Variable.WaitReturnArgus
				end
				if not BUtility.Wait(Wait, "WaitArgus") then
					return true
				else
					Variable.InsideArgus = false
					Variable.WaitReturnArgus = nil
				end
			end
			Variable.Need_SpeMove = nil
		else
			-- Need Move
			-- Stop Casting
			ActionList:StopCasting() -- Testing
		end
		-- Safe Check
		if BUtility.Wait(50, "SaveCheck_Movement") then -- 5sec
			if (Player.pos == Variable.SaveCheck_Movement) and Player:IsMoving() then
				-- Error ?
				d("SpeMove -> Save Check Actived")
				Variable.Need_SpeMove = nil
				Variable.MoveRange = nil
			end
			Variable.SaveCheck_Movement = nil
		else
			if not Variable.SaveCheck_Movement then
				Variable.SaveCheck_Movement = Player.pos
			end
		end
		return true
	end
	return false
end

function RevoltEngine.MoveUpdate(Event, ticks)
	if (not MoveUpdate.Timer or ticks - MoveUpdate.Timer > MoveUpdate.Pulse) then
		if not MoveUpdate.Timer then
			MoveUpdate.Timer = ticks
		else
			MoveUpdate.Timer = MoveUpdate.Timer + MoveUpdate.Pulse
		end
		if MoveUpdate.Active == true then
			------------
			if Variable.Need_SpeMove then
				if Player:IsMoving() then
					if (Player.role == 2) then
						BCommun.RunMinion(false, "MoveUpdate 1")
					end
				else
					BCommun.RunMinion(true, "MoveUpdate 2")
				end
				RevoltEngine.Check_SpeMove()
			end
			------------
		end
	end	
	return
end
RegisterEventHandler("Gameloop.Update", RevoltEngine.MoveUpdate, Addon.Name)
----------------------------	[End Move]		-------------------------------------------

----------------------------	[Behevior]		-------------------------------------------
function RevoltEngine.ActiveRaise(_target)
	local _action = RevoltEngine.RecupForJob(Player.job)
	if not BAction.HaveBuff(148, _target) then
		if BAction.UseAction(1, _action.Raise, _target.id) then
			d("Behevior Healer -> Raise ".._target.name)
			return true
		end
	end
	return false
end

function RevoltEngine.RecupForJob(_job)
	local Tab = {
		[1] = { -- Gladiateur
			Aoe_Aggro = 7381,
			Distance_Aggro = 24,
			Protection = 7531,
		},
		[3] = { -- Maraudeur
			Aoe_Aggro = 41,
			Distance_Aggro = 46,
			Protection = 7531,
		},
		[6] = { -- Conjurer
			-- Heal
			Heal_Solo = {135, 120}, 		-- Extra Soin / Soin
			Heal_Aoe = {124}, 				-- Medica
			-- Regen
			Regen_Aoe = 133, 				-- Extra Medica
			Regen_Aoe_Buff = 150, 			-- Extra Medica
			--
			Raise = 125,						-- Raise
			--
			Dispel = 7568, 					-- Esuna
		},
		[19] = { -- Paladin
			Aoe_Aggro = 7381,
			Distance_Aggro = 24,
			UnDeadSkill = 30,
			Protection = 7531,
		},
		[20] = { -- MONK
			Protection = 9639,
		},
		[21] = { -- Warrior
			Aoe_Aggro = 41,
			Distance_Aggro = 46,
			Protection = 7531,
		},
		[23] = { -- BARD
			Protection = 7405,
		},
		[24] = { -- White Mage
			-- Heal
			Heal_Solo = {135, 120}, 		-- Extra Soin / Soin
			Heal_Aoe = {124}, 				-- Medica
			Heal_Instant = {3570}, 			-- Tetragramme
			-- Regen
			Regen_Solo = 137, 				-- Récup
			Regen_Solo_Buff = 158,			-- Recup
			Regen_Aoe = 133, 				-- Extra Medica
			Regen_Aoe_Buff = 150, 			-- Extra Medica
			--
			Raise = 125,						-- Raise
		},
		[26] = { -- Arcanist
			Raise = 173,				-- Raise
		},
		[27] = { -- Summoner
			Raise = 173,				-- Raise
		},
		[28] = { -- Erudit
			-- Heal
			Heal_Solo = {190}, 				-- Médecine
			Heal_Aoe = {3583}, 				-- Traité Persévérance
			Heal_Instant = {189}, 			-- Loi de revivification
			-- Shield
			Shield_Solo = 185, 				-- Traité Réconfort
			Shield_Aoe = 186,				-- Traité soulagement
			Shield_Buff = 297,				-- Champ nocturne
			--
			Dispel = 7568, 					-- Esuna
			Protection = 8905,
			--
			Raise = 173,						-- Raise
		},
		[31] = { -- MACHI
			Protection = 18934,
		},
		[32] = { -- Dark knight
			Aoe_Aggro = 3621,
			Distance_Aggro = 3624,
			Protection = 7531,
		},
		[33] = { -- Astromancien
			-- Heal
			Heal_Solo = {3610, 3594}, 		-- Bienfaisance II / Bienfaisance
			Heal_Aoe = {3600}, 				-- Hélios
			Heal_Instant = {7445, 3614}, 	-- Reine des couronnes / Dignité essentielle
			-- Stance
			Regen_Stance = 839, 			-- Thème diurne
			Shield_Stance = 840, 			-- Thème nocturne
			-- Regen
			Regen_Solo = 3595, 				-- Bienfaisance Aspect
			Regen_Solo_Buff = 835,			-- Bienfaisance Aspect
			Regen_Aoe = 3601, 				-- Hélios aspect
			Regen_Aoe_Buff = 836, 			-- Hélios aspect
			-- Shield
			Shield_Solo = 3595, 			-- Bienfaisance Aspect
			Shield_Aoe = 3601,				-- Hélios aspect
			Shield_Buff = 837,				-- Champ nocturne
			--
			Dispel = 7568, 					-- Esuna
			-- Card
			Protection = 3595,
			--
			Raise = 3603,						-- Raise
		},
		[34] = { -- SAMU
			Protection = 7498,
		},
		[37] = { -- GunBreaker
			Aoe_Aggro = 16141,
			Distance_Aggro = 16143,
			Protection = 7531,
		},
		[38] = { -- DANCER
			Protection = 16012,
		},
	}
	return Tab[_job]
end

function RevoltEngine.RecupStanceMode(_action, _job)
	if _job == 33 then
		if BAction.HaveBuff(_action.Regen_Stance) then
			return "Regen"
		end
		if BAction.HaveBuff(_action.Shield_Stance) then
			return "Shield"
		end
	end
	if _job == 28 then
		return "Shield"
	end
	if (_job == 6) or (_job == 24) then
		return "Regen"
	end
	return nil
end

function RevoltEngine.GotTankEntity()
	local el = nil
	if Variable.Squadron or Variable.Trust then
		el = BTarget.EntityByOption("chartype=9")
	else
		el = BTarget.EntityByOption("myparty")
	end
	if table.valid(el) then
		for id, e in pairs(el) do
			if (e.job == 19) or (e.job == 21) or (e.job == 32) or (e.job == 1) or (e.job == 3) or (e.job == 37) then
				return e
			end
		end
	end
	return nil
end

function RevoltEngine.Behevior_CheckAggro(_tank)
	if Variable.Boss_Find then
		local el = BTarget.EntityByOption("Aggro")
		if table.valid(el) then
			for id, e in pairs(el) do
				if e.aggropercentage == 100 then
					-- Got Aggro
					RevoltEngine.Go_From_Angle(_tank, 3, 3.14159)
				end
			end
		end
	end
end

function RevoltEngine.RunBehevior_Tank()
	--
	if Variable.CurrentDuty.Type == 3 then
		BeheviorUpdate.Pulse = 100
		return true
	end
	--
	local _action = RevoltEngine.RecupForJob(Player.job)
	if table.valid(_action) then
		local el = BTarget.EntityByOption("maxdistance=40,aggro,targetable,alive")
		if table.valid(el) then
			local tab_close = {}
			local tab_ranged = {}
			for id, e in pairs(el) do
				if e.aggropercentage ~= 100 then
					if e.distance <= 5 then
						d("2.1 - "..e.name)
						table.insert(tab_close, e)
					else
						if e.distance <= 25 then
							d("2.2 - "..e.name)
							table.insert(tab_ranged, 1, e)
						end
					end
				end
			end
	d("3")
			-- Check Table
			if table.size(tab_close) >= 1 then
				-- Change Target
				if not Variable.Boss_Find and not Variable.PrioTarget then
					d("4")
					BTarget.SetEntityInTarget(tab_close[1])
				end
				--[[
				BeheviorUpdate.Pulse = 1
				if Player.job == 3 or Player.job == 21 then
					if BAction.IsActionReady(1, _action.Aoe_Aggro, tab_close[1].id) then
						d("5")
						BAction.UseAction(1, _action.Aoe_Aggro, tab_close[1].id)
					end
				else
					d("6")
					if BAction.IsActionReady(1, _action.Aoe_Aggro) then
						d("Behevior Tank [Flash/Unleashed/Domination]")
						BAction.UseAction(1, _action.Aoe_Aggro)
					end
				end
				]]
				return false
			end
			if table.size(tab_ranged) >= 1 then
				-- Change Target
				if not Variable.Boss_Find and not Variable.PrioTarget then
					d("4")
					BTarget.SetEntityInTarget(tab_ranged[1])
				end
				--[[
				BeheviorUpdate.Pulse = 1
				d("8")
				if BAction.IsActionReady(1, _action.Distance_Aggro, tab_ranged[1].id) then
					d("Behevior Tank [Distant Aggro casted] -> "..tab_ranged[1].name)
					BAction.UseAction(1, _action.Distance_Aggro, tab_ranged[1].id)
				end
				]]
				return false
			end
		end
		if Player.incombat then
			if Player.hp.percent <= 10 then
				if _action.UnDeadSkill then
					if BAction.IsActionReady(1, _action.UnDeadSkill) then
						-- Use Invincible
						BeheviorUpdate.Pulse = 1
						BAction.UseAction(1, _action.UnDeadSkill)
						return false
					end
				end
			end
		end	
	end
	BeheviorUpdate.Pulse = 100
	return true
end

function RevoltEngine.Behevior_Healer_CheckTeam(_team)
	local _action = RevoltEngine.RecupForJob(Player.job)
	local Tab = {}
	local SommeHp = 0
	for id, e in pairs(_team) do
		local Tmp = {
			Entity = e,
			Hp_percent = e.hp.percent,
		}
		SommeHp = SommeHp + e.hp.percent
		table.insert(Tab, Tmp)
	end
	SommeHp = SommeHp / table.size(_team)
	if SommeHp <= 60 then
		for id, e in pairs(_action.Heal_Aoe) do
			if BAction.UseAction(1, e) then
				d("Behevior Healer -> Team <= 60% -> AoE Heal done")
				return true
			end
		end
	end
	for id, e in pairs(Tab) do
		if e.Hp_percent <= 75 then
			local Stance = RevoltEngine.RecupStanceMode(_action, Player.job)
			if type(Stance) == "string" then
				if Stance == "Regen" then
					-- Last -> Regen
					if _action.Regen_Solo then
						if not BAction.HaveBuff(_action.Regen_Solo_Buff, e) then
							if BAction.UseAction(1, _action.Regen_Solo, e.id) then
								d("Behevior Healer -> Team <= 87% -> Regen done")
								return true
							end
						end
					end
				else -- Shield
					if _action.Shield_Solo then
						if not BAction.HaveBuff(_action.Shield_Buff, e) then
							if BAction.UseAction(1, _action.Shield_Solo, e.id) then
								d("Behevior Healer -> Team <= 87% -> Shield done")
								return true
							end
						end
					end
				end
			end			
		end
		if e.Hp_percent <= 50 then
			if _action.Heal_Instant then
				for iid, ie in pairs(_action.Heal_Instant) do
					if BAction.UseAction(1, ie, e.id) then
						d("Behevior Healer -> Team <= 60% -> Instant Heal done")
						return true
					end
				end
			end
			for iid, ie in pairs(_action.Heal_Solo) do
				if BAction.UseAction(1, ie, e.id) then
					d("Behevior Healer -> Team <= 60% -> Heal done")
					return true
				end
			end
		end		
	end
	return false
end

function RevoltEngine.Behevior_Healer_CheckTank(_TankEntity, _team)
	if table.valid(_TankEntity) and table.valid(_team) then
		local _action = RevoltEngine.RecupForJob(Player.job)
		--
		local Tab = {}
		local SommeHp = 0
		for id, e in pairs(_team) do
			local Tmp = {
				Entity = e,
				Hp_percent = e.hp.percent,
			}
			SommeHp = SommeHp + e.hp.percent
			table.insert(Tab, Tmp)
		end
		SommeHp = SommeHp / table.size(_team)
		--
		if _TankEntity.incombat and _TankEntity.alive and table.valid(_action) and (SommeHp >= 75) then
			-- Prio Instant
			if _TankEntity.hp.percent <= 60 then
				if _action.Heal_Instant then
					for id, e in pairs(_action.Heal_Instant) do
						if BAction.UseAction(1, e, _TankEntity.id) then
							d("Behevior Healer -> Tank <= 60% -> Instant Heal done")
							return true
						end
					end
				end
				for id, e in pairs(_action.Heal_Solo) do
					if BAction.UseAction(1, e, _TankEntity.id) then
						d("Behevior Healer -> Tank <= 60% -> Heal done")
						return true
					end
				end
			end
			if _TankEntity.hp.percent <= 87 then
				local Stance = RevoltEngine.RecupStanceMode(_action, Player.job)
				if type(Stance) == "string" then
					if Stance == "Regen" then
						-- Last -> Regen
						if _action.Regen_Solo then
							if not BAction.HaveBuff(_action.Regen_Solo_Buff, _TankEntity) then
								if BAction.UseAction(1, _action.Regen_Solo, _TankEntity.id) then
									d("Behevior Healer -> Tank <= 87% -> Regen done")
									return true
								end
							end
						end
					else -- Shield
						if _action.Shield_Solo then
							if not BAction.HaveBuff(_action.Shield_Buff, _TankEntity) then
								if BAction.UseAction(1, _action.Shield_Solo, _TankEntity.id) then
									d("Behevior Healer -> Tank <= 87% -> Shield done")
									return true
								end
							end
						end
					end
				end
			end
			local Action = ActionList:Get(1, _action.Heal_Solo[1])
			if table.valid(Action) then
				if not Action:IsReady(_TankEntity.id) then
					if Action.usable and not Action.isoncd then
						if Action.cost <= Player.mp.current then
							if not ActionList:IsCasting() then
								-- Check Debuff
								if not BAction.HaveBuff(296) and not BAction.HaveBuff(1259) and not BAction.HaveBuff(303) then
									d("Behevior Healer -> Healer goes closer to Tank")
									Variable.InBehevior = Action
									Variable.Need_SpeMove = _TankEntity.pos
									return true
								end
							end
						end
					end
				end
			end
		end
	end
	return false
end

function RevoltEngine.RunBehevior_Distance()
	return
end

function RevoltEngine.RunBehevior_Melee()
	return
end

function RevoltEngine.RunBehevior_Healer()
	if Player.incombat  then
		-- Recup Variable
		local Team = BTarget.EntityByOption("myparty")
		if Variable.Squadron or Variable.Trust then
			Team = BTarget.EntityByOption("chartype=9")
		end
		local TankEntity = RevoltEngine.GotTankEntity()
		if table.valid(TankEntity) and table.valid(Team) then
			-- Tank Check
			if RevoltEngine.Behevior_Healer_CheckTank(TankEntity, Team) then
				BeheviorUpdate.Pulse = 1
				return
			end
			-- Check Raise
			for id, e in pairs(Team) do
				if e.hp.min == 0 then
					if RevoltEngine.ActiveRaise(e) then
						return
					end
				end
			end
	--		if RevoltEngine.Behevior_Healer_CheckTeam(Team) then
	--			BeheviorUpdate.Pulse = 1
	--			return
	--		end
		end
	--	RevoltEngine.Behevior_CheckAggro(TankEntity)
	end
	BeheviorUpdate.Pulse = 100
end

function RevoltEngine.PlayerReaction()	
end

function RevoltEngine.BeheviorUpdate(Event, ticks)
	if (not BeheviorUpdate.Timer or ticks - BeheviorUpdate.Timer > BeheviorUpdate.Pulse) then
		BeheviorUpdate.Timer = ticks
		if BeheviorUpdate.Active == true then
			if not BeheviorUpdate.Pause then
				------------
				if Variable.CurrentDuty then
					if not Variable.Need_SpeMove and not Variable.CurrentTask then
						if Variable.RunBehevior[Player.role] then
							Variable.RunBehevior[Player.role]()
						end
					end
				end
				------------
			end
		end
	end	
	return
end
RegisterEventHandler("Gameloop.Update", RevoltEngine.BeheviorUpdate, Addon.Name)
----------------------------	[End Behevior]		-------------------------------------------

----------------------------	[Special Avoid]		-------------------------------------------

----------------------------	[The Burn]		-------------------------------------------
function RevoltEngine.DoSpecial_TheBurn(_data)
	-- No Target -> Off Minion
	if not BTarget.GetTarget() then
		BCommun.RunMinion(false)
	else
		local Target = BTarget.GetTarget()
		if (Target.contentid ~= 7673) or (not Target.alive) then
			BTarget.RemoveEntityInTarget()
			return true
		end
		if not BUtility.CanAttack(Target.id) then -- Not in Combat Range
			BMovement.doMoveToPosition(Target.pos)
			return
		else
			BMovement.StopMove()
			if not Variable.InitCast then
				if BUtility.Wait(10, "InitFirstAction4") then
					local InitAction = BVariable.Get_InitAction_By_Job(Player.job)
					if BAction.IsActionReady(1, InitAction, BTarget.GetTarget().id) then
						BAction.UseAction(1, InitAction, BTarget.GetTarget().id)
					end
					Variable.InitCast = true
				end
			end
		end
		BCommun.RunMinion(true)
		return true
	end
	-- Select Target
	local FTarget = BTarget.FindEntity(7673, "alive,maxdistance=70")
	if table.valid(FTarget) then
		BTarget.SetEntityInTarget(FTarget)
	else
		BMovement.doMoveToPosition(_data.FinalPosition[RevoltEngine.GetRole()], 1)
	end
	return true
end
----------------------------	[Cosmos]		-------------------------------------------
function RevoltEngine.TryFindDropPosition(_data, _patern, _sens, x, z)
	local DropPosition = nil
	if _sens ~= nil then
		if _sens == "AtLeft" then
			if (x + 1) ~= 5 then
				x = x + 1
			else
				x = x - 1
			end
		else
			if (x - 1) ~= 0 then
				x = x - 1
			else
				x = x + 1
			end
		end
	end
	-- Check Can drop here
	if not _patern[x][z] then
		-- Can drop here
		DropPosition = {x = _data.Coord_x[x], y = -12.5, z = _data.Coord_z[z]}
	end
	return DropPosition
end

function RevoltEngine.ResolvePatern(_data, _patern, _sens)
	local SeedPosition = nil
	local DropPosition = nil
	--
	local ClosedSeed = BTarget.FindListEntity({2010782,2010783,2010784,2010785}, "maxdistance=30")
	if table.valid(ClosedSeed) then
		-- Recup Position inside Patern
		local seed_x = RevoltEngine.FindInsideCood(_data.Coord_x, ClosedSeed.pos.x)
		local seed_z = RevoltEngine.FindInsideCood(_data.Coord_z, ClosedSeed.pos.z)
		-- First Try
		if seed_x and seed_z then
			local try_x = nil
			if (seed_x + 1) ~= 5 then
				try_x = seed_x + 1
			else
				try_x = seed_x - 1
			end
			--
			DropPosition = RevoltEngine.TryFindDropPosition(_data, _patern, _sens, try_x, seed_z)
			if DropPosition == nil then
				-- Update
				if (seed_x - 1) ~= 0 then
					try_x = seed_x - 1
				else
					try_x = seed_x + 1
				end
				DropPosition = RevoltEngine.TryFindDropPosition(_data, _patern, _sens, try_x, seed_z)
			end
			SeedPosition = ClosedSeed.pos
		end
	end
	-- Exit
	return SeedPosition, DropPosition, ClosedSeed
end

function RevoltEngine.FindInsideCood(_coord, _value)
	for id, e in pairs(_coord) do
		if _value >= (e - 1) and _value <= (e + 1) then
			return id
		end
	end	
	return nil
end

function RevoltEngine.Find_Patern(_data, _sens)
	-- Load Detect coord
	local tab_x = {[1] = -6, [2] = 6}
	if _sens ~= nil then
		tab_x = {[1] = -16, [2] = 16}
	end
	-- Search Detecting seed -- 2010785
	local Patern = nil
	local Seed = nil
	local LSeed = BTarget.EntityByOption("contentid=2010782,contentid=2010783,contentid=2010784,contentid=2010785")
	for id, e in pairs(LSeed) do
		if (e.pos.x >= tab_x[1] and e.pos.x <= tab_x[2]) and (e.pos.z >= -66 and e.pos.z <= -54) then
			d("Seed Finded")
			Seed = e
			break
		end
	end
	if Seed then
		-- Got Seed
		local x = RevoltEngine.FindInsideCood(_data.Coord_x, Seed.pos.x)
		local z = RevoltEngine.FindInsideCood(_data.Coord_z, Seed.pos.z)
		-- Update Coord
		if _sens ~= nil then
			if _sens == "AtLeft" then
				x = x + 1
			else
				x = x - 1
			end
		end
		-- Find Patern
		for id, e in pairs(_data.Patern) do
			if table.valid(e) then
				if table.valid(e[x]) then
					if e[x][z] then
						Patern = e
						d("Patern = "..id)
						break
					end
				end
			end
		end
	else
		d("No Seed")
	end
	return Patern
end

function RevoltEngine.Find_Sens()
	-- Check Wind
	local DWind = BTarget.FindEntity(9064,"contentid=9064")
	local Sens = nil
	if table.valid(DWind) then
		if DWind.castinginfo.channelingid == 18209 then -- Cast it
			-- Check Position
			if DWind.pos.x < 0 then
				d("-AtLeft")
				Sens = "AtLeft"
			else
				d("AtRight")
				Sens = "AtRight"
			end
		end
	end
	return Sens
end

function RevoltEngine.DoSpecial_Cosmos(_data)
	if Variable.InTakeAndDrop then
		return false
	end
	local Sens = RevoltEngine.Find_Sens()
	local Patern = RevoltEngine.Find_Patern(_data, Sens)
	if Patern then
		local Take, Drop, Seed = RevoltEngine.ResolvePatern(_data, Patern, Sens)
		if Take ~= nil and Drop ~= nil and Seed ~= nil then
			-- Set Variable
			d("Set Variable")
			Variable.InTakeAndDrop = true
			Variable.EntityToTake = Seed
			Variable.TakeCoord = Take
			Variable.DropCoord = Drop
			return true
		end
	end
	return false
end
----------------------------	[End Cosmos]		-------------------------------------------
----------------------------	[End Special Avoid]		-------------------------------------------

----------------------------	[AoE / Animation Avoid]		-------------------------------------------
function RevoltEngine.RecupCheck(_aoe, _anim, _buff, _casting,_entity)
	if _buff then
		local PBuffs = Player.buffs
		for id, e in pairs(PBuffs) do
			if Variable.Save_Avoid_ID == e.id then
				return Variable.Save_Avoid_ID
			end
		end
		return nil
	end
	local FTarget = BTarget.EntityByOption("maxdistance=80")
	if table.valid(FTarget) then
		for id, e in pairs(FTarget) do
			if e.id == _entity.id then
				if _aoe then
					return e.castinginfo.channelingid
				end
				if _casting then
					return e.castinginfo.castingid
				end
				if _anim then
					return e.action
				end
				break
			end
		end
	end
	-- Entity Not Find ?
	return nil
end

function RevoltEngine.DoTakeAndDrop()
	BCommun.RunMinion(false, "TakeAndDrop")
	if BAction.HaveBuff(404) then -- Chargé
		if BMovement.doMoveToPosition(Variable.DropCoord, 1) then
			BAction.UseAction(5, 18)
			Variable.InTakeAndDrop = false
			Variable.CurrentTask.FinishAfter = true
			return true
		end
	else
		-- Safe Check
		local ClosedSeed = BTarget.FindListEntity({2010782,2010783,2010784,2010785}, "maxdistance=30")
		if table.valid(ClosedSeed) then
			if Distance3D(ClosedSeed.pos.x, ClosedSeed.pos.y, ClosedSeed.pos.z, Variable.TakeCoord.x, Variable.TakeCoord.y, Variable.TakeCoord.z) >= 2 then
				-- Safe Check -> Finish
				Variable.InTakeAndDrop = false
				Variable.CurrentTask.FinishAfter = true
				return false
			end
			if BMovement.doMoveToPosition(Variable.TakeCoord, 1) then
				BInteract.Interact(Variable.EntityToTake.id)
			end
		else
			Variable.InTakeAndDrop = false
			Variable.CurrentTask.FinishAfter = true
			return false			
		end
	end
	return true
end

function RevoltEngine.CheckAfterAvoid(_task)
	Variable.IsAfter = true
	Variable.Save_Follow_Trust = nil
	if _task.UseExclude then
		d("Insert - "..Variable.CurrentTask.Entity.id)
		table.insert(Variable.SaveLastID, Variable.CurrentTask.Entity.id)
	end
	-- Wait Before Exit
	if _task.WaitBeforeReturn and (not _task.ReturnDone) then
		if not BUtility.Wait(_task.WaitBeforeReturn, "WaitBeforeReturn") then
			d("After Avoid System -> Wait Before Return")
			if _task.DoAoeHeal then
				if Player.role == 4 then
					Player:Stop()
					local action = RevoltEngine.RecupForJob(Player.job)
					d("Aoe ".._task.ID.." -> Aoe Heal")
					if BAction.IsActionReady(1, action.Heal_Aoe[1]) then
						BAction.UseAction(1, action.Heal_Aoe[1])
						_task.DoAoeHeal = nil
					end
				end
			end	
			return true
		end
	end
	-- Return Position
	if not _task.ReturnDone then
		-- Previous Position
		d("After Avoid System -> Check Return Position")
		if _task.ReturnPosition then
			d("Aoe ".._task.ID.." -> Return to Position After")
			Variable.Need_SpeMove = _task.ReturnPosition
			_task.ReturnDone = true
			return true
		end
		-- To New Position
		if _task.MoveToPositionAfter then
			if _task.MoveToPositionAfter[RevoltEngine.GetRole()] then
				d("Aoe ".._task.ID.." -> Move to Position After")
				Variable.Need_SpeMove = _task.MoveToPositionAfter[RevoltEngine.GetRole()]
				_task.ReturnDone = true
				return true
			end
		end
	end
	-- Check Index
	_task.DoIndex = _task.DoIndex + 1
	if table.valid(_task.Data[_task.DoIndex]) then
		d("After Avoid System -> Got Next Index ".._task.DoIndex)
		for avoid_id, avoid_e in pairs(_task.Data) do
			if table.valid(avoid_e) then
				if avoid_id >= _task.DoIndex then
					d("After Avoid System : Check "..avoid_id)
					if RevoltEngine.Avoid_System(_task.Data[avoid_id], _task.Entity) then
						Variable.InAoe = true
						RevoltEngine.NewAvoid(_task.ID, _task.Data, _task.Data[avoid_id], _task.Entity, avoid_id)
						d("After Avoid System : Good "..avoid_id)
						return true
					end
					d("After Avoid System : Fail "..avoid_id)
				end
			end
		end
	end
	return false
end

function RevoltEngine.Check_Index(_task)
	if _task.SaveIndex then
		if table.valid(Variable.Save_MoveThenMove_Index) then
			for id, e in pairs(Variable.Save_MoveThenMove_Index) do
				if e.id_avoid == _task.ID then
					e.index = Variable.Save_Counter
					d("MoveThenMove -> SaveIndex Update : ".._task.ID)
					return
				end
			end
			local Tab = {
				id_avoid = _task.ID,
				index = Variable.Save_Counter,
			}
			d("MoveThenMove -> SaveIndex Insert : ".._task.ID)
			table.insert(Variable.Save_MoveThenMove_Index, Tab)
		else
			local Tab = {
				id_avoid = _task.ID,
				index = Variable.Save_Counter,
			}
			Variable.Save_MoveThenMove_Index = {}
			d("MoveThenMove -> SaveIndex Insert : ".._task.ID)
			table.insert(Variable.Save_MoveThenMove_Index, Tab)
		end
	end
end

function RevoltEngine.Check_WaitMoveThenMove(_task)
	if Variable.Save_Pulse then
		d("MoveThenMove -> Pulse "..Variable.Save_Pulse)
		Variable.NeedTimerWait = Variable.NeedTimerWait - Variable.Save_Pulse
		if Variable.NeedTimerWait < 0 then
			Variable.NeedTimerWait = 0
		end
		d("MoveThenMove -> Timer Wait "..Variable.NeedTimerWait)
		Variable.Save_Pulse = nil
	end
	if BUtility.Wait(Variable.NeedTimerWait, "MoveThenMove") then
		--
		d("MoveThenMove -> Wait Done -> Next")
		Variable.NeedTimerWait = nil
		if _task.SaveIndex then
			-- Stop MoveThenMove
			if table.valid(Variable.Save_MoveThenMove_Index) then
				for id, e in pairs(Variable.Save_MoveThenMove_Index) do
					if e.id_avoid == _task.ID then
						if _data[e.index] then
							d("MoveThenMove -> SaveIndex Used : "..e.index)
							Variable.Save_Counter = e.index
						else
							d("MoveThenMove -> SaveIndex Reset")
							Variable.Save_Counter = 1
						end
					end
				end
			end
			return false
		end
	else
		-- Action During Wait
		if _task.DoAoeHeal then
			if Player.role == 4 then
				Player:Stop()
				local action = RevoltEngine.RecupForJob(Player.job)
				d("Aoe ".._task.ID.." -> Aoe Heal")
				if BAction.IsActionReady(1, action.Heal_Aoe[1]) then
					BAction.UseAction(1, action.Heal_Aoe[1])
					_task.DoAoeHeal = nil
				end
				return true
			end
		end	
		d("MoveThenMove -> Wait")
	end
	return true
end

function RevoltEngine.Check_Task_Move_Then_Move(_task, _data)
	-- Wait Before Stop
	if Variable.NeedTimerWait ~= nil then
		return RevoltEngine.Check_WaitMoveThenMove(_task)
	end
	-- Wait Finish / not Init
	d("Move Then Move Save Counter : "..Variable.Save_Counter)
	local Table = _data[Variable.Save_Counter]
	if table.valid(Table) then
		-- Check Assist
		if Table.RemoveHealerAssist and (Player.role == 4) then
			BCommun.RunMinion(false, "Movethenmove 1")
		else
			BCommun.RunMinion(true, "Movethenmove 2")
		end
		-- Check Sprint
		if Table.Sprint then
			BAction.UseAction(5, 4)
		end
		--
		local Wait = 0
		if Table.WaitBefore then
			Wait = Table.WaitBefore
		end
		if BUtility.Wait(Wait, "MoveThenMove-WaitBefore") then
			d("Move Then Move Count : "..Variable.Save_Counter)
			local p = Player
			local Position = Table.Position[RevoltEngine.GetRole()]
			if table.valid(Position) then
				d("MoveThenMove ["..Variable.Save_Counter.."] -> GoToPosition")
				Variable.Save_Pulse = 0
				Variable.Need_SpeMove = Position
				if Table.WalkToDistance then
					Variable.CurrentTask.WalkToDistance = Table.WalkToDistance
				end
			end
			if Table.Wait ~= 0 then
				Variable.NeedTimerWait = Table.Wait -- For got second
			else
				Variable.NeedTimerWait = nil
			end
			Variable.Save_Counter = Variable.Save_Counter + 1
			--
			RevoltEngine.Check_Index(_task)
		end
		return true
	end
	-- No More MoveThenMove
	return false
end

function RevoltEngine.DoTask_InMove(_task)
	if table.valid(_task) then
		if _task.Sprint then
			BAction.UseAction(5, 4)
		end
		if Variable.IsAfter then -- No Need
			return true
		end
		if not _task.ReturnDone then
			if _task.Type == "GoBehind" then
				RevoltEngine.Go_Behind(_task.Entity, _task, false)
			end
			if _task.Type == "GoBehindAll" and not _task.Data.NoRefresh then
				RevoltEngine.Go_Behind(_task.Entity, _task, true)
			end
		end
		if _task.Type == "GoTargetSide" and (_task.Sens or _task.Refresh) then
			RevoltEngine.Go_TargetSide(_task.Entity, _task)
		end
		if _task.Type == "EntityCheck" and _task.Refresh then
			RevoltEngine.Go_EntityCheck(_task.Data, _task.Entity)
		end
		if _task.Type == "GoTargetAngle" and _task.Refresh then
			RevoltEngine.Go_TargetAngle(_task.Entity, _task)
		end
		-- Check FollowTrust
		if table.valid(Variable.Save_Follow_Trust) then
			Variable.Need_SpeMove = Variable.Save_Follow_Trust.pos
		end
		if _task.StopFromDistance then
			if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, _task.DistanceStop.x, _task.DistanceStop.y, _task.DistanceStop.z) >= _task.StopFromDistance then
				Variable.Need_SpeMove = nil
			end
		end
		-- Until Aoe
		if _task.UntilDoingAoe then
			d("Avoid System -> Until Aoe")
			local CastInfo = _task.Entity.castinginfo
			if CastInfo.channelingid == _task.UntilDoingAoe then
				d("Avoid System -> Until Aoe : Exit")
				return false
			else
				if _task.NoRefreshDuringMoveForUntil then
					return true
				end
				d("Avoid System -> Until Aoe : Reload Avoid System")
				local Avoid_Data = _task.Data
				if table.valid(_task.Data[_task.DoIndex]) then
					Avoid_Data = _task.Data[_task.DoIndex]
				end
				RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)
				return true
			end
		end
		if table.valid(_task.UntilDoingAnimation) then
			d("Avoid System -> Until Animation")
			local AnimationInfo = _task.Entity.action
			for id, e in pairs(_task.UntilDoingAnimation) do
				if AnimationInfo == e then
					-- Finish
					d("Avoid System -> Until Animation : Exit")
					return false
				end
			end
			-- Still Inside
			if _task.NoRefreshDuringMoveForUntil then
				return true
			end
			d("Avoid System -> Until Animation : Reload Avoid System")
			local Avoid_Data = _task.Data
			if table.valid(_task.Data[_task.DoIndex]) then
				Avoid_Data = _task.Data[_task.DoIndex]
			end
			RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)
			return true
		end
		if _task.Data.WhenAnimationFinish then
			if BUtility.Wait(5, "Wait_WhenAnimationFinish") then
				local AnimationInfo = _task.Entity.action
				if AnimationInfo ~= _task.Data.WhenAnimationFinish then
					d("Avoid System -> When Animation : Exit")
					return false
				else
					if _task.NoRefreshDuringMoveForUntil then
						return true
					end
					d("Avoid System -> When Animation : Reload Avoid System")
					local Avoid_Data = _task.Data
					if table.valid(_task.Data[_task.DoIndex]) then
						Avoid_Data = _task.Data[_task.DoIndex]
					end
					RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)								
					return true
				end
			else
				return true
			end
		end
		if _task.UntilNextPhase then
			if not RevoltEngine.PhaseFinish(Variable.SavePhase, Variable.SaveBossEntity) then
				if _task.NoRefreshDuringMoveForUntil then
					return true
				end
				d("Avoid System -> Until Next Phase : Reload Avoid System")
				local Avoid_Data = _task.Data
				if table.valid(_task.Data[_task.DoIndex]) then
					Avoid_Data = _task.Data[_task.DoIndex]
				end
				RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)
				return true
			end
		end
		return true
	end
	return false
end

function RevoltEngine.Check_SpecialStop(_spe_stop)
	if _spe_stop.type == "Check_y" then
		if (Player.pos.y >= (_spe_stop.value - 1)) and (Player.pos.y <= (_spe_stop.value + 1)) then
			return true
		end
	end
	return false
end

function RevoltEngine.DoTask(_task)
	if table.valid(_task) then
		-- Check Spe Stop
		if table.valid(_task.SpecialStop) then
			if RevoltEngine.Check_SpecialStop(_task.SpecialStop) then
				d("Avoid System -> Special Exit actived")
				return RevoltEngine.CheckAfterAvoid(_task)
			end
		end
		-- Check in Move
		if Variable.Need_SpeMove then
			return RevoltEngine.DoTask_InMove(_task)
		else
			-- MoveThenMove
			if _task.Type == "MoveThenMove" then
				d("Avoid System -> Inside MoveThenMove")
				if RevoltEngine.Check_Task_Move_Then_Move(_task, _task.Move) then
					if Variable.Boss_Find then
						BTarget.SetTarget(Variable.Boss_Find)
					end
					return true
				end
			end
			-- Finish After
			if _task.FinishAfter then
				d("Avoid System -> Finish After")
				return RevoltEngine.CheckAfterAvoid(_task)
			end
			-- SpeMove
			if _task.Type == "Special_Avoid" then
				if _task.Data.Id_Special == 2 then
					-- The Burn
					RevoltEngine.DoSpecial_TheBurn(_task.Data)
				end
			end
			-- Take And Drop (Cosmos)
			if Variable.InTakeAndDrop then
				if RevoltEngine.DoTakeAndDrop() then
					return true
				end
			end
			-- Until Aoe
			if _task.UntilDoingAoe then
				d("Avoid System -> Until Aoe")
				local CastInfo = _task.Entity.castinginfo
				if CastInfo.channelingid == _task.UntilDoingAoe then
					d("Avoid System -> Until Aoe : Exit")
					_task.FinishAfter = true
					return RevoltEngine.CheckAfterAvoid(_task)
				else
					if _task.WaitDuringUntil then
						if not BUtility.Wait(_task.WaitDuringUntil, "WaitDuringUntil") then
							return true
						end
					end
					d("Avoid System -> Until Aoe : Reload Avoid System")
					local Avoid_Data = _task.Data
					if table.valid(_task.Data[_task.DoIndex]) then
						Avoid_Data = _task.Data[_task.DoIndex]
					end
					RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)
					return true
				end
			end
			if table.valid(_task.UntilDoingAnimation) then
				d("Avoid System -> Until Animation")
				local AnimationInfo = _task.Entity.action
				for id, e in pairs(_task.UntilDoingAnimation) do
					if AnimationInfo == e then
						-- Finish
						d("Avoid System -> Until Animation : Exit")
						_task.FinishAfter = true
						return RevoltEngine.CheckAfterAvoid(_task)
					end
				end
				-- Still Inside
				if _task.WaitDuringUntil then
					if not BUtility.Wait(_task.WaitDuringUntil, "WaitDuringUntil") then
						return true
					end
				end
				d("Avoid System -> Until Animation : Reload Avoid System")
				local Avoid_Data = _task.Data
				if table.valid(_task.Data[_task.DoIndex]) then
					Avoid_Data = _task.Data[_task.DoIndex]
				end
				RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)
				return true
			end
			if _task.UntilNextPhase then
				if not RevoltEngine.PhaseFinish(Variable.SavePhase, Variable.SaveBossEntity) then
					if _task.WaitDuringUntil then
						if not BUtility.Wait(_task.WaitDuringUntil, "WaitDuringUntil") then
							return true
						end
					end
					d("Avoid System -> Until Next Phase : Reload Avoid System")
					local Avoid_Data = _task.Data
					if table.valid(_task.Data[_task.DoIndex]) then
						Avoid_Data = _task.Data[_task.DoIndex]
					end
					RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)
					return true
				end
			end
			-- Check Doing Again AoE
			local Check = RevoltEngine.RecupCheck(Variable.InAoe, Variable.InAnimation, Variable.InBuff, Variable.InCasting, _task.Entity)
			if Check ~= nil then
				if _task.ID ~= Check then
					if _task.Data.WhenAnimationFinish then
						local AnimationInfo = _task.Entity.action
						if AnimationInfo ~= _task.Data.WhenAnimationFinish then
							d("Avoid System -> When Animation : Exit")
							_task.FinishAfter = true
						else
							d("Avoid System -> When Animation : Reload Avoid System")
							local Avoid_Data = _task.Data
							if table.valid(_task.Data[_task.DoIndex]) then
								Avoid_Data = _task.Data[_task.DoIndex]
							end
							RevoltEngine.Avoid_System(Avoid_Data, _task.Entity)								
							return true
						end
					end
					-- Other Cast
					return RevoltEngine.CheckAfterAvoid(_task)
				else
					-- Same Cast
					if table.valid(Variable.Save_Follow_Trust) then
						d("Avoid System -> Still Follow Trust")
						Variable.Need_SpeMove = Variable.Save_Follow_Trust.pos
						return true
					end
					if (_task.Type == "GoBehindAll" or _task.Type == "GoBehind") and _task.Refresh then
						local tmp = false
						if _task.Type == "GoBehindAll" then
							tmp = true
						end
						RevoltEngine.Go_Behind(_task.Entity, _task, tmp)
					end
					if _task.Type == "GoTargetSide" and (_task.Sens or _task.Refresh) then
						RevoltEngine.Go_TargetSide(_task.Entity, _task)
					end
					if _task.Type == "GoTargetSemiSide" and _task.Refresh then
						RevoltEngine.Go_TargetSemiSide(_task.Entity, _task)
					end
					if _task.Type == "EntityCheck" and _task.Refresh then
						RevoltEngine.Go_EntityCheck(_task.Data, _task.Entity)
					end
					if _task.Type == "GoTargetAngle" and _task.Refresh then
						RevoltEngine.Go_TargetAngle(_task.Entity, _task)
					end
					if _task.Type == "GoSpread" and _task.Refresh then
						RevoltEngine.Go_Spread(_task)
					end
					if _task.NoAction then
						Player:ClearTarget()
						return true
					end
					if _task.AtkEntityAfter then
						BTarget.SetTarget(_task.AtkEntityAfter)
					else
						if Variable.Boss_Find then
							BTarget.SetTarget(Variable.Boss_Find)
						end
					end
					BCommun.RunMinion(true, "DoTask 1")
					return true
				end
			end
			-- Exit Avoid System
			if Variable.Boss_Find then
				BTarget.SetTarget(Variable.Boss_Find)
			end
			BCommun.RunMinion(true, "DoTask 2")
			return RevoltEngine.CheckAfterAvoid(_task)
		end
	else
		d("Avoid System : Error Current Task")
	end
	return false
end

function RevoltEngine.NewAvoid(_id, _data, _e, _entity, _currentdataindex)
	-- Reset
	RevoltEngine.Reset_Avoid(false)
	--
	Variable.NextPulseIsAfterAvoid = true
	Variable.InsideArgus = false
	Variable.WaitReturnArgus = nil
	--
	Variable.CurrentTask = {
		Priority = _e.Priority,
		DoIndex = 1,
		ID = _id,
		Type = _e.Type,
		Data = _data,
		Entity = _entity,
		DistanceStop = Player.pos,
		MoveRange = _e.MoveRange,
		WalkToDistance = nil,
		ReturnPosition = nil,
		ReturnDone = false,
		DoAoeHeal = _e.DoAoeHeal,
		StopFromDistance = _e.StopFromDistance,
		WaitBefore = 0,
		WaitBeforeDone = nil,
		AtkEntityAfter = false,
		FinishAfter = _e.FinishAfter,
		UntilDoingAoe = _e.UntilDoingAoe,
		UntilDoingAnimation = _e.UntilDoingAnimation,
		UntilNextPhase = _e.UntilNextPhase,
		NoAction = _e.NoAction,
		Move = nil,
		Sprint = _e.Sprint,
		Range = _e.Range,
		Sens = _e.Sens,
		Angle = _e.Angle,
		WaitBeforeReturn = 0,
		MoveToPositionAfter = _e.MoveToPositionAfter,
		UseExclude = _e.UseExclude,
		--
		Refresh = _e.Refresh,
		ConsecutiveAvoid = _e.ConsecutiveAvoid,
		--
		WaitDuringUntil = _e.WaitDuringUntil,
		NoRefreshDuringMoveForUntil = _e.NoRefreshDuringMoveForUntil,
		--		
		ActiveArgusDuringWait = false,
		--
		SpecialStop = nil,
	}
	--ActiveArgusDuringWait
	if _currentdataindex then
		Variable.CurrentTask.DoIndex = _currentdataindex
	end
	if not _e.Priority then
		Variable.CurrentTask.Priority = 1
	end
	if Variable.InAoe or Variable.InCasting then
		table.insert(Variable.LastAvoid, {id = _id, entity = _entity.id})
	end
	if Variable.InAnimation then
		table.insert(Variable.LastAnimation, {id = _id, entity = _entity.id})
	end
	--
	if _e.ActiveArgusDuringWait then
		Variable.CurrentTask.ActiveArgusDuringWait = _e.ActiveArgusDuringWait
	end
	--
	if _e.WaitBeforeReturn then
		Variable.CurrentTask.WaitBeforeReturn = _e.WaitBeforeReturn
	end
	if _e.AtkEntityAfter then
		Variable.CurrentTask.AtkEntityAfter = _e.Entity
	end
	if _e.Type == "MoveThenMove" then
		Variable.CurrentTask.Move = _e.Move
	end
	if _e.WaitBefore then
		Variable.CurrentTask.WaitBefore = _e.WaitBefore
	end
	if _e.ReturnPositionAfter then
		Variable.CurrentTask.ReturnPosition = Player.pos
	end
	--
	if _e.SpecialStop then
		Variable.CurrentTask.SpecialStop = _e.SpecialStop
	end
	--
	if _e.ConsecutiveAvoid then
		RevoltEngine.RemoveLastAvoid(Variable.CurrentTask)
	end
end

function RevoltEngine.Go_EntityBetweenBoss(_entity, _data)
	local _Target = _entity.pos
	if table.valid(_data.UsePosition) then
		_Target = _data.UsePosition
	end
	local _Midder = Player
	if _data.EntityID then
		_Midder = BTarget.FindEntity(_data.EntityID, "maxdistance=60", Variable.SaveLastID)
	end
	if _data.UseEntity then
		_Midder = _entity
	end
	if table.valid(_Midder) then
		_Midder = _Midder.pos
		local position = BMath.PointBetween2Pos(_Target, _Midder, (math.distance2d(_Target.x, _Target.z, _Midder.x, _Midder.z) + _data.Range))
		Variable.Need_SpeMove = position
		--
		return true
	end
	return false
end

function RevoltEngine.Go_Move_When_Buff(_data)
	if _data.Position[RevoltEngine.GetRole()] then
		Variable.Need_SpeMove = _data.Position[RevoltEngine.GetRole()]
		return true
	end
	return false
end

function RevoltEngine.Go_Move_Then_Move(_data)
	if _data.NeedMesh then
		BVariable.Set_MeshMove(_data.NeedMesh)
	end
	Variable.Save_Counter = 1
	if _data.Move[Variable.Save_Counter] then
		return true
	end
	return false
end

function RevoltEngine.Go_Close_Entity(_entity, _range, _data)
	if _data.EntityID then
		_entity = BTarget.FindEntity(_data.EntityID)
	end
	if _data.UsePosition then
		_entity.pos = _data.UsePosition
		_entity.distance = Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, _data.UsePosition.x, _data.UsePosition.y, _data.UsePosition.z)
	end
	if _entity.distance >= _range then
		-- Go Math
	 	Variable.Need_SpeMove = BMath.PointBetween2Pos(_entity.pos, Player.pos, _range)
		return true
	end
	if _entity.distance < _range then
		if _data.GoAtRange then
			-- Go Math
		 	Variable.Need_SpeMove = BMath.PointBetween2Pos(_entity.pos, Player.pos, _range)
			return true
		end
	end
	return false
end

function RevoltEngine.Go_Pack(_data)
	if _data.Role[RevoltEngine.GetRole()] then
		Variable.Need_SpeMove = _data.Position
		return true
	else
		return false
	end
end

function RevoltEngine.Go_Behind(_target, _data, _all)
	-- Check job
	if not _all then
		if table.valid(_data.Role) then
			if not _data.Role[RevoltEngine.GetRole()] then
				return false
			end
		else
			if _data.Role then
				if Player.role ~=  _data.Role then
					return false
				end
			end
		end
	end
	-- Go Math
	local _PlayerPosition = Player.pos
	local _TargetPosition = _target.pos
	local Distance = _target.distance
	if Distance < (_target.hitradius + 3.3) then
		Distance = _target.hitradius + 3.3
	end
	if _data.Range then
		Distance = _data.Range
	end
	local New_position = {
		x = Distance * math.sin(_TargetPosition.h + math.pi) + _TargetPosition.x,
		y = _TargetPosition.y,
		z = Distance * math.cos(_TargetPosition.h + math.pi) + _TargetPosition.z,
	}
	-- Got Avoid Position
	Variable.Need_SpeMove = New_position
	return true
end

function RevoltEngine.Go_View_Entity(_entity)
	BCommun.RunMinion(false, "Go_View_Entity 1")
	local _PlayerPosition = Player.pos
	local Vecteur_Target_Player = {
		x = _PlayerPosition.x - _entity.pos.x,
		z = _PlayerPosition.z - _entity.pos.z,
	}
	local Norme_Vecteur_Target_Player = math.sqrt((Vecteur_Target_Player.x * Vecteur_Target_Player.x)
												+ (Vecteur_Target_Player.z * Vecteur_Target_Player.z))
	local Distance = _entity.distance + 2.5
	local _newposition = {
		x = _entity.pos.x + ( Vecteur_Target_Player.x * Distance / Norme_Vecteur_Target_Player),
		y = _entity.pos.y,
		z = _entity.pos.z + ( Vecteur_Target_Player.z * Distance / Norme_Vecteur_Target_Player),
	}
	Variable.Need_SpeMove = _newposition
	return true
end

function RevoltEngine.Go_Away_Entity(_entity, _range, _data)
	if _data.EntityID then
		_entity = BTarget.FindEntity(_data.EntityID)
	end
	if _data.UsePosition then
		_entity.pos = _data.UsePosition
		_entity.distance = Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, _data.UsePosition.x, _data.UsePosition.y, _data.UsePosition.z)
	end
	if _entity.distance <= _range then
		-- Go Math
	 	Variable.Need_SpeMove = BMath.PointBetween2Pos(_entity.pos, Player.pos, _range)
		return true
	end
	if _entity.distance > _range then
		if _data.GoAtRange then
			-- Go Math
		 	Variable.Need_SpeMove = BMath.PointBetween2Pos(_entity.pos, Player.pos, _range)
			return true
		end
	end
	return false
end

function RevoltEngine.Go_From_Angle(_entity, _range, _angle)
	local _PlayerPosition = Player.pos
	local Vecteur_Target_Player = {
		x = _PlayerPosition.x - _entity.pos.x,
		z = _PlayerPosition.z - _entity.pos.z,
	}
	local Norme_Vecteur_Target_Player = math.sqrt((Vecteur_Target_Player.x * Vecteur_Target_Player.x)
												+ (Vecteur_Target_Player.z * Vecteur_Target_Player.z))
	local Distance = _entity.distance
	if Distance <= (_entity.hitradius + 3.3) then
		Distance = _entity.hitradius + 3.3
	end
	if _range then
		Distance = _range
	end
	local Angle = _angle
	local New_position = {
		x = _PlayerPosition.x + ( Vecteur_Target_Player.x * Distance / Norme_Vecteur_Target_Player),
		z = _PlayerPosition.z + ( Vecteur_Target_Player.z * Distance / Norme_Vecteur_Target_Player),
	}
	-- Delta
	local _deltax = New_position.x - _PlayerPosition.x
	local _deltaz = New_position.z - _PlayerPosition.z
	-- Do Translation
	New_position.x = _PlayerPosition.x + (_deltax * math.cos(Angle) - _deltaz * math.sin(Angle))
	New_position.y = _PlayerPosition.y
	New_position.z = _PlayerPosition.z + (_deltax * math.sin(Angle) + _deltaz * math.cos(Angle))
	Variable.Need_SpeMove = New_position
	return true	
end

function RevoltEngine.Go_Side(_entity, _range, _sens)
	local _PlayerPosition = Player.pos
	local Vecteur_Target_Player = {
		x = _PlayerPosition.x - _entity.pos.x,
		z = _PlayerPosition.z - _entity.pos.z,
	}
	local Norme_Vecteur_Target_Player = math.sqrt((Vecteur_Target_Player.x * Vecteur_Target_Player.x)
												+ (Vecteur_Target_Player.z * Vecteur_Target_Player.z))
	local Distance = _range
	local Angle = -1.5708
	if _sens ~= nil then
		if _sens == "Right" then
			Angle = Angle * -1
		end
	else
		local random = math.random(-1, 1)
		if random <= 0 then
			Angle = Angle * -1
		end
	end

	local New_position = {
		x = _PlayerPosition.x + ( Vecteur_Target_Player.x * Distance / Norme_Vecteur_Target_Player),
		z = _PlayerPosition.z + ( Vecteur_Target_Player.z * Distance / Norme_Vecteur_Target_Player),
	}
	-- Delta
	local _deltax = New_position.x - _PlayerPosition.x
	local _deltaz = New_position.z - _PlayerPosition.z
	-- Do Translation
	New_position.x = _PlayerPosition.x + (_deltax * math.cos(Angle) - _deltaz * math.sin(Angle))
	New_position.y = _PlayerPosition.y
	New_position.z = _PlayerPosition.z + (_deltax * math.sin(Angle) + _deltaz * math.cos(Angle))
	--
	local tmp = NavigationManager:GetClosestPointOnMesh(New_position)
	if table.valid(tmp) then
		if (Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, tmp.x, tmp.y, tmp.z) < (_range - 0.5)) and _sens == nil then
			-- Other Side
			d("GoSide -> Switch Side")
			New_position.x = _PlayerPosition.x + (_deltax * math.cos(Angle * -1) - _deltaz * math.sin(Angle * -1))
			New_position.y = _PlayerPosition.y
			New_position.z = _PlayerPosition.z + (_deltax * math.sin(Angle * -1) + _deltaz * math.cos(Angle * -1))
		end
	else
		-- Other Side
		d("GoSide -> Switch Side")
		New_position.x = _PlayerPosition.x + (_deltax * math.cos(Angle * -1) - _deltaz * math.sin(Angle * -1))
		New_position.y = _PlayerPosition.y
		New_position.z = _PlayerPosition.z + (_deltax * math.sin(Angle * -1) + _deltaz * math.cos(Angle * -1))
	end
	Variable.Need_SpeMove = New_position
	return true
end

function RevoltEngine.Go_StopDps(_entity, _data)
	Variable.NotDpsTarget = _entity.id
	Variable.UnlockStopDps = _data.Unlock
	Variable.Save_Position = _entity.pos
	return true
end

function RevoltEngine.Go_TargetAngle(_target, _data)
	-- Go Math
	local _PlayerPosition = Player.pos
	local _TargetPosition = _target.pos
	local Distance = _target.distance
	if Distance <= (_target.hitradius + 3.3) then
		Distance = _target.hitradius + 3.3
	end
	if _data.Range then
		if table.valid(_data.Range) then
			Distance = _data.Range[Player.role]
		else
			Distance = _data.Range
		end
	end
	local Angle = -1.5708
	if _data.Angle then
		if table.valid(_data.Angle) then
			if _data.Angle[RevoltEngine.GetRole()] then
				Angle = _data.Angle[RevoltEngine.GetRole()]
			end
		else
			Angle = _data.Angle
		end
	end
	local New_position = {
		x = Distance * math.sin(_TargetPosition.h + Angle) + _TargetPosition.x,
		y = _TargetPosition.y,
		z = Distance * math.cos(_TargetPosition.h + Angle) + _TargetPosition.z,
	}
	-- Got Avoid Position
	Variable.Need_SpeMove = New_position
	return true
end

function RevoltEngine.Go_TargetSemiSemiSide(_target, _data)
	if _data.EntityID then
		local tmp = BTarget.FindEntity(_data.EntityID)
		if table.valid(tmp) then
			_target = tmp
		end
	end
	local Distance = _target.distance
	if Distance < (_target.hitradius + 3.3) then
		Distance = (_target.hitradius + 3.3)
	end
	if _data.Range then
		Distance = _data.Range
	end
	local Sens = nil
	if _data.Sens then
		if _data.Sens == "Left" then
			Sens = 1
		else
			Sens = -1
		end
	end
	local P1 = nil; local P2 = nil; local P3 = nil; local P4 = nil;
	if not _data.OnlyBehind then
		if not Sens then
			P1 = BMath.AngleFromEntity(_target, -0.45, Distance)
			P2 = BMath.AngleFromEntity(_target, 0.45, Distance)
		else
			P1 = BMath.AngleFromEntity(_target, (0.45 * Sens), Distance)
		end
	end
	if not _data.OnlyFront then
		if not Sens then
			P3 = BMath.AngleFromEntity(_target, -3.05, Distance)
			P4 = BMath.AngleFromEntity(_target, 3.05, Distance)
		else
			P3 = BMath.AngleFromEntity(_target, (3.05 * Sens), Distance)			
		end
	end
	local List = {P1, P2, P3, P4}
	local Closer = BMath.ShortDistance(List)
	if Closer ~= nil then
		Variable.Need_SpeMove = Closer
		return true
	end
	return false
end

function RevoltEngine.Go_TargetSemiSide(_target, _data)
	if _data.EntityID then
		local tmp = BTarget.FindEntity(_data.EntityID)
		if table.valid(tmp) then
			_target = tmp
		end
	end
	local Distance = _target.distance
	if Distance < (_target.hitradius + 3.3) then
		Distance = (_target.hitradius + 3.3)
	end
	if _data.Range then
		Distance = _data.Range
	end
	local Sens = nil
	if _data.Sens then
		if _data.Sens == "Left" then
			Sens = 1
		else
			Sens = -1
		end
	end
	local P1 = nil; local P2 = nil; local P3 = nil; local P4 = nil;
	if not _data.OnlyBehind then
		if not Sens then
			P1 = BMath.AngleFromEntity(_target, -0.785398, Distance)
			P2 = BMath.AngleFromEntity(_target, 0.785398, Distance)
		else
			P1 = BMath.AngleFromEntity(_target, (0.785398 * Sens), Distance)
		end
	end
	if not _data.OnlyFront then
		if not Sens then
			P3 = BMath.AngleFromEntity(_target, -2.35619, Distance)
			P4 = BMath.AngleFromEntity(_target, 2.35619, Distance)
		else
			P3 = BMath.AngleFromEntity(_target, (2.35619 * Sens), Distance)			
		end
	end
	local List = {P1, P2, P3, P4}
	local Closer = BMath.ShortDistance(List)
	if Closer ~= nil then
		Variable.Need_SpeMove = Closer
		return true
	end
	return false
end

function RevoltEngine.Go_TargetSide(_target, _data)
	-- Go Math
	local _PlayerPosition = Player.pos
	local _TargetPosition = _target.pos
	local Distance = _target.distance
	if Distance < (_target.hitradius + 3.3) then
		Distance = _target.hitradius + 3.3
	end
	if _data.Range then
		Distance = _data.Range
	end
	local P1 = nil; local P2 = nil;
	if _data.Sens then
		if _data.Sens == "Right" then
			P1 = BMath.AngleFromEntity(_target, 1.5708, Distance)
		else
			P1 = BMath.AngleFromEntity(_target, -1.5708, Distance)
		end
	else
		P1 = BMath.AngleFromEntity(_target, 1.5708, Distance)
		P2 = BMath.AngleFromEntity(_target, -1.5708, Distance)
	end
	local Closer = P1
	if P2 then
		Closer = BMath.ShortDistance({P1, P2})
	end
	Variable.Need_SpeMove = Closer
	return true
end

function RevoltEngine.Go_TargetAngleSide(_target, _data)
	-- Go Math
	local _PlayerPosition = Player.pos
	local _TargetPosition = _target.pos
	local Distance = _target.distance
	if Distance < (_target.hitradius + 3.3) then
		Distance = _target.hitradius + 3.3
	end
	if _data.Range then
		Distance = _data.Range
	end
	local P1 = nil; local P2 = nil;
	--
	local AnglePos = 1.309
	local AngleNeg = -1.309
	if _data.Angle then
		AnglePos = (_data.Angle * 3.1415) / 180
		AngleNeg = ((_data.Angle * 3.1415) / 180) * -1 -- Neg
	end
	if _data.Sens then
		if _data.Sens == "Right" then
			P1 = BMath.AngleFromEntity(_target, AnglePos, Distance)
		else
			P1 = BMath.AngleFromEntity(_target, AngleNeg, Distance)
		end
	else
		P1 = BMath.AngleFromEntity(_target, AnglePos, Distance)
		P2 = BMath.AngleFromEntity(_target, AngleNeg, Distance)
	end
	local Closer = P1
	if P2 then
		Closer = BMath.ShortDistance({P1, P2})
	end
	Variable.Need_SpeMove = Closer
	return true
end

function RevoltEngine.Go_FollowTrust(_target, _data)
	local el = BTarget.EntityByOption("alive,chartype=9")
	local tmp = nil
	if table.valid(el) then
		for id, e in pairs(el) do
			if table.valid(e) then
				if ((e.job ~= 37) and (e.job ~= 19)) or (Player.localmapid == 838) then
					local CanFollow = true
					if Player.localmapid == 838 and e.job == 28 then
						CanFollow = false
					end
					if table.valid(e.pos) and CanFollow == true  then
						if tmp == nil then
							tmp = e
						else
							if e.distance < tmp.distance then
								tmp = e
							end
						end
					end
				end
			end
		end
		if tmp ~= nil then
			BTarget.RemoveEntityInTarget()
			Variable.Save_Follow_Trust = tmp
			Variable.Need_SpeMove = tmp.pos
			return true
		end
	end
	return false
end

function RevoltEngine.Go_MultiEntityCasting(_data, _entity)
	local tmp = true
	for id ,e in pairs(_data.EntityList) do
		local option = nil
		if _data.OnlyTargetable then
			option = "targetable"
		end
		local entity = BTarget.FindEntity(e.id, option)
		if table.valid(entity) then
			if entity.castinginfo.channelingid ~= e.casting then
				tmp = false
			end
		end
	end
	if tmp == true then
		Variable.Need_SpeMove = _data.PositionFinal
		return true
	else
		return false
	end
end

function RevoltEngine.RecupSquadronPosition()
	return BTarget.EntityByOption("chartype=9")
end

function RevoltEngine.Go_Spread(_data)
	-- Recup Party Data
	local party = BTarget.EntityByOption("myparty")
	if not table.valid(EntityList.myparty) or Variable.Unsync then
		-- Solo Or Squadron or Trust
		party = RevoltEngine.RecupSquadronPosition()
	end
	-- Raid
	if _data.TakeFullAlliance then
		party = BTarget.EntityByOption("chartype=4")
	end
	--
	local px = Player.pos.x; local py = Player.pos.y; local pz = Player.pos.z;
	local Index = 1
	if _data.NoPlayer then
		px = 0; py = 0; pz = 0
		Index = 0
	end
	if table.valid(party) then
		for id, e in pairs(party) do
			if table.valid(e) then
				if e.hp.current ~= 0 then
					if _data.SpreadRange then
						if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, e.pos.x, e.pos.y, e.pos.z) < _data.SpreadRange then
							px = px + e.pos.x
							py = py + e.pos.y
							pz = pz + e.pos.z
							Index = Index + 1
						end
					else
						px = px + e.pos.x
						py = py + e.pos.y
						pz = pz + e.pos.z
						Index = Index + 1
					end
				end
			end
		end
	else
		BTarget.SetTarget()
		Variable.Boss_Init = true
		d("Go_Spread : Detect Solo -> Skip Avoid")
		return false
	end
	local Midder = {x = (px/Index), y = (py/Index), z = (pz/Index)}
	local Vecteur_Target_Player = {
		x = Player.pos.x - Midder.x,
		z = Player.pos.z - Midder.z,
	}
	local Distance = _data.Range
	local Norme_Vecteur_Target_Player = math.sqrt((Vecteur_Target_Player.x * Vecteur_Target_Player.x)
												+ (Vecteur_Target_Player.z * Vecteur_Target_Player.z))
	local _newposition = {
		x = Midder.x + ( Vecteur_Target_Player.x * Distance / Norme_Vecteur_Target_Player),
		y = Midder.y,
		z = Midder.z + ( Vecteur_Target_Player.z * Distance / Norme_Vecteur_Target_Player),
	}
	-- Got Avoid Position
	Variable.Need_SpeMove = _newposition
	return true
end

function RevoltEngine.Check_Position(_entity, _table)
	if table.valid(_table) then
		for iid, ie in pairs(_table) do
			local xmin = ie.Position_Init.x - 1; local xmax = ie.Position_Init.x + 1
			local ymin = ie.Position_Init.y - 1; local ymax = ie.Position_Init.y + 1
			local zmin = ie.Position_Init.z - 1; local zmax = ie.Position_Init.z + 1
			if 	(_entity.pos.x >= xmin) and (_entity.pos.x <= xmax) and
				(_entity.pos.y >= ymin) and (_entity.pos.y <= ymax) and
				(_entity.pos.z >= zmin) and (_entity.pos.z <= zmax) then
				-- got it
				d("Got it at index - "..iid.." &  entity ".._entity.id)
				if not ie.UseClosest then
					if table.valid(ie.Position_Final[RevoltEngine.GetRole()]) then
						Variable.Need_SpeMove = ie.Position_Final[RevoltEngine.GetRole()]
					else
						Variable.Need_SpeMove = ie.Position_Final
					end
				else
					Variable.Need_SpeMove = BMath.ShortDistance(ie.Position_Final)
				end
				return true
			end
		end
	end
	return false
end

function RevoltEngine.Go_EntityCheck(_data, _entity)
	if _data.EntityID then
		local el = BTarget.EntityByOption("maxdistance=120,contentid=".._data.EntityID)
		if table.valid(el) then
			if not _data.Missing then
				for id, e in pairs(el) do
					if RevoltEngine.Check_Position(e, _data.Table) then
						return true
					end
				end
			else
				for iid, ie in pairs(_data.Table) do
					local xmin = ie.Position_Init.x - 1; local xmax = ie.Position_Init.x + 1
					local ymin = ie.Position_Init.y - 1; local ymax = ie.Position_Init.y + 1
					local zmin = ie.Position_Init.z - 1; local zmax = ie.Position_Init.z + 1
					local tmp = false
					for id, e in pairs(el) do
						if table.valid(e) then
							if RevoltEngine.Check_ModeActive(e, _data) then
								if 	(e.pos.x >= xmin) and (e.pos.x <= xmax) and
									(e.pos.y >= ymin) and (e.pos.y <= ymax) and
									(e.pos.z >= zmin) and (e.pos.z <= zmax) then
									tmp = true
								end
							end
						end
					end
					if tmp == false then
						-- Position is Missing
						Variable.Need_SpeMove = ie.Position_Final
						return true
					end
				end
			end
		end
	else
		return RevoltEngine.Check_Position(_entity, _data.Table)
	end
	return false
end

function RevoltEngine.Go_FakeAvoid(_data)
	return true
end

function RevoltEngine.Go_SpecialAvoid(_data)
	local Tab = {
		[1] = function(data) return RevoltEngine.DoSpecial_Cosmos(data) end,
		[2] = function(data) return RevoltEngine.DoSpecial_TheBurn(data) end,
	}
	return Tab[_data.Id_Special](_data)
end

function RevoltEngine.CharactTargetedByAoe(_entity, _data)
	if _data.Type == "GoSide" then
		if _data.SideAll == true then
			d("Charact Targeted By Aoe -> Got side all")
			return true
		end
		if _data.Role then
			if table.valid(_data.Role) then
				if _data.Role[RevoltEngine.GetRole()] then
					d("Charact Targeted By Aoe -> Got good role : "..RevoltEngine.GetRole())
					return true
				end
			else
				if _data.Role == RevoltEngine.GetRole() then
					d("Charact Targeted By Aoe -> Got good role : "..RevoltEngine.GetRole())
					return true
				end
			end
			d("Charact Targeted By Aoe -> Got bad role : "..RevoltEngine.GetRole())
			return false
		end
		-- Check if Entity target Player
		local CastInfo = _entity.castinginfo
		if table.valid(CastInfo) then
			if CastInfo.channeltargetid ~= 0 then
				if _entity.id == CastInfo.channeltargetid then
					d("Charact Targeted By Aoe -> Entity target himself -> Ray Detected ?")
					return true
				end
				if Player.id == CastInfo.channeltargetid then
					d("Charact Targeted By Aoe -> Player Targeted")
					return true
				else
					local el = BTarget.EntityByOption("myparty")
					if table.valid(el) then
						for id, e in pairs(el) do
							if e.id == CastInfo.channeltargetid then
								-- Got it
								if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, e.pos.x, e.pos.y, e.pos.z) < _data.Range then
									d("Charact Targeted By Aoe -> Player close player Targeted")
									return true
								end
							end
						end
					end
				end
			end
		end
	end
	return true
end

function RevoltEngine.Avoid_System(_data, _entity)
	if table.valid(_data) and table.valid(_entity) then
		if Variable.Avoid_Function[_data.Type] then
			if RevoltEngine.CharactTargetedByAoe(_entity, _data) then
				return Variable.Avoid_Function[_data.Type](_entity, _data)
			end
		end
	end
	return false
end

function RevoltEngine.Got_DetectRange()
	local Range = 30
	local Table = {
		[150] = 120, --The Keeper of the Lake
		[371] = 120, --Snowcloak
		[421] = 120, --Vault
		[441] = 100, --Sohm Al	
		[689] = 80, --Ala Mhigo
		[822] = 80, --Mt. Gulg
		[823] = 80, --The Qitana Ravel
		[838] = 80, --Amaurot
	}
	if Table[Player.localmapid] then
		Range = Table[Player.localmapid]
	end
	if Variable.Boss_Find then
		Range = 80
	end
	return Range
end

function RevoltEngine.Check2Position(_listposition)
	if table.valid(_listposition) then
		for id, e in pairs(_listposition) do
			for iid, ie in pairs(Variable.Save_ListEntity) do
				--
				if 	math.round(e.x, 1) == math.round(ie.position.x, 1) and
					math.round(e.y, 1) == math.round(ie.position.y, 1) and
					math.round(e.z, 1) == math.round(ie.position.z, 1) then
					break
				end
			end
		end
	end
	return true
end

function RevoltEngine.IsNotInsideSaveEntity(_id)
	for id, e in pairs(Variable.Save_ListEntity) do
		if _id == e.id then
			return false
		end
	end
	return true
end

function RevoltEngine.RecupSavedEntity(_target)
	local Saved_Entity = RevoltEngine.RecupFromListEntity(_target.id)
	if not table.valid(Saved_Entity) then
		local Tab = {
			id = _target.id,
			contentid = _target.contentid,
			position = {x = 1, y = 1, z = 1},
		}
		table.insert(Variable.Save_ListEntity, Tab)							
		return Tab
	end	
	return Saved_Entity
end

function RevoltEngine.RecupFromListEntity(_id)
	if table.valid(Variable.Save_ListEntity) then
		for id, e in pairs(Variable.Save_ListEntity) do
			if e.id == _id then
				return e
			end
		end
	end
	return nil
end

function RevoltEngine.Update_ListEntity(_entity)
	for id, e in pairs(Variable.Save_ListEntity) do
		if e.id == _entity.id then
			e.position = _entity.pos
			return
		end
	end
	return
end

function RevoltEngine.Save_ListEntity(_id, _contentid)
	local el = BTarget.EntityByOption("maxdistance=70")
	Variable.Save_ListEntity = {}
	d("SaveEntity -> Actived")
	for id, e in pairs(el) do
		local Tab = {
			id = e.id,
			contentid = e.contentid,
			position = e.pos
		}
		table.insert(Variable.Save_ListEntity, Tab)
	end
end

function RevoltEngine.Check_ModeActive(_entity, _data, _savedentity)
	-- check mode active
	if not _data.ModeActive then
		return true
	end
	if _data.ModeActive == "Pop" then
		return true
	end
	if _data.ModeActive == "Animation" then
		if _entity.action == _data.AnimationID then
			return true
		end
	end
	if _data.ModeActive == "TargetBoss" then
		if _entity.targetid == Variable.Boss_ID then
			return true
		end
		if _data.UsePlayerTarget then
			if _entity.targetid == Player.id then
				return true
			end
		end
	end
	if _data.ModeActive == "Casting" then
		local castinfo = _entity.castinginfo
		if (castinfo.channelingid == _data.CastId) or (castinfo.castingid == _data.CastId) then
			return true
		end
	end
	if _data.ModeActive == "Position" then
		if table.valid(_savedentity) then
			if 	math.round(_entity.pos.x, 1) ~= math.round(_savedentity.position.x, 1) or
				math.round(_entity.pos.y, 1) ~= math.round(_savedentity.position.y, 1) or
				math.round(_entity.pos.z, 1) ~= math.round(_savedentity.position.z, 1) then
				-- Save New Position
				if _data.ResetEntityPosition then
					RevoltEngine.Save_ListEntity(_entity.id, _entity.contentid)
				else
					RevoltEngine.Update_ListEntity(_entity)
				end
				-- Actived
				return true
			end
		end
	end
	if _data.UseExclude then
		d("Insert - ".._entity.id)
		table.insert(Variable.SaveLastID, _entity.id)
	end
	return false
end

function RevoltEngine.Avoid_Entity(_entity, _data, _savedentity)
	-- Basic Check
	if _data.DistanceMax then
		if _entity.distance >= _data.DistanceMax then
			return false
		end
	end
	if _data.HP then
		if _entity.hp.max ~= _data.HP then
			return false
		end
	end
	if RevoltEngine.Check_ModeActive(_entity, _data, _savedentity) then
		return true
	end
	return false
end

function RevoltEngine.RecupLast(_data, action, entity, _argus)
	if table.valid(_data) then
		for id, e in pairs(_data) do
			if not _argus then
				if e.id == action and e.entity == entity then
					return true
				end
			else
				-- spe argue, skip entity check
				if e.id == action then
					return true
				end
			end
		end
	end
	return false
end

function RevoltEngine.RemoveLastAvoid(_task)
	if _argus then -- stop argus
		return
	end
	if table.valid(_task) then
		if Variable.InAoe then
			for id, e in pairs(Variable.LastAvoid) do
				if _task.ID == e.id and _task.Entity.id == e.entity then
					d("Avoid System - Remove Last Avoid - "..e.id.." ["..e.entity.."]")
					table.remove(Variable.LastAvoid, id)
					return
				end
			end
		end
		if Variable.InAnimation then
			for id, e in pairs(Variable.LastAnimation) do
				if _task.ID == e.id and _task.Entity.id == e.entity then
					d("Avoid System - Remove Last Animation - "..e.id.." ["..e.entity.."]")
					table.remove(Variable.LastAnimation, id)
					return
				end
			end
		end
	end
	return
end

function RevoltEngine.SearchDoubleAvoid(_id, _data)
	if _data.DoubleAvoidException then
		if table.valid(Variable.CurrentTask) then
			if Variable.CurrentTask.ID == _id then
				d("Avoid Exception -> False")
				return false
			end
		else
			return false
		end
	end
	return true
end

function RevoltEngine.SearchPriority(_id, _data)
	-- Check Prio
	local Prio_Data = 1
	if _data.Priority then
		Prio_Data = _data.Priority
	end
	local Prio_Task = 0
	if table.valid(Variable.CurrentTask) then
		Prio_Task = Variable.CurrentTask.Priority
	end
	d("Prio_Data -> : "..Prio_Data)
	d("Prio_Task -> : "..Prio_Task)
	if Prio_Data > Prio_Task then
		d("Avoid SearchPriority - ".._id.." : High Prio")
		return true
	end
	d("Avoid SearchPriority - ".._id.." : Less Prio")
	return false
end

function RevoltEngine.SearchData(_id, _data, _entity)
	if table.valid(_data.Role) then
		if not _data.Role[RevoltEngine.GetRole()] then
			d("Avoid SearchData - ".._id.." : Role Exit")
			return false
		end
	else
		if _data.Role then
			if _data.Role ~= RevoltEngine.GetRole() then
				d("Avoid SearchData - ".._id.." : Role Exit")
				return false
			end
		end
	end
	if _data.DistanceMax then
		if _entity.distance >= _data.DistanceMax then
			d("Avoid SearchData - ".._id.." : DistanceMax Exit ")
			return false
		end
	end
	if _data.KillAddBefore then
		local Target = BTarget.FindListEntity(_data.KillAddBefore, "alive")
		if table.valid(Target) then
			if (Target.hp.current ~= 1) then
				d("Avoid SearchData : Kill Add before Exit - "..Target.name)
				return false
			end
		end
	end
	return true
end

function RevoltEngine.SearchEntity(_data, _entity)
	if _data.Entity then
		if _entity.contentid ~= _data.Entity then
			return false
		end
	end
	if _data.HP then 
		if _entity.hp.max ~= _data.HP then
			return false
		end
	end
	return true
end

function RevoltEngine.SearchArgus(_id)
	if Argus then
		local Argusdata = Variable.Argus_Data
		if table.valid(Variable.Argus_Boss) then
			Argusdata = Variable.Argus_Boss
		end
		if table.valid(Argusdata) then
			for id, e in pairs (Argusdata) do
				if e.ID == _id then
					return false
				end
 			end
		end
	end
	return true
end

function RevoltEngine.Avoid_Aoe(id, _currentdata, _fulldata, _entity, _currentdataindex)
	if RevoltEngine.SearchArgus(id) then
		if RevoltEngine.SearchEntity(_currentdata, _entity) then
			if RevoltEngine.SearchData(id, _currentdata, _entity) then
				if RevoltEngine.Check_ModeActive(_entity, _currentdata, RevoltEngine.RecupSavedEntity(_entity)) then
					if RevoltEngine.SearchPriority(id, _currentdata) then
						if RevoltEngine.SearchDoubleAvoid(id, _currentdata) then
							if RevoltEngine.Avoid_System(_currentdata, _entity) then
								RevoltEngine.RemoveLastAvoid(Variable.CurrentTask)
								RevoltEngine.NewAvoid(id, _fulldata, _currentdata, _entity, _currentdataindex)
								d("Avoid System -          Active - "..id.." [".._entity.id.."]")
								return true
							end
						end
					end
				end
			end
		end
	end
	-- Avoid Not Actived
	return false
end

function RevoltEngine.Check_Avoid(_id, _data, _entity)
	-- Check Index
	if table.valid(_data[1]) then
		for avoid_id, avoid_e in pairs(_data) do
			if table.valid(avoid_e) then
				d("Avoid System : Check [ ".._id.." ] - "..avoid_id)
				if RevoltEngine.Avoid_Aoe(_id, avoid_e, _data, _entity, avoid_id) then
					d("Avoid System : Good [ ".._id.." ] - "..avoid_id)
					return true
				end
				d("Avoid System : Fail [ ".._id.." ] - "..avoid_id)
			end
		end
	else
		if RevoltEngine.Avoid_Aoe(_id, _data, _data, _entity) then
			return true
		end
	end
	-- Avoid is not actived
	return false
end

-- A refaire
function RevoltEngine.CheckEntityOutBoss()
	if Variable.CurrentDuty and not Variable.Boss_Find then
		if Variable.CurrentDuty.EntityOutBoss then
			local _data = Variable.CurrentDuty.EntityOutBoss
			if table.valid(_data) then
				for id, e in pairs(_data) do
					local el = BTarget.EntityByOption("contentid="..id..",maxdistance="..e.RangeDetect)
					if table.valid(el) then
						for iid, ie in pairs(el) do
							if ie.contentid == id then
								d("EntityOutBoss Detected")
								-- Check Distance
								local tmp = false
								if e.DistanceMax then
									if ie.distance >= e.DistanceMax then
										tmp = true
									end
								end
								-- Check SpeMove
								if Variable.Need_SpeMove then
									if e.Type == "GoAwayEntity" then
										if Distance3D(ie.pos.x, ie.pos.y, ie.pos.z, Variable.Need_SpeMove.x, Variable.Need_SpeMove.y, Variable.Need_SpeMove.z) > e.Range then
											d("EntityOutBoss -> SKip")
											tmp = true
										end
									end
									if e.Type == "GoCloseEntity" then
										if Distance3D(ie.pos.x, ie.pos.y, ie.pos.z, Variable.Need_SpeMove.x, Variable.Need_SpeMove.y, Variable.Need_SpeMove.z) < e.Range then
											d("EntityOutBoss -> SKip")
											tmp = true
										end
									end
								end
								if e.ModeActive == "Casting" then
									local castinfo = ie.castinginfo
									if castinfo.channelingid ~= e.CastId then
										tmp = true
									end									
								end
								if not tmp then
									-- Check Prio
									local Prio_Data = 1
									if e.Priority then
										Prio_Data = e.Priority
									end
									local Prio_Task = 0
									if table.valid(Variable.CurrentTask) then
										Prio_Task = Variable.CurrentTask.Priority
									end
									if Prio_Data > Prio_Task then
										if RevoltEngine.Check_Avoid(id, e, ie) then
											d("Avoid System -                     EntityOutFight Actived - "..id)
											return true
										end
									else
										d("EntityOutFight : "..iid.." -> Less Priority")
									end
								end
							end
						end
					end
				end
			end
		end
	end
	return
end

-- A refaire
function RevoltEngine.CheckEntityInBoss()
	if Variable.Boss_Find and Variable.Boss_ID then
		-- Check Default List
		local Phase = RevoltEngine.RecupPhase(Variable.Boss_Table[Variable.Boss_Find])
		if Phase.Entity then
			-- Init ListEntity
			if not table.valid(Variable.Save_ListEntity) then
				RevoltEngine.Save_ListEntity(Variable.Boss_ID, Variable.Boss_Find)
			end
			-- Recup Entity Option
			local SavedEntity = nil
			local SavedData = nil
			local SavedDataID = nil
			for id, e in pairs(Phase.Entity) do 
				-- Search Best Target
				local Option = "contentid="..id..",maxdistance="..e.RangeDetect
				if e.TankDetect and (Player.role == 1) then
					Option = "contentid="..id..",maxdistance="..e.TankDetect
				end
				if e.UseMinDistance then
					Option = Option..",mindistance="..e.UseMinDistance
				end
				if e.SearchCloser then
					local Target = BTarget.FindEntity(id, Option, Variable.SaveLastID)
					if table.valid(Target) then
						if RevoltEngine.Check_Avoid(id, e, Target) then
							d("Entity : "..Target.contentid.." [ "..Target.id.." ]")
							return true
						end
					end
				else
					local el = BTarget.EntityByOption(Option)
					if table.valid(el) then
						for iid, ie in pairs(el) do
							if id == ie.contentid then
								if ie.id ~= Variable.Boss_ID or e.CheckBossToo then
									if RevoltEngine.Check_Avoid(id, e, ie) then
										d("Entity : "..ie.contentid.." [ "..ie.id.." ]")
										return true
									end
								end
							end
						end
					end
				end
			end
			return false
		end
	end
	return false
end

function RevoltEngine.Got_Casting(_data)
	if table.valid(_data) then
		if table.valid(Variable.Casting_Boss) then
			_data = Variable.Casting_Boss
		end
		local Range = RevoltEngine.Got_DetectRange()
		-- Take Every Entity in Combat
		local Entity = BTarget.EntityByOption("maxdistance="..Range)
		if table.valid(Entity) then
			for id, e in pairs(Entity) do
				local CastInfo = e.castinginfo
				if table.valid(CastInfo) then
					for iid, ie in pairs(_data) do
						if CastInfo.castingid == iid then
							-- Got Avoid matched with data
							local Last = RevoltEngine.RecupLast(Variable.LastAvoid, iid, e.id)
							if not Last then
								Variable.InCasting = true
								Variable.InAoe = false
								Variable.InBuff = false
								Variable.InAnimation = false
								if RevoltEngine.Check_Avoid(iid, ie, e) then
									d("Avoid System -                     Casting Detected - "..iid)
									return true
								end
							else
								local Avoid_Data = ie
								if table.valid(ie[1]) then
									Avoid_Data = ie[1]
								end
								d("Same Casting Detected : "..iid.." -> "..Avoid_Data.Type.." for entiy : "..e.id)
							end
						end
					end
				end
			end
		end
	else
		d("wrong Data : Avoid Casting")
	end
	return false
end

function RevoltEngine.Got_Buff(_data)
	if table.valid(_data) then
		if table.valid(Variable.Buff_Boss) then
			_data = Variable.Buff_Boss
		end
		local PBuffs = Player.buffs
		for id, e in pairs(PBuffs) do
			for iid, ie in pairs(_data) do
				if e.id == iid then
					if ie.Entity then
						local Range = RevoltEngine.Got_DetectRange()
						local Entity = BTarget.EntityByOption("maxdistance="..Range)
						if table.valid(Entity) then
							for iiid, iie in pairs(Entity) do
								if iie.contentid == ie.Entity then
									if RevoltEngine.Check_Avoid(iid, ie, iie) then
										d("Avoid System -                     Buff/Debuff Detected - "..iid)
										Variable.InBuff = true
										Variable.InAoe = false
										Variable.InAnimation = false
										Variable.InCasting = false
										return true
									end
								end
							end
						end
					else
						if RevoltEngine.Check_Avoid(iid, ie, Player) then
							Variable.InBuff = true
							Variable.InAoe = false
							Variable.InAnimation = false
							Variable.InCasting = false
							return true
						end
					end
				end
			end
		end		
	else
		d("Wrong Data : Avoid Buff")
	end
	return false
end

function RevoltEngine.Got_Animation(_data)
	if table.valid(_data) then
		if table.valid(Variable.Animation_Boss) then
			_data = Variable.Animation_Boss
		end
		local Range = RevoltEngine.Got_DetectRange()
		-- Take Every Entity in Combat
		local Entity = BTarget.EntityByOption("maxdistance="..Range)
		if table.valid(Entity) then
			for id, e in pairs(Entity) do
				local ActionInfo = e.action
				for iid, ie in pairs(_data) do
					if (ie.Id_boss == e.contentid) or (ie.Entity == e.contentid) then
						if iid == ActionInfo then
							-- Got Animation matched with data
							local Last = RevoltEngine.RecupLast(Variable.LastAnimation, iid, e.id)
							if not Last then
								Variable.InAoe = false
								Variable.InBuff = false
								Variable.InAnimation = true
								Variable.InCasting = false
								if RevoltEngine.Check_Avoid(iid, ie, e) then
									d("Avoid System -                     Animation Detected - "..iid)
									return true
								end
							else
								local Avoid_Data = ie
								if table.valid(ie[1]) then
									Avoid_Data = ie[1]
								end
								d("Same Aoe Detected : "..iid.." -> "..Avoid_Data.Type.." for entiy : "..e.id)
							end
						end
					end
				end
			end
		end
	else
		d("wrong Data : Avoid Animation")
	end
	return false
end

function RevoltEngine.Got_Aoe(_data)
	if table.valid(_data) then
		if table.valid(Variable.Aoe_Boss) then
			_data = Variable.Aoe_Boss
		end
		local Range = RevoltEngine.Got_DetectRange()
		-- Take Every Entity in Combat
		local Entity = BTarget.EntityByOption("maxdistance="..Range)
		if table.valid(Entity) then
			for id, e in pairs(Entity) do
				local CastInfo = e.castinginfo
				if table.valid(CastInfo) then
					for iid, ie in pairs(_data) do
						if (iid == CastInfo.channelingid) or (CastInfo.castingid == iid) then
							-- Got Avoid matched with data
							local Last = RevoltEngine.RecupLast(Variable.LastAvoid, iid, e.id)
							if not Last then
								Variable.InAoe = true
								Variable.InCasting = false
								Variable.InAnimation = false
								Variable.InBuff = false
								if RevoltEngine.Check_Avoid(iid, ie, e) then
									d("Avoid System -                     Aoe Detected - "..iid)
									return true
								end
							else
								local Avoid_Data = ie
								if table.valid(ie[1]) then
									Avoid_Data = ie[1]
								end
								d("Same Aoe Detected : "..iid.." -> "..Avoid_Data.Type.." for entiy : "..e.id)
							end
						end
					end
				end
			end
		end
	else
		d("wrong Data : Avoid Aoe")
	end
	return false
end

function RevoltEngine.AvoidUpdate(Event, ticks)
	if (not AvoidUpdate.Timer or ticks - AvoidUpdate.Timer > AvoidUpdate.Pulse) then
		if not AvoidUpdate.Timer then
			AvoidUpdate.Timer = ticks
		else
			AvoidUpdate.Timer = AvoidUpdate.Timer + AvoidUpdate.Pulse
		end
		if AvoidUpdate.Active == true then
			if not AvoidUpdate.Pause == true then
				------------
				if Player.incombat and Player.alive then
					-- Block Avoid
					if Variable.StopAvoid then
						if BUtility.Wait(Variable.StopAvoid, "StopAvoid") then
							Variable.StopAvoid = false
						else
							return
						end
					end
					--
					if BStep.GetCurrentStep() and not Variable.Boss_Find then
						-- Got Step & Not in Boss (KP 3 Tank)
						if BStep.GetBeforeStep() and not table.valid(BTarget.GetTarget()) then
							return
						end
					end
					-- Current Task
					if table.valid(Variable.CurrentTask) then 
						BUtility.ResetWait("Reset_AoE_System")
						-- Do Task
						if not RevoltEngine.DoTask(Variable.CurrentTask) then
							Variable.InBehevior = false
							Variable.CurrentTask = nil
							if not table.valid(Variable.Need_SpeMove) then
								Variable.NextPulseIsAfterAvoid = false
							end
						end
					end
					-- Find Task / More Prio Task
					local Tab = {
						[1] = function() local _data = Variable.Avoid_Data; RevoltEngine.Got_Aoe(_data) end,
						[2] = function() RevoltEngine.CheckEntityInBoss() end,
						[3] = function() RevoltEngine.CheckEntityOutBoss() end,
						[4] = function() local _data = Variable.Animation_Data; RevoltEngine.Got_Animation(_data) end,
						[5] = function() local _data = Variable.Buff_Data; RevoltEngine.Got_Buff(_data) end,
						[6] = function() local _data = Variable.Casting_Data; RevoltEngine.Got_Casting(_data) end,
						[7] = function() local _data = Variable.Argus_Data; RevoltEngine.Got_Argus(_data) end,
					}
					for id, e in pairs(Tab) do
						e()
					end
					-- Reset Check
					if not table.valid(Variable.CurrentTask) then
						if Variable.InsideArgus then
							Variable.NextPulseIsAfterAvoid = true
						else
							if not table.valid(Variable.Need_SpeMove) then
								Variable.NextPulseIsAfterAvoid = false
							end
						end
						if BUtility.Wait(30, "Reset_AoE_System") then
							d("Reset Avoid System [Wait]")
							RevoltEngine.Reset_Avoid(true)
						end
					end
				else
					RevoltEngine.Reset_Avoid(false)
				end
			end
		end
	end
end
RegisterEventHandler("Gameloop.Update", RevoltEngine.AvoidUpdate, Addon.Name)
----------------------------	[End AoE / Animation Avoid]		-------------------------------------------

----------------------------	[Finish Run]		-------------------------------------------
function RevoltEngine.GotExit()
	if Variable.AutoDes == true then
		if Variable.HadCreatedNewListItem == false then
			RevoltEngine.CreateNewListItem()
			Variable.HadCreatedNewListItem = true
		end
		if Variable.HadCheckNewItemOnList == false then
			RevoltEngine.CheckNewItemOnList()
			Variable.HadCheckNewItemOnList = true
		end
	end
	local FTarget = BTarget.FindEntity(Variable.CurrentDuty.Exit, "contentid="..Variable.CurrentDuty.Exit)
	if FTarget ~= nil then
		-- Close shortcut
		if Player.localmapid == 442 or Player.localmapid == 449 or Player.localmapid == 580 or Player.localmapid == 584 then
			if BMovement.doMoveToPosition(FTarget.pos,4.4) then
				BInteract.Interact(FTarget.id)
				return true
			end
			return false
		end
		if BMovement.doMoveToPosition(FTarget.pos) then
			BInteract.Interact(FTarget.id)
			return true
		end
		return false
	end
end

function RevoltEngine.TakeBossChest()
	if Variable.TakeLastChest == true then
		if Variable.CurrentDuty.ChestBoss then
			local FTarget = BTarget.FindEntity(Variable.CurrentDuty.ChestBoss, "targetable,contentid="..Variable.CurrentDuty.ChestBoss)
			if FTarget ~= nil then
				-- Check Loot Not needed
				if BMovement.doMoveToPosition(FTarget.pos, 1) then
					BInteract.Interact(FTarget.id)
					-- Chest Open
					if Variable.Loot == 1 then
						-- Loot Not Selected
						if not RevoltEngine.Check_LootList(3) then
							-- Need Check Loot
							return false
						end
					end
				end
				return false
			end
		end
		if Variable.CurrentDuty.ChestBoss2 then
			local FTarget = BTarget.FindEntity(Variable.CurrentDuty.ChestBoss2, "targetable,contentid="..Variable.CurrentDuty.ChestBoss2)
			if FTarget ~= nil then
				-- Check Loot Not needed
				if BMovement.doMoveToPosition(FTarget.pos, 1) then
					BInteract.Interact(FTarget.id)
					-- Chest Open
					if Variable.Loot == 1 then
						-- Loot Not Selected
						if not RevoltEngine.Check_LootList(3) then
							-- Need Check Loot
							return false
						end
					end
				end
				return false
			end
		end
		if Variable.CurrentDuty.ChestBoss3 then
			local FTarget = BTarget.FindEntity(Variable.CurrentDuty.ChestBoss3, "targetable,contentid="..Variable.CurrentDuty.ChestBoss3)
			if FTarget ~= nil then
				-- Check Loot Not needed
				if BMovement.doMoveToPosition(FTarget.pos, 1) then
					BInteract.Interact(FTarget.id)
					-- Chest Open
					if Variable.Loot == 1 then
						-- Loot Not Selected
						if not RevoltEngine.Check_LootList(3) then
							-- Need Check Loot
							return false
						end
					end
				end
				return false
			end
		end
	end
	return true
end

function RevoltEngine.Finish_Other()
	if RevoltEngine.TakeBossChest() then
		RevoltEngine.GotExit()
	end
	return
end

function RevoltEngine.Finish_Guildhest()
	-- Wait Auto-Teleportation
	local p = Player
	local PosFinal = Variable.CurrentDuty.PositionFinish
	if Distance3D(p.pos.x, p.pos.y, p.pos.z, PosFinal.x, PosFinal.y, PosFinal.z) <= 5 then
		-- Close Npc
		if BCommun.IsControlOpen("JournalResult") then
			BInteract.SelectRewardQuest(0)
		else
			local FTarget = BTarget.FindEntity(Variable.CurrentDuty.NpcFinish)
			if table.valid(FTarget) then
				if BUtility.Wait(Variable.WaitGuild, "Finish_GuildHest") then
					BInteract.Interact(FTarget.id)
					Variable.WaitGuild = 90
				end
			end
			return
		end
	end
	return
end

function RevoltEngine.Finish_Run()
	if Variable.CurrentDuty.Type == 4 then
		-- Guildhest
		RevoltEngine.Finish_Guildhest()
	else
		-- Other (Dungeons / Trials / Raids)
		RevoltEngine.Finish_Other()
	end
	return
end
----------------------------	[End Finish Run]		-------------------------------------------

----------------------------	[Boss]		-------------------------------------------
function RevoltEngine.IsLimitMax(_LimitInfo, _entity)
	local Modulo = (_LimitInfo.numgauge * _LimitInfo.value) % 10000
	if Modulo == 0 then
		if _entity.hp.percent >= (5 * _LimitInfo.numgauge) and _entity.hp.percent <= 20 and Player.hp.percent >= 75 then
			-- Do LimitBreak
			d("Do LimitBreak ".._LimitInfo.numgauge)
			BMovement.StopMove()
			ActionList:Get(5, 3):Cast(_entity.id)
			return true
		end
	end
	if (_entity.hp.percent <= _LimitInfo.numgauge * 5) and (_LimitInfo.value >= 10000) then
		d("Do LimitBreak ".._LimitInfo.numgauge)
		BMovement.StopMove()
		ActionList:Get(5, 3):Cast(_entity.id)
		return true
	end
	return false
end

function RevoltEngine.IsMeleeDps(_job)
	local tab = {
		[2] = true,
		[4] = true,
		[20] = true,
		[22] = true,
		[29] = true,
		[30] = true,
		[34] = true,
	}
	return tab[_job]
end

function RevoltEngine.CanDoLimit(_setup, _entity)
	if not Variable.UseLimitBreak and not Variable.Need_SpeMove then
		-- Check Squadron
		if _entity.targetable and BUtility.CanAttack(_entity.id) then
			local AddonControl = GetControl("_LimitBreak"):GetData()
			if table.valid(AddonControl) then
				if Variable.Squadron then
					if _entity.hp.percent >= 30 and _entity.hp.percent <= 50 and AddonControl.value >= 10000 and Player.hp.percent >= 75 then
						-- Do LimitBreak
						d("Do LimitBreak "..AddonControl.numgauge.." for Squadron")
						ActionList:Get(19, 4):Cast(_entity.id)
						return true
					end
				else
					-- NormalTeam
					-- Check Player
					if Player.role == 2 then
						return RevoltEngine.IsLimitMax(AddonControl, _entity)
					end
					-- Check Team
					local el = BTarget.EntityByOption("myparty")
					if table.valid(el) then
						for id, e in pairs(el) do
							if RevoltEngine.IsMeleeDps(e.job) then
								-- Got Melee
								return false
							end
						end
					end
					if Player.role == 3 then
						return RevoltEngine.IsLimitMax(AddonControl, _entity)
					end
				end
			end
		end
	end
	return false
end

function RevoltEngine.WhenNotTargetable(_data)
	if _data.Type == "MoveToPosition" then
		if table.valid(_data.Position[RevoltEngine.GetRole()]) then
			Variable.Need_SpeMove = _data.Position[RevoltEngine.GetRole()]
		end
	end
end

function RevoltEngine.Fight_Target(Target, _setup, _bosstarget)
	-- Set Target
	if not Variable.Need_SpeMove then
		BTarget.SetTarget(Target.id)
		BCommun.RunMinion(true, "Fight Target 1")
		if _setup and _bosstarget then
			if not RevoltEngine.CanDoLimit(_setup, _bosstarget) then
				if not BUtility.CanAttack(Target.id) then -- Not in Combat Range
					if not RevoltEngine.CheckPrioMS(_setup) then
						BMovement.doMoveToPosition(Target.pos)
					end
					return
				else
					if Variable.Squadron then
						-- In Squadron
						if table.valid(BTarget.GetTarget()) then
		--					d("ORDER ENGAGE Fight_Target")
							BAction.UseAction(19, 1, BTarget.GetTarget().id)
						end
					end
					if Variable.GoFormation then
						if BMovement.doMoveToPosition(_setup.Engage_Pos) then
							Variable.GoFormation = false
						end
					else
						if not Variable.Need_SpeMove then
							-- Fight
							if not Variable.InitCast then
								if BUtility.Wait(10, "InitFirstAction3") then
									local InitAction = BVariable.Get_InitAction_By_Job(Player.job)
									if BAction.IsActionReady(1, InitAction, BTarget.GetTarget().id) then
										BAction.UseAction(1, InitAction, BTarget.GetTarget().id)
									end
									Variable.InitCast = true
								end
							end
							BMovement.StopMove()
						end
					end
				end
			end
		end
	end
end

function RevoltEngine.Recup_BossTarget(_bosstarget)
	local FTarget = BTarget.FindEntity(_bosstarget.contentid, "targetable,chartype=5,maxdistance=80")
	if table.valid(FTarget) then
		if FTarget ~= BTarget.GetTarget() then
			BeheviorUpdate.Pause = false
			BTarget.SetEntityInTarget(FTarget)
		end
	end
end

function RevoltEngine.Got_New_Prio(_list, _contentid, _setup)
	if table.valid(_list) then
		local Range = Variable.DefaultRange
		if _setup.Prio_Target_RangeDetect then
			Range = _setup.Prio_Target_RangeDetect
		end
		local Target = BTarget.FindListEntity(_listID, "targetable,alive,maxdistance="..Range)
		if table.valid(Target) then
			d("Check Prio : ".._contentid)
			if Target.contentid == _contentid then
				if (Target.hp.current ~= 1) then
					-- Got Other add
					d("PrioTarget Same ID finded")
					if Variable.Squadron then
	--					d("ORDER REPLI Got_New_Prio")
						BAction.UseAction(19, 2)
					end
					Variable.PrioTarget = Target.id
					Variable.InitCast = false
					BTarget.SetEntityInTarget(Target)
					return true
				end
			end
		end
	end
	return false
end

function RevoltEngine.Prio_is_dead(_setup, _contentid)
	-- Check if other same Add to kill before move
	local Range = Variable.DefaultRange
	if _setup.Prio_Target_RangeDetect then
		Range = _setup.Prio_Target_RangeDetect
	end
	local ListTarget = BTarget.EntityByOption("alive,targetable,attackable,maxdistance="..Range..",contentid=".._contentid)
	if not RevoltEngine.Got_New_Prio(ListTarget, _contentid, _setup) then
		-- No Add -> Go check if need move
		if (Player.role == 1) then
			if table.valid(_setup.Position_After_Add_Tank) then
				if table.valid(_setup.Position_After_Add_Tank[_contentid]) then
					Variable.Need_SpeMove = _setup.Position_After_Add_Tank[_contentid]
				end
			end
		else -- Other Job
			if table.valid(_setup.Position_After_Add_Dps_Heal) then
				if table.valid(_setup.Position_After_Add_Dps_Heal[_contentid]) then
					Variable.Need_SpeMove = _setup.Position_After_Add_Dps_Heal[_contentid]
				end
			end
		end
		-- Reset Target Here ? 
		BTarget.RemoveEntityInTarget()
		Variable.InitCast = false
		Variable.PrioTarget = nil
		return false
	else
		-- Find New ID
		return true
	end
end

function RevoltEngine.Boss_Prio_Range(_setup)
	local Range = Variable.DefaultRange
	if Player.localmapid == 742 then
		Range = 80
	end
	if Player.localmapid == 207 then -- Mog
		Range = 125
	end
	if Player.localmapid == 364 then -- MogEX
		Range = 125
	end
	if _setup.Prio_Target_RangeDetect then
		Range = _setup.Prio_Target_RangeDetect
	end
	return Range
end

function RevoltEngine.Check_Prio(_listID, _listMove, _setup, _prio)
	local Range = RevoltEngine.Boss_Prio_Range(_setup)
	local Tmp_target = {}
	-- Recup All Target
	if table.valid(_listID) then
		for id, e in pairs(_listID) do
			local el = BTarget.EntityByOption("targetable,alive,maxdistance="..Range..",contentid="..e)
			if table.valid(el) then
				for iid, ie in pairs(el) do
					table.insert(Tmp_target, ie)
					break
				end
			end
		end
		-- Epur List
		local Tmp = nil
		for id, e in pairs(Tmp_target) do
			if not Tmp then
				Tmp = e
			else
				if table.valid(_prio) then
					if _prio[Tmp.contentid] and _prio[e.contentid] then
						if _prio[e.contentid] > _prio[Tmp.contentid] then
							Tmp = e
						end
					end
				end
			end
		end
		if table.valid(Tmp) then
			if Variable.PrioTarget then
				if Variable.PrioTarget == Tmp.id then
					return false
				end
			end
			local Wait = 1
			if table.valid(_setup.Prio_Target_Wait) then
				if _setup.Prio_Target_Wait[Tmp.contentid] then
					Wait = _setup.Prio_Target_Wait[Tmp.contentid]
				end
			end
			if BUtility.Wait(Wait,"PrioTarget_Wait") then
				d("Check PrioTarget -> Got One")
				Tmp = BTarget.FindEntity(Tmp.contentid,"targetable,alive,maxdistance="..Range)
				-- Prio Finded -> Set In Target
				Variable.PrioTarget = Tmp.id
				BTarget.SetEntityInTarget(Tmp)
				Variable.InitCast = false
				-- Check Need Move
				if table.valid(_listMove) then
					if table.valid(_listMove[Tmp.contentid]) then
						Variable.Need_SpeMove = _listMove[Tmp.contentid]
					end
				end
				return true
			end
		end
	end
	return false
end

function RevoltEngine.Prio_Target(_setup, _percent, _target)
	-- Check Boss life
	if Variable.PrioTarget then
		-- Got PrioTarget already
		local Target = BTarget.GetTarget()
		if table.valid(Target) then
			-- Check Priotiry ???? A GARDER ????
			if table.valid(_setup.Prio_Target_Priority) then
				-- Check Target
				if Player.role == 1 or not table.valid(EntityList.myparty) or Variable.Unsync then
					if RevoltEngine.Check_Prio(_setup.Prio_Target_Tank, _setup.Position_For_Add_Tank, _setup, _setup.Prio_Target_Priority) then
						d("Prio Add -> Tank Priority")
						Target = BTarget.GetTarget()
					end
				end
				if Player.role ~= 1 or not table.valid(EntityList.myparty) or Variable.Unsync then
					if RevoltEngine.Check_Prio(_setup.Prio_Target_Dps_Heal, _setup.Position_For_Add_Dps_Heal, _setup, _setup.Prio_Target_Priority) then
						d("Prio Add -> Dps or Healer Priority")
						Target = BTarget.GetTarget()
					end
				end
			end
			-- Save Check
			local el = BTarget.FindEntity(Variable.PrioTarget, "alive,targetable,maxdistance=90")
			if not table.valid(el) then
				d("Save Check -> Reset Target - 1")
				BTarget.RemoveEntityInTarget()
				Variable.PrioTarget = nil
				return false
			end
			if Target.id ~= Variable.PrioTarget then
				d("Save Check -> Reset Target - 2")
				BTarget.RemoveEntityInTarget()
				Variable.PrioTarget = nil
				return false
			end
			-- Closer add with same contentid
			local CloserTarget = BTarget.FindEntity(Target.contentid,"targetable,alive")
			if table.valid(CloserTarget) then
				if CloserTarget.id ~= Target.id and Target.hp.percent >= 90 then
					Variable.PrioTarget = CloserTarget.id
					BTarget.SetEntityInTarget(CloserTarget)
					Target = BTarget.GetTarget()
				end
			end
			-- Init fight
			if Player.incombat then
				if not Variable.InitCast then
					if BUtility.CanAttack(Target.id) then
						-- Check Wait
						if BUtility.Wait(10, "InitFirstAction") then
							local InitAction = BVariable.Get_InitAction_By_Job(Player.job)
							if BAction.IsActionReady(1, InitAction, BTarget.GetTarget().id) then
								BAction.UseAction(1, InitAction, BTarget.GetTarget().id)
							end
							Variable.InitCast = true
						end
					end
				end
			end
			if (not Target.alive) or (Target.hp.current == 1) or (not Target.incombat and Target.hp.percent ~= 100) or (not Target.attackable) then
				-- Do next
				d("PrioTarget Not Alive")
				return RevoltEngine.Prio_is_dead(_setup, Target.contentid)
			end
			return true
		end
	else
		if _percent <= 5 and _target.targetable and Variable.CurrentDuty.Type == 1 then
			if _target.contentid ~= 4656 then 
				d("-5% -> Focus Boss")
				return false
			end
		end
		-- Check Target
		if Player.role == 1 or not table.valid(EntityList.myparty) or Variable.Unsync then
			if RevoltEngine.Check_Prio(_setup.Prio_Target_Tank, _setup.Position_For_Add_Tank, _setup) then
				d("Prio Add -> Tank")
				return true
			end
		end
		if Player.role ~= 1 or not table.valid(EntityList.myparty) or Variable.Unsync then
			if RevoltEngine.Check_Prio(_setup.Prio_Target_Dps_Heal, _setup.Position_For_Add_Dps_Heal, _setup) then
				d("Prio Add -> Dps or Healer")
				return true
			end
		end
	end
	Variable.PrioTarget = nil
	return false
end

function RevoltEngine.InitFight(_target)
	if Player.incombat then
		if not Variable.InitCast then
			if BUtility.CanAttack(_target.id) then
				-- Check Wait
				if BUtility.Wait(10, "InitFirstAction") then
					BCommun.PutSettingsAssist()
					local InitAction = BVariable.Get_InitAction_By_Job(Player.job)
					if BAction.IsActionReady(1, InitAction, BTarget.GetTarget().id) then
						BAction.UseAction(1, InitAction, BTarget.GetTarget().id)
					end
					Variable.InitCast = true
				end
			end
		end
	end
	return
end

function RevoltEngine.Target_SafeCheck(_list, _data)
	local Target = BTarget.GetTarget()
	if table.valid(Target) then
		-- Save Check Variable.Prio_Target
		if Target.id ~= Variable.PrioTarget then
			d("Save Check -> Reset Target - 2")
			BTarget.RemoveEntityInTarget()
			Variable.PrioTarget = nil
			return false
		end
		-- Save Check Target
		local el = BTarget.FindEntity(Target.id, "alive,targetable,maxdistance=90")
		if not table.valid(el) then
			d("Save Check -> Reset Target - 1")
			BTarget.RemoveEntityInTarget()
			Variable.PrioTarget = nil
			return false
		end
		-- Closer add with same contentid
		local CloserTarget = BTarget.FindEntity(Target.contentid, "alive,targetable,maxdistance=90")
		if table.valid(CloserTarget) then
			if CloserTarget.id ~= Target.id and Target.hp.percent >= 90 then
				Variable.PrioTarget = CloserTarget.id
				BTarget.SetEntityInTarget(CloserTarget)
			end
		end
	end
	return true
end

function RevoltEngine.Target_FindBetterPriority(_list, _data)
	local Tmp = nil
	for id, e in pairs(_list) do
		if not Tmp then
			Tmp = e
		else
			if table.valid(_data[Tmp.contentid]) and table.valid(_data[e.contentid]) then
				if _data[e.contentid].Priority > _data[Tmp.contentid].Priority then
					Tmp = e
				end
			end
		end
	end
	return Tmp
end

function RevoltEngine.Target_SelectTarget(_data, _targetlist)
	-- Current Target not here
	local Tmp = RevoltEngine.Target_FindBetterPriority(_targetlist, _data)
	--
	if table.valid(Tmp) then
		if Variable.PrioTarget then
			if Variable.PrioTarget == Tmp.id then
				return false
			end
		end
		--
		Tmp = BTarget.FindEntity(Tmp.contentid,"targetable,alive,maxdistance="..Range)
		if table.valid(Tmp) then
			local DataTarget = _data[Tmp.contentid]
			local Wait = 1
			if DataTarget.Wait_Between2Target then
				Wait = DataTarget.Wait_Between2Target
			end
			if BUtility.Wait(Wait,"PrioTarget_Wait") then
				d("Check PrioTarget -> Got One")
				-- Prio Finded -> Set In Target
				Variable.PrioTarget = Tmp.id
				BTarget.SetEntityInTarget(Tmp)
				Variable.InitCast = false
				-- Check Need Move
				if table.valid(DataTarget.MoveBefore) then
					if table.valid(DataTarget.MoveBefore[RevoltEngine.GetRole()]) then
						Variable.Need_SpeMove = DataTarget.MoveBefore[RevoltEngine.GetRole()]
					else
						Variable.Need_SpeMove = DataTarget.MoveBefore
					end
				end
				return true
			end
		end
	end
	return false
end

function RevoltEngine.ActiveCheck(_target, _targetdata, _info_boss)
	local Percent_Default = 5
	if _targetdata.BossHpPercent then
		Percent_Default = _targetdata.BossHpPercent
	end
	if _info_boss.hp.percent <= Percent_Default and _info_boss.targetable then
		if _target.contentid ~= 4656 then 
			d("-5% -> Focus Boss")
			return false
		end
	end
	return true
end

function RevoltEngine.Target_CheckList(_list, _info_boss)
	-- Map_Detection_Range
	local Map_Detection_Range = 80
	if _list.Map_Detection_Range then
		Map_Detection_Range = _list.Map_Detection_Range
	end
	-- Recup Valid Target
	local Potential_Target = {}
	local el = BTarget.EntityByOption("alive,maxdistance="..Map_Detection_Range)
	if table.valid(el) then
		for id, e in pairs(el) do
			if table.valid(_list[e.contentid]) then -- Got Data
				if RevoltEngine.ActiveCheck(e, _list[e.contentid], _info_boss) then
					if table.valid(_list[e.contentid].Role) then -- Got Role
						if _list[e.contentid].Role[RevoltEngine.GetRole()] or not table.valid(EntityList.myparty) or Variable.Unsync then
							table.insert(Potential_Target, e)
						end
					else
						table.insert(Potential_Target, e)
					end
				end
			end
		end
	end
	-- Check Potential Target
	if table.valid(Potential_Target) then
		return RevoltEngine.Target_SelectTarget(_list, Potential_Target)
	end
	return false
end

function RevoltEngine.Target_System(_data_boss, _percent_boss, _info_boss)
	if table.valid(_data_boss.Target) then
		local List = _data_boss.Target
		if Variable.PrioTarget then
			-- Got PrioTarget already
			if not RevoltEngine.Target_SafeCheck() then
				return false
			end
			local Target = BTarget.GetTarget()
			if table.valid(Target) then
				-- Init fight
				RevoltEngine.InitFight(Target)
				if (not Target.alive) or (Target.hp.current == 1) or (not Target.incombat and Target.hp.percent ~= 100) or (not Target.attackable) then
					d("PrioTarget Not Alive")
					if not RevoltEngine.Target_CheckList(List, _info_boss) then
						-- Check Need Move
						local Data = List[Target.contentid]
						if table.valid(Data) then
							if table.valid(Data.MoveAfter) then
								if table.valid(Data.MoveAfter[RevoltEngine.GetRole()]) then
									Variable.Need_SpeMove = Data.MoveAfter[RevoltEngine.GetRole()]
								else
									Variable.Need_SpeMove = Data.MoveAfter
								end
							end
						end
						Variable.PrioTarget = nil -- Reset
					end
				end
				return true
			end
		else
			-- No Target
			return RevoltEngine.Target_CheckList(List, _info_boss)
		end
	end
	-- Exit
	Variable.PrioTarget = nil -- Reset
	return false
end

function RevoltEngine.Check_ManoeuvreCrit()
	if BCommun.IsControlOpen("_QTEKeep") then
		-- Inside Manoeuvre -> Press Key
		PressKey(0x5A)
		PressKey(0x5A)
		return true
	end
	return false
end

function RevoltEngine.GoMakeInteract(_target, _position)
	BeheviorUpdate.Pause = true
	BCommun.RunMinion(false, "make interact 1")
	-- MoveToEntity
	if _position ~= nil then
		local Position = BMath.ShortDistance(_position)
		if not Position then
			Position = _position
		end
		if BMovement.doMoveToPosition(Position) then
			local search = _target.contentid
			if Position.contentid then
				search = Position.contentid
			end
			local FTarget = BTarget.FindEntity(search, "targetable,maxdistance=20")
			if table.valid(FTarget) then
				BInteract.Interact(FTarget.id)
			end
		end
	else
		if BMovement.doMoveToPosition(_target.pos, 2) then
			Player:SetTarget(_target.id)
			BInteract.Interact(_target.id)
		end
	end
end

function RevoltEngine.Do_Spe_Interact(_setup, _target)
	-- Check if table
	if table.valid(_setup.InteractDuringFight) then
		for id, e in pairs(_setup.InteractDuringFight) do
			local FTarget = BTarget.FindEntity(id, "targetable,maxdistance=120")
			if table.valid(FTarget) then
				-- Got Interact
				local pause = 0
				if e.WaitBefore and not Variable.AfterInteract then
					pause = e.WaitBefore
				end
				--
				if BUtility.Wait(pause, "Interact_WaitBefore") then
					local _role = RevoltEngine.GetRole()
					if e.Type == "SpamSpell" then
						local PBuffs = Player.buffs
						for iid, ie in pairs(PBuffs) do
							if ie.id == e.BuffId then
								d("Find Interact -> SpamSpell")	
								if BAction.IsActionReady(1, e.SkillID) then
									BAction.UseAction(1, e.SkillID, Player)
									Variable.AfterInteract = true
								end
								return true
							end
						end
					end
					if e.Type == "UseCanon" then
							d("Find Interact -> UseCanon")	
							if BAction.IsActionReady(1, e.SkillID) then
								-- Interact Done
								BAction.UseAction(1, e.SkillID, _target.id)
							else
								-- Do Interact
								RevoltEngine.GoMakeInteract(FTarget)
								Variable.AfterInteract = true
							end
							return true
					end
					if e.Type == "WhenPop" then
						if (e.Role[_role] == true) or (not table.valid(EntityList.myparty)) then
							d("Find Interact -> WhenPop")
							RevoltEngine.GoMakeInteract(FTarget)
							Variable.AfterInteract = true
							if e.WaitBeforeReturn then
								Variable.StopAvoid = e.WaitBeforeReturn
							end
							return true
						end
					end
					if e.Type == "WhenBuff" then
						local PBuffs = Player.buffs
						for iid, ie in pairs(PBuffs) do
							if ie.id == e.BuffId then
								-- Got Buff
								if e.BuffStack then
									-- Need check stack
									if ie.stacks >= e.BuffStack then
										if (e.Role[_role] == true) then
											d("Find Interact -> WhenBuff")
											RevoltEngine.GoMakeInteract(FTarget)
											Variable.AfterInteract = true
											return true
										end
									end
								else
									-- No stack check
									if (e.Role[_role] == true) or (not table.valid(EntityList.myparty)) then
										d("Find Interact -> WhenBuff")
										RevoltEngine.GoMakeInteract(FTarget)
										Variable.AfterInteract = true
										return true
									end
								end
							end
						end
					end
					if e.Type == "WhenCast" then
						local CastInfo = _target.castinginfo
						if table.valid(CastInfo) then
							if CastInfo.channelingid == e.Cast_Id then
								if (e.Role[_role] == true) or (not table.valid(EntityList.myparty)) then
									d("Find Interact -> WhenCast")
									RevoltEngine.GoMakeInteract(FTarget, e.Position)
									Variable.AfterInteract = true
									return true
								end
							end
						end
					end
					if e.Type == "EntityCheck" then
						if e.EntityID then
							local el = BTarget.EntityByOption("contentid="..e.EntityID)
							if table.valid(el) and table.valid(e.Position) then
								for eid, ee in pairs(el) do
									local xmin = e.Position.x - 1; local xmax = e.Position.x + 1
									local ymin = e.Position.y - 1; local ymax = e.Position.y + 1
									local zmin = e.Position.z - 1; local zmax = e.Position.z + 1
									if 	(ee.pos.x >= xmin) and (ee.pos.x <= xmax) and
										(ee.pos.y >= ymin) and (ee.pos.y <= ymax) and
										(ee.pos.z >= zmin) and (ee.pos.z <= zmax) then
										-- got it
										if (e.Role[_role] == true) or (not table.valid(EntityList.myparty)) then
											d("Find Interact -> EntityCheck")
											RevoltEngine.GoMakeInteract(FTarget)
											Variable.AfterInteract = true
											return true
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	if Variable.AfterInteract then
		BeheviorUpdate.Pause = false
		Variable.AfterInteract = false
	end
	return false
end

function RevoltEngine.Percent_Move(_setup, _percent)
	if table.valid(_setup.Percent_Move) then
		for id, e in pairs(_setup.Percent_Move) do
			if (_percent >= e.percent_min) and (_percent <= e.percent_max) then
				if table.valid(Variable.Tmp_Percent) then
					-- Check
					if Variable.Tmp_Percent == e then
						-- already done
						return false
					end
				end
				--
				Variable.Tmp_Percent = e
				d("Revolt - Use Percent Move")
				Variable.Need_SpeMove = e.Position[RevoltEngine.GetRole()]
				return true
			end
		end
	end
	return false
end

function RevoltEngine.Check_Phase(_setup, _phase, _target)
	-- Check Interact
	if table.valid(_setup.InteractDuringFight) then
		if RevoltEngine.Do_Spe_Interact(_setup, _target) then
			return false
		end
	end
	-- Check Manoeuvre
	if RevoltEngine.Check_ManoeuvreCrit() then
		return false
	end
	-- Check Percent Move
	if table.valid(_setup.Percent_Move) then
		if RevoltEngine.Percent_Move(_setup, _target.hp.percent) then
			return false
		end
	end
	-- Check Add
	if table.valid(_setup.Target) then
		if RevoltEngine.Target_System(_setup, _target.hp.percent, _target) then
			return true
		end
	else
		if table.valid(_setup.Prio_Target_Tank) or table.valid(_setup.Prio_Target_Dps_Heal) then
			if RevoltEngine.Prio_Target(_setup, _target.hp.percent, _target) then
				return true
			end
		end
	end
	RevoltEngine.Recup_BossTarget(_target)
	return true
end

function RevoltEngine.SwitchPhase(_phase, _target)
	Variable.Phase = Variable.Phase + 1
	Variable.PhaseInit = false
	RevoltEngine.Reset_Avoid(false)
end

function RevoltEngine.PhaseFinish(_phase, _entity)
	if _phase.FinishPhase.Type == "Percent" then
		if _entity.hp.percent <= _phase.FinishPhase.Value then
			return true
		end
	end
	if _phase.FinishPhase.Type == "ReturnPhase" then
		return true
	end
	if _phase.FinishPhase.Type == "NotTargetable" then
		if not _entity.targetable or (not _entity.alive) then
			return true
		end
	end
	return false
end

function RevoltEngine.PhaseIsFinish(_phase, _entity)
	if _phase.FinishPhase then
		if _phase.FinishPhase.Type == "Percent" then
			if _entity.hp.percent <= _phase.FinishPhase.Value then
				RevoltEngine.SwitchPhase(Phase, _bosstarget)
				return true
			end
		end
		if _phase.FinishPhase.Type == "ReturnPhase" then
			Variable.Phase = _phase.FinishPhase.Value
			Variable.PhaseInit = false
			return true
		end
		if _phase.FinishPhase.Type == "NotTargetable" then
			if not _entity.targetable or (not _entity.alive) then
				if _phase.FinishPhase.Option then
					if _phase.FinishPhase.Option == "SwitchBoss" then
						local Target = BTarget.EntityByOption("alive,targetable,contentid=".._phase.FinishPhase.Value)
						if table.valid(Target) then
							Variable.Boss_Find = Target.contentid
							Variable.Boss_ID = Target.id
							Variable.Phase = 1
							Variable.PhaseInit = false
						end
					end
				end
				return true
			end
		end
	end
	-- No Finish
	return false
end

function RevoltEngine.GotFormationPosition(_type, _role, _entity, _phase)
	local Tab = nil
	if _type == "Nothing" then -- Pas de Formation
		return true
	end
	if _type == "Normal" then
		Tab = {
			[2] = {Angle = 70, Range = 3.5},
			[3] = {Angle = 40, Range = 8.5},
			[4] = {Angle = 0, Range = 10},
		}
	end
	if _type == "Front" then
		Tab = {
			[2] = {Angle = 70, Range = 3.5},
			[3] = {Angle = 40, Range = 8.5},
			[4] = {Angle = 0, Range = 10},
		}
	end
	if _type == "Custom" then
		Tab = _phase.CustomPosition
	end
	local Setup = Tab[_role]
	local Position = Setup
	if _type ~= "Custom" then
		if not Variable.RandomSens then
			Variable.RandomSens = math.random(-1, 1)
		end
		if Variable.RandomSens <= 0 then
			Setup.Angle = Setup.Angle * -1
		end
		Position = BMath.PointFromPoint(_entity, Setup.Angle, Setup.Range)
	end
	Variable.Need_SpeMove = Position
	return true
end

function RevoltEngine.Load_Avoid_Phase(_aoe, _animation, _buff, _casting, _argus)
	if _aoe then
		Variable.Aoe_Boss = _aoe
	else
		Variable.Aoe_Boss = nil
	end
	if _animation then
		Variable.Animation_Boss = _animation
	else
		Variable.Animation_Boss = nil
	end
	if _buff then
		Variable.Buff_Boss = _buff
	else
		Variable.Buff_Boss = nil
	end	
	if _casting then
		Variable.Casting_Boss = _casting
	else
		Variable.Casting_Boss = nil
	end
	if _argus then
		Variable.Argus_Boss = _argus
	else
		Variable.Argus_Boss = nil
	end
end

function RevoltEngine.PhaseIsStarted(_setup, _phase, _entity)
	if not Variable.PhaseInit then
		RevoltEngine.Load_Avoid_Phase(_phase.Aoe, _phase.Animation, _phase.Buff, _phase.Casting, _phase.Argus)
		if _phase.StartPhase.Type == "Init" and _entity.hp.percent >= 98 then -- Init Boss
			if RevoltEngine.GetRole() == 1 or not table.valid(EntityList.myparty) then -- Tank
				BCommun.RunMinion(true, "phase started 1")
				if BMovement.doMoveToPosition(_phase.Engage_Pos) then
					Variable.PhaseInit = true
				end
				-- Got Aggro 
				if Player.role == 1 then
					local TankSkill = RevoltEngine.RecupForJob(Player.job)
					if BAction.IsActionReady(1, TankSkill.Distance_Aggro, _entity.id) then
						BAction.UseAction(1, TankSkill.Distance_Aggro, _entity.id)
					end
				end
			else -- Other Member
				if _entity.incombat or _setup.StartWithAdd then
					if _phase.Engage_Pos_Other then
						if BMovement.doMoveToPosition(_phase.Engage_Pos_Other[RevoltEngine.GetRole()]) then
							Variable.PhaseInit = true
						end
					else
						BCommun.RunMinion(true, "phase started 2")
						RevoltEngine.GotFormationPosition(_phase.StartPhase.Formation, RevoltEngine.GetRole(), _entity, _phase)
						Variable.PhaseInit = true
					end
				end
			end
			return false
		end
		-- No Action
		Variable.PhaseInit = true
	end
	return true
end

function RevoltEngine.RecupPhase(_setup)
	local phase = _setup.Phase
	if table.valid(phase) then
		if table.valid(phase[Variable.Phase]) then
			return phase[Variable.Phase]
		end
	end
	d("Error Phase Unknow")
	return nil
end

function RevoltEngine.CheckCustomMesh(_setup, _phase)
	if (_setup.NeedMesh ~= nil) and (_phase.NeedMesh == nil) then
		BVariable.Set_MeshMove(_setup.NeedMesh)
		return true
	end
	if (_phase.NeedMesh ~= nil) then
		BVariable.Set_MeshMove(_phase.NeedMesh)
		return true
	end
	BVariable.Set_MeshMove(nil)
	return true
end

function RevoltEngine.ReadyCheck_BeforeBoss()
	if not Variable.ReadyCheckDone_BeforeBoss then
		-- Need Ready Check
		local AddonControl = GetControl("ReadyCheck")
		if table.valid(AddonControl) and IsControlOpen("ReadyCheck") then
			-- Recup RawData
			local RawData = AddonControl:GetRawData()
			if table.valid(RawData) then
				for id, e in pairs(RawData) do
					if (e.type ~= "0") then
						if (id >= 51) and (id <= 59) then
							if e.value == 1 or e.value == 0 then
								-- Someone don't press
								return false
							end
						end
					end
				end
				-- Everyone have vote
				for id, e in pairs(RawData) do
					if (e.type ~= "0") then
						if (id >= 51) and (id <= 59) then
							if e.value == 3 then
								-- Someone is not ready
								if BUtility.Wait(35, "Wait retry ReadyCheck") then
									BCommun.CloseControl("ReadyCheck")
								else
									d("Wait retry ReadyCheck")
								end
								return false
							end
						end
					end
				end
				-- ReadyCheck Done
				BCommun.CloseControl("ReadyCheck")
				Variable.ReadyCheckDone_BeforeBoss = true
			end
		else
			-- Run ReadyCheck
			BAction.UseAction(10, 59)
			BInteract.SelectYes()
		end
		return false
	end
	return true
end

function RevoltEngine.GetWaitPosition(_setup)
	-- Go Wait_Position
	if table.valid(_setup.Wait_A) and table.valid(_setup.Wait_B) then
		-- Calcule Random Wait Position
		if not Variable.RandomWait then
			Variable.RandomWait = BMath.PointOnVector(_setup.Wait_A, _setup.Wait_B)
		else
			if BMovement.doMoveToPosition(Variable.RandomWait, 0.5) then
				d("Wait Position System -> Finish")
				return true
			end
		end
		d("Wait Position System -> In Activity")
		return false
	else
		d("Error Wait Position")
		return false
	end
end

function RevoltEngine.Init_Boss(_setup, _target)
	if not Variable.Boss_Init then
		-- Fight Started
		if _target.incombat then
			d("Init_Boss : Boss in combat -> Skip Init Boss")
			BTarget.SetTarget()
			Variable.Boss_Init = true
	--		BCommun.RunMinion(true)
			if _target.hp.current == 0 then
				return true
			end
			return false
		end
		-- Normal Init Boss
	--	BCommun.RunMinion(false) -- Unenable Minion Assist
		if not RevoltEngine.GetWaitPosition(_setup) then
			return true
		end
		-- In Wait Position
		if not table.valid(EntityList.myparty) or Variable.Unsync then
			-- Solo Or Squadron or Trust
			BTarget.SetTarget()
			Variable.Boss_Init = true
	--		BCommun.RunMinion(true)
			d("Init_Boss : Detect Solo -> Skip Init Boss")
			return false
		end
		-- Got Party
		if RevoltEngine.GetRole() == 1 then
			-- (Tank + Got Team) -> Ready Check
			if Variable.UseReadyCheck then
				if not RevoltEngine.ReadyCheck_BeforeBoss() then
					return true
				end
			end
			local Wait = 15
			if Variable.UseCountdown then
				if not Variable.CountdownUsed then
					BCommun.Speak("/cd "..tostring(Variable.Countdown))
					Variable.CountdownUsed = true
				end
				Wait = (Variable.Countdown * 3) + 1
			end
			if BUtility.Wait(Wait, "Pull_Tank") then
				d("Tank is pulling!")
				Variable.Boss_Init = true
			else
				d("Tank to pull! Be ready")
			end
		end
		-- Other
		d("Wait Tank Pull")
		BInteract.SelectYes()
		return true
	end
	return false
end

function RevoltEngine.CheckPrioMS(_setup)
	local Target = BTarget.GetTarget()
	if table.valid(_setup.PrioMS) then
		for id, e in pairs(_setup.PrioMS) do
			if e == Target.contentid then
				-- Go Math
				local Position = BMath.PointBetween2Pos(Target.pos, Player.pos, Target.hitradius)
				-- Got Avoid Position
				BMovement.doMoveToPosition(Position)
				return true
			end
		end
	end
	return false
end

function RevoltEngine.Do_Boss(_setup, _bosstarget)
	if not RevoltEngine.Init_Boss(_setup, _bosstarget) then
		Variable.Save_CurrentStep = nil -- Safe Check
		-- Check Phase
		local Phase = RevoltEngine.RecupPhase(_setup)
		if table.valid(Phase) then
			RevoltEngine.CheckCustomMesh(_setup, Phase)
			if RevoltEngine.PhaseIsStarted(_setup, Phase, _bosstarget) then
				-- Check End Phase
				if not RevoltEngine.PhaseIsFinish(Phase, _bosstarget) then
					if RevoltEngine.Check_Phase(_setup, Phase, _bosstarget) then
						-- Save
						Variable.SavePhase = Phase
						Variable.SaveBossEntity = _bosstarget
						--
						local Target = BTarget.GetTarget()
						if table.valid(Target) then
							-- Fight Target
							RevoltEngine.Fight_Target(Target, _setup, _bosstarget)
						end
					end					
				end
			end
		end
	end
end

function RevoltEngine.Do_Spe_Location(_id)
	local p = Player
	if _id == 1279 then
		if Distance3D(p.pos.x, p.pos.y, p.pos.z, -22.95, 35.45, -235.14) > 40 then
			return true
		end
	end
	if _id == 1397 then
		if Distance3D(p.pos.x, p.pos.y, p.pos.z, 76.90, -11.09, 105.84) > 40 then
			return true
		end
	end	
	if _id == 3409 then
		if Distance3D(p.pos.x, p.pos.y, p.pos.z, -70.06, 32.06, -370.66) > 40 then
			return true
		end
	end
	return false
end

function RevoltEngine.Try_Find_Boss()
	-- Recup Boss dungeons
	local BossList = Variable.CurrentDuty.BossList
	if table.valid(BossList) then
		-- Check if boss near
		for bid, be in pairs(BossList) do
			local BossTarget = BTarget.FindEntity(be.id, "maxdistance="..be.range)
			if table.valid(BossTarget) then
				-- Check Spe Location
				if not RevoltEngine.Do_Spe_Location(BossTarget.contentid) then
					-- Got Boss close -> Check if Boss is targetable
					local BossData = Variable.Boss_Table[BossTarget.contentid]
					if table.valid(BossData) then
						-- Check StartWithAdd
						local DetectRange = be.range + 10
						if BossData.StartWithAdd then
							-- Got Not targetable Boss
							local TargetList = BTarget.EntityByOption("maxdistance="..DetectRange..",contentid="..BossData.Id)
							if table.valid(TargetList) then
								for id, e in pairs(TargetList) do
									if BossData.BossHp then
										if (e.hp.max == BossData.BossHp) and (e.hp.min ~= 0) then
											d("Active Boss : "..BossTarget.contentid)
											Variable.Boss_Find = BossTarget.contentid
											Variable.Boss_ID = BossTarget.id
											return true
										end
									else
										d("Active Boss : "..BossTarget.id)
										Variable.Boss_Find = BossTarget.contentid
										Variable.Boss_ID = BossTarget.id
										return true
									end
								end
							end
						else
							-- Got Targetable Boss
							BossTarget = BTarget.FindEntity(be.id, "targetable,maxdistance="..DetectRange)
							if table.valid(BossTarget) then
								BossData = Variable.Boss_Table[BossTarget.contentid]
								if BossData.BossHp then
									if (math.round(BossTarget.hp.max, 0) == BossData.BossHp) and (BossTarget.hp.min ~= 0) then
										d("Active Boss : "..BossTarget.contentid)
										Variable.Boss_Find = BossTarget.contentid
										Variable.Boss_ID = BossTarget.id
										return true
									end
								else
									d("Active Boss : "..BossTarget.contentid)
									Variable.Boss_Find = BossTarget.contentid
									Variable.Boss_ID = BossTarget.id
									return true
								end
							end
						end
					end
				end
			end
		end
	end
	-- Boss Not Find
	return false
end

function RevoltEngine.Is_Again_Boss()
	if Variable.Boss_Find == nil then
		if RevoltEngine.Try_Find_Boss() then
			return true
		end
	else
		-- Recup Boss Entity
		local Boss_Entity = BTarget.FindEntity(Variable.Boss_ID)
		if table.valid(Boss_Entity) then
			if Boss_Entity.alive or RevoltEngine.RecupPhase(Variable.Boss_Table[Variable.Boss_Find]).FinishPhase then
				RevoltEngine.Do_Boss(Variable.Boss_Table[Variable.Boss_Find], Boss_Entity)
				return true
			else
				BCommun.RunMinion(false, "BossIsDead")
			end
		end
	end
	-- Not Again Boss -> Reset Boss Variable
	RevoltEngine.Reset_Boss()
	return false
end
----------------------------	[End Boss]		-------------------------------------------

----------------------------	[Run Type]		-------------------------------------------
function RevoltEngine.GotFormationStep(_role, _entity)
	local Tab = {
		[1] = {Angle = {0}, Range = 2.5}, -- Tank
		[2] = {Angle = {45, 135, 225, 315}, Range = 3.5}, -- Melee
		[3] = {Angle = {22, 158, 202, 338}, Range = 5.5}, -- DPS Dis
		[4] = {Angle = {0, 90, 180, 270}, Range = 6}, -- Healer
	}
	local Setup = Tab[_role]
	local TabPosition = {}
	for id, e in pairs(Setup.Angle) do
		local pos = BMath.AngleFromEntity(_entity, e, Setup.Range)
		table.insert(TabPosition, pos)
	end
	if table.valid(TabPosition) then
		Closer = BMath.ShortDistance(TabPosition)
		Variable.Need_SpeMove = Closer
		Variable.MoveRange = 2
	end
	return true
end

function RevoltEngine.IsNotWallMoob(_id)
	for id, e in pairs(Variable.WallMoob) do
		if e == _id then 
			return false
		end
	end
	return true
end

function RevoltEngine.Do_Follow_Tank_Step(_isguildhest)
	-- Recup Tank
	local TankEntity = RevoltEngine.GotTankEntity()
	if table.valid(TankEntity) then
		-- Check Player out combat
		if not Player.incombat and not TankEntity.incombat then
			Variable.InitFormation = false
		end
		-- Check Tank Target & Set Target
		local Target = BTarget.FindEntity(TankEntity.targetid, "attackable,alive,targetable,maxdistance=120")
		local tmp = true
		if (TankEntity.targetid ~= 0) and table.valid(Target) then
			if Target.distance < 20 then
				if TankEntity.incombat then
					if Variable.InitFormation == false and RevoltEngine.IsNotWallMoob(Target.contentid) then -- Init Fight
						if ((Player.localmapid ~= 172) and (Player.localmapid ~= 421) and (Player.localmapid ~= 516) and (Player.localmapid ~= 188)) and not _isguildhest then
							RevoltEngine.GotFormationStep(RevoltEngine.GetRole(), Target)
						end
					end
					if Target.hp.percent <= 98 then -- Init Fight
						BTarget.SetEntityInTarget(Target)
						BLoad.LoadKillStepFromTarget()
						BStep.NoKillAggro(true)
					end
					Variable.InitFormation = true
				else
					if Variable.Boss_Table then
						if Variable.Boss_Table[Target.contentid] then
							BTarget.SetEntityInTarget(Target)
							BLoad.LoadKillStepFromTarget()
							BStep.NoKillAggro(true)
						end
					end
				end
				tmp = false
			end
		end
		if tmp == true then
			-- No Target Finded
			BStep.RemoveStep()
			-- Follow Tank
			if TankEntity.distance2d <= Variable.JobRange[Player.role] then
				d("Player Stop Move - 1")
				Player:Stop()
			end
			--
			if Variable.LastTankDistance < TankEntity.distance2d then
				BMovement.doMoveToPosition(TankEntity.pos, 2)
			end
			Variable.LastTankDistance = TankEntity.distance2d
			local Wait = Variable.Timer_MoveTank_Max
			if TankEntity.incombat then
				Wait = Variable.Timer_MoveTankInFight_Max
			end
			if BUtility.Wait(Wait, "FollowTank") then
				BMovement.doMoveToPosition(TankEntity.pos, Variable.JobRange[Player.role])
			end	
			return
		end
	end
	-- Check if got Step
	if BStep.GetCurrentStep() then
		--
		BUtility.ResetWait("FollowTank")
		Variable.LastTankDistance = TankEntity.distance2d
		-- Check Distance 
		local Target = BTarget.GetTarget()
		if table.valid(Target) then
			if Target.incombat then
				if BMovement.doMoveToPosition(Target.pos, Variable.JobRange[Player.role] + Target.hitradius) then
					d("Player Stop Move - 2")
					Player:Stop()
				else
					return
				end
			end
		end
		-- Got Kill Step From Target()
		BStep.NoKillAggro(true)
		if BStep.DoStep() == true then
			BTarget.RemoveEntityInTarget()
			RevoltEngine.Do_Follow_Tank_Step()
		end
	end	
	return
end

function RevoltEngine.LoadStepFromObjectif()
	if Variable.Objectif then
		BLoad.LoadStepFromString(Variable.Objectif[Variable.CurrentStep])
		if Variable.IgnoreChest then
			local Step = BStep.GetCurrentStep()
			Step = Step.Type
			if Step == "TakeChest" then
				if Variable.Objectif[Variable.CurrentStep + 1] then
					Variable.CurrentStep = Variable.CurrentStep + 1
				else
					Variable.CurrentStep = 1
				end
				BStep.ResetStep()
				RevoltEngine.LoadStepFromObjectif()
			end
		end
	end
end

function RevoltEngine.Init_Step()
	-- No Step -> Need Load it
	RevoltEngine.LoadStepFromObjectif()
	BTarget.RemoveEntityInTarget()
	return
end

function RevoltEngine.Do_Step(_playeractive)
	local Step = BStep.GetCurrentStep()
	if not table.valid(Step) then
		RevoltEngine.Init_Step()
		Step = BStep.GetCurrentStep()
	end
	if Step.Finish == true then
		-- Step is finish
		if Variable.Save_CurrentStep ~= nil then
			Variable.CurrentStep = Variable.Save_CurrentStep
			Variable.Save_CurrentStep = nil
		else
			if Variable.Objectif[Variable.CurrentStep + 1] then
				Variable.CurrentStep = Variable.CurrentStep + 1
			else
				Variable.CurrentStep = 1
			end
		end
		RevoltEngine.LoadStepFromObjectif()
	end
	if BStep.DoStep() == true then
		-- Check Speed
		if Step.Type == "Interact" or Step.Type == "SpeedInteract" then
			if BAction.IsActionReady(5, 4) then
				BAction.UseAction(5, 4)
			end
		end
		-- Check Step TakeChest
		--if Step.Type == "TakeChest"  then
		--	if BAction.IsActionReady(5, 4) then
		--		BAction.UseAction(5, 4)
		--	end
		--end
		BTarget.RemoveEntityInTarget()
		if Step.Type == "Kill-Aggro" then
			BStep.RemoveStep()
			-- Reload Current Step (Before Kill Aggro)
			RevoltEngine.LoadStepFromObjectif()
		end
		if Step.Type ~= "KillPack" then
			BStep.CheckKillAggro()
			RevoltEngine.Do_Step(_playeractive)
		end
	else
		-- In Step
		if Step.Type == "Kill" or Step.Type == "KillPack" or Step.Type == "Kill-Aggro" then
			if Variable.Squadron then
				-- In Squadron
				-- Check Stop
				--[[if Step.Position then
					if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, Step.Position.x, Step.Position.y, Step.Position.z) <= 8 then
						local entity = BTarget.EntityByOption("maxdistance="..(Step.Count + 10)..",chartype=5")
						if table.valid(entity) then
							for id, e in pairs(entity) do
								if e.alive then
									Player:Stop()
									BTarget.SetEntityInTarget(e)
									break
								end
							end
						end
					end
				end]]
				if table.valid(BTarget.GetTarget()) then
	--				d("ORDER ENGAGER : Do_Step")
					BAction.UseAction(19, 1, BTarget.GetTarget().id)
				end
			end
		end
	end
	return
end

function RevoltEngine.Check_Doing_Step()
	-- Player is Tank OR Solo/Squadron
	if (RevoltEngine.GetRole() == 1) or (not table.valid(EntityList.myparty)) or Variable.Unsync or Variable.CurrentDuty.Is24Raid then
		return true -- Do Step
	else
		-- Member of the team
		return false
	end
end

function RevoltEngine.Run_Duty()
	-- Check In Boss
	if not RevoltEngine.Is_Again_Boss() then
		-- Check Objectif
		if Variable.Objectif == nil then
			-- Init
			BTarget.RemoveEntityInTarget()
			Variable.Objectif = Variable.Objectif_Table.Objectif[1]
			Variable.CurrentStep = 1
			BStep.RemoveStep()
		else
			RevoltEngine.Do_Step()
		end
	end
	return
end

function RevoltEngine.Run_Guildhests()
	-- Guildhest don't have Objectif
	if Variable.Objectif == nil then
		-- Init
		BTarget.RemoveEntityInTarget()
		Variable.Objectif = Variable.Objectif_Table.Objectif[1]
		Variable.CurrentStep = 1
		BStep.RemoveStep()
	else
		if RevoltEngine.Check_Doing_Step() then
			RevoltEngine.Do_Step()
		else
			RevoltEngine.Do_Follow_Tank_Step(true)
		end		
	end
	return
end

function RevoltEngine.Get_Alliance()
	-- Check
	for id, e in pairs(Variable.NeededList) do
		if e.DutyInfo.Name == Variable.CurrentDuty.Name then
			local Tab = {
				[1] = "A",
				[2] = "B",
				[3] = "C",
			}
			if Tab[e.Alliance] then
				return Tab[e.Alliance], e.Alliance
			else
				break
			end
		end
	end
	--
	local Letter = nil
	local j = 1
	-- Get string
	local Ligne = nil
	if BCommun.IsControlOpen("_PartyList") then
		local Addon = GetControl("_PartyList")
		AddonString = Addon:GetStrings()
		Ligne = AddonString[5]
	end
	--
	if Ligne ~= nil then
		if GetGameLanguage() ~= 4 then
			j = string.find(Ligne, " ", j)
		else
			j = 2
		end
		Letter = string.sub(Ligne, j+1, j+2)
	end
	local Tab2 = {
		["A"] = 1,
		["B"] = 2,
		["C"] = 3,
	}
	return Letter, Tab2[Letter]
end

function RevoltEngine.Get_RaidData()
	if Variable.CurrentDuty.Is24Raid then
		local Alliance, number = RevoltEngine.Get_Alliance()
		if Alliance then
			if tostring(Alliance) ~= tostring(Variable.CurrentDuty.IsTeam) then
				for id, e in pairs(Variable.NeededList) do
					if e.DutyInfo.Name == Variable.CurrentDuty.Name then
						local OtherTeam = Variable.CurrentDuty.DataOtherTeam[Alliance]()
						local Data = {
							[1] = function() return OtherTeam.Get_Data_Normal() end,
							[2] = function() return OtherTeam.Get_Data_Unsync() end,
						}
						local Boss = {
							[1] = function() return OtherTeam.Get_Boss_Duty() end,
							[2] = function() return OtherTeam.Get_Boss_Duty() end,
						}
						local Tab = {
							DutyInfo = OtherTeam.Get_Info(),
							--
							Data_Duty = Data[e.DataIndex](),
							Data_Boss = Boss[e.DataIndex](),
							--
							DataIndex = e.DataIndex,
							--
							Max = e.Size,
							Count = 0,
							--
							JobIndex = e.JobIndex,
							--
							Alliance = number,
						}
						d("Loading Alliance : "..Alliance)
						Variable.CurrentDuty = Tab.DutyInfo
						RevoltEngine.LoadDataForDuty(Tab)
						return false
					end
				end
			end
		end
	end
	return true
end

function RevoltEngine.Run_Raids()
	-- Check In Boss
	if RevoltEngine.Get_RaidData() then
		if not RevoltEngine.Is_Again_Boss() then
			-- Check Objectif
			RevoltEngine.Check_Objectif()
			if Variable.Objectif then
				if RevoltEngine.Check_Doing_Step() then
					RevoltEngine.Do_Step()
				else
					RevoltEngine.Do_Follow_Tank_Step()
				end		
			end
		end
	end
	return
end

function RevoltEngine.Run_Trials()
	-- Check In Boss
	if not RevoltEngine.Is_Again_Boss() then
		-- Check Objectif
		if Variable.Objectif == nil then
			BTarget.RemoveEntityInTarget()
			Variable.Objectif = Variable.Objectif_Table.Objectif[1]
			Variable.CurrentStep = 1
			BStep.RemoveStep()
		else
			if RevoltEngine.Check_Doing_Step() then
				RevoltEngine.Do_Step()
			else
				RevoltEngine.Do_Follow_Tank_Step()
			end		
		end
	end
	return
end

function RevoltEngine.DoingSpecialMove()
	local SpeMove = Variable.CurrentDuty.SpecialMove
	if SpeMove then
		if SpeMove[Variable.CountSpecialMove] then
			local SpeMove = SpeMove[Variable.CountSpecialMove]
			if Variable.TargetSpeMove then
				if not Variable.TargetSpeMove.alive then
					d("SpeMove Finish : "..Variable.CountSpecialMove)
					Variable.CountSpecialMove = Variable.CountSpecialMove + 1
					Variable.TargetSpeMove = nil
					return false
				end
			end
			-- Detect
			if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, SpeMove.position.x, SpeMove.position.y, SpeMove.position.z) <= SpeMove.rangedetect then
				d("Inside SpeMove : "..Variable.CountSpecialMove)
				-- Close
				if not Variable.TargetSpeMove then
					Variable.TargetSpeMove = BTarget.FindEntity(SpeMove.entityid, "alive,maxdistance="..SpeMove.rangedetect)
				end
				if table.valid(Variable.TargetSpeMove) then
					BTarget.RefreshEntityInTarget()
					if Distance3D(Variable.TargetSpeMove.pos.x, Variable.TargetSpeMove.pos.y, Variable.TargetSpeMove.pos.z, SpeMove.position.x, SpeMove.position.y, SpeMove.position.z) <= 2 then
						-- Good -> Go Kill it
						Player:SetTarget(Variable.TargetSpeMove.id)
						BCommun.RunMinion(true)
					else
						if RevoltEngine.GetRole() == 4 then -- Need Healing
							Player:ClearTarget()
							BCommun.RunMinion(true)
						else
							BCommun.RunMinion(false)
						end
					end
					local position = BMath.PointBetween2Pos(SpeMove.midder, Variable.TargetSpeMove.pos, SpeMove.distancerange)
					if table.valid(position) then
						BMovement.doMoveToPosition(position, 1)
					end
				end
				return true
			end
		end
	end
	return false
end

function RevoltEngine.SpecialObjectifMap(_index)
	local Index = _index
	if Player.localmapid == 435 then
		if _index == 8 then
			return 6
		end
	end
	return _index
end

function RevoltEngine.Get_Current_Objectif()
	local Started_Objectif = 1
	if Variable.Objectif_Table.StartAtObjectif then
		Started_Objectif = Variable.Objectif_Table.StartAtObjectif
	end
	local objectives = Duty:GetActiveDutyObjectives()
	if table.valid(objectives) then
		for id, e in pairs(objectives) do
			if id >= Started_Objectif then
				if not e.completed and e.type == 1 then
					if Variable.CurrentDuty.OnlyFirstObjectif then
						local Index = e.values[1]
						return Variable.Objectif_Table.Objectif[Index]
					end
					local Index = id
					id = RevoltEngine.SpecialObjectifMap(Index)
					return Variable.Objectif_Table.Objectif[id]
				end
			end
		end
	end
	if Player.localmapid == 366 then -- Check BigBridge
		return Variable.Objectif_Table.Objectif[1]
	end
	return nil
end

function RevoltEngine.Check_Objectif()
	if Variable.Objectif then
		local CurrentObjectif = RevoltEngine.Get_Current_Objectif()
		if Variable.Objectif ~= CurrentObjectif then
			-- Init New Objectif
			d("OBJECTIF New -> Reset Step")
			BTarget.RemoveEntityInTarget()
			Variable.CurrentStep = 1
			Variable.Objectif = CurrentObjectif
			BStep.RemoveStep()
		end
	else
		-- Need Init Objectif
		d("OBJECTIF Init -> Reset Step")
		BTarget.RemoveEntityInTarget()
		Variable.Objectif = RevoltEngine.Get_Current_Objectif()
		Variable.CurrentStep = 1
		BStep.RemoveStep()
		return
	end
	return
end

function RevoltEngine.Run_Dungeons()
	-- Check In Boss
	if not RevoltEngine.Is_Again_Boss() then
		-- Check Objectif
		RevoltEngine.Check_Objectif()
		BInteract.SelectConversation(0)
		if Variable.Objectif then
			if not RevoltEngine.DoingSpecialMove() then
				if RevoltEngine.Check_Doing_Step() then
					RevoltEngine.Do_Step()
				else
					RevoltEngine.Do_Follow_Tank_Step(false)
				end		
			end
		end
	end
	return
end
----------------------------	[End Run Type]		-------------------------------------------

----------------------------	[Inside Duty]		-------------------------------------------
function RevoltEngine.Prio_Target_Spe_Map(_table)
	-- Default
	local FTarget = BTarget.FindListEntity(_table, "alive,targetable,maxdistance=18")
	if Variable.Trust then
		FTarget = BTarget.FindListEntity(_table, "alive,targetable,maxdistance=30")
	end
	if Player.localmapid == 441 then -- Sohm Al
		FTarget = BTarget.FindListEntity(_table, "alive,targetable,maxdistance=10")
	end
	if Player.localmapid == 557 then -- HullBreaker Isle (Hard)
		FTarget = BTarget.FindListEntity(_table, "alive,targetable,maxdistance=40")
	end
	if Player.localmapid == 742 then -- Hell's Lid
		FTarget = BTarget.FindListEntity(_table, "alive,targetable,maxdistance=22")
	end
	if Player.localmapid == 689 then -- Ala Mhigo
		FTarget = BTarget.FindListEntity(_table, "alive,targetable,maxdistance=8")
	end
	if Player.localmapid == 349 then -- Ala Mhigo
		FTarget = BTarget.FindListEntity(_table, "alive,targetable,maxdistance=8")
	end
	if FTarget and BTarget.GetTarget() then
		if FTarget.contentid == BTarget.GetTarget().contentid then
			d("Prio Target : Keep Target -> "..FTarget.name)
			return BTarget.GetTarget()
		end
		Variable.InitCast = false
		d("Prio Target : Finded -> "..FTarget.name)
	end
	return FTarget
end

function RevoltEngine.Check_Prio_Target(_table)
	if table.valid(_table) then
		local FTarget = RevoltEngine.Prio_Target_Spe_Map(_table)
		if table.valid(FTarget) then
			if FTarget.alive then
				BTarget.SetEntityInTarget(FTarget)
				-- Set Target
				if BUtility.CanAttack(FTarget.id) == false then -- Not in Combat Range
					Variable.InitCast = false
					d("Reset InitCast -> Check_Prio_Target InDuty")
					BMovement.doMoveToPosition(FTarget.pos)
				else
					-- Can Atk
					if not Variable.InitCast then
						-- Check Wait
						if BUtility.Wait(10, "InitFirstAction2") then
							BCommun.PutSettingsAssist()
							local InitAction = BVariable.Get_InitAction_By_Job(Player.job)
							if BAction.IsActionReady(1, InitAction, BTarget.GetTarget().id) then
								d("Init Action")
								BAction.UseAction(1, InitAction, BTarget.GetTarget().id)
							end
							Variable.InitCast = true
						end
					end
					if Variable.Squadron then
						-- In Squadron
						if table.valid(BTarget.GetTarget()) then
	--						d("ORDER ENGAGER Check_Prio_Target")
							BAction.UseAction(19, 1, BTarget.GetTarget().id)
						end
					end
					if not Variable.Need_SpeMove then
						d("Player Stop Move - 3")
						Player:Stop()
					end
					BTarget.SetTarget()
				end
				BCommun.RunMinion(true, "Fight Target 1")
				return true
			else
				d("Prio Target Dead -> Reset Target")
				Variable.InitCast = false
				BStep.RemoveStep()
				BUtility.ResetWait("InitFirstAction2")
				BTarget.RemoveEntityInTarget()
			end
		end
		local Target = BTarget.GetTarget()
		if table.valid(Target) then
			for id, e in pairs(_table) do
				if Target.contentid == e then
					d("Prio Target not Finded / Dead -> Reset Target")
					Variable.InitCast = false
					BStep.RemoveStep()
					BUtility.ResetWait("InitFirstAction2")
					BTarget.RemoveEntityInTarget()
				end
			end
		end
	end
	return false
end

function RevoltEngine.ResetShortCutTransition()
	Variable.AfterShortCut = false
end

function RevoltEngine.Check_SkipStep(e)
	-- Need Skip Step
	if e.SkipStep then
		BStep.RemoveStep()
		if not Variable.AfterShortCut then
			if Variable.Objectif then
				if Variable.Objectif[Variable.CurrentStep + 1] then
					Variable.CurrentStep = Variable.CurrentStep + 1
				end
			end
		end
		RevoltEngine.LoadStepFromObjectif()
	end
	Variable.InTransition = false
	return false
end

function RevoltEngine.CheckTypeTransition(id, e, tp, r)
	if e.Type == "Interact" then
		local t = BTarget.FindEntity(e.Id, "targetable,maxdistance="..r)
		if table.valid(t) then
			if BMovement.doMoveToPosition(tp, 2) then
				local Wait = 1
				if e.Wait_Before then
					Wait = e.Wait_Before
				end
				if BUtility.Wait(Wait, "Transition_Interact") then
					BInteract.Interact(t.id)
					Variable.InTransition = id
				end
			end
		end
	end
	if e.Type == "Position" then
		-- Close Transition
		if BMovement.doMoveToPosition(tp, 2) then
			if e.Facing then
				Player:SetFacing(e.Facing)
				Variable.InTransition = id
			else
				Variable.InTransition = id
			end
		end
	end
	return true
end

function RevoltEngine.CloseTransitionZone()
	if not Player.incombat then
		local Tag = Variable.CurrentDuty.Tag_Id
		if Variable.CurrentDuty.Transition_Tag_Id then
			Tag = Variable.CurrentDuty.Transition_Tag_Id
		end
		if table.valid(Variable.TransitionZone[Tag]) then
			-- There are Transition zone in this dungeon
			-- Check Distance
			for id, e in pairs(Variable.TransitionZone[Tag]) do
				if table.valid(e) then
					local pp = Player.pos
					if not Variable.InTransition then
						local CanCheckDistance = true
						if e.AtObjectif then
							local objectives = Duty:GetActiveDutyObjectives()
							if table.valid(objectives) then
								for iid, ie in pairs(objectives) do
									if not ie.completed then
										local Index = iid
										if Variable.CurrentDuty.OnlyFirstObjectif then
											Index = ie.values[1]
										end
										if Index < e.AtObjectif then
											CanCheckDistance = false
										end
										if e.AtStep and (Index == e.AtObjectif) then
											if Variable.CurrentStep <= e.AtStep then
												CanCheckDistance = false
											end
										end
										break
									end
								end
							end
						end
						if CanCheckDistance then
							local tp = e.Position
							local r = e.Detect
							if Distance3D(pp.x, pp.y, pp.z, tp.x, tp.y, tp.z) <= r then
								return RevoltEngine.CheckTypeTransition(id, e, tp, r)
							end
						end
					else
						-- Check Final Transition
						if Variable.InTransition == id then
							-- Got Final Pos
							if e.Type_Final == "Vertical" then
								if (pp.y >= (e.Position_Final - 1)) and (pp.y <= (e.Position_Final + 2)) then
									return RevoltEngine.Check_SkipStep(e)
								end
							end
							if e.Type_Final == "Position" then
								local l = e.Position_Final
								local r = e.Detect_Finish
								if Distance3D(pp.x, pp.y, pp.z, l.x, l.y, l.z) <= r then
									return RevoltEngine.Check_SkipStep(e)
								end
								if e.ForceMovement then
									BMovement.ForceMovement()
								end
							end
							return true
						end
					end
				end
			end
		end
	end
	Variable.InTransition = false
	return false
end

function RevoltEngine.SkipShortcutsRaid()
	-- YoRHa - The Copied Factory
	if Variable.CurrentDuty.Tag_Id == 700 then
		local objectives = Duty:GetActiveDutyObjectives()
		if table.valid(objectives) then
			for id, e in pairs(objectives) do
				if not e.completed and e.type == 1 then
					if Variable.CurrentDuty.OnlyFirstObjectif then
						local Index = tonumber(e.values[1])
						if Index >= 1 then
							if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, -500, 484, 248.58) <= 20 then
								return false
							end
						end
						return true
					end
				end
			end
		end
		return true
	end
	-- YoRHa - The Puppet bunker
	if Variable.CurrentDuty.Tag_Id == 736 then
		local objectives = Duty:GetActiveDutyObjectives()
		if table.valid(objectives) then
			for id, e in pairs(objectives) do
				if not e.completed and e.type == 1 then
					if Variable.CurrentDuty.OnlyFirstObjectif then
						local Index = tonumber(e.values[1])
						if Index >= 1 then
							if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, -355.04, 104.01, 367.22) <= 20 then
								return false
							end
						end
						return true
					end
				end
			end
		end
		return true
	end
	return false
end

function RevoltEngine.CloseShortCut()
	if Variable.AfterShortCut then
		if table.valid(Variable.CurrentDuty.ShortCut) then
			for id, e in pairs(Variable.CurrentDuty.ShortCut) do
				local objectives = Duty:GetActiveDutyObjectives()
				if table.valid(objectives) then
					for iid, ie in pairs(objectives) do
						if not ie.completed then
							if (iid >= e.AfterObjectif) and (iid <= e.BeforeObjectif) then
								if BUtility.Wait(10, "AfterShortCut") then
									BMovement.doMoveToPosition(Variable.TransitionZone[Variable.CurrentDuty.Tag_Id][e.DoTransition].Transition)
								end
								return true
							end
						end
					end
				end
			end
		else
			if BUtility.Wait(10, "AfterShortCut2") then
				d("Player Stop Move - 4")
				Player:Stop()
				return false
			end
		end
	end
	local id = Variable.ShortcutsID
	if Variable.CurrentDuty.ShortCutID then
		id = Variable.CurrentDuty.ShortCutID
	end
	local FTarget = BTarget.FindEntity(id, "targetable,maxdistance=30,contentid="..id)
	if FTarget ~= nil then
		-- Check Fractal
		if Variable.CurrentDuty.Tag_Id == 35 then
			local objectives = Duty:GetActiveDutyObjectives()
			if table.valid(objectives) then
				for id, e in pairs(objectives) do
					if not e.completed and e.type == 1 then
						if id >= 5 then
							return false
						end
					end
				end
			end
		end
		if RevoltEngine.SkipShortcutsRaid() then
			return false
		end
		if Variable.CurrentDuty.Tag_Id == 21 then
			return false
		end
		-- Close shortcut
		if BMovement.doMoveToPosition(FTarget.pos) then
			d("Player Stop Move - 5")
			Player:Stop()
			Variable.AfterShortCut = true
			BInteract.Interact(FTarget.id)
		end
		return true
	end
	return false
end

function RevoltEngine.CheckCurrentTarget()
	if table.valid(Variable.Need_SpeMove) then
		if BTarget.GetTarget() then
			local Target = BTarget.GetTarget()
			if not Target.alive then
				d("Current Target Dead -> Reset Target & Move & Avoid")
				Player:Stop()
				BTarget.RemoveEntityInTarget()
				Variable.Need_SpeMove = nil
				RevoltEngine.Reset_Avoid(false)
				return true
			end
		end
	end
	return false
end

function RevoltEngine.TankUseSprint()
	local el = BTarget.EntityByOption("maxdistance=120,chartype=4")
	local TankEntity = RevoltEngine.GotTankEntity()
	if table.valid(TankEntity) then
		local TankBuff = TankEntity.buffs
		if table.valid(TankBuff) then
			for id, e in pairs(TankBuff) do
				if e.id == 50 then -- Sprint Buff
					if TankEntity.distance >= 35 then
						-- Got Sprint
						if Variable.Random_Wait == 0 then
							Variable.Random_Wait = math.random(Variable.Random_Min, Variable.Random_Max_Sprint)
						end
						if BUtility.Wait(Variable.Random_Wait, "UseSprint") then
							Variable.Random_Wait = 0
							if BAction.IsActionReady(5, 4) then
								BAction.UseAction(5, 4)
								return true
							end
						end
					end
				end
			end
		end
	end
	return false
end

function RevoltEngine.TankUseRapat()
	if Variable.CurrentDuty.Tag_Id == 6 then
		local el = BTarget.EntityByOption("maxdistance=120,chartype=4")
		if table.valid(el) then
			for id, e in pairs(el) do
				if (e.job == 19) or (e.job == 21) or (e.job == 32) 
					or (e.job == 1) or (e.job == 3) or (e.job == 37) then
					local CastInfo = e.castinginfo
					if table.valid(CastInfo) then
						if CastInfo.channelingid == 6 then
							-- Use Rapat
							if Variable.Random_Wait == 0 then
								Variable.Random_Wait = math.random(Variable.Random_Min, Variable.Random_Max_Rapat)
							end
							if BUtility.Wait(Variable.Random_Wait, "UseRapat") then
								Variable.Random_Wait = 0
								if BAction.IsActionReady(1, 6) then
									BAction.UseAction(1, 6)
									return true
								end
							end
						end
					end
					return false
				end
			end
		end
		return false
	end
end

function RevoltEngine.CheckFinish_China(_Dinfo)
	if table.valid(_Dinfo) then
		local IdExit = 2000139
		if Variable.CurrentDuty.Exit then
			IdExit = Variable.CurrentDuty.Exit
		end
		local Exit = BTarget.FindEntity(IdExit)
		if table.valid(Exit) then
			if Exit.targetable then
				-- Exit
				d("Check Finish -> Exit")
				return false
			end
		end
	end
	return true
end

function RevoltEngine.CheckFinish()
	local Dinfo = Duty:GetActiveDutyInfo()
	local DObjectif = Duty:GetActiveDutyObjectives()
	if Variable.SoloDuty then
		return true
	end
	if (GetGameLanguage() == 4) or (GetGameLanguage() == 6) then
		return RevoltEngine.CheckFinish_China(Dinfo)
	end
	if table.valid(Dinfo) and not table.valid(DObjectif) then
		-- Guildhest
		if Variable.CurrentDuty.Type == 4 then
			if Dinfo.timer <= (Variable.CurrentDuty.Timer - 30) then
				local PosFinal = Variable.CurrentDuty.PositionFinish
				local p = Player
				if Distance3D(p.pos.x, p.pos.y, p.pos.z, PosFinal.x, PosFinal.y, PosFinal.z) <= 5 then
					p:Stop()
					return false
				end
			end
		end
		--
		local IdExit = 2000139
		if Variable.CurrentDuty.Exit then
			IdExit = Variable.CurrentDuty.Exit
		end
		local Exit = BTarget.FindEntity(IdExit)
		if table.valid(Exit) then
			if Exit.targetable then
				-- Exit
				return false
			end
		end
	end
	return true
end

function RevoltEngine.GetRole()
	if Variable.TeamList then
		for id, e in pairs(Variable.TeamList) do
			if e.Name == Player.name then
				return id
			end
		end
	end
	-- Default
	return 1
end

function RevoltEngine.CreateTable(_name, _job)
	local Tmp = {
		Name = _name,
		Job = _job,
	}
	return Tmp
end

function RevoltEngine.BuildTeamList()
	-- Init Variable
	Variable.TeamList = {}
	local Team = BTarget.EntityByOption("myparty")
	-- Recup List Job
	local ListJob = {
		1,3,19,21,32,37,2,4,29,20,22,30,34,5,7,26,23,38,31,25,27,35,6,24,28,33
	}
	--
	if table.valid(Team) then
		for id, e in pairs(ListJob) do
			if Player.job == e then
				table.insert(Variable.TeamList, RevoltEngine.CreateTable(Player.name, Player.job))
			end
			for iid, ie in pairs(Team) do
				if e == ie.job then
					table.insert(Variable.TeamList, RevoltEngine.CreateTable(ie.name, ie.job))
				end
			end
		end
	else
		-- Solo / Trust / Squadron
		table.insert(Variable.TeamList, Player.role, RevoltEngine.CreateTable(Player.name, Player.job))
	end
	for id, e in pairs(Variable.TeamList) do
		d(id.." - "..e.Name.." - "..e.Job)
	end
end

function RevoltEngine.CheckStart()
	if Variable.CheckStart and not Variable.SoloDuty then
		-- Check if Timer Valide
		local info = Duty:GetActiveDutyInfo()
		if table.valid(info) then
			local Timer = 5400
			if Variable.CurrentDuty.Is24Raid then
				Timer = 7200
			end
			if Variable.CurrentDuty.Timer then
				Timer = Variable.CurrentDuty.Timer
			end
			if (info.timer < Timer and info.timer ~= 0) then
				-- Go Engage
				BCommun.RunMinion(true, "check start 1")
				if info.timer >= 5340 then -- Only First Minute
					-- Check WelcomeString
					if Variable.UseWelcomeString then
						if not Variable.WelcomeUsed then
							if Variable.Random_UseString == nil then
								Variable.Random_UseString = math.random(1, 10)
							end
							if BUtility.Wait(Variable.Random_UseString, "WaitUseWelcomeString") then
								BCommun.Speak("/p "..Variable.WelcomeString)
								Variable.WelcomeUsed = true
							end
						end
					end
				end
				local Wait = 10
				if info.timer <= 5340 then -- Not First Minute
					Wait = 4
				end
				if BUtility.Wait(Wait, "Check_Start") then
					d("Check Start Duty Done")
					RevoltEngine.BuildTeamList()
					Variable.CheckStart = false
				end
			end
		end
		return false
	end
	return true
end

function RevoltEngine.FindDataSlaveMode()
	local map = Player.localmapid
	if Variable.DataByMapId[map]() then
		local Data = Variable.DataByMapId[map]()
		local Tab = {
			DataIndex = 1,
			Duty_Info = Data.Get_Info(),
			Data_Boss = Data.Get_Boss_Duty(),
			Data_Duty = Data.Get_Data_Normal(),
			JobIndex = Variable.JobIndex
		}
		Variable.CurrentDuty = Tab.Duty_Info
		RevoltEngine.LoadDataForDuty(Tab)
	end
end

function RevoltEngine.Is_Not_Start_InsideDuty()
	-- Check Start inside Duty
	if (not table.valid(Variable.CurrentDuty)) then
		if Variable.ActiveSlaveMode then
			RevoltEngine.FindDataSlaveMode()
		else
			RevoltEngine.Find_Duty()
		end
		return false
	else
		if Variable.CurrentDuty.IsRoulette then
			Variable.CurrentDuty = nil
			return false
		end
	end
	return true
end

function RevoltEngine.Squadron_ActiveRepli()
	local RawData = GetControl("GcArmyOrder"):GetRawData()
	if table.valid(RawData) then
		local Repli = ActionList:Get(19, 2).name
		local EndRepli = ActionList:Get(19, 3).name
		if (Repli ~= nil) and (EndRepli ~= nil) then
			if Repli ~= EndRepli then
				-- Use Action Repli
	--			d("ORDER REPLI Squadron_ActiveRepli")
				BAction.UseAction(19, 2)
				return true
			end
		end
	end
	return false
end

function RevoltEngine.Squadron_System()
	if Variable.Squadron then
		if table.valid(BTarget.GetTarget()) then
			-- Got Target
			if not BTarget.GetTarget().targetable and Player.hp.percent >= 75 then
				-- Not Targetable
				RevoltEngine.Squadron_ActiveRepli()
				return
			end
			-- Use Action Attack
			BAction.UseAction(19, 1, BTarget.GetTarget().id)
			return
		else
			-- No Target
			RevoltEngine.Squadron_ActiveRepli()
			return
		end
	end
end

function RevoltEngine.Check_InDuty_Pulse()
	if not RevoltEngine.Is_Not_Start_InsideDuty() then
		return false
	end
	if not RevoltEngine.CheckStart() then
		return false
	end
	if RevoltEngine.TankUseRapat() then
		return false
	end
	if RevoltEngine.TankUseSprint() then
		return false
	end
	if RevoltEngine.CheckCurrentTarget() then
		return false
	end
	if BCommun.IsControlOpen("SystemMenu") then
		BCommun.CloseControl("SystemMenu")
	end
	return true
end

function RevoltEngine.InDuty()
	if RevoltEngine.Check_InDuty_Pulse() then
		if not Player.incombat then
			if BCommun.IsCasting() then
				return
			end
		end
		if RevoltEngine.CheckFinish() then
			-- In Duty
			if not Variable.Need_SpeMove then
				if not Variable.NextPulseIsAfterAvoid then -- Check stil in AoE
					if RevoltEngine.CloseTransitionZone() then
						return
					end
					if RevoltEngine.CloseShortCut() then
						return
					end
					-- Check Reset ShortCut & Transition
					RevoltEngine.ResetShortCutTransition()
					-- Check Prio
					if not RevoltEngine.Check_Prio_Target(Variable.CurrentDuty.Prio_Target) then
						return Variable.RunType[Variable.CurrentDuty.Type]()
					end
				else
					d("Inside Avoid")
				end
			end
		else
			-- Finish -> Timer Stoped
			return RevoltEngine.Finish_Run()
		end
	end
	return
end
----------------------------	[End Inside Duty]		-------------------------------------------

----------------------------	[Outside Duty]		-------------------------------------------
function RevoltEngine.StartDutyFromExtern(_data)
	-- Start Addon
	RevoltEngine.StartAddon()
	-- Init Info
	Variable.CurrentDuty = _data.DutyInfo
	RevoltEngine.LoadDataForDuty(_data)
	Variable.CheckSetting = false
	Variable.SoloDuty = true
end

function RevoltEngine.GetDataForDuty(_index)
	if table.valid(Bottox_Bonus) then
		local DataList =  Bottox_Bonus.Get_List_Bonus()
		if table.valid(DataList) then
			for id, e in pairs(DataList) do
				-- Recup Info
				local info = e()
				local tmp = info.Get_Info()
				if tmp.Name == _index then
					local Tab = {
						--
						Count = 1,
						JobIndex = 0,
						DataIndex = 1,
						--
						DutyInfo = info.Get_Info(),
						Data_Duty = info.Get_Data_Normal(),
						Data_Boss = info.Get_Boss_Duty(),
					}
					return Tab
				end
			end
		end
	end
	return nil
end

function RevoltEngine.GetDataForRoulette(_count, _job, _tmp)
	local tmp = nil
	if Variable.RouletteData[Player.localmapid] then
		for id, e in pairs(Variable.RouletteData[Player.localmapid]) do
			if e.Type == "HP_Boss" then
				local entity = BTarget.FindEntity(e.ID, "alive")
				if table.valid(entity) then
					if entity.hp.max == e.Value then
						tmp = e
					end
				end
			else
				tmp = e
			end
		end
		if table.valid(tmp) then
			_tmp = {
				--
				Count = _count,
				JobIndex = _job,
				DataIndex = 1,
				--
				DutyInfo = tmp.Info(),
				Data_Duty = tmp.Data(),
				Data_Boss = tmp.Boss(),
			}
		end
	end
	return _tmp
end

function RevoltEngine.LoadDataForDuty(_info)
	if _info.DataIndex == 1 then
		Variable.Unsync = false
		Variable.Squadron = false
		Variable.Trust = false
	end
	if _info.DataIndex == 2 then
		Variable.Unsync = true
		Variable.Squadron = false
		Variable.Trust = false
	end
	if _info.DataIndex == 3 then
		Variable.Unsync = false
		Variable.Squadron = true
		Variable.Trust = false
	end
	if _info.DataIndex == 4 then
		Variable.Unsync = false
		Variable.Squadron = false
		Variable.Trust = true
	end
	Variable.Boss_Table = _info.Data_Boss
	Variable.Objectif_Table = _info.Data_Duty
	-- Switch Job
	Variable.DutyJob = _info.JobIndex
end

function RevoltEngine.Find_Duty()
	-- Check Slave Mode
	if Variable.ActiveSlaveMode then
		return RevoltEngine.EnterDuty()
	end
	if table.size(Variable.NeededList) == 0 then
		if Variable.AutoLevel == true or Variable.AutoLevelDuty == true then
			if Player.level ~= 80 then
				RevoltEngine.AutoLevel()
			else
				d("You are level 80 is max level.")
				RevoltEngine.StopAddon()
				return
			end
		else
			RevoltEngine.StopAddon()
			return
		end
	end
	for id, e in pairs(Variable.NeededList) do
		-- Epur List
		if e.Max <= e.Count then
			table.remove(Variable.NeededList, id)
			return
		else
			local tmp = e
			-- Spe Roulette
			if tmp.DutyInfo.IsRoulette then
				if Duty:GetActiveDutyObjectives() then
					tmp = RevoltEngine.GetDataForRoulette(tmp.Count, tmp.JobIndex, tmp)
				end
			end
			--
			Variable.CurrentDuty = tmp.DutyInfo
			if not tmp.DutyInfo.IsRoulette then
				RevoltEngine.LoadDataForDuty(tmp)
				Variable.CheckSetting = false
			end
			return
		end
	end
end

function RevoltEngine.AutoLevel()
	d("AUTOLEVEL : ON")
	local tabb
	if Variable.AutoLevel == true then
		tabb = {
			[1] = {
				LevelMinimum = 20,
				DungeonName = "Halatali",
				DataIndex = 3,
			},
			[2] = {
				LevelMinimum = 24,
				DungeonName = "The Thousand Maws of Toto-Rak",
				DataIndex = 3,
			},
			[3] = {
				LevelMinimum = 32,
				DungeonName = "Brayflox's Longstop",
				DataIndex = 3,
			},
			[4] = {
				LevelMinimum = 41,
				DungeonName = "The Stone Vigil",
				DataIndex = 3,
			},
			[5] = {
				LevelMinimum = 47,
				DungeonName = "Aurum Vale",
				DataIndex = 3,
			},
			[6] = {
				LevelMinimum = 53,
				DungeonName = "Sohm Al",
				DataIndex = 3,
			},
			[7] = {
				LevelMinimum = 57,
				DungeonName = "The Vault",
				DataIndex = 3,
			},
			[8] = {
				LevelMinimum = 71,
				DungeonName = "Holminster Switch",
				DataIndex = 4,
			},
			[9] = {
				LevelMinimum = 73,
				DungeonName = "Dohn Mheg",
				DataIndex = 4,
			},
			[10] = {
				LevelMinimum = 75,
				DungeonName = "The Qitana Ravel",
				DataIndex = 4,
			},
			[11] = {
				LevelMinimum = 77,
				DungeonName = "Malikah's Well",
				DataIndex = 4,
			},
			[12] = {
				LevelMinimum = 79,
				DungeonName = "Mt. Gulg",
				DataIndex = 4,
			},
			[13] = {
				LevelMinimum = 80,
				DungeonName = "Anamnesis Anyder",
				DataIndex = 4,
			},
		}
	end
	if Variable.AutoLevelDuty == true then
		tabb = {
			[1] = {
				LevelMinimum = 15,
				DungeonName = "Sastasha",
				DataIndex = 1,
			},
			[2] = {
				LevelMinimum = 17,
				DungeonName = "The Tam-Tara Deepcroft",
				DataIndex = 1,
			},
			[3] = {
				LevelMinimum = 20,
				DungeonName = "Halatali",
				DataIndex = 1,
			},
			[4] = {
				LevelMinimum = 24,
				DungeonName = "The Thousand Maws of Toto-Rak",
				DataIndex = 1,
			},
			[5] = {
				LevelMinimum = 28,
				DungeonName = "Haukke Manor",
				DataIndex = 1,
			},
			[6] = {
				LevelMinimum = 32,
				DungeonName = "Brayflox's Longstop",
				DataIndex = 1,
			},
			[7] = {
				LevelMinimum = 38,
				DungeonName = "Cutter's Cry",
				DataIndex = 1,
			},
			[8] = {
				LevelMinimum = 41,
				DungeonName = "The Stone Vigil",
				DataIndex = 1,
			},
			[9] = {
				LevelMinimum = 48,
				DungeonName = "Aurum Vale",
				DataIndex = 1,
			},
			[10] = {
				LevelMinimum = 50,
				DungeonName = "Amdapor Keep",
				DataIndex = 1,
			},
			[11] = {
				LevelMinimum = 51,
				DungeonName = "The Dusk Vigil",
				DataIndex = 1,
			},
			[12] = {
				LevelMinimum = 53,
				DungeonName = "Sohm Al",
				DataIndex = 1,
			},
			[13] = {
				LevelMinimum = 55,
				DungeonName = "The Aery",
				DataIndex = 1,
			},
			[14] = {
				LevelMinimum = 57,
				DungeonName = "The Vault",
				DataIndex = 1,
			},
			[15] = {
				LevelMinimum = 60,
				DungeonName = "The Fractal Continuum",
				DataIndex = 1,
			},
			[16] = {
				LevelMinimum = 61,
				DungeonName = "Saint Mocianne's Arboretum",
				DataIndex = 1,
			},
			[17] = {
				LevelMinimum = 63,
				DungeonName = "Shisui of the Violet Tides",
				DataIndex = 1,
			},
			[18] = {
				LevelMinimum = 67,
				DungeonName = "Doma Castle",
				DataIndex = 1,
			},
			[19] = {
				LevelMinimum = 70,
				DungeonName = "Kugane Castle",
				DataIndex = 1,
			},
			[20] = {
				LevelMinimum = 71,
				DungeonName = "Holminster Switch",
				DataIndex = 1,
			},
			[21] = {
				LevelMinimum = 73,
				DungeonName = "Dohn Mheg",
				DataIndex = 1,
			},
			[22] = {
				LevelMinimum = 77,
				DungeonName = "Malikah's Well",
				DataIndex = 1,
			},
			[23] = {
				LevelMinimum = 80,
				DungeonName = "The Grand Cosmos",
				DataIndex = 1,
			},
		}
	end
	local _numberList = {}
	local _number
	if Variable.AutoLevel == true or Variable.AutoLevelDuty == true then
		local lev = Player.levels
		local numberOfDungeons = table.getn(tabb)
		if (table.valid(lev)) then
			for lkey, lvalue in pairs(lev) do
				if lkey == Player.job then
					for i=1,numberOfDungeons do
						if lvalue >= tabb[i].LevelMinimum then
							table.insert(_numberList,i)
						end
					end
				end
			end
		end
	end	
	_number = table.getn(_numberList)
	RevoltEngine.LoadInformation(Bottox_Dungeons.Get_Duty_Info(tabb[_number].DungeonName))
	local Tab
	if Variable.AutoLevel == true then
		Tab = {
			DutyInfo = Variable.Selected.Info,
			--
			Data_Duty = Variable.Selected.Data_Squadron,
			Data_Boss = Variable.Selected.Boss_Squadron,
			--
			DataIndex = tabb[_number].DataIndex,
			--
			Max = 1,
			Count = 0,
			--
			JobIndex = 1,
		}
	end
	if Variable.AutoLevelDuty == true then
		Tab = {
			DutyInfo = Variable.Selected.Info,
			--
			Data_Duty = Variable.Selected.Data_Speed,
			Data_Boss = Variable.Selected.Boss_Duty,
			--
			DataIndex = tabb[_number].DataIndex,
			--
			Max = 1,
			Count = 0,
			--
			JobIndex = 1,
		}
	end
	if Variable.AutoLevel == true then
		if table.getn(_numberList) >= 8 then
			Tab.Data_Duty = Variable.Selected.Data_Trust
			Tab.Data_Boss = Variable.Selected.Boss_Trust
		end
	end
	table.insert(Variable.NeededList, Tab)
end

function RevoltEngine.CreateOldListItem()
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if (id >= 0) and (id <= 4) then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							table.insert(Variable.ListOldItems,item)
						end
					end
				end
			end
		end
	end
end

function RevoltEngine.CreateNewListItem()
	d("CreateNewListItem")
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if (id >= 0) and (id <= 4) then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							table.insert(Variable.ListNewItems,item)
						end
					end
				end
			end
		end
	end
end

function RevoltEngine.CheckNewItemOnList()
	d("CheckNewItemOnList")
	for k, v in ipairs(Variable.ListOldItems) do
		for kk,vv in ipairs(Variable.ListNewItems) do
			if v.Name == vv.Name and v.ishq == vv.ishq then
				table.remove(Variable.ListNewItems, kk)
			end
		end
	end
	for kk,vv in pairs(Variable.ListNewItems) do
		local Tmp = {
			Item = vv,
			Count = 1,
		}
		if AceLib.API.Items.IsDesynthable(vv) == true then
			Exorcism.SetNeedList(Tmp)
		end
	end
end

function RevoltEngine.EnterWithTrust()
	if BCommun.IsControlOpen("Dawn") then
		--
		local Dawn = GetControl("Dawn"):GetActions()
		if table.valid(Dawn) then
			local Data = GetControl("Dawn"):GetData()
			if Variable.TrustType ~= Data.IsOnScenario then
				-- Need change it
				for aid, action in pairs(Dawn) do
					if action == "ToggleScenario" then
						GetControl("Dawn"):Action(action,0)
					end
				end
			end
			if Variable.SpecificTrust then
				RevoltEngine.DeleteTrust()
				RevoltEngine.LoadSpecificTrust()
			end
			for aid, action in pairs(Dawn) do
				if action == "SelectDuty" then
					GetControl("Dawn"):Action(action,Variable.CurrentDuty.Tag_Trust)
				end
			end
			for aid, action in pairs(Dawn) do
				if action == "Register" then
					GetControl("Dawn"):Action(action,Variable.CurrentDuty.Tag_Trust)
				end
			end
		end
	else
		-- Open Item
		local Action = ActionList:Get(10, 82)
		if table.valid(Action) then
			Action:Cast()
		end
	end
	return
end

function RevoltEngine.DeleteTrust()
	local tab = {
		[0] = 35,
		[1] = 36,
		[2] = 37,
		[3] = 38,
		[4] = 39,
		[5] = 40,
		[6] = 41,
	}
	local controls = GetControls()
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e.name == "Dawn" then
				local ac = e:GetActions()
				if (table.valid(ac)) then
					for aid, action in pairs(ac) do
						if action == "SelectIndex" then
							local Dawn = GetControl("Dawn"):GetActions()
							local AddonControlDawn = GetControl("Dawn")
							if table.valid(Dawn) then
								local RawData = AddonControlDawn:GetRawData()
								if table.valid(RawData) then
									for k , v in pairs(tab) do
										if RawData[v].value == true then
											e:Action(action,k)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function RevoltEngine.GetIdSpecificTrust(_trustList)
	local controls = GetControls()
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e.name == "Dawn" then
				local ac = e:GetActions()
				if (table.valid(ac)) then
					for aid, action in pairs(ac) do
						if action == "SelectIndex" then
							local Dawn = GetControl("Dawn"):GetActions()
							local AddonControlDawn = GetControl("Dawn")
							if table.valid(Dawn) then
								local RawData = AddonControlDawn:GetRawData()
								if table.valid(RawData) then
									for k, trust in pairs(_trustList) do
										if RawData[trust.rawdataId].value == false then
											d(trust.number)
											e:Action(action,trust.number)
											d(RawData[trust.rawdataId].value)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function RevoltEngine.LoadSpecificTrust()
	if BCommun.IsControlOpen("Dawn") then
		local type
		local Dawn = GetControl("Dawn"):GetActions()
		local AddonControlDawn = GetControl("Dawn")
		if table.valid(Dawn) then
			local RawData = AddonControlDawn:GetRawData()
			if table.valid(RawData) then
				for id, e in pairs(RawData) do
					if id == 84 then
						type = e.value
					end
				end
			end
		end
		-- TANK
		if type == 1 then
			RevoltEngine.GetIdSpecificTrust(
				{
					Variable.TrustHealList[Variable.TrustHealListSelected],
					Variable.TrustFirstDpsList[Variable.TrustFirstDpsListSelected],
					Variable.TrustSecondDpsList[Variable.TrustSecondDpsListSelected]
				}
			)
		end
		-- DPS
		if type == 2 then
			RevoltEngine.GetIdSpecificTrust(
				{
					Variable.TrustTankList[Variable.TrustTankListSelected],
					Variable.TrustHealList[Variable.TrustHealListSelected],
					Variable.TrustFirstDpsList[Variable.TrustFirstDpsListSelected]
				}
			)
		end
		-- HEAL
		if type == 3 then
			RevoltEngine.GetIdSpecificTrust(
				{
					Variable.TrustTankList[Variable.TrustTankListSelected],
					Variable.TrustFirstDpsList[Variable.TrustFirstDpsListSelected],
					Variable.TrustSecondDpsList[Variable.TrustSecondDpsListSelected]
				}
			)
		end
	end
end

function RevoltEngine.EnterWithSquadron()
	if BCommun.IsControlOpen("GcArmyExpeditionResult") then
		-- Take Item
		GetControl("GcArmyExpeditionResult"):PushButton(25, 0)
		return
	end
	if BCommun.IsControlOpen("GcArmyCapture") then
		local Tag = Variable.CurrentDuty.Tag_Squadron - 1
		-- Check List is Full
		local RawData = GetControl("GcArmyCapture"):GetRawData()
		if table.valid(RawData) then
			if RawData[8] ~= 15 then
				-- List not Full
				local tab = {
					1, -- Halatali
					2, -- Toto-rak
					3, -- Brayflow
					4, -- Vigile
					6, -- Dzemael
					9, -- Aurum
					5, -- Vagabond
					7, -- Sirius
					8, -- Clochecuivre hard
					10, -- Brayflow hard
					12, -- Vagabond hard -- XX (11)
					11, -- Sohm al {tag data 12, real tag = 10}
					13, -- Voûte
					14, -- Continuum
					15, -- Sirius hard -- XX
				}
				local downtagindex = 0
				for id, e in pairs (tab) do
					if id < (Tag + 1) then -- check Finish
						if e ~= tonumber(RawData[((id - downtagindex) * 6) + 6].value) then
							-- donjon missing
							downtagindex = downtagindex + 1
						end
					else -- Exit
						break
					end
				end
				Tag = Tag - downtagindex
			end
		end
		-- Select Duty and go
		local Squad_Control = GetControl("GcArmyCapture"):GetActions()
		if (table.valid(Squad_Control)) then
			local SetIndex = nil
			local Deploy = nil
			for aid, action in pairs(Squad_Control) do
				if action == "SetIndex" then
					SetIndex = action
				end
				if action == "Deploy" then
					Deploy = action
				end
			end
			GetControl("GcArmyCapture"):Action(SetIndex, Tag)
			GetControl("GcArmyCapture"):Action(Deploy, 0)
		end
	else
		if Player.localmapid ~= 534 and Player.localmapid ~= 535 and Player.localmapid ~= 536 then
			if Exorcism.TeleportToTown() then
				Exorcism.MoveToBarrack()
			end
		else
			BInteract.SelectConversation(0)
			local map = {
				[534] = 4301182944, -- Gridania
				[535] = 4301373282, -- Ulda
				[536] = 4301373343, -- Limsa
			}
			BInteract.Interact(map[Player.localmapid])
		end
	end
	return
end

function RevoltEngine.EnterDuty()
	RevoltEngine.ResetAutoDes()
	if Variable.HadCreatedOldListItem == false then
		RevoltEngine.CreateOldListItem()
		Variable.HadCreatedOldListItem = true
	end
	local Duty_Status = Duty:GetQueueStatus()
	if Duty_Status == 0 and RevoltEngine.Is_Leader() then -- No tag
		if Variable.NeedWait then
			if BUtility.Wait(5, "Wait_ReTag") then
				Variable.NeedWait = false
			end
			return
		end
		if Variable.Trust then
			RevoltEngine.EnterWithTrust()
			Variable.NeedWait = true
			return
		end
		if Variable.Squadron then
			RevoltEngine.EnterWithSquadron()
			Variable.NeedWait = true
			return
		end
		local dList = Duty:GetCompleteDutyList()
		if table.valid(dList) then
			for id, e in pairs(dList) do
				if (e.id == Variable.CurrentDuty.Tag_Id) and (e.type == Variable.CurrentDuty.Tag_Type) then
					Duty:JoinDuty(e.type, e.id)
					Variable.NeedWait = true
					return
				end
			end
		end
	end
	if Duty_Status == 1 then --[[ Wait Tag ]] 		return end
	if Duty_Status == 2 then --[[ Accept Tag ]] 	BInteract.ConfirmDuty() return end
	if Duty_Status == 3 then --[[ Wait All Accept ]]return end
end

function RevoltEngine.CloseFinder()
	if BCommun.IsControlOpen("ContentsFinderSetting") then
		BCommun.CloseControl("ContentsFinderSetting")
		return
	end
	if BCommun.IsControlOpen("ContentsFinder") then
		BCommun.CloseControl("ContentsFinder")
		return
	end
	local controls = GetControls()
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e:IsOpen() == true then
				local ac = e:GetActions()
				if (table.valid(ac)) then
					if e.name == "ContentsFinderConfirm" then
						for aid, action in pairs(ac) do
							if action == "Confirm" then
								if e:Action(action,0) then
									return
								end
							end
						end
					end
				end
			end
		end
	end
end

function RevoltEngine.CheckSetting()
	if not Variable.CheckSetting then
		-- Check Squadron
		if Variable.Squadron or Variable.Trust then
			Variable.CheckSetting = true
			return false
		end
		-- Check Settings
		if BCommun.IsControlOpen("ContentsFinder") or 
			BCommun.IsControlOpen("ContentsFinderSetting") then
			if BCommun.IsControlOpen("ContentsFinderSetting") then
				if BInteract.SetSettingsFinder(Variable.Unsync) then
					if BCommun.CloseControl("ContentsFinder") then
						Variable.CheckSetting = true
					end
				end
			else
				-- Need Open ContentsFinderSetting
				BInteract.OpenFinderSettings()
			end
		else
			-- Need Open ContentsFinder
			local action = ActionList:Get(10, 33)
			action:Cast()
		end
		return false
	else
		-- Check if Finder Closed
		RevoltEngine.CloseFinder()
		return true
	end
end

function RevoltEngine.UseRepairMender(_info)
	if not BCommun.IsControlOpen("Repair") then
		if BMovement.doTp(_info.MapId, _info.AethId) then
			if BMovement.doMoveToPosition(_info.NpcPosition) then
				local target = BTarget.FindEntity(_info.NpcID)
				if table.valid(target) then
					BInteract.Interact(target.id)
				end
			else
				if BAction.IsActionReady(5, 4) then
					BAction.UseAction(5, 4)
				end
			end
		end
	else
		local Addon = GetControl("Repair")
		if table.valid(Addon) then
			Addon:PushButton(25, 0)
			return true
		end
	end
	return false
end

function RevoltEngine.UseDarkMatter()
	if BCommun.IsHotBarRdy() then
		if BCommun.IsControlOpen("Repair") then
			if BCommun.IsControlOpen("SelectYesno") then
				if BInteract.SelectYes() then
					return true
				end
			else
				local Addon = GetControl("Repair")
				if table.valid(Addon) then
					Addon:PushButton(25, 0)
				end
			end
		else
			local action = ActionList:Get(5, 6)
			if action ~= nil then
				action:Cast()
			end
		end
	end
	return false
end

function RevoltEngine.NeedUseRepair(_mode)
	local tab = {99, 30}
	-- check item
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if (tostring(e) == "1000") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if table.valid(ilist) then
						for slot, item in pairs(ilist) do
							if item.condition <= tab[_mode] then
								return true
							end
						end
					end
				end
			end
		end
	end	
	return false
end

function RevoltEngine.UseRepair()
	if RevoltEngine.NeedUseRepair(Variable.RepairMode) then
		d("Inside Auto Repair")
		if Variable.RepairMode == 1 then
			-- Dark Matter
			if RevoltEngine.UseDarkMatter() then
				return false
			end
		else
			-- Mender Repair
			local info = BVariable.GetRepairInfo(Variable.Repair)
			if table.valid(info) then
				if RevoltEngine.UseRepairMender(info) then
					return false
				end
			end
		end
		-- Stay inside
		return true
	else
		if BCommun.IsControlOpen("Repair") then
			BCommun.CloseControl("Repair")
			BCommun.CloseControl("Character")
		end
	end
	-- Exit
	return false
end

function RevoltEngine.ReadyCheck()
	if Variable.UseReadyCheck then
		if RevoltEngine.Is_Leader() then
			local plist = EntityList.myparty
			if table.valid(plist) then
				if Variable.CheckStart then
					-- Before Run
					if not Variable.ReadyCheckDone then
						-- Need Ready Check
						local AddonControl = GetControl("ReadyCheck")
						if table.valid(AddonControl) and IsControlOpen("ReadyCheck") then
							-- Recup RawData
							local RawData = AddonControl:GetRawData()
							if table.valid(RawData) then
								for id, e in pairs(RawData) do
									if (e.type ~= "0") then
										if (id >= 51) and (id <= 59) then
											if e.value == 1 or e.value == 0 then
												-- Someone don't press
												return false
											end
										end
									end
								end
								-- Everyone have vote
								for id, e in pairs(RawData) do
									if (e.type ~= "0") then
										if (id >= 51) and (id <= 59) then
											if e.value == 3 then
												-- Someone is not ready
												if BUtility.Wait(35, "Wait retry ReadyCheck") then
													BCommun.CloseControl("ReadyCheck")
												else
													d("Wait retry ReadyCheck")
												end
												return false
											end
										end
									end
								end
								-- ReadyCheck Done
								BCommun.CloseControl("ReadyCheck")
								Variable.ReadyCheckDone = true
								Variable.BeforeTag = true
							end
						else
							-- Run ReadyCheck
							BAction.UseAction(10, 59)
							BInteract.SelectYes()
						end
						return false
					end
				end
			end
		end
	end
	BInteract.SelectNo()
	return true
end

function RevoltEngine.Is_Leader()
	-- Check Team
	local plist = EntityList.myparty
	if table.valid(plist) then
		for id, e in pairs(plist) do
			if e.name == Player.name then
				return e.isleader
			end
		end
	end
	-- Check CrossWorld
	local crosslist = EntityList.crossworldparty
	if table.valid(crosslist) then
		for id, e in pairs(crosslist) do
			if e.name == Player.name then
				return e.isleader
			end
		end
	end
	-- Solo or Squadron
	return true
end

function RevoltEngine.TeamSizeChanged()
	if table.valid(EntityList.myparty) then
		if Variable.TeamSize then
			local Tmp_Size = table.size(EntityList.myparty)
			if Variable.TeamSize ~= Tmp_Size then
				-- Size Changed
				Variable.TeamSize = table.size(EntityList.myparty)
				d("Team Size changed -> Stop Addon")
				RevoltEngine.StopAddon()
				return true
			end
		else
			Variable.TeamSize = table.size(EntityList.myparty)
		end
		return false
	end
	if Variable.TeamSize then
		d("Team Disband or Leave -> Stop Addon")
		RevoltEngine.StopAddon()
		return true
	end
	-- Solo or Squadron or InterEquip
	return false
end

function RevoltEngine.CheckSymbiose()
	if Variable.AutoSymb then
		BCommun.SymbioseStuff(1000)
	end
end

function RevoltEngine.Run_Finish()
	if not Variable.CheckStart then
		-- Check Retag Time
		if Variable.WaitReTag == 0 then
			-- Run just Finish -> Need Reset + Add Count
			d("Check Duty Counter")
			-- Slave Mode
			if Variable.SoloDuty then
				d("2")
				RevoltEngine.ResetVariable()
				Update.Active = false
				return false
			end
			if Variable.ActiveSlaveMode then
				RevoltEngine.ResetVariable()
				return false
			end
			-- Add Count
			for id, e in pairs(Variable.NeededList) do
				if (Variable.CurrentDuty == e.DutyInfo) or e.DutyInfo.Is24Raid or e.DutyInfo.IsRoulette then
					e.Count = e.Count + 1
					if e.Max <= e.Count then
						table.remove(Variable.NeededList, id)
					end
					Variable.WaitReTag = math.random(Variable.TagMin, Variable.TagMax)
					d("Random Set between "..Variable.TagMin.." / "..Variable.TagMax.." -> "..Variable.WaitReTag)
					RevoltEngine.Find_Duty()
					break
				end
			end
		else
			-- Check Symbiose
			RevoltEngine.CheckSymbiose()
			if Variable.WaitReTag <= Variable.PulseTag then
				RevoltEngine.ResetVariable()
			else
				d("Wait -> "..Variable.PulseTag)
				if Player.job ~= BVariable.Get_Number(Variable.JobList[Variable.DutyJob]) then
					BUtility.SetGear(BVariable.Get_GearSet(Variable.JobList[Variable.DutyJob]))
				end
				Variable.PulseTag = Variable.PulseTag + 1
			end
		end
		return false
	end
	local jobindex = Variable.DutyJob
	for id, e in pairs(Variable.NeededList) do
		if e.DutyInfo.IsRoulette then
			jobindex = e.JobIndex
		end
		break
	end
	if jobindex then
		if Player.job ~= BVariable.Get_Number(Variable.JobList[jobindex]) then
			BUtility.SetGear(BVariable.Get_GearSet(Variable.JobList[jobindex]))
		end
	end
	return true
end

function RevoltEngine.OutDuty()
	if RevoltEngine.Run_Finish() then
		if Variable.UseAutoEquip then
			if not Variable.AutoEquipDone then
				if BCommun.AutoEquipGear() then
					Variable.AutoEquipDone = true
				else
					return
				end
			else
				if BCommun.IsControlOpen("Character") then
					GetControl("Character"):Close()
				end
			end
		end
		if Variable.UseAutoRepair then
			if RevoltEngine.UseRepair() then
				return
			end
		end
		if Variable.AutoDes == true then
			if RevoltEngine.SwitchToDesAddon() then
				return
			end
		end
		if Variable.AutoRetainer == true then
			if RevoltEngine.SwitchToRetainerAddon() then
				return
			end
		end
		if Variable.UseTrade == true then
			if RevoltEngine.SwitchToExorcismAddon() then
				return 
			end
		end
	--	if not RevoltEngine.TeamSizeChanged() then
	--		if RevoltEngine.ReadyCheck() then
			-- Check Settings
		if RevoltEngine.CheckSetting() then
			if Variable.CurrentDuty then
				-- Got Duty
				RevoltEngine.EnterDuty()
			else
				-- No Duty Selected -> Go Check List
				RevoltEngine.Find_Duty()
			end
	--		end
	--	end
		end
	end
	return
end
----------------------------	[End Outside Duty]		-------------------------------------------

----------------------------	[Check Every Pulse]		-------------------------------------------
function RevoltEngine.Check_StartCombat(_bool)
	if _bool ~= nil then
		gStartCombat = _bool
		return
	end
	-- Player is Tank OR Solo/Squadron
	if table.valid(Variable.TeamList) then
		if (RevoltEngine.GetRole() == 1) or (not table.valid(EntityList.myparty)) or Variable.Unsync then
			gStartCombat = true
		else
			gStartCombat = false
		end
	end
	return
end

function RevoltEngine.Check_IsInDuty()
	if (Player.localmapid ~= 886) and (Player.localmapid ~= 418) then
		if table.valid(Duty:GetActiveDutyInfo()) then
			-- In Duty
			Variable.InDuty = Duty:GetActiveDutyInfo()
		else
			Variable.InDuty = false
		end
	end
	return
end

function RevoltEngine.RecupCurrentLoot(_id)
	local list = Inventory:GetLootList()
	if (table.valid(list)) then
		for id, e in pairs(list) do
			if _id then
				if id == _id then
					return e
				end
			else
				if e.rollvalue == 0 and e.rollstate == 0 and e.info ~= 17 then
					d("Init Loot Function -> Recup Loot : "..e.id)
					return id
				end
			end
		end
	end
	return nil
end

function RevoltEngine.RollLoot(_roll)
	if Variable.WaitRoll ~= 0 then
		d("Loot System Wait")
		if BUtility.Wait(Variable.WaitRoll, "WaitRoll") then
			if Variable.CurrentLoot ~= 3 then
				Variable.CurrentLoot = Variable.CurrentLoot + 1
			else
				Variable.CurrentLoot = 0
			end
			Variable.WaitRoll = 0
		end
		return
	end
	local NeedGreed = GetControl("NeedGreed")
	if NeedGreed then
		if Variable.InLoot == nil then
			Variable.InLoot = RevoltEngine.RecupCurrentLoot()
		end
		if Variable.InLoot then
			d("Loot System Started")
			local NeededLoot = _roll
			if Variable.CurrentLoot == 0 then
				Variable.CurrentLoot = _roll
			end
			local Action = {[1] = "Need", [2] = "Greed", [3] = "Pass"}
			--
			for id, e in pairs(Action) do
				if id == Variable.CurrentLoot then
					-- Check Current Loot
					local Loot = RevoltEngine.RecupCurrentLoot(Variable.InLoot)
					if Loot then
						if Loot.rollvalue ~= 0 or Loot.rollstate ~= 0 then
							d("Loot Finish -> Reset Variable")
							Variable.InLoot = nil
							Variable.CurrentLoot = 0
							Variable.WaitRoll = 0
							return
						end
						d("Check Can roll : "..e)
						--
						if Loot.rollvalue == 0 and Loot.rollstate == 0 and Loot.info ~= 17 and Loot.info ~= id then
							-- No Roll
							NeedGreed:Action(e, Variable.InLoot - 1)
							d("Action Tried : "..e)
							Variable.WaitRoll = 3
							return
						end
						Variable.CurrentLoot = id + 1
					end
				end
			end
			d("Wait Roll System")
			return
		end
	end
	--
	d("Loot Finish -> Reset Variable")
	Variable.InLoot = nil
	Variable.CurrentLoot = 0
	Variable.WaitRoll = 0
	return 
end

function RevoltEngine.Check_LootList(_roll)
	-- is _NotificationLoot is here
	local controls = GetControls()
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e.name == "_NotificationLoot" then
				if BCommun.IsControlOpen("NeedGreed") then
					RevoltEngine.RollLoot(_roll)
				else
					-- Need Open it
					-- Recup Action for open NeedGreed
					local ac = e:GetActions()
					if (table.valid(ac)) then
						for aid, action in pairs(ac) do
							if action == "OpenNeedGreed" then
								e:Action(action,0)
								Variable.InLoot = nil
								Variable.CurrentLoot = 0
								Variable.WaitRoll = 0
							end
						end
					end
				end
				return false
			end
		end
	end
	-- _Notification not here
	Variable.InLoot = nil
	Variable.CurrentLoot = 0
	Variable.WaitRoll = 0
	return true
end

function RevoltEngine.PlayerOrPartyInCombat()
	-- Check Player
	local p = Player
	if p.incombat then
		return true
	end
	-- Check Team
	local Team = BTarget.EntityByOption("myparty")
	if Variable.Squadron or Variable.Trust then
		Team = BTarget.EntityByOption("chartype=9")
	end
	if table.valid(Team) then
		for id, e in pairs(Team) do
			if e.incombat then
				return true
			end
		end
	end
	-- No One In Combat
	return false
end

function RevoltEngine.Not_Raise_Needed()
	local p = Player
	if p then
		local h = p.hp
		if h.current == 0 then
			-- Player dead / Reset Move & Avoid
			Variable.Need_SpeMove = nil
			RevoltEngine.Reset_Avoid(false)
			--
			if RevoltEngine.PlayerOrPartyInCombat() then
				-- In Combat
				if BAction.GotBuff(148) then -- Vie
					BInteract.SelectYes() -- Take it
				end
			else
				RevoltEngine.Reset_Death()
				if BCommun.IsControlOpen("_NotificationRevive") then
					if not BCommun.IsControlOpen("SelectYesno") then
						local control = GetControl("_NotificationRevive")
						local ac = control:GetActions()
						if (table.valid(ac)) then
							for aid, action in pairs(ac) do
								if action == "OpenRevive" then
									control:Action(action,0)
								end
							end
						end
					else
						if BUtility.Wait(1, "Raise_Needed") then
							if table.valid(Bozja) then
								if Bozja.GetAddonStarted() then
									return false
								end
							end
							-- Out Combat
							Variable.Save_CurrentStep = Variable.CurrentStep
							BStep.RemoveStep()
							-- Do Raise
							BCommun.Raise()
						end
					end
				end
			end
			return false
		end
	end
	-- Raise not Needed
	return true
end

function RevoltEngine.CheckEveryPulse()
	-- Check Dead
	if RevoltEngine.Not_Raise_Needed() then
		-- Next / Check Dialog-Cast-SelectYes
		if not BCommun.InsideDialog() then
			if not BInteract.SelectYes() then
				-- Check Could Stop Finish -> Check During Duty Run 
				-- Check Loot List
				if Variable.Loot ~= 1 then
					RevoltEngine.Check_LootList(Variable.Loot - 1)
				end
				-- Check List Empty
				if (table.size(Variable.NeededList) == 0) and not Variable.ActiveSlaveMode and not Variable.SoloDuty then
					d("1")
					RevoltEngine.StopAddon()
					return false
				end
				-- Check Is In Duty
				RevoltEngine.Check_IsInDuty()
				-- Check Start Combat
				RevoltEngine.Check_StartCombat()
				-- Everything is fine
				-- Check Food
				return true
			end
		end
	end
	-- Something is wrong
	return false
end
----------------------------	[End Check Every Pulse]		-------------------------------------------

----------------------------	[Update]		-------------------------------------------
function RevoltEngine.Update(Event, ticks)
	if (not Update.Timer or ticks - Update.Timer > Update.Pulse) then
		if not Update.Timer then
			Update.Timer = ticks
		else
			Update.Timer = Update.Timer + Update.Pulse
		end
		if Update.Active == true then
			------------
			if not Update.Pause == true then
				Hacks:Disable3DRendering(Variable.Rendering)
				-- Check if rien ne bloque l'addon
				if RevoltEngine.CheckEveryPulse() then
					if Variable.InDuty then -- Got Duty Info
						RevoltEngine.InDuty()
					else
	--					if BCommun.CheckFood() then
							RevoltEngine.OutDuty()
	--					end
					end
				end
			end
			------------
		end
	end	
end
RegisterEventHandler("Gameloop.Update", RevoltEngine.Update, Addon.Name)

----------------------------	[Draw]		-------------------------------------------
function RevoltEngine.DoDuty(_id)
	local Data = RevoltEngine.GetDataForDuty(_id)
	if table.valid(Data) then
		d("Not Yet")
	else
		Variable.DutyData = RevoltEngine.GetDutyData()
	end
end

function RevoltEngine.Draw_Settings()
	--
	if Variable.Size == nil then
		-- Need Init Settings
		GUI:Text("Init Setting")
		BottoxSettings.CheckNeedSave()
		return
	end
	-- Loot List
	GUI:PushItemWidth(GUI:GetWindowSize() - 1); Variable.Loot = GUI:Combo("##LootList_Revolt", Variable.Loot, Variable.LootList, GUI:GetWindowSize() - 1); GUI:PopItemWidth()
	BStyle.Draw_Space()
	--
	Variable.UseReadyCheck =	GUI:Checkbox("##ReadyChecks", Variable.UseReadyCheck)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\ReadyCheck.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Ready Checks"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Will first ask for other players to confirm the dungeon or the boss pull.")
	end
	--
	Variable.IgnoreChest =		GUI:Checkbox("##IgnoreChest", Variable.IgnoreChest)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Chest.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Ignore Chests in Dungeon"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("to skip dungeon chests.")
	end 
	GUI:Text(""); GUI:SameLine(25); Variable.TakeLastChest = GUI:Checkbox("##OpenLastBossChest", Variable.TakeLastChest)
	GUI:SameLine(60);
	if Variable.IgnoreChest == true then
	 	GUI:Text(BTalk.Translate_Tooltip("Open Last Boss Chest"))
	 else
	 	GUI:TextDisabled("Open Last Boss Chest")
	 end
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("to ONLY open dungeon's last boss chest.")
	end
	if Variable.IgnoreChest == false then
		Variable.TakeLastChest = true
	end
	--
	Variable.UseLimitBreak =	GUI:Checkbox("##DisableLimitBreak", Variable.UseLimitBreak)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\LimitBreak.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Disable Limit Break"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Disables the Limit Break usage during bosses fights.")
	end
	--
	Variable.Rendering = 		GUI:Checkbox("##DisableRendering", Variable.Rendering)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\3d.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Disable Rendering"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Will ignore any 3D rendering and particles computing to limit both GPU & CPU usage.\nHighly recommended if running many accounts on the same computer.")
	end	
	--
	Variable.AutoLevel = 		GUI:Checkbox("##AutoLevel", Variable.AutoLevel)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\AutoLevel.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Leveling (Squad/Trust)"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("The bot will auto-level through Squadron runs from level 20 to 71,\nthen will switch to Trust runs from lvl 71 to 80.\nMake sure to first get a good amount of GC Seals,\nbut also to check the \"Auto trade loots to GC\" setting, that way the bot can run for a very long time.")
	end	
	--
	Variable.AutoLevelDuty = 		GUI:Checkbox("##AutoLevelDuty", Variable.AutoLevelDuty)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\AutoLevel2.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Leveling (Duty Finder)"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("The bot will auto-level through Duty Finder from level 15 to 80.\n If running in public, you must take a look at your screen, regulary.\n You can also level 4 accounts in a premade party.")
	end	
	--
	if Variable.AutoLevel == true then
		Variable.AutoLevelDuty = false
	end
	--
	if Variable.AutoLevelDuty == true then
		Variable.AutoLevel = false
	end
	--
	Variable.UseAutoEquip = 		GUI:Checkbox("##UseAutoEquip", Variable.UseAutoEquip)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Reload.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Equip"))
		--	if (GUI:IsItemHovered()) then
		--		GUI:SetTooltip("The bot will focus Squadron runs from level 20 to 71, then will switch to Trust runs from lvl 71 to 80.\nMake sure to first get a good amount of GC Seals, but also to check the \"Auto trade loots to GC\" setting, that way the bot can run for a very long time.")
		--	end	
	--
	Variable.UseTrade = 		GUI:Checkbox("##UseTrade", Variable.UseTrade)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Warning.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Use NPC Trades"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("BEFORE TO USE, you need to setup NPC Trades part of Exorcism addon,\n but also to READ the tutorial.")
	end	
	--
	Variable.AutoRetainer = 		GUI:Checkbox("##AutoRetainer", Variable.AutoRetainer)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Venture.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Send Retainers"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Use ventures for a 1 hour quick Exploration on each retainer")
	end	
	--
	Variable.AutoDes = 		GUI:Checkbox("##AutoDes", Variable.AutoDes)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\DesynthEX.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Desynth"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Desynth all item loots in dungeon")
	end	
	Variable.AutoSymb =		GUI:Checkbox("##AutoSymb", Variable.AutoSymb)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\TransmuteEX.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Convert gear to materia"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("The bot will automatically convert your gear to materia between 2 runs.")
	end	
end

function RevoltEngine.Draw_ChatLog()
	Variable.UseAutoRepair =	GUI:Checkbox("##AutoRepair", Variable.UseAutoRepair)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Tool.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Auto Repair"))
	GUI:Text(""); GUI:SameLine(30); Variable.RepairMode = GUI:RadioButton("Dark Matter", Variable.RepairMode, 1)
	GUI:Text(""); GUI:SameLine(30); Variable.RepairMode = GUI:RadioButton("Mender Repair", Variable.RepairMode, 2)
	GUI:SameLine(); GUI:PushItemWidth(120); Variable.Repair = GUI:Combo("##RepairList_Revolt", Variable.Repair, Variable.RepairList, 120); GUI:PopItemWidth()

	--
	GUI:Text("Chatlog support")
	BStyle.Draw_Space()
	Variable.UseWelcomeString = GUI:Checkbox("Hello", Variable.UseWelcomeString)
	GUI:SameLine(75); GUI:PushItemWidth(190); Variable.WelcomeString = GUI:InputText("##WelcomeString", Variable.WelcomeString, GUI.InputTextFlags_AutoSelectAll); GUI:PopItemWidth()
end

function RevoltEngine.Draw_NeededList()
	if table.valid(Variable.NeededList) then
		for id, e in pairs(Variable.NeededList) do
			if table.valid(e) then
				GUI:BeginGroup()
				local itemM = e.Max -- Max Item
				local Count = e.Count
				GUI:Text(""); GUI:SameLine(37); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Revolt\\"..e.DutyInfo.Icone_Name..".png", 190, 57)
				GUI:Text(e.DutyInfo.Name);
				GUI:Text(""); GUI:SameLine(210); GUI:Text(Count.." / "..itemM)
				GUI:EndGroup()
				if GUI:IsItemClicked() then
					table.remove(Variable.NeededList, id)
					break
				end
			end
		end
	end
end

function RevoltEngine.Draw_TrustList()
	BStyle.Draw_Space()
	Variable.SpecificTrust = 		GUI:Checkbox("##SpecificTrust", Variable.SpecificTrust)
	GUI:SameLine(); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Trust.png", 20, 20)
	GUI:SameLine(60); GUI:Text(BTalk.Translate_Tooltip("Use Specific Trust"))
	if (GUI:IsItemHovered()) then
		GUI:SetTooltip("Select your Trust")
	end
	if Variable.SpecificTrust == true then
		BStyle.Draw_Space()
		BStyle.Draw_Space()
		GUI:SameLine(95);GUI:Text("- Tank -")
		local _listTank = {}
		for k,v in pairs(Variable.TrustTankList) do
			table.insert(_listTank,v.name)
		end
		GUI:PushItemWidth(GUI:GetWindowSize() - 1); Variable.TrustTankListSelected = GUI:Combo("##TrustTankListSelected", Variable.TrustTankListSelected, _listTank, GUI:GetWindowSize() - 1); GUI:PopItemWidth()
		BStyle.Draw_Space()
		BStyle.Draw_Space()
		------------------
		GUI:SameLine(95);GUI:Text("- Heal -")
		local _listHeal = {}
		for k,v in pairs(Variable.TrustHealList) do
			table.insert(_listHeal,v.name)
		end
		GUI:PushItemWidth(GUI:GetWindowSize() - 1); Variable.TrustHealListSelected = GUI:Combo("##TrustHealListSelected", Variable.TrustHealListSelected, _listHeal, GUI:GetWindowSize() - 1); GUI:PopItemWidth()
		BStyle.Draw_Space()
		BStyle.Draw_Space()
		------------------
		GUI:SameLine(90);GUI:Text("- First Dps -")
		local _listFirstDps = {}
		for k,v in pairs(Variable.TrustFirstDpsList) do
			table.insert(_listFirstDps,v.name)
		end
		GUI:PushItemWidth(GUI:GetWindowSize() - 1); Variable.TrustFirstDpsListSelected = GUI:Combo("##TrustFirstDpsListSelected", Variable.TrustFirstDpsListSelected, _listFirstDps, GUI:GetWindowSize() - 1); GUI:PopItemWidth()
		BStyle.Draw_Space()
		BStyle.Draw_Space()
		------------------
		GUI:SameLine(90);GUI:Text("- Second Dps -")
		local _listSecondDps = {}
		for k,v in pairs(Variable.TrustSecondDpsList) do
			table.insert(_listSecondDps,v.name)
		end
		GUI:PushItemWidth(GUI:GetWindowSize() - 1); Variable.TrustSecondDpsListSelected = GUI:Combo("##TrustSecondDpsListSelected", Variable.TrustSecondDpsListSelected, _listSecondDps, GUI:GetWindowSize() - 1); GUI:PopItemWidth()
	end
end

function RevoltEngine.Draw_Second() -- Second Windows
	Second_Windows.DrawInside[Second_Windows.Index]()
end

function RevoltEngine.StopAddon()
	-- Reset Variable
	RevoltEngine.ResetVariable()
	BMovement.StopMove()
	-- GC Trade 
	Exorcism.StopAddon()
	-- Go Engage
	Hacks:Disable3DRendering(false)
	BCommun.RunMinion(false, "stop addon")
	--
	Update.Active = false
	Update.Pause = false
	AvoidUpdate.Pause = false	
	AvoidUpdate.Active = false
	BeheviorUpdate.Pause = false	
	BeheviorUpdate.Active = false
	MoveUpdate.Active = false
end

function RevoltEngine.StartAddon()
	-- Init Variable
	Exorcism.ResetVariableCollecTrade()
	RevoltEngine.ResetVariable()
	Variable.CountBeforeTrade = Variable.CountBeforeTradeByUser
	if Variable.AutoLevel == true or Variable.AutoLevelDuty == true then
		if Player.level ~= 80 then
			RevoltEngine.AutoLevel()
		else
			Variable.AutoLevel = false
		end
	end
	-- Init Assist Mode
	BCommun.SwitchMode("Assist")
	BCommun.PutSettingsAssist()
	RevoltEngine.Check_StartCombat()
	-- Break
	Update.Pause = false	
	Update.Active = true
	AvoidUpdate.Pause = false	
	AvoidUpdate.Active = true
	BeheviorUpdate.Pause = false	
	BeheviorUpdate.Active = true
	MoveUpdate.Active = true
	-- Madao
	if Settings then
		if Settings.MCR then
			if Settings.MCR.autoface ~= gAssistUseAutoFace then
			    gAssistUseAutoFace = Settings.MCR.autoface
			    Player:SetAutoFace(gAssistUseAutoFace)
			end
			Settings.MCR.autoface = true
			Settings.MCR.legacy = false
		end
	end
	-- End Madao Setup
end

function RevoltEngine.Draw_StartStop()
	if Update.Active == false then
		if Update.Pause == true then
			if GUI:Button("Stop", GUI:GetWindowSize() - 17, 20) then
				RevoltEngine.StopAddon()
			end
			if GUI:Button("Continue", GUI:GetWindowSize() - 17, 20) then
				if Player.job ~= BVariable.Get_Number(Variable.JobList[Variable.DutyJob]) then
					BUtility.SetGear(BVariable.Get_GearSet(Variable.JobList[Variable.DutyJob]))
				end
				Variable.Need_SpeMove = nil
				Update.Active = true
				Update.Pause = false
				AvoidUpdate.Active = true
				AvoidUpdate.Pause = false
				BeheviorUpdate.Pause = false	
				BeheviorUpdate.Active = true
				MoveUpdate.Active = true
			end
		else
			if GUI:Button("Start", GUI:GetWindowSize() - 17, 20) then
				RevoltEngine.StartAddon()
			end
		end
	else
		if GUI:Button("Stop", GUI:GetWindowSize() - 17, 20) then
			RevoltEngine.StopAddon()
		end
		if (GUI:Button("Pause", GUI:GetWindowSize() - 17, 20)) then
			BMovement.StopMove()
			Variable.Need_SpeMove = nil
			Hacks:Disable3DRendering(false)
			Update.Active = false
			Update.Pause = true
			AvoidUpdate.Active = false
			AvoidUpdate.Pause = true
			BeheviorUpdate.Pause = true	
			BeheviorUpdate.Active = false
			MoveUpdate.Active = false
		end
	end	
end

function RevoltEngine.Draw_SlaveMode()
	-- Text Explication
	BStyle.Draw_Space()
	BStyle.SetStringInCenter("Slave Mode only works for dungeons.")
	BStyle.Draw_Space()
	GUI:Text("Tank must be the leader of the team.\nAll other bots check the Slave Mode \nbutton.")
	--
	BStyle.SetStringInCenter("--------------------")
	BStyle.Draw_Space()
	-- Job List
	if table.size(Variable.JobList) == 1 then
		local tmp_list = BVariable.Get_JobList(false, false, true)
		local NameList = BVariable.Get_NameJob(tmp_list)
		for id, e in pairs(NameList) do
			table.insert(Variable.JobList, e)
		end
	end
	GUI:PushItemWidth(GUI:GetWindowSize() - 1); Variable.JobIndex = GUI:Combo("##JobIndex_Revolt",Variable.JobIndex, Variable.JobList, GUI:GetWindowSize() - 1); GUI:PopItemWidth()
	BStyle.Draw_Space()
	-- Active Slave Mode
	GUI:SameLine(50)
	Variable.ActiveSlaveMode =	GUI:Checkbox("##EnableSlaveMode", Variable.ActiveSlaveMode)
	GUI:SameLine(80)
	GUI:BeginGroup()
	GUI:Text(BTalk.Translate_Tooltip("Enable Slave Mode"))
	GUI:EndGroup()
	if GUI:IsItemClicked() then
		Variable.ActiveSlaveMode =	not Variable.ActiveSlaveMode
	end
end

function RevoltEngine.Draw_Selected()
	if Variable.Selected then
		--
		GUI:Text(""); GUI:SameLine(37); GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Revolt\\"..Variable.Selected.Info.Icone_Name..".png", 190, 57)
		BStyle.SetStringInCenter(Variable.Selected.Info.Name)
		--
		GUI:Text(""); GUI:SameLine(37)
		Variable.DutyMode = GUI:RadioButton("Normal Run", Variable.DutyMode, 1)
		if Variable.Selected.Data_Speed and Variable.DataIndex == 1 then
			GUI:SameLine(140); Variable.DutyMode = GUI:RadioButton("Speed Run", Variable.DutyMode, 2);
		else
			Variable.DutyMode = 1
		end
		-- Repeat / Duty Counter
		GUI:PushItemWidth(80)
		Variable.Size = GUI:InputInt("\t\tDuty Counter", Variable.Size); GUI:PopItemWidth()
		if Variable.Size <= 0 then
			Variable.Size = 1
		end
		BStyle.Draw_Space()
		-- Job List
		if table.size(Variable.JobList) == 1 then
			local tmp_list = BVariable.Get_JobList(false, false, true)
			local NameList = BVariable.Get_NameJob(tmp_list)
			for id, e in pairs(NameList) do
				table.insert(Variable.JobList, e)
			end
		end
		GUI:PushItemWidth(GUI:GetWindowSize() - 1); Variable.JobIndex = GUI:Combo("##JobIndex_Revolt",Variable.JobIndex, Variable.JobList, GUI:GetWindowSize() - 1); GUI:PopItemWidth()
		BStyle.Draw_Space()
		--
		local tab = {
			[1] = Variable.Selected.Data_Normal,
			[2] = Variable.Selected.Data_Unsync,
			[3] = Variable.Selected.Data_Squadron,
			[4] = Variable.Selected.Data_Trust,
		}
		if not tab[Variable.DataIndex] then -- Bad choose
			for id, e in pairs(tab) do
				if table.valid(e) then
					Variable.DataIndex = id
					break
				end
			end
		end
		--
		if Variable.Selected.Data_Normal then
			Variable.DataIndex = GUI:RadioButton("##Duty Finder_RevoltEngine", Variable.DataIndex, 1)
			GUI:SameLine()
			GUI:BeginGroup()
			GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Duty.png", 30, 30)
			GUI:SameLine(); GUI:Text("Duty Finder")
			GUI:EndGroup()
			if GUI:IsItemClicked() then
				Variable.DataIndex = 1
			end
			if GUI:IsItemHovered() then
				GUI:SetTooltip("The normal way to run dungeons in FFXIV.\nTeam up with other Minion users for Premade Parties runs,\nor join public queue.")
			end
		end
		--
		if Variable.Selected.Data_Unsync then
			Variable.DataIndex = GUI:RadioButton("##Unsync_RevoltEngine", Variable.DataIndex, 2)
			GUI:SameLine()
			GUI:BeginGroup()
			GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Unsync.png", 30, 30)
			GUI:SameLine(); GUI:Text("Unsync")
			GUI:EndGroup()
			if GUI:IsItemClicked() then
				Variable.DataIndex = 2
			end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Will add the \"Undersized party\" setting from the game.\nYou can run the dungeons with uncaped stats.")
			end
		end
		--
		if Variable.Selected.Data_Squadron then
			Variable.DataIndex = GUI:RadioButton("##Squadron_RevoltEngine", Variable.DataIndex, 3)
			GUI:SameLine()
			GUI:BeginGroup()
			GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Squad.png", 30, 30)
			GUI:SameLine(); GUI:Text("Squadron")
			GUI:EndGroup()
			if GUI:IsItemClicked() then
				Variable.DataIndex = 3
			end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Check the Squad button to let the bot navigate through the Squadron menu\nYou need to face the Squadron menu NPC from your Grand Company.")
			end
		end
		--
		if Variable.Selected.Data_Trust then
			Variable.DataIndex = GUI:RadioButton("##Trust_RevoltEngine", Variable.DataIndex, 4)
			GUI:SameLine()
			GUI:BeginGroup()
			GUI:Image(GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Trust.png", 30, 30)
			GUI:SameLine(); GUI:Text("Trust System")
			GUI:EndGroup()
			if GUI:IsItemClicked() then
				Variable.DataIndex = 4
			end
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Run the dungeons with your Trust Npcs !")
			end
			GUI:SameLine(); GUI:Text(""); GUI:SameLine()
			GUI:BeginGroup()
			Variable.TrustType = GUI:Checkbox("Scenario", Variable.TrustType)
			GUI:EndGroup()
			if (GUI:IsItemHovered()) then
				GUI:SetTooltip("Check this setting to force the \"Scenario\" mode instead of the \"Avatars\" mode.")
			end
		end
		if GUI:Button("Add to list", GUI:GetWindowSize() - 1, 20) then
			local Data = {
				[1] = function() if (Variable.DutyMode == 1 or not Variable.Selected.Data_Speed) then return Variable.Selected.Data_Normal else return Variable.Selected.Data_Speed end end,
				[2] = function() return Variable.Selected.Data_Unsync end,
				[3] = function() return Variable.Selected.Data_Squadron end,
				[4] = function() return Variable.Selected.Data_Trust end,
			}
			local Boss = {
				[1] = function() return Variable.Selected.Boss_Duty end,
				[2] = function() return Variable.Selected.Boss_Duty end,
				[3] = function() return Variable.Selected.Boss_Squadron end,
				[4] = function() return Variable.Selected.Boss_Trust end,				
			}
			local Tab = {
				DutyInfo = Variable.Selected.Info,
				--
				Data_Duty = Data[Variable.DataIndex](),
				Data_Boss = Boss[Variable.DataIndex](),
				--
				DataIndex = Variable.DataIndex,
				--
				Max = Variable.Size,
				Count = 0,
				--
				JobIndex = Variable.JobIndex,
			}
			table.insert(Variable.NeededList, Tab)
			Second_Windows.Index = 5
			Variable.Selected = nil
		end
	else
		GUI:Text("No duty selected")
	end
end

function RevoltEngine.LoadDataInformation(_tab, _data, _name)
	local TabFor = {
		-- Info
		["Info"] = function(_data) return _data.Get_Info(_name) end,
		-- Step Info
		["Data_Normal"] = function(_data)	return _data.Get_Data_Normal() end,
		["Data_Speed"] = function(_data) 	return _data.Get_Data_Speed() end,
		["Data_Unsync"] = function(_data)	return _data.Get_Data_Unsync() end,
		["Data_Squadron"] = function(_data)	return _data.Get_Data_Squadron() end,
		["Data_Trust"] = function(_data)	return _data.Get_Data_Trust() end,
		-- Boss Info
		["Boss_Duty"] = function(_data)		return _data.Get_Boss_Duty() end,
		["Boss_Squadron"] = function(_data)	return _data.Get_Boss_Squadron() end,
		["Boss_Trust"] = function(_data)	return _data.Get_Boss_Trust() end,
	}
	local info =  _data.Get_Info(_name)
	-- Loading
	for id, e in pairs(TabFor) do
		if id == "Data_Speed" then
			if info.Type == 1 then
				if table.valid(e(_data)) then
					_tab[id] = e(_data)
				end
			end
		else
			if table.valid(e(_data)) then
				_tab[id] = e(_data)
			end
		end
	end
	-- Finish
	return _tab
end

function RevoltEngine.LoadInformation(_data, _name)
	-- Init Tab
	local Tab = {
		-- Général Information
		Info = nil,
		-- Step Information
		Data_Normal = nil,
		Data_Speed = nil,
		Data_Unsync = nil,
		Data_Squadron = nil,
		Data_Trust = nil,
		-- Boss Information
		Boss_Duty = nil,
		Boss_Squadron = nil,
		Boss_Trust = nil,
	}
	-- Load Data
	Variable.Selected = RevoltEngine.LoadDataInformation(Tab, _data, _name)
end

function RevoltEngine.Load_Data()
	Data[1] = Bottox_Dungeons.Get_List_Dungeons()
	Data[2] = Bottox_Trials.Get_List_Trials()
	Data[3] = Bottox_Raids.Get_List_Raids()
	Data[4] = Bottox_Guilds.Get_List_Guilds()
	Data[5] = Bottox_Roulette.Get_List_Roulette()
	Data[6] = Bottox_Bonus.Get_List_Bonus()
	Variable.Loaded = true
end

function RevoltEngine.Draw_Data()
	if Variable.Loaded then
		if Data[Variable.MenuIndex] then
			-- List
			GUI:PushItemWidth(GUI:GetWindowSize() - 17)
			if GUI:ListBoxHeader("##List", GUI:GetWindowSize() - 17, 12) then
				-- Init
				local Type_Info = {
					[1] = function(_name) return Bottox_Dungeons.Get_Duty_Info(_name) end,
					[2] = function(_name) return Bottox_Trials.Get_Trial_Info(_name) end,
					[3] = function(_name) return Bottox_Raids.Get_Raid_Info(_name) end,
					[4] = function(_name) return Bottox_Guilds.Get_Guild_Info(_name) end,
					[5] = function(_name) return Bottox_Roulette.Get_Roulette_Info(_name) end,
					[6] = function(_name) return Bottox_Bonus.Get_Bonus_Info(_name) end,
				}
				for id, e in pairs(Data[Variable.MenuIndex]) do
					if table.valid(e) then
						if (e.Version == Variable.VersionIndex) or (e.Version == -1) then
							if GUI:Selectable(e.Name.."##id", false) then
								Second_Windows.Index = 4
								RevoltEngine.LoadInformation(Type_Info[Variable.MenuIndex](e.Name), e.Name)
							end
							if e.Tooltip then -- String check
								if (GUI:IsItemHovered()) then
									GUI:SetTooltip(e.Tooltip)
								end
							end
						end
					end
				end
				GUI:ListBoxFooter()
			end
			GUI:PopItemWidth()
		end
	else
		RevoltEngine.Load_Data()
	end
end

function RevoltEngine.Draw_Version()
	if Variable.MenuIndex <= 3 then
		GUI:PushItemWidth(GUI:GetWindowSize() - 17);
		Variable.VersionIndex = GUI:Combo("##Category",Variable.VersionIndex,Variable.VersionList,17); GUI:PopItemWidth()
	else
		Variable.VersionIndex = 1
		GUI:NewLine()
		BStyle.Draw_Space()
		BStyle.Draw_Space()
	end
end

function RevoltEngine.Draw_Menu()
	Variable.MenuIndex = BStyle.DrawImageButton("Roulette##RevoltEngine", 5, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\roulette.png", 32, 32, "Roulette", Variable.MenuIndex)
	GUI:SameLine(55)
	Variable.MenuIndex = BStyle.DrawImageButton("Dungeons##RevoltEngine", 1, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Dungeons.png", 32, 32, "Dungeons", Variable.MenuIndex)
	GUI:SameLine(100)
	Variable.MenuIndex = BStyle.DrawImageButton("Trials##RevoltEngine", 2, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Trials.png", 32, 32, "Trials", Variable.MenuIndex)
	GUI:SameLine(145)
	Variable.MenuIndex = BStyle.DrawImageButton("Raids##RevoltEngine", 3, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Raids.png", 32, 32, "Raids", Variable.MenuIndex)
	GUI:SameLine(190)
	Variable.MenuIndex = BStyle.DrawImageButton("Guildhests##RevoltEngine", 4, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Guildhests.png", 32, 32, "Guildhests", Variable.MenuIndex)
	GUI:SameLine(235)
	Variable.MenuIndex = BStyle.DrawImageButton("Bonus##RevoltEngine", 6, GetStartupPath().."\\LuaMods\\Bottox Manager\\Other\\Bonus.png", 32, 32, "Bonus", Variable.MenuIndex)
end

function RevoltEngine.Draw_First() -- First Windows
	BStyle.DrawAddonButton("Revolt Engine 2.0")
	--
	RevoltEngine.Draw_Menu()
	RevoltEngine.Draw_Version()
	RevoltEngine.Draw_Data()
	RevoltEngine.Draw_StartStop()
end
