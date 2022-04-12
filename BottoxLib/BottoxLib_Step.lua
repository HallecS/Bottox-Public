BStep = BottoxLib.BStep

BStep = {} -- ???????????? Utility ?
--
local Step = nil
local Variable = {
	Fate = nil,
	Target = nil,
	Quest = nil,
	StepModule = 1,
	NoKillAggro = false,
	AfterInteract = false,
	AfterUseItem = false,
	BeforeStep = true,
	AfterBene = false,
	AfterEmote = false,
	StepList = {
		[0] = {"Kill","Interact","UseItem", "Fate", "Mount", "ForceMove", "Emote", 
				"Kill-Aggro", "Sniper", "Wait", "Transport", "Teleport", "Craft", 
				"SwitchJob", "BuyItem", "GatherBotMin", "GatherFish", "Boss",
				"KillPack", "UseAction", "SpeedInteract","TakeChest","GatherSpearFish", "Duty"},
		[1] = function() return BStep.doKill() end,
		[2] = function() return BStep.doInteract() end,
		[3] = function() return BStep.doUseItem() end,
		[4] = function() return BStep.doFate() end,
		[5] = function() return BStep.doMount() end,
		[6] = function() return BStep.doForceMove() end,
		[7] = function() return BStep.doEmote() end,
		[8] = function() return BStep.doKill() end,
		[9] = function() return BStep.doSniper() end,
		[10] = function() return BStep.doWait() end,
		[11] = function() return BStep.doInteract() end,
		[12] = function() return BStep.doTeleport() end,
		[13] = function() return BStep.doCraft() end,
		[14] = function() return BStep.doSwitchJob() end,
		[15] = function() return BStep.doBuyItem() end,
		[16] = function() return BStep.doGatherBotMin() end,
		[17] = function() return BStep.doGatherFish() end,
		[18] = function() return BStep.doBossFight() end,
		[19] = function() return BStep.doKillPack() end,
		[20] = function() return BStep.doUseAction() end,
		[21] = function() return BStep.doSpeedInteract() end,
		[22] = function() return BStep.doTakeChest() end,
		[23] = function() return BStep.doGatherSpearFish() end,
		[24] = function() return BStep.doDuty() end,
	},
	-- Craft Skill List
	CalmeInte = { [0] = 252, [1] = 253, [2] = 254, [3] = 255, [4] = 257, [5] = 256, [6] = 258, [7] = 259 },
	MainI = 	{ [0] = 244, [1] = 245, [2] = 246, [3] = 247, [4] = 249, [5] = 248, [6] = 250, [7] = 251 },
	MainII = 	{ [0] = 4607, [1] = 4608, [2] = 4609, [3] = 4610, [4] = 4611, [5] = 4612, [6] = 4613, [7] = 4614 },
	RecupI = 	{ [0] = 100003, [1] = 100017, [2] = 100032, [3] = 100077, [4] = 100047, [5] = 100062, [6] = 100092, [7] = 100107 },
	TravailBasic = 		{ [0] = 100001, [1] = 100015, [2] = 100030, [3] = 100075, [4] = 100045, [5] = 100060, [6] = 100090, [7] = 100105 },
	TravailStandart = 	{ [0] = 100007, [1] = 100021, [2] = 100037, [3] = 100080, [4] = 100051, [5] = 100067, [6] = 100096, [7] = 100111 },
	OuvrageBasic = 		{ [0] = 100002, [1] = 100016, [2] = 100031, [3] = 100076, [4] = 100046, [5] = 100061, [6] = 100091, [7] = 100106 },
	OuvrageStandart =	{ [0] = 100004, [1] = 100018, [2] = 100034, [3] = 100078, [4] = 100048, [5] = 100064, [6] = 100093, [7] = 100109 },
	OuvrageAvance = 	{ [0] = 100008, [1] = 100022, [2] = 100038, [3] = 100081, [4] = 100052, [5] = 100068, [6] = 100097, [7] = 100112 },
	Spot = false,
	GatheringSkillUsed = false,
	--
	ProgressOK = false,
	AfterBenediction = false,
}
--

function BStep.NoKillAggro(_bool)
	Variable.NoKillAggro = _bool
end

function BStep.RemoveStep()
	Step = nil
end

function BStep.GetBeforeStep()
	return Variable.BeforeStep
end

function BStep.GetStepModule()
	return Variable.StepModule
end

function BStep.GetCurrentStep()
	return Step
end

function BStep.SetStep(_step)
	Step = _step
end

-- Commun --
function BStep.NewStep()
	BDebug.Log("NewStep", 2)
	--
	Step = BVariable.GetStep()
	--
	Step.Type = nil
	Step.NeedMove = true
	Step.NeedMoveToEntity = true
	Step.Position = { x = 0, y = 0, z = 0, }
	Step.String = ""
	Step.Count = 0
	Step.RecipeId = 0
	Step.Id = 0
	Step.NeedHQ = 0
	Step.IdList = {}
	Step.Finish = false
	Step.Spot = false
	--
	Variable.BeforeStep = true
	Variable.AfterInteract = false
	Variable.AfterUseItem = false
	Variable.StepModule = 1
	Variable.NoKillAggro = false
	Variable.AfterEmote = false
	Variable.GatheringSkillUsed = false
	--
	Variable.ProgressOK = false
	Variable.AfterBenediction = false
	--
	BUtility.ResetWait("doWait")
	BUtility.ResetWait("Interact1")
	BUtility.ResetWait("Interact2")
end

function BStep.ResetStep()
	BDebug.Log("ResetStep", 2)
	if BTarget.GetTarget() ~= nil then
		BTarget.RemoveEntityInTarget()
	end
	--
	Step = BVariable.GetStep()
	--
	Step.Type = nil
	Step.NeedMove = true
	Step.NeedMoveToEntity = true
	Step.Position = { x = 0, y = 0, z = 0, }
	Step.String = ""
	Step.Count = 0
	Step.RecipeId = 0
	Step.Id = 0
	Step.NeedHQ = 0
	Step.IdList = {}
	Step.Finish = false
	Step.Spot = false
	--
	Variable.BeforeStep = true
	Variable.AfterInteract = false
	Variable.AfterUseItem = false
	Variable.StepModule = 1
	Variable.NoKillAggro = false
	Variable.AfterEmote = false
	Variable.GatheringSkillUsed = false
	--
	BUtility.ResetWait("doWait")
	BUtility.ResetWait("Interact1")
	BUtility.ResetWait("Interact2")
end

-- Check Kill Aggro
function BStep.CheckKillAggro()
	BDebug.Log("CheckKillAggro", 2)
	local str = "aggro,attackable,targetable"
	local Quest = BQuest.GetCurrentQuest()
	if Quest ~= nil then
		BDebug.Log("BStep - CheckKillAggro -> Load Aggro List From Quest", 3)
		str = str..Quest.AggroList
	end
	local el = EntityList(str)
	if table.valid(el) then
		for id, e in pairs(el) do
			if table.valid(e) then
				BMovement.StopMove()
				BStep.ResetStep()
				BTarget.ResetTarget()
				BTarget.SetEntityInTarget(e)
				BLoad.LoadKillStepFromTarget()
				Step.Type = "Kill-Aggro"
				Variable.BeforeStep = false
				BMovement.doMount(false)
				if BMovement.UseMount() == true then
					local action = ActionList:Get(5, 23)
					if action then
						BDebug.Log("BStep - CheckKillAggro - UnMount", 3)
						action:Cast()
					end
				end
				return true
			else
				BDebug.Log("BStep - CheckKillAggro - table.valid(e) == false", 1)
				return false
			end
		end
		return false
	else
		BDebug.Log("BStep - CheckKillAggro - No Need Kill Aggro", 3)
		return false
	end
end

-- Doing Step --
function BStep.DoStep()
	BDebug.Log("BStep - DoStep", 2)
	if Step ~= nil then
		-- Check KillPack & Step.id == 3
		if Step.Type == "KillPack" and Step.Id == 3 then
			if Player.role ~= 1 then
				Step.Finish = true
				Variable.BeforeStep = true
				return true
			end
		end
		-- Check Kill Aggro
		if Variable.BeforeStep == true then
			if 	(((Step.Type ~= "Mount") and (Step.Type ~= "Wait") and
				(Step.Type ~= "Transport") and (Step.Type ~= "Craft") and
				(Step.Type ~= "GatherBotMin") and (Step.Type ~= "GatherFish") and
				(Step.Type ~= "KillPack") and (Step.Type ~= "GatherSpearFish") and (Step.Type ~= "Duty")) or
				(Step.Type == "KillPack" and Step.Id == 1)) and Variable.NoKillAggro == false then
				if (BStep.CheckKillAggro() == false) then
					if BMovement.doMoveBeforeStep() == true then
						Variable.BeforeStep = false
						BDebug.Log("BStep - DoStep - KA doMoveBefore : true", 3)
					end
				end
			else
				if BMovement.doMoveBeforeStep() == true then
					BDebug.Log("BStep - DoStep - NKA doMoveBefore : true", 3)
					Variable.BeforeStep = false
				end
			end
		end
		if Variable.BeforeStep == false then
			for id, e in pairs(Variable.StepList[0]) do
				if Step.Type == e then
					if Step.Finish == false then
						-- Do Step
						BTarget.RefreshEntityInTarget()
						if Variable.StepList[id]() == true then
							Step.Finish = true
							Variable.BeforeStep = true
						end
					end
					if table.valid(Step) then
						if Step.Finish == true then
							BDebug.Log("BStep - DoStep -> Step Finish", 3)
							BTarget.ResetTarget()
							Variable.BeforeStep = true
							return true
						end
					end
				end
			end
			return false
		end
		return false
	end
	BDebug.Log("BStep - DoStep - Var.Step == nil", 1)
	return false
end

-- Use Action
function BStep.doUseAction()
	BDebug.Log("BStep - doUseAction", 2)
	local Target = nil
	if Step.IdList[1] ~= 20000000 then
		local target = BTarget.FindListEntity(Step.IdList)
		if table.valid(target) then
			Target = target.id
		end
	end
	if BAction.UseAction(Step.Count, Step.Id, Target) then
		return true
	end
	return false
end

-- Kill Pack
function BStep.EntityNotInsideEnmityList(_entity)
	local enist = Player:GetEnmityList()
	if table.valid(enist) then
		for id, e in pairs(enist) do
			if e.id == _entity.id then -- Got Aggro
				return false
			end
		end
		-- Not Find
		return true
	end
	return false
end

function BStep.doDuty()
	local data = RevoltEngine.GetDataForDuty(Step.Id)
	if table.valid(data) then
		if RevoltEngine.StartDutyFromExtern(data) then
			return true
		end
	end
	return false
end

function BStep.doKillPack()
	BDebug.Log("BStep - doKillPack", 2)
	local p = Player
	local Target = BTarget.GetTarget()
	-- Check Finish
	if Step.Id ~= 3 then
		if not table.valid(Target) then -- No Target
			Target = BTarget.EntityByOption("chartype=5,alive,attackable,targetable,maxdistance="..Step.Count)
			if table.valid(Target) then
				local enti = nil
				for id, e in pairs(Target) do
					if e.alive == true then
						if not e.friendly or (e.contentid == 6068) or (e.contentid == 6999) or (e.contentid == 1208) or (e.contentid == 439) or (e.contentid == 6997) or (e.contentid == 1543) then
							if enti == nil then
								enti = e
								if Player.localmapid == 166 then -- Haukke Manoir
									if enti.contentid == 633 then
										if enti.pos.y ~= Player.pos.y then
											enti = nil
										end
									end
								end
							else
								if e.distance2d < enti.distance2d then
									local tmp = enti
									enti = e 
									if Player.localmapid == 166 then -- Haukke Manoir
										if enti.contentid == 633 then -- Soubrette du Manoir
											if enti.pos.y ~= Player.pos.y then
												enti = tmp
											end
										end
									end
								end
							end
							if Player.localmapid == 166 then -- Haukke Manoir
								if e.pos.y ~= Player.pos.y then
									FTarget = nil
								end
							end
							if Player.localmapid == 421 then -- The Vault
								if e.pos.y ~= Player.pos.y then
									FTarget = nil
								end
							end
						end
					end
				end
				if enti ~= nil then
					BTarget.SetEntityInTarget(enti)
					BTarget.SetTarget(enti.id)
					BDebug.Log("BStep - doKillPack -> Still Target here", 3)
					return false
				else
					BDebug.Log("BStep - doKillPack -> Finish", 3)
					return true
				end
			else
				-- No More Target Alive
				BTarget.RemoveEntityInTarget()
				BDebug.Log("BStep - doKillPack -> Finish", 3)
				return true
			end
		else
			-- Set Target
			BTarget.SetTarget(Target.id)
			-- Move In Range Fight
			if BUtility.CanAttack(Target.id) == false or Player.flying.isflying then -- Not in Combat Range
				if BMovement.doMoveToPosition(Target.pos) then
					BMovement.doMount(false)
				end
				BDebug.Log("BStep - doKillPack -> Cannot Atk", 3)
				return false
			end
			-- In Combat Range
			BMovement.StopMove()
			BTarget.SetTarget(Target.id)
			if BStep.InitFight() == false then -- Not Rdy
				BDebug.Log("BStep - doKillPack -> Kill Not Ready", 3)
				return false
			end
			-- Check Stop Target
			if not Target.attackable then
				BTarget.RemoveEntityInTarget()
				return false
			end
			if Target.alive == false then
				BTarget.RemoveEntityInTarget()
				return false
			end
			-- Still In Fight
		end
	else
		-- Need Take Aggro on All Moob
		if Player.role == 1 then
			BCommun.RunMinion(false)
			local Action = RevoltEngine.RecupForJob(Player.job)
			local GetActionAoeAggro = ActionList:Get(1, Action.Aoe_Aggro)
			local Distance = GetActionAoeAggro.radius
			if Player.job == 3 or Player.job == 21 then -- Domination
				Distance = GetActionAoeAggro.range
			end
			local Target = BTarget.EntityByOption("chartype=5,maxdistance="..(Distance + 1))
			if table.valid(Target) then
				for id, e in pairs(Target) do
					if e.distance2d <= (Distance - 1) then
						-- Go Use AoE Aggro
						if Player.job == 3 or Player.job == 21 then
							BAction.UseAction(1, Action.Aoe_Aggro, e.id)
						else
							BAction.UseAction(1, Action.Aoe_Aggro)
						end
						return true
					else
						BMovement.doMoveToPosition(e.pos, Distance - 1)
						return false
					end
				end
			end
		end
		-- Got Everyone
		BCommun.RunMinion(true)
		return true -- Finish
	end
	return false
end

-- Boss Fight --
function BStep.doBossFight()
	BDebug.Log("BStep - doBossFight", 2)
	-- Init Fight
	local Target = BTarget.FindListEntity(Step.IdList, "targetable,chartype=5,maxdistance=100")
	if table.valid(Target) then
		if Target.alive == true then
			BTarget.SetEntityInTarget(Target)
			BDebug.Log("BStep - Boss - Alive -> False", 3)
			return false
		else
			BTarget.RemoveEntityInTarget()
			BDebug.Log("BStep - Boss - Killed -> True", 3)
			return true
		end
	end
	-- No Target
	if BUtility.Wait(10, "BossFight") then
		return true
	else
		return false
	end
end

-- Wait --
function BStep.doWait()
	BDebug.Log("BStep - doWait", 2)
	if BUtility.Wait(Step.Count, "doWait") == true then
		return true
	else
		return false
	end
end
-----------------
function BStep.ResetSpot()
	Variable.Spot = false
end

function BStep.UseSpear()
	local tar = Player:GetTarget()
	if tar == nil then
		return true
	else
		if tar.spearfishstate == 0 then
			if BUtility.Wait(5) then
				Player:ClearTarget()
				return true
			end
			return false
		end
	end
	if tar.spearfishstate == 2 then
		if BAction.IsActionReady(1, 7632) == true then -- Harponnage
			BAction.UseAction(1, 7632)
		end
	end
	return false
end

function BStep.Init_Spot()
	if BCommun.IsControlOpen("HarpoonTip") then
		GetControl("HarpoonTip"):Close()
	end
	if BUtility.Wait(3, "GSF-Init_Spot") then
		BInteract.Interact(Player:GetTarget().id)
		Variable.Spot = true
	end
	return
end

function BStep.Find_Spot()
	local el = BTarget.FindEntity(21,"maxdistance=120,targetable,type=6,contentid=21")
	if table.valid(el) then
		if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, el.pos.x, el.pos.y, el.pos.z) <= 5 then
			if not BCommun.IsControlOpen("HarpoonTip") then
				if BAction.IsActionReady(1, 7634) == true then -- Pointe de harpon
					BAction.UseAction(1, 7634)
				end
			end
			Player:SetTarget(el.id)
		end
		return el
	end
	return nil
end

function BStep.Check_Spear()
	-- Check Buff
	if ActionList:IsReady() then
		if BCommun.IsControlOpen("HarpoonTip") then
			-- Size
			local Size = Step.Bait
			-- Check Index
			local Index = GetControl("HarpoonTip"):GetRawData()[1].value
			if Size ~= Index then
				local ac = GetControl("HarpoonTip"):GetActions()
				if table.valid(ac) then
					for aid, action in pairs(ac) do
						if action == "SetIndex" then
							GetControl("HarpoonTip"):Action(action,Size)
							return false
						end
					end
				end
				return false
			end
		end
		return true
	end
	return false
end

function BStep.doGatherSpearFish()
	-- Check Exit
	if Step.NeedHQ == 1 then
		if BCommun.GotNbItemHq(Step.Id, Step.Count) == true then -- Find HQ Item
			Player:ClearTarget()
			return true
		end
	else
		if BCommun.GotNbItem(Step.Id, Step.Count) == true then -- Find NQ Item
			Player:ClearTarget()
			return true
		end
	end
	-- Next
	if BStep.Check_Spear() then
		if Player:GetTarget() then
			-- Do Spot
			Player.Stop()
			if Variable.Spot then
				if BStep.UseSpear() then
					BStep.ResetSpot()
				end
			else
				BStep.Init_Spot()
			end
		else
			-- Search Spot
			local Spot = BStep.Find_Spot()
			if not Spot then 
				BMovement.doMoveToPosition(Step.Position)
			else
				BMovement.doMoveToPosition(Spot.pos)
			end
		end
	end
	return false
end

-----------------
function BStep.doGatherFish()
	local State = Player:GetFishingState()
	if State == 0 then
		local Pos = Player.pos
		if Step.Position.x ~= 0 or Step.Position.y ~= 0 or Step.Position.z ~= 0 then
			Pos = Step.Position
		end
		if not BMovement.doMoveToPosition(Pos, 1) then
			return false
		end
	end
	if Step.NeedHQ == 1 then
		if BCommun.GotNbItemHq(Step.Id, Step.Count) == true then -- Find HQ Item
			if State ~= 0 then -- Action Stop
				BAction.UseAction(1, 299)
			else
				return true
			end
		end
	else
		if BCommun.GotNbItem(Step.Id, Step.Count) == true then -- Find NQ Item
			if State ~= 0 then -- Action Stop
				BAction.UseAction(1, 299)
			else
				return true
			end
		end
	end
	-- Check Mount
	if BMovement.UseMount() == true then
		BMovement.doMount(false)
		return false
	end
	-- Check Bait
	if Player:GetBait() ~= Step.Bait then
		Player:SetBait(Step.Bait)
		return false
	end
	-- Start Check State
	if (State == 0) or (State == 4) then -- Start Fish
		BAction.UseAction(1, 289)
	end
	if State == 5 then
		BAction.UseAction(1, 296)
	end
	return false
end
-----------------
function BStep.MoveToGatherSpot()
	-- Find Spot
	local el =  BTarget.EntityByOption("gatherable,nearest")
	for id, e in pairs(el) do
		if BMovement.UseMount() == false then
			if BMovement.doMount(BMovement.NeedMount(e.id)) == false then
				return
			end
		end
		--
		local position = e.pos
		if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, position.x, position.y, position.z) <= 10 then
			if not Player.diving.isdiving then
				position = NavigationManager:GetClosestPointOnMesh(e.pos)
			end
		end
		if BMovement.doMoveToPosition(position, 1.5) == true then
			if BCommun.IsControlOpen("Gathering") == true then
				return
			else
				Player:SetTarget(e.id)
				BInteract.Interact(e.id)
				return
			end
		end
	end
	return
end

function BStep.doGatherBotMin()
	-- Check Finish
	if Step.NeedHQ == 1 then
		if BCommun.GotNbItemHq(Step.Id, Step.Count) == true then -- Find HQ Item
			if BCommun.IsControlOpen("Gathering") == true then
				GetControl("Gathering"):Close()
				return false
			end
			Variable.GatheringSkillUsed = false
			return true -- Finish
		end
	else
		if BCommun.GotNbItem(Step.Id, Step.Count) == true then -- Find NQ Item
			if BCommun.IsControlOpen("Gathering") == true then
				GetControl("Gathering"):Close()
				return false
			end
			Variable.GatheringSkillUsed = false
			return true -- Finish
		end
	end
	if BCommun.IsControlOpen("Gathering") == true then -- Check Inside gathering
		if BUtility.Wait(5, "Gathering-Step") then
			--
			if (Step.NeedHQ == 1) and not Variable.GatheringSkillUsed then
				local Tab = {
					[16] = {
						{lvlmin = 63, prcost = 300, id = 270},
						{lvlmin = 35, prcost = 300, id = 243},
						{lvlmin = 15, prcost = 100, id = 242},
					},
					[17] = {
						{lvlmin = 63, prcost = 300, id = 271},
						{lvlmin = 35, prcost = 300, id = 226},
						{lvlmin = 15, prcost = 100, id = 225},
					},
				}
				local TabJob = Tab[Player.job]
				for id, e in pairs(TabJob) do
					if e.lvlmin <= Player.level then
						if e.prcost <= Player.gp.current then
							-- Use it
							if BAction.IsActionReady(1, e.id) then
								BAction.UseAction(1, e.id)
							else
								return
							end
						end
						break
					end
				end
				Variable.GatheringSkillUsed = true
			end
			-- Need Gathering
			local glist = Player:GetGatherableSlotList()
			if (table.valid(glist)) then
				for id, e in pairs(glist) do
					if e.id == Step.Id then
						Player:Gather(e.index - 1)
						return
					end
				end
				-- No Id
				local Crystal = BVariable.Get_CrystalList()
				for id, e in pairs(glist) do
					for iid, ie in pairs(Crystal) do
						if (ie[1] == e.id) or (ie[2] == e.id) or (ie[3] == e.id) then
							Player:Gather(e.index - 1)
						end
					end
				end
			end
		end
	else -- Need go to Stop
		Variable.GatheringSkillUsed = false
		BStep.MoveToGatherSpot()
	end
	return false
end

-----------------
function BStep.BuyItem()
	local slist = Inventory:GetShopList()
	if (table.valid(slist)) then
		for id, e in pairs(slist) do
			if e.id == Step.Id then
				Inventory:BuyShopItem(e.id, tonumber((Step.Count - BCommun.GetNbItem(e.id))))
				return
			end
		end
	end
	return
end

function BStep.doBuyItem()
	BDebug.Log("BStep - doBuyItem", 2)
	-- Check Finish
	if BCommun.GotNbItem(Step.Id, (Step.Count / 2) ) == true then
		if BCommun.IsControlOpen("Shop") == true then
			GetControl("Shop"):Close()
		end
		return true
	end
	if BCommun.IsControlOpen("Shop") then -- Inside Shop
		BStep.BuyItem()
	else
		if BCommun.IsControlOpen("SelectIconString") == true then -- Inside Dialogue
			BCommun.SelectWord(BTalk.Translate(Step.String))
		else
			for id, e in pairs(Step.IdList) do
				local el =  BTarget.EntityByOption("contentid="..e)
				for id, e in pairs(el) do
					BInteract.Interact(e.id)
					return false
				end
			end
		end
	end
	return false
end

-- Switch Job --
function BStep.doSwitchJob()
	BDebug.Log("BStep - doSwitchJob", 2)
	-- Find Good Job
	local p = Player
	local Job_Name = nil
	local Job = nil
	-- Craft
	if Step.Id == 1 or Step.Id == 6 then
		Job_Name = DailiesIxal.Get_CraftJob()
		Job = BVariable.Get_Job(Job_Name)
		if p.Job == Job.Number then
			-- Spe Ixal
			if Step.Id == 6 then
				if BCommun.ItemIsEquiped(8568) == false then
					BCommun.EquipItem(8568)
					return false
				end
			end
			return true
		else
			BUtility.SetGear(Job.GearSet)
			return false
		end
	end	
	if Step.Id >= 2 and Step.Id <= 4 then
		if Step.Id == 2 then
			Job = BVariable.Get_Job("Miner")
		end
		if Step.Id == 3 then
			Job = BVariable.Get_Job("Botanist")
		end
		if Step.Id == 4 then
			Job = BVariable.Get_Job("Fisher")
		end
		if p.Job == Job.Number then
			return true
		else
			BUtility.SetGear(Job.GearSet)
			return false
		end
	end
	if Step.Id == 5 then
		Job_Name = DailiesIxal.Get_CombatJob()
		Job = BVariable.Get_Job(Job_Name)
		if p.Job == Job.Number then
			return true
		else
			BUtility.SetGear(Job.GearSet)
			return false
		end
	end
	return false
end

----------------------------------------------------------------------------------------
function BStep.ReturnJobAction(_index)
	local ReducAction = {
		["Calme"] = {
			[8] = 252,
			[9] = 253,
			[10] = 254,
			[11] = 255,
			[12] = 257,
			[13] = 256,
			[14] = 258,
			[15] = 259,
		},
		["Grand"] = {
			[8] = 260,
			[9] = 261,
			[10] = 262,
			[11] = 263,
			[12] = 265,
			[13] = 264,
			[14] = 266,
			[15] = 267,
		},
		["Recup"] = {
			[8] = 100003,
			[9] = 100017,
			[10] = 100032,
			[11] = 100077,
			[12] = 100047,
			[13] = 100062,
			[14] = 100092,
			[15] = 100107,
		},
	}
	return ReducAction[_index][Player.job]
end

function BStep.CanActiveBenediction(_info, _benedictioninfo)
	local increase = _benedictioninfo.increase
	increase = (increase * 2) + (increase * 0.5)
	if (increase + _info.quality) >= _info.qualitymax then
		-- can finish with bene
		-- Grand Progrès
		if not BAction.HaveBuff(254) then
			local Grandprogres = ActionList:Get(1,BStep.ReturnJobAction("Grand"))
			Grandprogres:Cast()
			return true
		end
		-- Innovation
		if not BAction.HaveBuff(2189) then
			local Innovation = ActionList:Get(1,19004 + (Player.job - 8))
			Innovation:Cast()
			return true
		end
		-- Can Benediction
		local Benediction = ActionList:Get(9,_benedictioninfo.actionid)
		Benediction:Cast()		
		return true
	end
	return false
end

function BStep.NeedProgressAction(_info, _action, _craft)
	local coef = 1
	if BAction.HaveBuff(2191) then
		coef = 0.5
	end
	-- Can finish craft with 1 action
	if (_action.increase * coef) >= (_info.progressmax - _info.progress) then
		Variable.ProgressOK = true
		return false -- No Need
	end
	-- Need do Action
	if ((_action.increase + _info.progress) >= _info.progressmax) and (_craft.NeedHQ == 1) then
		-- Need Dernière
		if not BAction.HaveBuff(2190) then
			-- Use dernière verif
			local DerniereVerif = ActionList:Get(1,19012 + (Player.job - 8))
			DerniereVerif:Cast()
			return false
		end
	end
	return true
end

function BStep.NeedDurability(_info)
	if _info.quality == _info.qualitymax then 
		-- Skip -> Only Last Hit
		return false
	end
	if _info.durability <= 10 then
		-- Need Up
		local recupmaster = ActionList:Get(9, BStep.ReturnJobAction("Recup"))
		recupmaster:Cast()
		return true
	end
	return false
end

function BStep.Doing_FirstStep(_control, _info, _craft)
	-- First Step
	local Memoire = _control.progressefficiencylist[4]
	-- Chekc increase >= progressmax
	if (Memoire.increase >= _info.progressmax) and (_craft.NeedHQ == 1) then
		if not BAction.HaveBuff(2190) then
			-- Use dernière verif
			local DerniereVerif = ActionList:Get(1,19012 + (Player.job - 8))
			DerniereVerif:Cast()
			return
		end
	end
	-- Use Mémoire
	local actionmemoire = ActionList:Get(9, Memoire.actionid)
	actionmemoire:Cast()
	return
end

function BStep.GetQualityAction(_list)
	if table.valid(_list) then
		-- Check lvl
		if Player.level >= 66 then
			-- Recup Ouvrage Parcimonieux
			return _list[7]
		else
			-- Recup Ouvrage de Base
			return _list[1]
		end
	end
	return nil
end

function BStep.GetProgressAction(_list)
	if table.valid(_list) then
		-- Check lvl
		if Player.level >= 62 then
			-- Recup Travail Prudent
			return _list[5]
		else
			-- Recup Travail de Base
			return _list[1]
		end
	end
	return nil
end

function BStep.DoCraft(_craft)
	-- Recup current Synthesis info
	local SynthesisControl = GetControlData("Synthesis")
	local SyntheseInfo = {
		-- Durabilité
		durability = SynthesisControl.durability,
		durabilitymax = SynthesisControl.durabilitymax,
		-- Progress
		progress = SynthesisControl.progress,
		progressmax = SynthesisControl.progressmax,
		-- Quality
		quality = SynthesisControl.quality,
		qualitymax = SynthesisControl.qualitymax,
		-- Step
		step = SynthesisControl.step,
	}
	-- Recup Action Progress / Quality
	local ProgressAction = BStep.GetProgressAction(SynthesisControl.progressefficiencylist)
	local QualityAction = BStep.GetQualityAction(SynthesisControl.qualityefficiencylist)
	-- check first Step
	if SyntheseInfo.step == 1 then
		if Player.level >= 54 then
			return BStep.Doing_FirstStep(SynthesisControl, SyntheseInfo, _craft)
		end
	end
	-- Check Durabilité
	if BStep.NeedDurability(SyntheseInfo) then
		return
	end
	-- Up Progress until 1 action left
	if BStep.NeedProgressAction(SyntheseInfo, ProgressAction, _craft) then
		local progressaction = ActionList:Get(9, ProgressAction.actionid)
		progressaction:Cast()
		return
	end
	if Variable.ProgressOK then
		-- Check Quality OK
		if (SyntheseInfo.quality == SyntheseInfo.qualitymax) or (_craft.NeedHQ == 0) then
			-- Finish craft
			local progressaction = ActionList:Get(9, ProgressAction.actionid)
			progressaction:Cast()
		end
		if (_craft.NeedHQ == 1) and Player.level >= 5 then
			-- Active Calme Inté
			if not Variable.AfterBenediction then
				if not BAction.HaveBuff(251) then
					local calmeinterieur = ActionList:Get(1, BStep.ReturnJobAction("Calme"))
					calmeinterieur:Cast()
					return
				end
			end
			-- Can Benediction
			if not BStep.CanActiveBenediction(SyntheseInfo, SynthesisControl.qualityefficiencylist[4]) then
				-- Doing action Quality+
				local qualityaction = ActionList:Get(9, QualityAction.actionid)
				qualityaction:Cast()
			end
			return
		end
	end
	return
end

function BStep.StartCraft(_craft)
	if BCommun.IsControlOpen("Synthesis") then
		-- Inside Craft
		return true
	else
		-- Start Craft
		if BCommun.IsControlOpen("RecipeNote") then
			-- Select & Start Craft
			local controlData = GetControlData("RecipeNote")
			local control = GetControl("RecipeNote")
			if table.valid(control) then
				if tonumber(GetControlData("RecipeNote").page) == tonumber(BVariable.GetPageRecipe()) then
					if Crafting:SetRecipe(Player.job - 8, _craft.PageID, _craft.RecipeID + ((Player.job - 8) * _craft.MaxPageCraft)) == true then
						if Crafting:SetCraftingMats(0,0) == true then
							local ac = control:GetActions()
							if (table.valid(ac)) then
								for aid, action in pairs(ac) do
									if action == "Synthesize" then
										control:Action(action, 1)
										return false
									end
								end
							end
						end
					end
				else
					Crafting:SetRecipe(Player.job - 8, _craft.PageID, _craft.RecipeID + ((Player.job - 8) * _craft.MaxPageCraft))
					return false
				end
			end
		else
			-- Open RecipeNode
			local CarnetOpen = ActionList:Get(10, 9)
			if (CarnetOpen and CarnetOpen.usable) then
				CarnetOpen:Cast(Player.id)
			end
		end
	end
	return false
end

function BStep.NeedMoreCraft(_craft)
	if BCommun.GotItem(_craft.ItemID) == true then
		if BCommun.GotNbItem(_craft.ItemID, _craft.Size) == true then
			return false
		end
	end
	return true
end

function BStep.doCraft()
	if BMovement.doMount(false) == true then
		local _craft = {
			RecipeID = Step.RecipeId,
			PageID = BVariable.GetPageRecipe(),
			MaxPageCraft = BVariable.GetMaxCraft(),
			--
			ItemID = Step.Id,
			Size = Step.Count,
			--
			NeedHQ = Step.NeedHQ,
		}
		-- Check End Craft
		if BStep.NeedMoreCraft(_craft) then
			-- Need Craft
			if BStep.StartCraft(_craft) then
				if ActionList:IsReady() then
					BStep.DoCraft(_craft)
				end
			end
			return false
		else
			-- Finish
			local controls = GetControls()
			if (table.valid(controls)) then
				for id, e in pairs(controls) do
					if e.name == "RecipeNote" then
						if e:IsOpen() == true then
							e:Close()
							return false
						end
					end
				end
			end
			if BUtility.Wait(15, "DoCraft") == true then
				return true
			end
		end
	end
	return false
end
-----------------------------------------------------------------------------

-- Teleport -- ????
function BStep.doTeleport()
	BDebug.Log("BStep - doTeleport", 2)
	--
	if not BQuest.GetCurrentQuest() then
		if (BVariable.GetMapID() ~= 0) and (BVariable.GetAethID() ~= 0) then
			if BMovement.doTp(BVariable.GetMapID(), BVariable.GetAethID()) == true then
				return true
			else
				return false
			end
		end
	else
		if BMovement.doTp(nil, nil) == true then
			return true
		else
			return false
		end
	end
end

-- Snipe --
function BStep.doSniper()
	BDebug.Log("BStep - doSniper", 2)
	if BStep.WaitSnipeControl() == true then
		if BStep.SetTargetSnipe() == true then
			local p = Player
			if table.valid(p) then
				if p:SnipeHasTarget() == true then
					Player:SnipeShoot()
					BDebug.Log("BStep - doSniper -> Step Finish", 3)
					return true
				end
				BDebug.Log("BStep - doSniper -> Wait Shoot", 3)
				return false
			end
		end
	end
	BDebug.Log("BStep - doSniper -> Step Not Finish", 3)
	return false
end

function BStep.SetTargetSnipe()
	BDebug.Log("BStep - SetTargetSnipe", 2)
	local x = Step.IdList[1]
	local y = Step.IdList[2]
	local zoom = Step.IdList[3]
	if (Player:SetSnipeCam(x, y, zoom) == true) then 
		BDebug.Log("BStep - SetTargetSnipe -> Finish", 3)
		return true
	else
		BDebug.Log("BStep - SetTargetSnipe -> Not Finish", 3)
		return false
	end
end

function BStep.WaitSnipeControl()
	BDebug.Log("BStep - WaitSnipeControl", 2)
	local controls = GetControls()
	-- Check if Snipe Open
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e.name == "Snipe" then
				if e:IsOpen() == true then
					BDebug.Log("BStep - WaitSnipeControl -> Finish", 3)
					return true
				end
			end
		end
	end
	BDebug.Log("BStep - WaitSnipeControl -> Not Finish", 3)
	return false
end

-- Emote --
function BStep.doEmote()
	BDebug.Log("BStep - doEmote", 2)
	local Target = BTarget.GetTarget()
	if Target == nil then
		local tmp = BTarget.FindListEntity(Step.IdList, "targetable,maxdistance=125")
		if tmp == nil then
			if tonumber(Step.IdList[1]) == 20000000 then
				BTarget.SetEntityInTarget(Player)
			else
				return true
			end
		else
			BTarget.SetEntityInTarget(tmp)
		end
	end
	Target = BTarget.GetTarget()
	if BMovement.UseMount() == true then
		BMovement.doMount(false)
		BDebug.Log("BStep - doEmote -> Wait Mount OFF", 3)
		return false
	end
	if not Variable.AfterEmote then
		if BUtility.Wait(4, "BeforeEmote") then
			BTarget.SetTarget(Target.id)
			BCommun.Speak(BTalk.Translate(Step.String))
			Variable.AfterEmote = true
		end
	else
		if BUtility.Wait(8, "AfterEmote") == true then
			BDebug.Log("BStep - doEmote -> Step Finish", 3)
			return true
		end
	end
	BDebug.Log("BStep - doEmote -> Wait Emote", 3)
	return false
end

-- Force Move
function BStep.doForceMove()
	BDebug.Log("BStep - doForceMove", 2)
	local p = Player
	if table.valid(p) then
		if BMovement.IsFlying() == false then
			if BMovement.doMount(false) == true then
				if BUtility.Wait(4, "Step_ForceMove") == false then
					BMovement.ForceMovement()
					BDebug.Log("BStep - doForceMove -> Wait Force Move", 3)
					return false
				else
					BMovement.StopMove()
					BDebug.Log("BStep - doForceMove -> Step Finish", 3)
					return true
				end
			end
		end
	else
		BDebug.Log("BMovement - ForceMovement - Player == nil", 1)
	end
	return false
end

-- Mount
function BStep.doMount()
	BDebug.Log("BStep - doMount", 2)
	local Target = BTarget.GetTarget()
	if Target == nil then
		local tmp = BTarget.FindListEntity(Step.IdList, "maxdistance=125")
		if tmp == nil then
			if tonumber(Step.IdList[1]) == 20000000 then
				BTarget.SetEntityInTarget(Player)
			else
				return true
			end
		else
			BTarget.SetEntityInTarget(tmp)
		end
	end
	Target = BTarget.GetTarget()
	if BTarget.SetTarget(Target.id) == true then
		if (Player.localmapid == 622) or (Player.localmapid == 612) or (Player.localmapid == 813) then
			-- Need au sol
			if Player.flying.isflying == true then
				Player:Move(FFXIV.MOVEMENT.DOWN)
			end
		end
		if (Target.id ~= Player.id) then
			if (Player:SetFacing(Target.pos.x, Target.pos.y, Target.pos.z) == false) then
				return false
			end
		end
		if BStep.UseMountAction() == true then
			BDebug.Log("BStep - doMount -> Step Finish", 3)
			return true
		else
			BDebug.Log("BStep - doMount -> Step Not Finish", 3)
			return false
		end
	else
		BDebug.Log("BStep - doMount -> Target Not Set", 3)
		return false
	end
end

function BStep.UseMountAction()
	BDebug.Log("BStep - UseMountAction", 2)
	local p = Player
	local Quest = BQuest.GetCurrentQuest()
	local Target = BTarget.GetTarget()
	if table.valid(p) then
		local action = ActionList:Get(1, Quest.mountSkill)
		if table.valid(action) then
			BDebug.Log("BStep - UseMountAction -> Use Action", 3)
			if action:Cast(Target.id) == true then
				BDebug.Log("BStep - UseMountAction -> Step Finish", 3)
				return true
			else
				BDebug.Log("BStep - UseMountAction -> Wait Use Action", 1)
				return false
			end
		else
			BDebug.Log("BStep - UseMountAction -> Action == nil", 1)
			return false
		end
	else
		BDebug.Log("BStep - UseMountAction -> Player == nil", 1)
		return false
	end
end

-- Use Item --
function BStep.doUseItem()
	BDebug.Log("BStep - doUseItem", 2)
	Target = BTarget.GetTarget()
	if Target == nil then
		local tmp = BTarget.FindListEntity(Step.IdList, "targetable,maxdistance=125")
		if tmp == nil then
			if tonumber(Step.IdList[1]) == 20000000 then
				BTarget.SetEntityInTarget(Player)
			else
				return true
			end
		else
			BTarget.SetEntityInTarget(tmp)
		end
	end
	Target = BTarget.GetTarget()
	if Step.NeedMoveToEntity == true then
		if BMovement.doMoveToPosition(Target.pos) == false then
			return false
		end
	end
	if Variable.AfterUseItem == true then
		if BUtility.Wait(15, "UseItem") == true then
			Variable.AfterUseItem = false
			BTarget.RemoveEntityInTarget()
			return true
		else
			return false
		end
	end
	if BMovement.UseMount() == true then
		BMovement.doMount(false)
		BDebug.Log("BStep - doUseItem -> Wait Mount OFF", 3)
		return false
	end
	if BTarget.SetTarget(Target.id) == true then
		if BInteract.UseKeyItem(Step.Id) == true then
			BDebug.Log("BStep - doUseItem -> Step Finish", 3)
			Variable.AfterUseItem = true
			return false
		else
			BDebug.Log("BStep - doUseItem -> Step Not Finish", 3)
			return false
		end
	else
		if Target.id == Player.id then
			if BInteract.UseKeyItem(Step.Id) == true then
				BDebug.Log("BStep - doUseItem -> Step Finish", 3)
				Variable.AfterUseItem = true
				return false
			end
		end
		BDebug.Log("BStep - doUseItem -> Target Not Set", 3)
		return false
	end
end

-- Interact -- 
function BStep.CheckInteractFinish()
	if ActionList:IsReady() == false then 
		return true
	else
		return false
	end
end

--[[---------------------------------------------------------------------------------------
----------------------------	[Interact]	-----------------------------------------------
-----------------------------------------------------------------------------------------]]
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
local DoInteractStep = {
	[1] = function () local Range = 120 if Step.Type == "Transport" then Range = 40 end local Target = BTarget.FindListEntity(Step.IdList, "targetable,maxdistance="..Range) if Target ~= nil then BTarget.SetEntityInTarget(Target) Variable.StepModule = 2 else return true end end,
	[2] = function () if BTarget.SetTarget() == true then BAction.UseAction(5, 23) Variable.StepModule = 3 else Variable.StepModule = 1 end end,
	[3] = function () if BUtility.Wait(5, "Interact1") == true then if BInteract.Interact(BTarget.GetTarget().id) == true then Variable.StepModule = 4 end else BMovement.doMount(false) end end,
	[4] = function () if BUtility.Wait(4, "Interact2") == true then BInteract.ReturnItem() return true end end,
}
-------------------------------------------------------------------------------------------------------------------------------------------------------------------

function BStep.doInteract()
	return DoInteractStep[Variable.StepModule]()
end

local DoSpeedInteractStep = {
	[1] = function () local Target = BTarget.FindListEntity(Step.IdList, "targetable,maxdistance=120") if Target ~= nil then BTarget.SetEntityInTarget(Target) Variable.StepModule = 2 else return true end end,
	[2] = function () if BTarget.SetTarget() == true then Variable.StepModule = 3 end end,
	[3] = function () if BInteract.Interact(BTarget.GetTarget().id) == true then return true end end,
}
-- Speed Interact
function BStep.doSpeedInteract()
	return DoSpeedInteractStep[Variable.StepModule]()
end

local DoTakeChestStep = {
	[1] = function () local Target = BTarget.FindListEntity(Step.IdList, "targetable,maxdistance=120") if Target ~= nil then BTarget.SetEntityInTarget(Target) Variable.StepModule = 2 else return true end end,
	[2] = function () if BInteract.Interact(BTarget.GetTarget().id) == true then Variable.StepModule = 3 end end,
	[3] = function () if BInteract.Interact(BTarget.GetTarget().id) == true then return true end end,
}
-- Take Chest
function BStep.doTakeChest()
	return DoTakeChestStep[Variable.StepModule]()
end

-- Fate --
function BStep.doFate()
	BDebug.Log("BStep - doFate", 2)
	if BStep.WaitFate(Step.IdList) == true then
		if BStep.SyncFate() == true then
			BDebug.Log("BStep - doFate -> Step Finish", 3)
			return true
		else
			BDebug.Log("BStep - doFate -> Wait Sync", 3)
			return false
		end
	else
		BDebug.Log("BStep - doFate -> Fate Not Here", 3)
		return false
	end
end

function BStep.WaitFate(_List)
	BDebug.Log("BStep - WaitFate", 2)
	local flist = GetFateList()
	if table.valid(flist) then
		for id, e in pairs(flist) do
			for iid, ie in pairs (_List) do 
				if e.id == ie then
					Variable.Fate = e
					BDebug.Log("BStep - WaitFate -> Fate Here", 3)
					return true
				end
			end
		end
		BDebug.Log("BStep - WaitFate -> Fate Not Here", 3)		
		return false
	else
		BDebug.Log("BStep - WaitFate -> flist == nil", 3)
		return false
	end
end

function BStep.SyncFate()
	BDebug.Log("BStep - SyncFate", 2)
	local p = Player
	if table.valid(p) then
		if p.level > Variable.Fate.maxlevel then
			p:SyncLevel()
		end
		if p.level <= Variable.Fate.maxlevel then
			BDebug.Log("BStep - SyncFate -> Player Sync", 3)
			return true
		else
			BDebug.Log("BStep - SyncFate -> Player Not Sync", 3)
			return false
		end
	else
		BDebug.Log("BStep - SyncFate -> Player == nil", 1)
		return false
	end
end

-- Kill -- 
function BStep.CheckTarget(_target)
	if _target == nil then -- Need Find Target
		if Step.Count == -3 then
			-- Find Prio Target
			_target = BTarget.FindListEntity(Step.IdList, "alive,attackable,targetable,maxdistance=50")
		else
			_target = BTarget.FindListEntity(Step.IdList, "alive,attackable,targetable,maxdistance=80")
		end
		if _target == nil then -- No Id Here
			if Step.Count > 0 then
				if Step.Type == "Kill-Aggro" then
					return true
				else
					-- Wait Pop
					BMovement.doMount(false)
					BDebug.Log("BStep - doKill -> Need Search Target", 3)
					return false
				end
			else
				if BUtility.Wait(15, "Kill-1") == false then
					BDebug.Log("BStep - doKill -> Wait Pop for - 1", 3)
					return false
				else
					BDebug.Log("BStep - doKill -> Step Finish", 3)
					return true
				end
			end
		end
		-- Got New Target
		if Step.Type == "Kill-Aggro" then
			return true
		end
		BTarget.SetEntityInTarget(_target)
		BDebug.Log("BStep - doKill -> Find Finded and Saved", 3)
	end
	return false
end

function BStep.InitFight()
	BDebug.Log("BStep - InitFight", 2)
	if BMovement.UseMount() == true then
		BMovement.doMount(false)
		BDebug.Log("BStep - doKill -> Wait Mount OFF", 3)
		return false
	end
	-- Check Gysahl
	if BCommun.UseGysahl() then
		if BCommun.SwitchMode("Assist") == true then
			BCommun.PutSettingsAssist()
			if BCommun.RunMinion(true) == true then
				BDebug.Log("BStep - ModifCount - init Fight OK", 3)
				return true
			else
				BDebug.Log("BStep - ModifCount - Wait Run Minion", 3)
				return false
			end
		else
			BDebug.Log("BStep - ModifCount - Wait Switch Mode", 3)
			return false
		end
	else
		BDebug.Log("BStep - UseGysahl - Wait Use it", 3)
		return false		
	end
end

function BStep.ModifCount()
	BDebug.Log("BStep - ModifCount", 2)
	if Step.Count == -3 then
		Variable.NoKillAggro = true
	end
	if (Step.Count == -1) or (Step.Count == -3) then
		BDebug.Log("BStep - ModifCount - Need change Count to 1", 3)
		Step.Count = 1
	end
	BDebug.Log("BStep - ModifCount - Count OK", 3)
end

function BStep.doKill()
	BDebug.Log("BStep - doKill", 2)
	local p = Player
	local Target = BTarget.GetTarget()
	-- Check Finish
	if Step.Count == 0 then
		-- Check Revolt
		if not RevoltEngine.GetAddonStarted() then
			BCommun.RunMinion(false)
		end
		BDebug.Log("BStep - doKill - Step Finish", 3)
		return true
	end
	-- Check Target
	if Target == nil then
		BDebug.Log("BStep - doKill -> Target Nill", 3)
		return BStep.CheckTarget(Target) -- Can Finish if Kill-Aggro or -1
	end
	-- Init
	BStep.ModifCount()
	BStep.CheckFateID()
	-- Move In Range Fight
	if BUtility.CanAttack(Target.id) == false or Player.flying.isflying then -- Not in Combat Range
		if BMovement.doMoveToPosition(Target.pos) then
			BMovement.doMount(false)
		end
		BDebug.Log("BStep - doKill -> Cannot Atk", 3)
		return false
	end
	-- In Combat Range
	if Player:IsMoving() then
		BMovement.StopMove()
	end
	BTarget.SetTarget(Target.pos.x,Target.pos.y,Target.pos.z)
	if BStep.InitFight() == false then -- Not Rdy
		BDebug.Log("BStep - doKill -> Kill Not Ready", 3)
		return false
	end
	-- Check if Target is dead
	if Target.alive == false then
		Step.Count = Step.Count - 1
		BTarget.RemoveEntityInTarget()
		BDebug.Log("BStep - doKill -> Count - 1", 3)
		return false
	end
	-- Check Count -2
	if (Target.hp.percent <= 50) and (Step.Count == -2) and (Target.aggro == false) and (Target.aggropercentage == 0) then
		BDebug.Log("BStep - doKill -> Target at 1hp", 2)		
		Step.Count = 0
		return false
	end
	if not Target.attackable then
		Step.Count = Step.Count - 1
		BTarget.RemoveEntityInTarget()
		BDebug.Log("BStep - doKill -> No Attackable", 3)
		return false
	end
	BDebug.Log("BStep - doKill -> last Return", 3)
	return false
end

function BStep.CheckFateID()
	BDebug.Log("BStep - CheckFateID", 2)
	local p = Player
	local Target = BTarget.GetTarget()
	if table.valid(p) then
		if Target.fateid ~= 0 then
			if p:GetSyncLevel() == 0 then
				BDebug.Log("BStep - CheckFateID -> Need SyncLevel", 3)
				p:SyncLevel()
			end
		end
		return true
	else
		BDebug.Log("BStep - CheckFateID -> Player == nil", 1)
		return false
	end	
end
