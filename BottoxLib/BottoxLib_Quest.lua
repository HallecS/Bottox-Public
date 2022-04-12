BQuest = {}

local VQuest = nil

function BQuest.RemoveQuest()
	VQuest = nil
end

function BQuest.GetCurrentQuest()
	return VQuest
end
-------- Reset ---------
function BQuest.ResetQuest()
	BDebug.Log("ResetQuest", 2)
------------
	if BTarget.GetTarget() ~= nil then
		BTarget.RemoveEntityInTarget()
	end
	if BStep.GetCurrentStep ~= nil then
		BStep.RemoveStep()
	end
------------
	VQuest = BVariable.GetQuest()
	VQuest.id = 0
	VQuest.Type = nil
	VQuest.Data = nil
	VQuest.Finish = false
	VQuest.itemFate = 0
	VQuest.mountSkill = 0
	VQuest.CurrentStep = 1
	VQuest.AggroList = ""
end
-------- Commun ---------
function BQuest.FindXQuestInsideJournal(_idmin, _idmax)
	BDebug.Log("BQuest - FindXQuestInsideJournal", 2)
	if _idmin ~= nil and _idmax ~= nil then
		local nb = 0
		local qList = Quest:GetQuestList()
		if (table.valid(qList)) then
			for id, e in pairs(qList) do
				if e then
					if (e.id >= _idmin) and (e.id <= _idmax) then
						BDebug.Log("BQuest - FindXQuestInsideJournal -> Quest Finded", 3)
						-- Check Ixal Quest
						if not ((e.id >= 1524) and (e.id <= 1565)) then -- Check No Range Quest
							nb = nb + 1
						end
					end
				end
			end
			BDebug.Log("BQuest - FindXQuestInsideJournal -> All Quest Finded", 3)
			return nb
		end
	else
		BDebug.Log("BQuest - FindXQuestInsideJournal - Wrong Argument", 1)
		return 0
	end
end

function BQuest.FindQuestInsideJournal(_id)
	BDebug.Log("BQuest - FindQuestInsideJournal", 2)
	if _id ~= nil then
		local qList = Quest:GetQuestList()
		if (table.valid(qList)) then
			for id, e in pairs(qList) do
				if e then
					if e.id == _id then
						BDebug.Log("BQuest - FindQuestInsideJournal -> Quest Finded", 3)
						return true
					end
				end
			end
			BDebug.Log("BQuest - FindQuestInsideJournal -> Error : Quest Not Finded", 3)
			return false
		end
	else
		BDebug.Log("BQuest - FindQuestInsideJournal - Wrong Argument", 1)
		return false
	end
end

-------- Return ---------
function BQuest.ReturnQuest(Data)
	BDebug.Log("BQuest - ReturnQuest", 2)
	if Data ~= nil then
		-- Need Go Position
		if BMovement.UseMount() == false then
			if BMovement.CanUseMount() then
				if BMovement.doMount(BMovement.NeedMount(Data.id)) == false then
					BDebug.Log("BQuest - ReturnQuest -> Wait Mount ON", 3)
					return false
				end
			end
		end
		if BMovement.doMoveToPosition(Data.Position) == true then
			if DailiesIxal then
				if DailiesIxal.ReturnActiveForDailiesManager() then
					local Job = BVariable.Get_Job(DailiesIxal.Get_ReturnJob())
					if Player.Job ~= Job.Number then
						BUtility.SetGear(Job.GearSet)
						return false
					end
				end
			end
			if BMovement.UseMount() == true then
				BMovement.doMount(false)
				BDebug.Log("BQuest - ReturnQuest -> Wait Mount OFF", 3)
				return false
			end
			-- Move Finish -> Next Return
			-- Check Select Reward
			if BInteract.SelectRewardQuest(2) == true then
				BDebug.Log("BQuest - ReturnQuest -> Return Finish", 3)
				BQuest.RemoveQuest()
				return true
			end
			-- Check Return Item for Fate
			if VQuest then
				if VQuest.Type == "Fate" then
					BDebug.Log("BQuest - ReturnQuest -> Return Finish", 3)
					BInteract.ReturnItem(VQuest.itemFate)
				end
				-- Check Select String
				BCommun.SelectString(VQuest.id)
			end
			-- Check Return Item
			BInteract.ReturnItem()
			-- Check Interact
			if ActionList:IsReady() == true then
				BInteract.Interact(Data.id)
			end
			BDebug.Log("BQuest - ReturnQuest -> Return New Turn", 3)
			return false
		else
			-- In Move
			BDebug.Log("BQuest - ReturnQuest -> In Move", 3)
			return false
		end
	else
		BDebug.Log("BQuest - ReturnQuest - Wrong Argument", 1)
		return false
	end
end

-------- Take ---------
function BQuest.SelectQuest(Data)
	local controls = GetControls()
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e.name == "SelectIconString" then
				if e:IsOpen() == true then
					local save = e:GetData()
					local qList = Quest:GetQuestList()
					if (table.valid(qList)) then
						for idq, eq in pairs(qList) do
							if eq.id >= Data.questidmin and eq.id <= Data.questidmax then
								local m = 0
								for key, value in ipairs(save) do 
									if save[0] == value then
										if save[key] == value then
											table.remove(save, key)
											m = 1
											break
										end
									end
									if eq.name == value then
										table.remove(save, key)
										m = 1
										break
									end
									if m == 1 then
										break
									end
								end
							end
						end
					end
					for sid, se in pairs(save) do
						if (se ~= BTalk.Translate("Parler")) and (se ~= BTalk.Translate("Annuler")) and (se ~= BTalk.Translate("Parler2")) then
							local ac = e:GetData()
							for key, value in pairs(ac) do 
								if se == value then
									return key
								end
							end
						end
					end
					return -1
				end
			end
		end
	end
	return -1
end

function BQuest.TakeQuest(Data)
	BDebug.Log("BQuest - TakeQuest", 2)
	if Data ~= nil then
		-- Need Go Position
		if BMovement.UseMount() == false then
			if BMovement.doMount(BMovement.NeedMount(Data.id)) == false then
				BDebug.Log("BQuest - TakeQuest -> Wait Mount ON", 3)
				return false
			end
		end
		if BMovement.doMoveToPosition(Data.Position) == true then
			if DailiesIxal then
				if DailiesIxal.ReturnActiveForDailiesManager() then
					local Job = BVariable.Get_Job(DailiesIxal.Get_CraftJob())
					if Player.Job ~= Job.Number then
						BUtility.SetGear(Job.GearSet)
						return false
					end
				end
			end
			if BMovement.UseMount() == true then
				BMovement.doMount(false)
				BDebug.Log("BQuest - TakeQuest -> Wait Mount OFF", 3)
				return false
			end
			-- Move Finish -> Next Return
			if BInteract.AcceptQuest() == true then
				BDebug.Log("BQuest - TakeQuest -> Return Finish", 3)
				return true
			end
			BInteract.SelectConversation(BQuest.SelectQuest(Data))
			if DailiesDwarf then
				if DailiesDwarf.ReturnActiveForDailiesManager() then
					-- Spe Dwarf
					BInteract.SelectConversation(0)
				end
			end
			if ActionList:IsReady() == true then
				BInteract.Interact(Data.id)
				return false
			end
			BDebug.Log("BQuest - TakeQuest -> Return New Turn", 3)
			return false		
		else
			-- In Move
			BDebug.Log("BQuest - TakeQuest -> In Move", 3)
			return false
		end
	else
		BDebug.Log("BQuest - TakeQuest - Wrong Argument", 1)
		return false
	end
end

-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
----------------------------	[BQuest.DoQuest]	-------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------
function BQuest.DoQuest()
	BDebug.Log("BQuest - DoQuest", 2)
	if VQuest ~= nil then
		-- Check if Quest Finish
		if VQuest.Finish == false then
			-- Check if Finish in Progress
			if BQuest.IsFinishInProgress() == true then
				VQuest.Finish = true
				BDebug.Log("BQuest - DoQuest - Quest Finish", 3)
				return BQuest.QuestFinish()
			end
			-- Do Quest
			local Step = BStep.GetCurrentStep()
			-- Load Step if Step == nil
			if Step == nil then
				BLoad.LoadStepFromData()
			else
				if Step.Finish == true then
					-- Step Finish && Quest NOT Finish
					BStep.RemoveStep()
					if VQuest.Data[VQuest.CurrentStep + 1] ~= nil then
						BDebug.Log("BQuest - IsQuestFinish - Go Next Step", 3)
						VQuest.CurrentStep = VQuest.CurrentStep + 1
						return false
					else
						-- Reset Quest
						BDebug.Log("BQuest - IsQuestFinish - Reset Quest", 3)
						VQuest.CurrentStep = 1
						return false
					end
				else
					if BStep.DoStep() == true then
						if Step.Type == "Kill-Aggro" then
							BStep.RemoveStep()
							BTarget.RemoveEntityInTarget()
							BDebug.Log("BQuest - IsQuestFinish - Aggro Finish", 3)
							return false
						end
					end
				end
			end
			BDebug.Log("BQuest - DoQuest - Quest Not Finish", 3)
			return false
		else
			-- Quest Finish
			BDebug.Log("BQuest - DoQuest - Quest Finish", 3)
			return BQuest.QuestFinish()
		end
	else
		BDebug.Log("BQuest - DoQuest - No Data for this Quest", 1)
		return false
	end
end

-------- Progress ---------
function BQuest.IsFinishInProgress()
	BDebug.Log("BQuest - IsFinishInProgress", 2)
	local qList = Quest:GetQuestList()
	if (table.valid(qList)) then
		for id, e in pairs(qList) do
			if e then
				if e.id == VQuest.id then
					-- Check Fate
					if VQuest.Type == "Fate" then
						if BCommun.GotItem(VQuest.itemFate) == true then
							BDebug.Log("BQuest - IsFinishInProgress - Quest Fate Finish", 3)
							return true
						end
					else
						-- Check Other
						if e.completed == true then
							BDebug.Log("BQuest - IsFinishInProgress - Quest Finish", 3)
							return true
						end
					end
					BDebug.Log("BQuest - IsFinishInProgress - Quest Not Finish", 3)
					return false
				end
			end
		end
		BDebug.Log("BQuest - IsFinishInProgress - Quest Not Find", 2)
		return false
	end
	BDebug.Log("BQuest - IsFinishInProgress - qList == nil", 1)
	return false
end

function BQuest.NeedTpAfter()
	BDebug.Log("BQuest - NeedTpAfter", 2)
	local NeedTp = BVariable.GetNeedTp()
	for id, e in pairs(NeedTp) do
		if table.valid(e) then
			if id == VQuest.id then
				if BAction.IsActionReady(1, 5) == true then
					local p = Player
					if table.valid(p) then
						p:Teleport(e)
						BDebug.Log("NeedTpAfter - Need TP", 3)
						if BCommun.IsCasting() == true then
							return true
						else
							return false
						end
					end
				else
					BDebug.Log("NeedTpAfter - Wait Action Rdy", 3)
					return false
				end
			end
		end
	end
	BDebug.Log("BQuest - NeedTpAfter - Not Need TP", 3)
	return true
end

function BQuest.QuestFinish()
	BDebug.Log("BQuest - QuestFinish", 2)
	-- Spé Mount Quest
	if VQuest.Type == "Mount" then
		if BMovement.UseMount() == true then
			if BMovement.doMoveToPosition(NavigationManager:GetClosestPointOnMesh(Player.pos)) or Player.diving.isdiving then
				local action = ActionList:Get(5, 23)
				if action then
					BMovement.StopMove()
					BDebug.Log("BQuest - IsQuestFinish - UnMount for Quest Mount", 3)
					action:Cast()
				end
			end
			return false
		end
	end
	-- Spé Craft & Gather
	-- Check Gather & Craft
	if BCommun.IsControlOpen("Gathering") == true then
		GetControl("Gathering"):Close()
		return false
	end
	if (IsControlOpen("RecipeNote") == true) then
		GetControl("RecipeNote"):Close()
		return false
	end
	-- End Check
	-- Quest Finish
	-- Kill aggro
	VQuest.AggroList = ""
	if BStep.CheckKillAggro() == true then
		BStep.DoStep()
		return false
	else
		if BQuest.NeedTpAfter() then
			BStep.RemoveStep()
			VQuest.Finish = true
			BDebug.Log("BQuest - IsQuestFinish - Quest Finish", 3)
			return true
		end
	end
	return false
end

------- GET SET
function BQuest.SetType(_string)
	VQuest.Type = _string
end

function BQuest.SetItemFate(_id)
	VQuest.itemFate = _id
end

function BQuest.SetMountSkill(_nb)
	VQuest.mountSkill = _nb
end
