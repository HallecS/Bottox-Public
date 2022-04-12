Bottox_Sastasha = {}

local Variable = {
	Duty_Info = {
		Name = "Sastasha",
		Icone_Name = "Sastasha",
		--
		Type = 1, -- 1 = Dungeon / 2 = Trial / 3 = Raid / 4 = Guildhest
		Version = 1, -- 1 = ARR / 2 = HW / 3 = SB
		--
		Tag_Type = 2,
		Tag_Id = 4,
		--
		BossList = {
			{id = 1204, range = 33},
			{id = 1206, range = 28},
		},
		ChestBoss = 93,
		--
		Exit = 2000139,
		Timer = 5400,
		-- Inside Duty
		Prio_Target = nil,
	},	
	Data_Normal = {
		StartAtObjectif = 1,
		Objectif = {
			[1] = { 		
					"(KP):(M):308.85:46.59:-165.54:19:1:", -- Kill Pack
					"(KP):(M):259.76:46.99:-196.25:15:1:", -- Kill Pack															
					"(KP):(M):225.82:43.20:-187.17:19:1:", -- Kill Pack			
					"(KP):(M):200.42:27.33:-96.66:17:1:", -- Kill Pack
					"(KP):(M):161.82:31.19:-130.07:18:1:", -- Kill Pack				
					"(KP):(M):156.57:28.40:-74.55:15:0:", -- Kill Pack	
					"(KP):(M):128.89:26.27:-75.18:15:3:", -- Kill Pack	
					"(KP):(M):128.48:28.17:-98.63:17:0:", -- Kill Pack	
					"(TC):(M):130.54:27.89:-99.45:98:", -- Chest 2 - Eau Sastasha
					"(KP):(M):107.06:28.26:-66.36:15:3:", -- Kill Pack		
					"(KP):(M):97.97:26.83:-66.88:15:0:", -- Kill Pack					
					"(I):(MS):65.93:31.57:-55.41:2000215:", -- Corail Vert
					"(I):(MS):87.08:28.93:-41.96:2000214:", -- Corail Rouge
					"(I):(MS):75.57:32.41:-33.92:2000213:", -- Corail Bleu
			},
			[2] = { 
					"(W):(S):4:20000000:", -- Wait Chect Boss
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(I):(M):64.66:32.71:-32.48:2000216:", -- Interrupteur
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(I):(M):64.66:32.71:-32.48:2000216:", -- Interrupteur
			},
			[3] = { 
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(KP):(M):28.70:23.99:-5.66:15:1:", -- Kill Pack
					"(KP):(M):4.93:23.77:5.83:15:3:", -- Kill Pack										
					"(KP):(M):-26.04:22.61:56.43:25:3:", -- Kill Pack
					"(KP):(M):-31.40:23.72:58.69:25:0:", -- Kill Pack				
					"(W):(S):2:20000000:", -- Wait Chect Boss	
					"(KP):(M):-23.69:22.32:56.04:25:1:", -- Kill Pack		
			},
			[4] = { 
					"(W):(S):2:20000000:", -- Wait Chect Boss
					"(TC):(M):-31.35:23.74:59.32:95:", -- Chest Boss
					"(KP):(M):-92.48:15.60:124.75:10:3:", -- Kill Key					
					"(KP):(M):-97.08:13.91:150.31:13:0:", -- Kill Key	
					"(W):(S):2:20000000:", -- Wait Pop Key		
					"(T):(M):-94.49:15.60:129.86:2000250:", -- Key 1							
					"(KP):(M):-95.54:13.85:146.29:15:0:", -- Kill Key
					"(W):(S):2:20000000:", -- Wait Pop Key			
					"(T):(M):-95.78:13.85:146.18:2000250:", -- Key 1
					"(KP):(M):-95.24:19.14:166.70:10:0:", -- Kill Pack
					"(I):(M):-95.17:19.59:169.89:2000227:", -- Porte Capitaine
					"(KP):(M):-94.99:20.01:192.78:10:0:", -- Kill Pack
					"(W):(S):3:20000000:", -- Wait Pop Key
					"(I):(M):-94.99:20.01:192.78:2000255:", -- Key 1
			},
			[5] = { 
					"(KP):(M):-125.44:15.30:154.77:15:3:", -- Kill Pack
					"(KP):(M):-128.31:15.82:155.86:15:0:", -- Kill Pack
					"(I):(M):-129.0:16.00:156.22:2000231:", -- Porte bourlinqueurs
					"(KP):(M):-183.82:6.50:247.46:15:3:", -- Kill Pack Capitaine
					"(KP):(M):-165.28:6.57:247.81:20:0:", -- Kill Pack Capitaine				
					"(W):(S):2:20000000:", -- Wait Pop Key
					"(TC):(M):-185.8:6.85:250.32:96:", -- Chest Boss
					"(KP):(M):-240.68:5.58:257.82:15:0:", -- Kill Pack Capitaine				
					"(KP):(M):-266.31:5.57:266.00:15:3:", -- Kill Pack Capitaine
					"(KP):(M):-275.12:5.58:263.59:15:3:", -- Kill Pack Capitaine
					"(KP):(M):-277.35:5.56:265.01:15:3:", -- Kill Pack Capitaine		
					"(KP):(M):-298.6:5.58:271.36:20:3:", -- Kill Pack							
					"(KP):(M):-298.6:5.58:271.36:20:0:", -- Kill Pack
					"(BO):(M):-310.0:5.58:295.34:1206:", -- Kill Boss		
					"(W):(S):3:20000000:", -- Wait Pop Key
					"(BO):(M):-310.0:5.58:295.34:1206:", -- Kill Boss	
			},
		},
	},
	Data_Speed = {
		StartAtObjectif = 1,
		Objectif = {
			[1] = { 
					"(KP):(M):327.21:44.26:-213.11:15:3:", -- Kill Pack	
					"(KP):(M):325.90:44.28:-211.21:15:0:", -- Kill Pack	
					"(KP):(M):310.47:46.44:-165.51:19:3:", -- Kill Pack			
					"(KP):(M):272.65:45.73:-204.25:15:3:", -- Kill Pack	
					"(KP):(M):259.76:46.99:-196.25:15:0:", -- Kill Pack		
					"(KP):(M):262.89:46.36:-197.48:15:3:", -- Kill Pack														
					"(KP):(M):225.82:43.20:-187.17:19:0:", -- Kill Pack
					"(KP):(M):197.39:32.62:-121.73:17:3:", -- Kill Pack				
					"(KP):(M):200.42:27.33:-96.66:17:1:", -- Kill Pack
					"(KP):(M):162.70:26.70:-116.19:17:1:", -- Kill Pack	
					"(KP):(M):161.82:31.19:-130.07:10:1:", -- Kill Pack				
					"(KP):(M):156.57:28.40:-74.55:15:1:", -- Kill Pack	
					"(KP):(M):128.89:26.27:-75.18:15:3:", -- Kill Pack	
					"(KP):(M):128.48:28.17:-98.63:17:0:", -- Kill Pack	
					"(TC):(M):130.54:27.89:-99.45:98:", -- Chest 2 - Eau Sastasha
					"(KP):(M):128.25:27.67:-60.53:15:3:", -- Kill Pack					
					"(KP):(M):107.06:28.26:-66.36:15:3:", -- Kill Pack		
					"(KP):(M):97.97:26.83:-66.88:15:0:", -- Kill Pack					
					"(I):(MS):65.93:31.57:-55.41:2000215:", -- Corail Vert
					"(I):(MS):87.08:28.93:-41.96:2000214:", -- Corail Rouge
					"(I):(MS):75.57:32.41:-33.92:2000213:", -- Corail Bleu	
			},
			[2] = { 
					"(W):(S):4:20000000:", -- Wait Chect Boss
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(I):(M):64.66:32.71:-32.48:2000216:", -- Interrupteur
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(I):(M):64.66:32.71:-32.48:2000216:", -- Interrupteur
			},
			[3] = { 
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(KP):(M):28.70:23.99:-5.66:15:1:", -- Kill Pack
					"(KP):(M):4.93:23.77:5.83:15:3:", -- Kill Pack										
					"(KP):(M):-26.04:22.61:56.43:25:3:", -- Kill Pack
					"(KP):(M):-31.40:23.72:58.69:25:0:", -- Kill Pack				
					"(W):(S):2:20000000:", -- Wait Chect Boss	
					"(KP):(M):-23.69:22.32:56.04:25:1:", -- Kill Pack			
			},
			[4] = { 
					"(W):(S):2:20000000:", -- Wait Chect Boss
					"(TC):(M):-31.35:23.74:59.32:95:", -- Chest Boss
					"(KP):(M):-92.48:15.60:124.75:10:1:", -- Kill Key					
					"(KP):(M):-97.08:13.91:150.31:13:0:", -- Kill Key	
					"(W):(S):2:20000000:", -- Wait Pop Key		
					"(T):(M):-94.49:15.60:129.86:2000250:", -- Key 1							
					"(KP):(M):-95.54:13.85:146.29:15:0:", -- Kill Key
					"(W):(S):2:20000000:", -- Wait Pop Key			
					"(T):(M):-95.78:13.85:146.18:2000250:", -- Key 1
					"(KP):(M):-95.24:19.14:166.70:10:0:", -- Kill Pack
					"(I):(M):-95.17:19.59:169.89:2000227:", -- Porte Capitaine
					"(KP):(M):-94.99:20.01:192.78:10:0:", -- Kill Pack
					"(W):(S):3:20000000:", -- Wait Pop Key
					"(I):(M):-94.99:20.01:192.78:2000255:", -- Key 1
			},
			[5] = { 
					"(KP):(M):-125.44:15.30:154.77:15:3:", -- Kill Pack
					"(KP):(M):-128.31:15.82:155.86:15:0:", -- Kill Pack
					"(I):(M):-129.0:16.00:156.22:2000231:", -- Porte bourlinqueurs
					"(KP):(M):-183.82:6.50:247.46:15:3:", -- Kill Pack Capitaine
					"(KP):(M):-165.28:6.57:247.81:20:0:", -- Kill Pack Capitaine				
					"(W):(S):2:20000000:", -- Wait Pop Key
					"(TC):(M):-185.8:6.85:250.32:96:", -- Chest Boss
					"(KP):(M):-240.68:5.58:257.82:15:3:", -- Kill Pack Capitaine				
					"(KP):(M):-269.57:5.61:264.76:15:0:", -- Kill Pack Capitaine
					"(KP):(M):-275.12:5.58:263.59:15:3:", -- Kill Pack Capitaine
					"(KP):(M):-277.35:5.56:265.01:15:0:", -- Kill Pack Capitaine	
					"(KP):(M):-298.6:5.58:271.36:20:3:", -- Kill Pack								
					"(KP):(M):-298.6:5.58:271.36:20:0:", -- Kill Pack
					"(BO):(M):-310.0:5.58:295.34:1206:", -- Kill Boss		
					"(W):(S):3:20000000:", -- Wait Pop Key
					"(BO):(M):-310.0:5.58:295.34:1206:", -- Kill Boss	
			},
		},
	},
	Data_Unsync = {
		StartAtObjectif = 1,
		Objectif = {
			[1] = { -- Activer mécanismes coraux
					"(KP):(M):128.48:28.17:-98.63:15:0:", -- Kill Pack	
					"(W):(S):3:20000000:", -- Wait
					"(TC):(M):130.54:27.89:-99.45:98:", -- Chest 2 - Eau Sastasha
					"(KP):(M):95.78:26.66:-68.14:15:0:", -- Kill Pack					
					"(I):(MS):65.93:31.57:-55.41:2000215:", -- Corail Vert
					"(I):(MS):87.08:28.93:-41.96:2000214:", -- Corail Rouge
					"(I):(MS):75.57:32.41:-33.92:2000213:", -- Corail Bleu
				},
			[2] = { -- Ouvrir porte cachée
					"(I):(M):64.66:32.71:-32.48:2000216:", -- Interrupteur
					"(W):(S):5:20000000:", -- Wait Chect Boss
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(I):(M):64.66:32.71:-32.48:2000216:", -- Interrupteur
				},
			[3] = { -- Trouver capitaine pirate
					"(W):(S):5:20000000:", -- Wait Chect Boss
					"(TC):(M):64.66:32.71:-32.48:94:", -- Chest Boss
					"(KP):(M):28.70:23.99:-5.66:10:1:", -- Kill Pack
					"(KP):(M):-23.69:22.32:56.04:10:1:", -- Kill Pack
				},
			[4] = { -- Obtenir clé bourlingueurs
					"(W):(S):5:20000000:", -- Wait Chect Boss
					"(TC):(M):-31.35:23.74:59.32:95:", -- Chest Boss
					"(KP):(M):-86.68:15.60:116.86:15:0:", -- Kill Key				
					"(KP):(M):-95.54:13.85:146.29:15:0:", -- Kill Key
					"(W):(S):2:20000000:", -- Wait Pop Key
					"(T):(M):-88.53:15.60:122.94:2000250:", -- Key 1				
					"(T):(M):-95.78:13.85:146.18:2000250:", -- Key 1
					"(KP):(M):-95.24:19.14:166.70:10:0:", -- Kill Pack
					"(I):(M):-95.17:19.59:169.89:2000227:", -- Porte Capitaine
					"(KP):(M):-94.99:20.01:192.78:10:0:", -- Kill Pack
					"(W):(S):4:20000000:", -- Wait Pop Key
					"(I):(M):-94.99:20.01:192.78:2000255:", -- Key 1
				},
			[5] = { -- Vaincre Denn dent-d'orque
					"(KP):(M):-124.7:15.20:154.05:15:0:", -- Kill Pack
					"(I):(M):-129.0:16.00:156.22:2000231:", -- Porte bourlinqueurs
					"(KP):(M):-182.1:6.31:243.56:15:0:", -- Kill Pack Capitaine
					"(W):(S):2:20000000:", -- Wait Pop Key
					"(TC):(M):-185.8:6.85:250.32:96:", -- Chest Boss
					"(KP):(M):-229.3:6.25:263.60:15:0:", -- Kill Pack Capitaine
					"(KP):(M):-256.1:7.87:270.29:15:0:", -- Kill Pack Capitaine
					"(KP):(M):-298.6:5.58:271.36:20:0:", -- Kill Pack
					"(BO):(M):-310.0:5.58:295.34:1206:", -- Kill Boss	
					"(W):(S):4:20000000:", -- Wait Pop Key	
					"(BO):(M):-310.0:5.58:295.34:1206:", -- Kill Boss	
			},
		},
	},
	Data_Squadron = nil,
 	Data_Trust = nil,
 	Data_Boss_Squadron = nil,
	Data_Boss_Trust = nil,
	Data_Boss_Duty = {
		[1206] = { -- Boss Sastasha 2
			Id = 1206,
			BossHp = 5869,
			Wait_A = {x = -314.13, y = 5.58, z = 306.07},
			Wait_B = {x = -316.91, y = 5.58, z = 301.42},
			Phase = {
				[1] = {
					StartPhase = {Type = "Init", Formation = "Normal"},
					FinishPhase = nil,
					--
					Engage_Pos = {x = -333.26, y = 5.58, z = 317.71}, -- Tank & Solo Position
					Aoe = {
					   	[556] = { -- Sastasha cone
	 						Type = "GoTargetSide",
	 						WaitBeforeReturn = 0,
	 						ReturnPositionAfter = false,
	 						DistanceMax = 7,
	  						Range = 3,
							FinishAfter = true,
	 					},
					},
				},
			},
		},
	},
}

function Bottox_Sastasha.Get_Info()
	return Variable.Duty_Info
end

function Bottox_Sastasha.Get_Data_Normal()
	return Variable.Data_Normal
end

function Bottox_Sastasha.Get_Data_Speed()
	return Variable.Data_Speed
end

function Bottox_Sastasha.Get_Data_Unsync()
	return Variable.Data_Unsync
end

function Bottox_Sastasha.Get_Data_Squadron()
	return Variable.Data_Squadron
end

function Bottox_Sastasha.Get_Data_Trust()
	return Variable.Data_Trust
end

function Bottox_Sastasha.Get_Boss_Duty()
	return Variable.Data_Boss_Duty
end

function Bottox_Sastasha.Get_Boss_Squadron()
	return Variable.Data_Boss_Squadron
end

function Bottox_Sastasha.Get_Boss_Trust()
	return Variable.Data_Boss_Trust
end
