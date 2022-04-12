BMovement = {}

local VMovement = {
	Tmp = false,
	InGateNpc = false,
	----
	RadiusDiving = 2.6,
	RadiusFlying = 2.8,
	RadiusMove = 2,
}

-------------------- Function --------------------------------
--Name = "Tempura Platter (iLvl 279 Craft)", id = 19826, map = function() return BVariable.Get_MapInfo() end, map = 628, AethId = 111, Npc_Id = 4301621483, Position = {x = 52.70, y = 4.00, z = 71.49}},

function BMovement.Get_InGateNpc()
	return VMovement.InGateNpc
end

function BMovement.Set_InGateNpc(_bool)
	VMovement.InGateNpc = _bool
end

function BMovement.CanWalk()
	return true
end

function BMovement.ResetTmp()
	VMovement.Tmp = false
end

function BMovement.MoveToMap(_mapid, _aethid, _sector)
	BMovement.doTp(_mapid, _aethid, _sector)
end

function BMovement.SameMap(_id)
	if Player then
		if Player.localmapid == _id then
			VMovement.Tmp = false
			return true
		end
	end
	return false
end

function BMovement.MoveTo(_table)
	if table.valid(_table) then
		if BMovement.CanWalk() then
			if BMovement.SameMap(_table.MapId) then
				if ActionList:IsCasting() == true then
					return false
				end
				if BMovement.doMoveToPosition(_table.Position, _table.Radius) then
					return true
				else
					if BUtility.Wait(1, "MoveTo_WaitMount") then
						if BMovement.CanUseMount() then
							-- Check Mount
							if _table.ID then
								if BMovement.NeedMount(_table.ID) then
									if not BMovement.doMount(true) then
										BMovement.StopMove()
										return false
									end
								end
							else
								if not BMovement.doMount(true) then
									BMovement.StopMove()
									return false
								end
							end
						else
							if BAction.IsActionReady(5, 4) == true then -- Abandon
								BAction.UseAction(5, 4)
							end
						end
					end
				end
				return false
			end
			BMovement.MoveToMap(_table.MapId, _table.AethId, _table.Sector)
		end
	end
	return false
end

	-------- Teleport ---------
function BMovement.doTpHack(_Position)
	BDebug.Log("BMovement - doTpHack", 2)
	if _Position ~= nil then
		BDebug.Log("BMovement - doTpHack ".._Position.x.." : ".._Position.y.." : ".._Position.z, 3)
		Hacks:TeleportToXYZ(_Position.x, _Position.y, _Position.z)
		return true
	end
	BDebug.Log("BMovement - doTpHack - Error Argument", 1)
	return false
end

function BMovement.doTpToAeth(_AethId)
	if (_AethId ~= nil) then
		local p = Player
		if table.valid(p) then
			if ActionList:IsCasting() == true then
				return false
			else
				BDebug.Log("BMovement - doTp ".._AethId, 3)
				p:Teleport(_AethId)
				return true
			end
		end
		BDebug.Log("BMovement - doTp - Player == nil", 1)
		return false
	end
end

function BMovement.doSpeMoveWithUrban(_MaponTp, _IdAethrit, _Pos, _Index)
	if BMovement.doMoveToPosition(_Pos) == true then
		-- Do Interact NPC
		if VMovement.Tmp == false then
			if BInteract.SelectConversation(0) == false then
				BInteract.Interact(_IdAethrit)
				BCommun.InsideDialog()
			else
				VMovement.Tmp = true
			end
		else
			BInteract.SelectConversation(_Index)
		end
	end
	return false
end

function BMovement.doSpeMoveToLogement(_MaponTp, _IdAethrit, _Pos, _sector)
	if BMovement.doMoveToPosition(_Pos) == true then
		-- Do Interact NPC
		if VMovement.Tmp == false then
			if BInteract.SelectConversation(1) == false then
				BInteract.Interact(_IdAethrit)
				BCommun.InsideDialog()
			else
				VMovement.Tmp = true
			end
			return false
		else
			BInteract.SelectConversation(2)
		end
		local controls = GetControls()
		if (table.valid(controls)) then
			for id, e in pairs(controls) do
				if e.name == "HousingSelectBlock" then
					if e:IsOpen() == true then
						local ac = e:GetActions()
						if (table.valid(ac)) then
							for aid, action in pairs(ac) do
								if action == "Travel" then
									local index = 1
									if _sector ~= nil then
										index = _sector
									end
									e:Action(action, index)
									return false
								end
							end
						end					
					end
				end
				if e.name == "SelectYesno" then
					if e:IsOpen() == true then
						BInteract.SelectYes()
						return false
					end
				end
			end
		end
	end
	return false
end

function BMovement.doSpeMove(_MaponTp, _AethId, _sector)
	local p = Player
	-- Check End
	if p.localmapid == _MaponTp then
		VMovement.Tmp = false
		return true
	end
	-- Cave Matoya
	if (_MaponTp == 463) then
		-- Idyléé to Dravanian
		if p.localmapid == 478 then
			if BMovement.doMount(true) == true then
				BMovement.doMoveToPosition({x = 149,y = 207,z = 119})
			end
			return false
		end
		-- Dravanian to Matoya
		if p.localmapid == 399 then
			if BMovement.doMoveToPosition({x = -488.67,y = 137.79,z = 740.21}) == true then
				BInteract.Interact(4300789333)
				BInteract.SelectYes()
			end
			return false
		end
	end
	-- Spe Idyléé
	if (_MaponTp == 399) and (p.localmapid == 478) then
		if BMovement.doMount(true) == true then
			BMovement.doMoveToPosition({x = 149,y = 207,z = 119})
		end
		return false
	end
	-- Il Mheg -> Lyhe Mheg
	if (_MaponTp == 890) and (p.localmapid == 816) then
		if BMovement.doMoveToPosition({x = -461.5,y = 72.52,z = 586.48}) == true then
			if ActionList:IsReady() then
				BInteract.Interact(4303108943)
			else
				BInteract.SelectYes()
			end
		end
		return false
	end
	-- Il Mheg -> Lyhe Mheg 2
	if (_MaponTp == 891) and (p.localmapid == 816) then
		if BMovement.doMoveToPosition({x = -461.5,y = 72.52,z = 586.48}) == true then
			if ActionList:IsReady() then
				BInteract.Interact(4303108944)
			else
				BInteract.SelectYes()
			end
		end
		return false
	end
	-- Il Mheg -> Lyhe Mheg 3
	if (_MaponTp == 892) and (p.localmapid == 816) then
		if BMovement.doMoveToPosition({x = -461.5,y = 72.52,z = 586.48}) == true then
			if ActionList:IsReady() then
				BInteract.Interact(4303108945)
			else
				BInteract.SelectYes()
			end
		end
		return false
	end
	-- Foundation -> Diadem 2
	if (_MaponTp == 886) and (p.localmapid == 418) then
		if BMovement.doMoveToPosition({x = -64.72,y = 8.2,z = 38.02}) == true then
			if ActionList:IsReady() then
				BInteract.Interact(4300844667)
			else
				BInteract.SelectConversation(1)
			end
		end
		return false
	end
	-- Isgard -> Contreforts (Marché)
	if (_MaponTp == 419) and (p.localmapid == 418) then
		return BMovement.doSpeMoveWithUrban(419, 4300844667, {x = -58.38, y = 8.11, z = 40.97}, 4)
	end
	-- Limsa Entrepont -> Limsa Tillac (Guilde Aventurier)
	if (_MaponTp == 128) and (p.localmapid == 129) then
		return BMovement.doSpeMoveWithUrban(128, 4298661156, {x = -82.26, y = 18.90, z = -4.17}, 0)
	end
	-- Limsa -> Brumée
	if (_MaponTp == 339) and (p.localmapid == 129) then
		return BMovement.doSpeMoveToLogement(339, 4298661156, {x = -82.26, y = 18.90, z = -4.17}, _sector)
	end
	-- Gridania New -> Gridania Old
	if (_MaponTp == 133) and (p.localmapid == 132) then
		return BMovement.doSpeMoveWithUrban(133, 4298660948, {x = 33.25, y = 2.20, z = 32.85}, 5)
	end
	-- Gridania -> Lavendière
	if (_MaponTp == 340) and (p.localmapid == 132) then
		return BMovement.doSpeMoveToLogement(340, 4298660948, {x = 33.25, y = 2.20, z = 32.85}, _sector)
	end
	-- Ulda -> Coupe
	if (_MaponTp == 341) and (p.localmapid == 130) then
		return BMovement.doSpeMoveToLogement(341, 4298852333, {x = -139.8, y = -3.15, z = -171.7}, _sector)
	end
	-- Ulda -> Ulda 2
	if (_MaponTp == 131) and (p.localmapid == 130) then
		return BMovement.doSpeMoveWithUrban(131, 4298852333, {x = -139.8, y = -3.15, z = -171.7}, 5)
	end
	-- Kugane -> Bazar Rubis
	if (_MaponTp == 639) and (p.localmapid == 628) then
		if BMovement.doMoveToPosition({x = 149.46,y = 14.78,z = 93.81}) == true then
			if ActionList:IsReady() then
				BInteract.Interact(4301841345)
			else
				BInteract.SelectYes()
			end
		end
		return false
	end
	-- Kugane -> Shirogame
	if (_MaponTp == 641) and (p.localmapid == 628) then
		return BMovement.doSpeMoveToLogement(641, 4301873080, {x = 45.48, y = 4.59, z = -33.36}, _sector)
	end
	-- Quartier Doma -> Gangos
	if (_MaponTp == 915) and (p.localmapid == 759) then
		if not BMovement.UseMount() then
			if Distance3D(Player.pos.x, Player.pos.y, Player.pos.z, 127.28, -4.18, 98.68) >= 20 then
				BMovement.doMount(true)
				return false
			end
		end
		if BMovement.doMoveToPosition({x = 127.28,y = -4.18,z = 98.68}) == true then
			if ActionList:IsReady() then
				BInteract.Interact(4303243595)
			else
				BInteract.SelectYes()
			end
		end
		return false
	end
	-- Not Good Map
	p:Teleport(_AethId)
	return false
end

function BMovement.IsSpeMapID(_mapontp)
	local SpeMap = {128, 131, 133, 399, 341, 340, 339, 419, 463, 639, 641, 886, 890, 891, 892, 915}
	for id, e in pairs(SpeMap) do
		if e == _mapontp then
			return true
		end
	end
	return false
end

function BMovement.doTp(_MaponTp, _AethId, _sector)
	BDebug.Log("BMovement - doTp", 2)
	local Quest = BQuest.GetCurrentQuest()
	if Quest ~= nil then
		if (BVariable.GetMapID() ~= 0) and (BVariable.GetAethID() ~= 0) then
			_MaponTp = BVariable.GetMapID()
			_AethId = BVariable.GetAethID()
		end
	end
	if not _AethId then
		_AethId = BVariable.GetAethIdByMap(_MaponTp)
	end
	if (_AethId ~= nil) then
		local p = Player
		if table.valid(p) then
			if ActionList:IsCasting() == true then
				BDebug.Log("BMovement - doTp - In Cast", 3)
				return false
			else
				if (_MaponTp ~= nil) then
					if BMovement.IsSpeMapID(_MaponTp) == true then
						BDebug.Log("BMovement - doTp SpeMove", 3)
						return BMovement.doSpeMove(_MaponTp, _AethId, _sector)
					end
					if _MaponTp == p.localmapid then
						BDebug.Log("BMovement - doTp Finish", 3)
						VMovement.Tmp = false
						return true
					else
						BDebug.Log("BMovement - doTp ".._AethId, 3)
						p:Teleport(_AethId)
						return false
					end
				else
					BDebug.Log("BMovement - doTp ".._AethId, 3)
					p:Teleport(_AethId)
					return true
				end
			end
		end
		BDebug.Log("BMovement - doTp - Player == nil", 1)
		return false
	end
	BDebug.Log("BMovement - doTp - Error Argument", 1)
	return false
end
	-------- End Teleport ---------

	-------- Mount ---------
function BMovement.NeedMount(_Findid)
	BDebug.Log("BMovement - NeedMount", 2)
	if _Findid ~= nil then
		local el = EntityList("targetable,maxdistance=120")
		if table.valid(el) then
			for id, e in pairs(el) do
				if e.contentid == _Findid or e.id == _Findid then
					if e.distance < 40 then
						BDebug.Log("BMovement - NeedMount", 3)
						return false
					end
					if e.distance < 50 then
						BAction.UseAction(5, 4)
						BDebug.Log("BMovement - NeedMount", 3)
						return false
					end
				end
			end
		end
	end
	return true
end

function BMovement.CanUseMount()
	BDebug.Log("BMovement - CanUseMount", 2)
	local MountList = BVariable.Get_MountList()
	local MountAction = ActionList:Get(13, MountList[BVariable.Get_MountIndex()][2])
	if MountAction ~= nil then
		BDebug.Log("BMovement - CanUseMount return IsReady", 3)
		return MountAction:IsReady()
	else
		BDebug.Log("BMovement - CanUseMount - MountAction == nil", 1)
		return false
	end
end

function BMovement.UseMount()
	BDebug.Log("BMovement - UseMount", 2)
	local p = Player
	if table.valid(p) then
		BDebug.Log("BMovement - UseMount return", 3)
		return p.ismounted
	end
	BDebug.Log("BMovement - UseMount - Player == nil", 1)
	return false
end

function BMovement.IsFlying()
	BDebug.Log("BMovement - IsFlying", 2)
	local p = Player
	if table.valid(p) then
		BDebug.Log("BMovement - IsFlying return", 3)
		return p.flying.isflying
	end
	BDebug.Log("BMovement - IsFlying - Player == nil", 1)
	return false	
end

function BMovement.CheckMount()
	local MountList = BVariable.Get_MountList()
	local MountSelected = MountList[BVariable.Get_MountIndex()][2]
	local MountAction = ActionList:Get(13, MountSelected)
	if MountAction:IsReady() == false then
		MountAction = ActionList:Get(13, 1)
		d("BMovement - CheckMount - Mount not find")
	end
	return MountAction
end

function BMovement.doMount(_Mount)
	BDebug.Log("BMovement - doMount", 2)
	local p = Player
	if p.ismounted == _Mount then
		return true
	end
	-- Check Step
	local Step = BStep.GetCurrentStep()
	if Step ~= nil then
		if Step.CanUseMount == false then
			return true
		end
	end
	
	local MountAction = BMovement.CheckMount()
	if (MountAction ~= nil) and (table.valid(p)) then
		if BMovement.TargetIsNpcGate() then
			return true
		end
		if _Mount == true then
			if ActionList:IsCasting() == false then
				if MountAction:IsReady() == false and p.ismounted == false and BCommun.IsHotBarRdy() then
					BDebug.Log("BMovement - IsReady -> false", 3)
					return false
				end
				if p.ismounted == true then
					BDebug.Log("BMovement - ismounted -> true", 3)
					return true
				else
					if BCommun.IsHotBarRdy() then
						p:Stop()
						MountAction:Cast()
						BDebug.Log("BMovement - MountAction:Cast", 3)
						return false
					else
						if BUtility.Wait(20) then
							BDebug.Log("BMovement - Hot Bar not Rdy", 3)
							return true
						end
					end
				end
			else
				BDebug.Log("BMovement - IsCasting -> true", 3)
				return false
			end
		else
			if p.ismounted == true then
				MountAction:Cast()
				BDebug.Log("BMovement - MountAction:Cast", 3)
				return false
			end
			BDebug.Log("BMovement - _Mount -> false", 3)
			return true
		end
	else
		BDebug.Log("BMovement - doMount - MountAction or Player == nil", 1)
		return false
	end	
end
	-------- End Mount ---------

	-------- Utility ---------
function BMovement.ForceMovement()
	BDebug.Log("BMovement - ForceMovement", 2)
	local p = Player
	if table.valid(p) then
		p:Move(FFXIV.MOVEMENT.FORWARD)
	end
end

function BMovement.TakeSpeNpc(_indexString)
	if BCommun.IsControlOpen("SelectIconString") == true then
		BInteract.SelectConversation(_indexString)
		return
	end
	if BCommun.IsControlOpen("SelectYesno") == true then
		BInteract.SelectYes()
		return
	end
	return
end

function BMovement.TargetIsNpcGate()
	BDebug.Log("BMovement - TargetIsNpcGate", 2)
	local p = Player
	if table.valid(p) then
		local tar = p:GetTarget()
		if tar ~= nil then
			for id, e in pairs(BVariable.GetNpcGate()) do
				if (tar.contentid == e) or (tar.id == e) then
					BDebug.Log("BMovement - TargetIsNpcGate - Finded "..tar.name, 3)
					return true
				end
			end
		end
		BDebug.Log("BMovement - TargetIsNpcGate - Target nill", 3)
		return false
	end
	BDebug.Log("BMovement - TargetIsNpcGate - Error", 3)
	return false
end

function BMovement.TakeNpcGate()
	BDebug.Log("BMovement - TakeNpcGate", 2)
	local p = Player
	if table.valid(p) then
		local tar = p:GetTarget()
		if tar ~= nil then
			for id, e in pairs(BVariable.GetNpcGate()) do
				if (tar.contentid == e) or (tar.id == e) then
					BDebug.Log("BMovement - TakeNpcGate -> Take Gate", 3)
					Player:Stop()
					-- Got One
					VMovement.InGateNpc = true
					local List = {
						[1003584] = 2, -- Ile Ombrage
						[1005420] = 1, -- Nepto Dragon
					}
					if List[tar.contentid] then
						BMovement.TakeSpeNpc(List[tar.contentid])
					else
						BMovement.TakeSpeNpc(1)
					end
					BCommun.InsideDialog()
					BInteract.Interact(tar.id)
					return false
				end
			end
			BDebug.Log("BMovement - TakeNpcGate - Target Not Gate", 3)
			return true	
		end
		BDebug.Log("BMovement - TakeNpcGate - GetTarget == nil", 3)
		return true	
	end
	BDebug.Log("BMovement - TakeNpcGate - Player == nil", 1)		
	return true	
end

function BMovement.UseMeshBottox()
	BDebug.Log("BMovement - UseMeshBottox", 2)
	local p = Player
	if table.valid(p) then
		-- Spe Navigator
		if (BottoxManager.GetCurrentAddon() == Navigator) or (BottoxManager.GetCurrentAddon() == Poacher) then
			BDebug.Log("No Custom Mesh", 3)
			return true
		end
		-- Spe Pixie
		if DailiesPixie ~= nil then
			if DailiesPixie.ReturnActiveForDailiesManager() and (p.localmapid ~= 890) and (p.localmapid ~= 891) then
				return true
			end
		end
		-- Spe Qitari
		if DailiesQitari ~= nil then
			if DailiesQitari.ReturnActiveForDailiesManager() then
				return true
			end
		end
		-- Spe Dwarf
		if DailiesDwarf ~= nil then
			if DailiesDwarf.ReturnActiveForDailiesManager() then
				return true
			end
		end
		--
		local map = nil
		if p.localmapid ~= 622 then
			local MeshById = BVariable.GetMeshById_New()
			map = MeshById[p.localmapid]
		else
			local MeshById = BVariable.GetMeshById_New()
			map = MeshById[p.localmapid][1]
			if DailiesNamazu then
				if DailiesNamazu.ReturnActiveForDailiesManager() then
					local Quest = BQuest.GetCurrentQuest()
					if Quest then
						if (Quest.id == 3118) and (Quest.CurrentStep == 3) then
							map = MeshById[p.localmapid][2]
						end
					end
				end
			end
		end
		if BVariable.Get_MeshMove() then -- Spe Revolt mostly
			map = BVariable.Get_MeshMove()
		end
		if map then
			local FileName = ml_mesh_mgr.data.meshfile
			if FileName then
				if FileName ~= map then
					BDebug.Log("BMovement - UseMeshBottox -> Need Load Mesh == true", 3)
					BLoad.LoadBottoxMesh(map)
					return false
				else
					BDebug.Log("BMovement - UseMeshBottox -> Need Load Mesh == false", 3)
					return true
				end
			end
			BDebug.Log("BottoxLib : ml_mesh_mgr.data.meshfile == NILL", 1)
			return false
		else
			return true
		end
	end
	BDebug.Log("BMovement - UseMeshBottox - Player == nil", 1)
	return true
end

function BMovement.CheckBeforeMovement()
	BDebug.Log("BMovement - CheckBeforeMovement", 2)
	-- Check Bottox Mesh
	if BMovement.UseMeshBottox() == false then
		return false
	end
	-- Check Npc Gate
	if BMovement.TakeNpcGate() == false then
		return false
	end
	-- Check Mesh
	if NavigationManager:GetNavMeshState() ~= 1 then
		return false
	end
	VMovement.InGateNpc = false
	return true
end

function BMovement.StopMove()
	BDebug.Log("BMovement - StopMove", 2)
	local p = Player
	if table.valid(p) then
		p:Stop()
		BDebug.Log("BMovement - StopMove -> Player:Stop()", 3)
		return true
	else
		BDebug.Log("BMovement - StopMove - Player == nil", 1)	
		return false
	end
end
	-------- End Utility ---------

	-------- Move ---------
function BMovement.doMoveToPosition(_Position, _Radius, _enablecube)
	if BMovement.CheckBeforeMovement() == true then
		BDebug.Log("BMovement - doMoveToPosition", 2)
		if table.valid(_Position) then
			if _Position.x and _Position.y and _Position.z then
--				_Position = NavigationManager:GetClosestPointOnMesh(_Position)
				local p = Player
				if table.valid(p) then
	--				if (NavigationManager:IsReachable(_Position)) == true then
					if p.targetable == false then
						return false
					end
					-- Check Radius
					if _Radius == nil then
						_Radius = VMovement.RadiusMove
						if DailiesPixie ~= nil then
							if DailiesPixie.ReturnActiveForDailiesManager() then
								local Quest = BQuest.GetCurrentQuest()
								if table.valid(Quest) then
									if Quest.id == 3692 then
										_Radius = 2.9
									end
								end
							end
						end
						if p.diving.isdiving == true then
							BDebug.Log("BMovement - doMoveToPosition -> isdiving == true", 3)
							_Radius = VMovement.RadiusDiving
						end
						if p.flying.isflying == true then
							BDebug.Log("BMovement - doMoveToPosition -> isflying == true", 3)
							_Radius = VMovement.RadiusFlying
						end
					end
					-- Spe Revolt
					if table.valid(RevoltEngine) then
						--  and (Player.localmapid ~= 933)
						if RevoltEngine.GetAddonStarted() then
							local save = _Position
							_Position = NavigationManager:GetClosestPointOnMesh(_Position)
							if not table.valid(_Position) then
								_Position = save
							end
						end
					end
					--
					BDebug.Log("BMovement - doMoveToPosition -> "..Distance3D(p.pos.x, p.pos.y, p.pos.z, _Position.x, _Position.y, _Position.z).." and Radius -> ".._Radius, 3)
					if (Distance3D(p.pos.x, p.pos.y, p.pos.z, _Position.x, _Position.y, _Position.z) <= _Radius)
						or (Distance3D(p.pos.x, p.pos.y, p.pos.z, _Position.x, _Position.y, _Position.z) <= (_Radius * 2) and p:IsMoving() == false) then
						p:Stop()
						BDebug.Log("BMovement - doMoveToPosition -> Move Finish", 3)
						return true
					else
						BDebug.Log("BMovement - doMoveToPosition -> In Move", 3)
						local cube = 0
						if _enablecube then
							cube = 1
						end
						-- Spe Revolt
						if table.valid(RevoltEngine) then
							if RevoltEngine.GetAddonStarted() then
								NavigationManager:ResetPath()
							end
						end
						--
						p:MoveTo(_Position.x, _Position.y, _Position.z, nil, true, cube)
						return false
					end
				else
					BDebug.Log("BMovement - doMoveToPosition - Player == nil", 1)	
					return false
				end
			end
			BDebug.Log("BMovement - doMoveToPosition - Wrong Argument", 1)	
		end
	end
	return false
end

function BMovement.RadarForStep()
	-- Check Target
	local Target = BTarget.GetTarget()
	if Target ~= nil then
		return true
	end
	--------------
	local Step = BStep.GetCurrentStep()
	if (table.valid(Step.IdList)) then
		local M_Distance = 50
		if table.size(Step.IdList) > 1 then
			M_Distance = 110
		end
		for id, e in pairs(Step.IdList) do
			-- First Check
			local el = nil
			if (Step.Type == "Kill") or (Step.Type == "Kill-Aggro") or (Step.Type == "Boss") then
				el = BTarget.EntityByOption("alive,maxdistance="..tostring(M_Distance)..",contentid="..tonumber(e))
			else
				el = BTarget.EntityByOption("maxdistance="..tostring(M_Distance)..",contentid="..tonumber(e))
			end
			if (table.valid(el)) then
				-- Second Check
				el = nil
				M_Distance = 80
				if table.size(Step.IdList) > 1 then
					M_Distance = 125
				end
				if (Step.Type == "Kill") or (Step.Type == "Kill-Aggro") or (Step.Type == "Boss") then
					el = BTarget.EntityByOption("targetable,alive,attackable,maxdistance="..tostring(M_Distance)..",contentid="..tonumber(e))
				else
					el = BTarget.EntityByOption("targetable,maxdistance="..tostring(M_Distance)..",contentid="..tonumber(e))
				end
				if table.valid(el) then
					-- Entity Here
					local tar = nil
					for idq, eq in pairs (el) do
						if tar == nil then
							tar = eq
						else
							if tar.distance2d > eq.distance2d then
								tar = eq
							end
						end
					end
					BTarget.SetEntityInTarget(tar)
					return true
				else
					-- Entity Not Here
					table.remove(Step.IdList, id)
					return false
				end
			end
		end
		return false
	else
		-- Check Step Type
		if Step.Type == "KillPack" then
			return false
		end
		-- Target Not here -> Go Next Step
		return true
	end
end

function BMovement.doMoveBeforeStep()
	BDebug.Log("BMovement - doMoveBeforeStep", 2)
	local Step = BStep.GetCurrentStep()
	if Step ~= nil then
		-- Check Buy item
		if Step.Type == "BuyItem" then
			if BCommun.GotNbItem(Step.Id, (Step.Count / 2 )) == true then
				return true
			end
		end
		if Step.NeedMove == false then
			return true
		end
		-- Spe Mount Step (Amalj & Sylph)
		local NotUseCube = false
		if Step.Type == "Mount" then
			if DailiesAmal then
				if DailiesAmal.ReturnActiveForDailiesManager() then
					NotUseCube = true
				end
			end
			if DailiesSylph then
				if DailiesSylph.ReturnActiveForDailiesManager() then
					NotUseCube = true
				end
			end
		end
		-- Spe Sylph -> Invisible Buff
		if DailiesSylph then
			if DailiesSylph.ReturnActiveForDailiesManager() then
				if BAction.HaveBuff(404) or BAction.HaveBuff(416) then
					NotUseCube = true
				end
			end
		end
		--
		if BMovement.RadarForStep() == true then
			-- Check Target
			local Target = BTarget.GetTarget()
			if Target ~= nil then
				-- Target Here
				-- Set Target
				if not Step.Type == "Boss" then
					BTarget.SetTarget()
				end
				-- Check Kill
				if (Step.Type == "Kill") or (Step.Type == "Kill-Aggro") or (Step.Type == "Boss") then
					if Step.NeedMoveToEntity then
						if BUtility.CanAttack(Target.id) == true then
							BMovement.StopMove()
							return true
						end
					end
				end
				if BMovement.CanUseMount() then
					if not BMovement.UseMount() then
						if not BMovement.doMount(BMovement.NeedMount(Target.id)) then
							BDebug.Log("BMovement - doMoveBeforeStep -> Wait Mount ON", 3)
							return false
						end
					end
				end
				-- Check Var.Step.NeedMoveToEntity
				if Step.NeedMoveToEntity == true then
					BDebug.Log("BMovement - doMoveBeforeStep -> Move to Target", 3)
					local position = Target.pos
					if not Player.diving.isdiving then
						position = NavigationManager:GetClosestPointOnMesh(Target.pos)
					end
					return BMovement.doMoveToPosition(position, nil, NotUseCube)
				else
					BDebug.Log("BMovement - doMoveBeforeStep -> Move To Position 1", 3)
					return BMovement.doMoveToPosition(Step.Position, nil, NotUseCube)
				end
			else
				-- No Target Here -> Go Next Step
				if Step.Type ~= "Boss" then
					BMovement.StopMove()
				end
				Step.Finish = true
				BDebug.Log("BMovement - doMoveBeforeStep -> Entity Not Here -> Next Step", 3)
				return true
			end
		else
			local Radius = nil
			if Step.Type == "KillPack" then
				Radius = 1.2
			end
			if BMovement.CanUseMount() then
				if BMovement.doMount(true) == true then
					BDebug.Log("BMovement - doMoveBeforeStep -> Move To Position 2", 3)
					return BMovement.doMoveToPosition(Step.Position, Radius, NotUseCube)
				else
					BDebug.Log("BMovement - doMoveBeforeStep -> Wait Mount", 3)
					return false
				end
			else
				BDebug.Log("BMovement - doMoveBeforeStep -> Move To Position 3", 3)
				return BMovement.doMoveToPosition(Step.Position, Radius, NotUseCube)
			end
		end
	else
		BDebug.Log("BMovement - doMoveBeforeStep - Var.Step == nil", 1)	
		return false
	end
end
