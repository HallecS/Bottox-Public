BCommun = {}

function BCommun.PutSettingsAssist()
	-- Target Mode
	FFXIV_Assist_Mode = GetString("None")
	FFXIV_Assist_ModeIndex = 1
	gAssistFollowTarget = false
	gAssistTrackTarget = false
	Settings.FFXIVMINION[GetString("FFXIV_Assist_Mode")] = GetString("None")
	Settings.FFXIVMINION[GetString("FFXIV_Assist_ModeIndex")] = 1
	Settings.FFXIVMINION[GetString("gAssistFollowTarget")] = false
	Settings.FFXIVMINION[GetString("gAssistTrackTarget")] = false
	-- Minion Settings
	gAvoidAOE = false
	gSkipCutscene = true
	Settings.FFXIVMINION[GetString("gAvoidAOE")] = false
	Settings.FFXIVMINION[GetString("gSkipCutscene")] = true
	--
	gStartCombat = true
	gAssistUseAutoFace = true
	gAssistUseLegacy = false
	gAssistConfirmDuty = false
	gQuestHelpers = false
	Settings.FFXIVMINION[GetString("gStartCombat")] = true
	Settings.FFXIVMINION[GetString("gAssistUseAutoFace")] = true
	Settings.FFXIVMINION[GetString("gAssistUseLegacy")] = false
	Settings.FFXIVMINION[GetString("gAssistConfirmDuty")] = false
	Settings.FFXIVMINION[GetString("gQuestHelpers")] = false
end

function BCommun.LevelByJob(_job)
	local lev = Player.levels
	if table.valid(lev) then
		return lev[_job]
	end
	return nil
end

function BCommun.AutoEquipGear()
	if BCommun.IsControlOpen("RecommendEquip") then
		local control = GetControl("RecommendEquip")
		local ac = control:GetActions()
		if (table.valid(ac)) then
			for aid, action in pairs(ac) do
				if action == "Equip" then
					control:Action(action,0)
					return true
				end
			end
		end
		return false
	end
	if BCommun.IsControlOpen("Character") then
		local control = GetControl("Character")
		local ac = control:GetActions()
		if (table.valid(ac)) then
			for aid, action in pairs(ac) do
				if action == "OpenRecommendEquip" then
					control:Action(action,0)
				end
			end
		end		
		return false
	end
	local action = ActionList:Get(10, 2)
	if action ~= nil then
		action:Cast()
	end
	return false
end

function BCommun.CheckFood()
	local Food = BottoxSettings.BuildFoodList()[BVariable.Get_FoodIndex()]
	if table.valid(Food) then
		if Food.id ~= nil then
			-- Can Use this Food
			if not BAction.HaveBuff(48) then
				-- Use Food
				if BCommun.GotItem(Food.id) == true then
					if BCommun.IsControlOpen("Shop") == true then
						GetControl("Shop"):Close()
						return false
					end
					BCommun.UseItem(Food.id)
					return false
				end
				if Food.Shop.ID then
					BUtility.BuyItem(Food.id, BVariable.Get_AmountFood(), Food.Shop)
					return false
				end
			end
		end
		if Food.id ~= nil then
			if not BAction.HaveBuff(48) then
				BCommun.UseItem(Food.id)
				return false
			end
		end
	end
	return true
end

function BCommun.SymbioseStuff(_slot)
	-- Check Addon Control
	if BCommun.IsControlOpen("MaterializeDialog") then
		local control = GetControl("MaterializeDialog")
		local ac = control:GetActions()
		if (table.valid(ac)) then
			for aid, action in pairs(ac) do
				if action == "Yes" then
					control:Action(action,0)
					return true
				end
			end
		end	
		return true
	end
	--
	if ActionList:IsReady() then
		local inv = Inventory:GetTypes()
		if table.valid(inv) then
			for id, e in pairs(inv) do
				if (tostring(e) == tostring(_slot)) then
					local bag = Inventory:Get(e)
					if table.valid(bag) then
						local ilist = bag:GetList()
						if table.valid(ilist) then
							for slot, item in pairs(ilist) do
								if item.spiritbond == 100 then
									item:Convert()
									return true
								end
							end
						end
					end
				end
			end
		end
	else
		return true
	end
	return false
end

function BCommun.EquipItem(_id)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "3500") or (tostring(e) == "3200") or (tostring(e) == "3201") or (tostring(e) == "9657") or (tostring(e) == "3096") or  (tostring(e) == "3098") or (tostring(e) == "3097") or (tostring(e) == "3086") or
				(tostring(e) == "3202") or (tostring(e) == "3203") or (tostring(e) == "3204") or (tostring(e) == "3205") or 
				(tostring(e) == "3206") or (tostring(e) == "3207") or (tostring(e) == "3208") or (tostring(e) == "3209") or (tostring(e) == "3300") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if table.valid(ilist) then
						for slot, item in pairs(ilist) do
							if item.id == _id then
								if item.equipslot == 13 then
									GetItemBySlot(slot, e):Move(1000, 0)
								else
									GetItemBySlot(slot, e):Move(1000, item.equipslot - 1)
								end
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

function BCommun.ItemIsEquiped(_id)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if (tostring(e) == "1000") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if table.valid(ilist) then
						for slot, item in pairs(ilist) do
							if item.id == _id then
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

function BCommun.DoPurify(_iditem)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if (id >= 0) and (id <= 4) then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								if item.collectability ~= 0 then
									item:Purify()
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

function BCommun.CanDoPurify(_iditem)
	local Count = 0
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								if item.spiritbond ~= 0 and item.spiritbond <= 8 then
									Count = Count + item.count
								end
							end
						end
					end
				end
			end
		end
	end
	return Count
end

function BCommun.ReturnCurrentCordial(_needHQ)
	local CordialList = BVariable.Get_CordialList()
	local CordialIndex = BVariable.Get_CordialIndex()
	local currentCordial = CordialList[CordialIndex]
	local inv = Inventory:GetTypes()
	if (table.valid(inv)) then
		for id, e in pairs(inv) do
			if (id >= 0) and (id <= 4) then
				local bag = Inventory:Get(e)
				if (table.valid(bag)) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == currentCordial[2] then
								if _needHQ == true then
									if item.ishq == 1 then
										return item
									end
								else
									return item
								end
							end
						end
					end
				end
			end 
		end
	end
	return nil
end

function BCommun.UseCordial()
	if BVariable.Get_UseCordial() then
		-- Variable
		local CordialIndex = BVariable.Get_CordialIndex()
		local CordialList = BVariable.Get_CordialList()
		local NoExceed = BVariable.Get_NoExceed()
		local FirstHQ = BVariable.Get_FirstHQ()
		--
		local CurrentCordial = nil
		local target = 0
		--
		if FirstHQ then
			CurrentCordial = BCommun.ReturnCurrentCordial(true)
			target = 4
		end
		if CurrentCordial == nil then
			CurrentCordial = BCommun.ReturnCurrentCordial(false)
			target = 3
		end
		if CurrentCordial ~= nil then
			if CurrentCordial:IsReady() == true then
				local p = Player
				local current = 0
				local max = 0
				if p then
					max = p.gp.max
					current = p.gp.current
				end
				if NoExceed == true then
					local currentCordial = CordialList[CordialIndex]
					if target == 4 then
						if currentCordial[target] == nil then
							target = 3
						end
					end
					if (current + currentCordial[target]) <= max then
						CurrentCordial:Cast()
					end
				else
					if current < max then
						CurrentCordial:Cast()
					end
				end
			end
		end
	end
end

function BCommun.UseGysahl()
	if BVariable.Get_UseGysahl() then
		-- Check Chocobo Used
		local el = BTarget.EntityByOption("chartype=3,ownerid="..Player.id)
		if table.valid(el) then
			for _id, _e in pairs(el) do
				return true
			end
		end
		-- Check Use Chocobo
		if not BCommun.IsItemReady(4868) and ActionList:IsReady() then
			BDebug.Log("BCommun - UseGysahl - Cannot use it", 3)
			return true
		end
		if BCommun.GotItem(4868) then
			if BUtility.Wait(5, "Wait_UseGysah") then
				if BCommun.IsItemReady(4868) then
					BCommun.UseItem(4868)
				end
			end
			return false
		end
	end
	return true
end

function BCommun.IsHotBarRdy()
	if table.valid(ActionList) then
		if ActionList:IsReady() == true then
			return true
		end
	end
	return false
end

function BCommun.CloseControl(_name)
	local Addon = GetControl(_name)
	if Addon then
		Addon:Close()
		return true
	else
		return false
	end
end

function BCommun.IsControlOpen(_name)
	if (IsControlOpen(_name) == true) then
		return true
	else
		return false
	end
end

function BCommun.PlayerIsTargetable()
	if table.valid(Player) then
		return Player.targetable
	end
	return false
end

function BCommun.LoadMesh(Name)
	if Name ~= nil then
		ml_mesh_mgr.LoadNavMesh(Name)
		return true
	end
	return false
end

function BCommun.RunMinion(_mode, _debug)
	if FFXIV_Common_BotRunning ~= _mode then
		local ActiveDebug = false
		if ActiveDebug and (_debug ~= nil) then
			d("BCommun.RunMinion -> Switch Mode -> "..tostring(_mode).." [ ".._debug.." ]")
		else
			d("BCommun.RunMinion -> Switch Mode -> "..tostring(_mode))
		end
		ml_global_information.ToggleRun()
		return false
	else
		return true
	end
end

function BCommun.SwitchMode(_mode)
	BDebug.Log("SwitchMode", 2)
	if GetString(gBotMode) ~= GetString(_mode) then
		for id, e in pairs(gBotModeList) do
			if _mode == e then
				gBotModeIndex = id
				gBotMode = e
				ffxivminion.SwitchMode(gBotMode)
				return true
			end
		end
		return false
	else
		return true
	end
end

function BCommun.SelectWord(_string)
	if BCommun.IsControlOpen("SelectIconString") == true then
		local ad = GetControl("SelectIconString"):GetData()
		if (table.valid(ad)) then
			for key, value in pairs(ad) do
				if value == _string then
					BInteract.SelectConversation(key)
					return true
				end
			end
		end
	end
	if BCommun.IsControlOpen("SelectString") == true then
		local ad = GetControl("SelectString"):GetData()
		if (table.valid(ad)) then
			for key, value in pairs(ad) do
				if value == _string then
					BInteract.SelectConversation(key)
					return true
				end
			end
		end
	end
	return false
end

function BCommun.SelectString(_id)
	if _id ~= nil then
		local controls = GetControls()
		if (table.valid(controls)) then
			for id, e in pairs(controls) do
				if e.name == "SelectIconString" then
					if e:IsOpen() == true then
						BDebug.Log("SelectIconString", 3)
						local ac = e:GetData()
						for key, value in pairs(ac) do 
							if (value == "Yes") or (value == "Yes.") then
								return BInteract.SelectConversation(key)
							else
								if _id ~= 0 and _id ~= nil then
									local qList = Quest:GetQuestList()
									if (table.valid(qList)) then
										for idq, eq in pairs(qList) do
											if eq.name == value then
												if _id ~= 0 then
													if _id == idq then
														return BInteract.SelectConversation(key)
													end
												else
													return BInteract.SelectConversation(key)
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
		return false
	end
end

function BCommun.IsInventoryFull()
	local tmp = 0
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if (id >= 0) and (id <= 4) then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					if bag.free == 0 then
						tmp = tmp + 1
					end
				end
			end
		end
	end
	if tmp == 4 then
		return true
	else
		return false
	end
end

function BCommun.EmptySlotInInventory()
	local tmp = 0
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if (id >= 0) and (id <= 4) then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					tmp = tmp + bag.free
				end
			end
		end
	end
	return tmp
end

function BCommun.IsItemReady(_iditem)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								return item:IsReady()
							end
						end
					end
				end
			end
		end
	end
	return false
end

function BCommun.UseItem(_iditem, _needhq)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								if _needhq then
									if item.ishq == 1 then
										item:Cast()
									end
								else
									item:Cast()
								end
							end
						end
					end
				end
			end
		end
	end
end

function BCommun.GetNbItemCollect(_iditem)
	local Count = 0
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								if item.collectability ~= 0 then
									Count = Count + item.count
								end
							end
						end
					end
				end
			end
		end
	end
	return Count
end

function BCommun.GetNbItem(_iditem,_ishq)
	if _ishq == nil or not _ishq then
		_ishq = false
	end
	local Count = 0
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") or (tostring(e) == "2001") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								if _ishq == true then
									if item.ishq == 1 then
										Count = Count + item.count
									end
								else
									Count = Count + item.count
								end
							end
						end
					end
				end
			end
		end
	end
	return Count
end

function BCommun.GetItemInSlot(_slot, _iditem)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if tostring(e) == tostring(_slot) then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								BDebug.Log("GotItem - "..item.name, 3)
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

function BCommun.GetItem(_iditem)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								BDebug.Log("GotItem - "..item.name, 3)
								return item
							end
						end
					end
				end
			end
		end
	end
	return nil
end

function BCommun.GotItemArsenal(_iditem)
	local Tab = {"3500", "3200", "3201", "3202", "3203", "3204", "3205", "3206", "3207", "3208", "3209", "3300"}
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			for iid, ie in pairs(Tab) do
				if tostring(e) == ie then
					local bag = Inventory:Get(e)
					if table.valid(bag) then
						local ilist = bag:GetList()
						if (table.valid(ilist)) then
							for slot, item in pairs(ilist) do
								if item.id == _iditem then
									BDebug.Log("GotItemArsenal - "..item.name, 3)
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

function BCommun.GotItem(_iditem)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								BDebug.Log("GotItem - "..item.name, 3)
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

function BCommun.GotNbItemHq(_iditem, _nb)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								if item.ishq == 1 then
									if item.count >= _nb then
										BDebug.Log("GotNbItemHq - "..item.name.." - "..item.count, 3)
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
	return false
end

function BCommun.GotNbItem(_iditem, _nb)
	local inv = Inventory:GetTypes()
	if table.valid(inv) then
		for id, e in pairs(inv) do
			if ((id >= 0) and (id <= 4)) or (tostring(e) == "2004") then
				local bag = Inventory:Get(e)
				if table.valid(bag) then
					local ilist = bag:GetList()
					if (table.valid(ilist)) then
						for slot, item in pairs(ilist) do
							if item.id == _iditem then
								if item.count >= _nb then
									BDebug.Log("GotNbItem - "..item.name.." - "..item.count, 3)
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

function BCommun.InsideDialog()
	local controls = GetControls()
	-- Check if Request Open
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e.name == "Request" then
				if e:IsOpen() == true then
					return false
				end
			end
		end
		for id, e in pairs(controls) do
			if e.name == "Talk" then
				if e:IsOpen() == false then
					return false
				else
					local ac = e:GetActions()
					if (table.valid(ac)) then
						for aid, action in pairs(ac) do
							if action == "Click" then
								BDebug.Log("InsideDialog", 3)
								e:Action(action,1)
								return true
							end
						end
					end
				end
			end
			if e.name == "Request" then
				if e:IsOpen() == true then
					return false
				end
			end
		end
	end
	return false
end

function BCommun.IsCasting()
	local p = Player
	if BVariable.Target ~= nil then
		if (BVariable.Target.alive == false) or (BVariable.Target.hp.current < 1.01) then
			return false
		end
	end
	if p.castinginfo.channeltime ~= 0 then
		BDebug.Log("IsCasting", 3)
		return true
	end
	return false
end

function BCommun.PlayerDeadForDuty()
	local p = Player
	if p then
		local h = p.hp
		if h.current == 0 and p.incombat then
			-- Wait raise
			if BAction.GotBuff(148) then
				-- Got raize
				BInteract.SelectYes()
			end
			return false
		else
			return BCommun.PlayerIsNotDead()
		end
	end
	return false
end

function BCommun.PlayerIsNotDead()
	local p = Player
	if p then
		local h = p.hp
		if h.current == 0 then
			BDebug.Log("Player Dead", 3)
			BVariable.Step = nil
			BTarget.RemoveEntityInTarget()
			return BCommun.Raise()
		else
			return true
		end
	end
	return false
end

function BCommun.Raise()
	local controls = GetControls()
	if (table.valid(controls)) then
		for id, e in pairs(controls) do
			if e.name == "_NotificationRevive" then
				if e:IsOpen() == true then
					BDebug.Log("Raise", 3)
					return BInteract.SelectYes()
				end
			end
		end
	end
end

function BCommun.Speak(_string)
	SendTextCommand(_string)
end