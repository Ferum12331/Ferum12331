game.AddParticles("particles/DRG_TVTITAN_UPGR_SKBT.pcf")
 
  
local particlename = {
		"DRG_SKBT_TITITAN_UPGR_CHARGE",
		"DRG_SKBT_TITITAN_UPGR_STREAM",
		"DRG_SKBT_TVTITAN_UPGR_CORE"
	}
for _,v in ipairs(particlename) do PrecacheParticleSystem(v) end
 
game.AddParticles("particles/DRG_SKBT_TVSTRIDER_UPGR.pcf")
 
  
local particlename = {
		"DRG_SKBT_TVSTRIDER_BEAM",
		"DRG_SKBT_TVSTRIDER_CANNONSHOT",
		"DRG_SKBT_TVSTRIDER_CANNONSHOT_proj",
		"DRG_SKBT_TVSTRIDER_CANNONSHOT_proj_exp",
		"DRG_SKBT_TVSTRIDER_JETTRAIL",
		"DRG_SKBT_TVSTRIDER_TVSKILL",
		"DRG_SKBT_TVSTRIDER_BEAM_IMPACT"

		
	}
for _,v in ipairs(particlename) do PrecacheParticleSystem(v) end
 

if not DrGBase then return end -- return if DrGBase isn't installed
ENT.Base = "drgbase_nextbot" -- DO NOT TOUCH (obviously)

-- Misc --
ENT.PrintName = "Titan TV Man (Upgraded)"
ENT.Category = "Skibidi Toilet (Alliance)"
ENT.Models = {"models/SKBT_TV_TITAN_UPGR_V2.mdl"}
ENT.Skins = {0}
ENT.ModelScale = 1
ENT.BloodColor = BLOOD_COLOR_MECH
ENT.RagdollOnDeath = true
ENT.SNPCClass = "C_TV"

ENT.SightRange = 40000
ENT.Omniscient = true

ENT.CollisionBounds = Vector(285, 285, 1035)
ENT.StepHeight = 110
 


//ENT.OnIdleSounds
 
ENT.MaxYawRate = 120
-- Weapons --
ENT.Weapons = {""}
ENT.WeaponAccuracy = 0.01

ENT.HealthRegen = 3400

-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)

-- Stats --
ENT.FallDamage = false

-- AI --
ENT.RangeAttackRange = 12000
ENT.MeleeAttackRange = 660

ENT.ReachEnemyRange = 30

//ENT.AvoidEnemyRange = 0
ENT.SpotDuration = 10

 

ENT.Factions = { "FACTION_CAMERAMAN" }
ENT.Frightening = false
ENT.AllyDamageTolerance = 0.001
ENT.AfraidDamageTolerance = 0.02
ENT.NeutralDamageTolerance = 0.1

 
ENT.AvoidEnemyRange = 0
ENT.AvoidAfraidOfRange = 2500
ENT.WatchAfraidOfRange = 2750
 

-- Movements/animations --
ENT.UseWalkframes = false

ENT.SpawnHealth = 7000000
ENT.WalkSpeed = 800
ENT.RunSpeed = 800

 
 
ENT.IdleAnimRate = 1

ENT.JumpHeight = math.random(9500, 14000)
 
ENT.WalkAnimation = ACT_WALK
ENT.WalkAnimRate = 1
ENT.RunAnimation = ACT_RUN
ENT.RunAnimRate = 1
ENT.IdleAnimation = ACT_IDLE
ENT.IdleAnimRate = 0.5
ENT.JumpAnimation = ACT_JUMP

ENT.JumpAnimRate = 1

ENT.OnSpawnSounds = {""}
ENT.OnIdleSounds = {""}
ENT.IdleSoundDelay = 2

ENT.Acceleration = 3000

ENT.OnDamageSounds = {""}
					
 
ENT.OnDeathSounds = {""}
ENT.OnDownedSounds = {}
ENT.Footsteps = {}

-- Climbing --
ENT.ClimbLadders = false
ENT.CanUseArm = true

-- Weapons --
ENT.UseWeapons = false
ENT.DropWeaponOnDeath = false
ENT.AcceptPlayerWeapons = false

-- Detection --
ENT.EyeBone = "spine.018"
 

ENT.EyeOffset = Vector(0, 0, 0)
 
-- Possession --
ENT.PossessionEnabled = true
ENT.PossessionMovement = POSSESSION_MOVE_1DIR
ENT.PossessionViews = {
	{
	  offset = Vector(0, 0, 10),
	  distance = 1500
	}
}
   
 
 



ENT.PossessionBinds = {
  [IN_ATTACK] = {{
    coroutine = true,
    onkeydown = function(self)
		self:PlaySequenceAndMove("Attack "..math.random(1,8), 1,function(self,cycle) end)		 
    end
  }},
  [IN_ATTACK2] = {{
    coroutine = true,
    onkeydown = function(self)
    	if (not (IsValid(self.TVup_ent)&&IsValid(self.TVr_ent)&&IsValid(self.TVl_ent)) ) then
				self:PlaySequenceAndMove("Skill 1", 0.6,function(self,cycle) end)	
			end
    end
  }},
  [IN_RELOAD] = {{
    coroutine = true,
    onkeydown = function(self)
		self:PlaySequenceAndMove("Skill 2", 0.5,function(self,cycle) end)	
    end
  }},
  [KEY_G] = {{
  	coroutine = true,
  	onbuttonpressed = function(self)
  		self:SpawnArm()
  	end
  }},
  [IN_JUMP] = {{
    coroutine = false,
    onkeydown = function(self)	
		self:Jump()
    end
  }},
  [KEY_H] = {{
  	coroutine = true,
  	onbuttonpressed = function(self)
  		self:SpawnTVUp()
  	end
  }},
  [KEY_J] = {{
  	coroutine = true,
  	onbuttonpressed = function(self)
  		self:SpawnTVr()
  	end
  }},
  [KEY_K] = {{
  	coroutine = true,
  	onbuttonpressed = function(self)
  		self:SpawnTVl()
  	end
  }}
}
if SERVER then

function ENT:OnSpawn()
	 local efpos = Vector(250,0,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,120,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,-120,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,220,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-220,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,220,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-220,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,120,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-120,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,0,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,120,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-120,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,0,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(250,220,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,-220,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,120,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,-120,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,0,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(250,220,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,-220,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,120,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,-120,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(250,0,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(180,220,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-220,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,120,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-120,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,0,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(180,220,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-220,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,120,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-120,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,0,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
		 local efpos = Vector(180,120,-550)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,-120,-550)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(180,0,-550)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(90,370,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(90,-370,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(90,370,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(90,-370,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(90,370,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(90,-370,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(90,370,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(90,-370,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(-250,0,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,120,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,-120,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,220,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-220,0)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,220,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-220,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,120,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-120,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,0,150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,120,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-120,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,0,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(-250,220,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,-220,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,120,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,-120,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,0,-150)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(-250,220,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,-220,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,120,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,-120,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-250,0,-250)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(-180,220,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-220,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,120,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-120,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,0,-350)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(-180,220,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-220,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,120,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-120,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,0,-450)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	local efpos = Vector(-180,120,-550)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,-120,-550)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-180,0,-550)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-60,120,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-60,-120,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-60,0,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-60,-320,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	 local efpos = Vector(-60,320,210)
			efpos:Rotate(self:GetAngles())
			local effect = ents.Create("info_particle_system")
			effect:SetKeyValue("effect_name","[1]big_smoke")
			effect:SetPos(self:GetAttachment(self:LookupAttachment("core")).Pos + efpos )
			effect:SetParent(self, self:LookupAttachment("core"))
			effect:Fire("SetParentAttachment")
			effect:Spawn()
			effect:SetLocalAngles(Angle(0,-90,0))
			effect:Activate()
			effect:Fire("Start","",0)
			effect:Fire("Kill","",5)
	self:EmitSound("tvtit_upgr/teleport2.wav", 150, 70, 1) 
	self:EmitSound("tvtit_upgr/tvspeak1.wav", 150, 100, 1) 	
	self:Timer(6, function()
		self:EmitSound("tvtit_upgr/tvspeak2.wav", 150, 110, 1) 
	end)
	self:Timer(7, function()
		self:PlaySequence("attack 1", 0.5,self.FaceEnemy)
	end)
end
function ENT:SpawnArm(apos,aang) 
	if not isvector(apos) then apos = self:GetPos()+self:GetForward()*self:OBBMaxs().x*4 end
	if not isangle(aang) then aang = self:GetAngles()+Angle(0,-180,0) end
	if not self.CanUseArm then return end
	if not isvector(apos) then return end
	local sarm = ents.Create("ent_drg_titantvman_arm")
	sarm:SetPos(apos)
	sarm:SetAngles(aang)
	sarm:SetOwner(self)
	sarm:SetDrGOwner(self)
	sarm:Spawn()
		self.CanUseArm = false
		local seffect = ents.Create("info_particle_system")
		seffect:SetKeyValue("effect_name","[1]big_smoke")
		seffect:SetPos(self:GetBonePosition(11))
		seffect:SetParent(self)
		seffect:Spawn()
		seffect:Activate()
		seffect:Fire("Start","",0)
		self:ManipulateBoneScaleSeq(11,Vector(0,0,0))
		self:EmitSound("tvtit_upgr/teleport2.wav", 150, 90, 1) 
	sarm:CallOnRemove("ArmDiedunu", function(ent)
		seffect:Fire("Kill","",0)
		self.CanUseArm = true
		self:ManipulateBoneScaleSeq(11,Vector(1,1,1))
	end)
end

function ENT:SpawnTVUp()
	if IsValid(self.TVup_ent) then return end
	self.TVup_ent = ents.Create("npc_gianttv")
	local bpos, bang = self:GetBonePosition(self:LookupBone("ValveBiped.Bip01_Head1"))
	self.TVup_ent:SetPos(bpos)
	self.TVup_ent:SetAngles(self:GetAngles())
	self.TVup_ent:SetOwner(self)
	self.TVup_ent:Spawn()
	self:SetBodygroup(0, 1)
	if IsValid(self.MyComponents[1].entity) then
				self.MyComponents[1].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[2].entity) then
				self.MyComponents[2].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[3].entity) then
				self.MyComponents[3].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[4].entity) then
				self.MyComponents[4].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[5].entity) then
				self.MyComponents[5].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[6].entity) then
				self.MyComponents[6].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[7].entity) then
				self.MyComponents[7].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	self:SetEntityRelationship(self.TVup_ent, D_LI, 99)
	self:DeleteOnRemove(self.TVup_ent)
	self.TVup_ent:SetBodygroup(3,1)
	--SafeRemoveEntityDelayed( self.TVup_ent, 8 )

	self:Timer(8, function()
		self.TVup_ent.TVreturn = true
	end)

	self.TVup_ent:CallOnRemove("TVupDied", function(ent)
		if IsValid(self) then
		end
		if IsValid(self.MyComponents[1].entity) then
				self.MyComponents[1].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	if IsValid(self.MyComponents[2].entity) then
				self.MyComponents[2].entity:ManipulateBoneScale(0, Vector(0.3,1,1))
			end
	if IsValid(self.MyComponents[3].entity) then
				self.MyComponents[3].entity:ManipulateBoneScale(0, Vector(0.3,1,1))
			end
	if IsValid(self.MyComponents[4].entity) then
				self.MyComponents[4].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	if IsValid(self.MyComponents[5].entity) then
				self.MyComponents[5].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	if IsValid(self.MyComponents[6].entity) then
				self.MyComponents[6].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	if IsValid(self.MyComponents[7].entity) then
				self.MyComponents[7].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	end)
end

function ENT:SpawnTVr()
	if IsValid(self.TVr_ent) then return end
	self.TVr_ent = ents.Create("npc_gianttv")
	local bpos, bang = self:GetBonePosition(self:LookupBone("tv.r"))
	self.TVr_ent:SetPos(bpos)
	self.TVr_ent:SetAngles(self:GetAngles())
	self.TVr_ent:SetOwner(self)
	self.TVr_ent.TVSkin = 3
	self.TVr_ent.TVColor = Color( 255, 93, 0, 20 )
	self.TVr_ent.TVBone = "tv.r"
	self.TVr_ent.TVBulletColor = Color(255,255,0,255)
	self.TVr_ent:Spawn()
	self:SetBodygroup(2, 1)
	if IsValid(self.MyComponents[8].entity) then
				self.MyComponents[8].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[9].entity) then
				self.MyComponents[9].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	self:SetEntityRelationship(self.TVr_ent, D_LI, 99)
	self:DeleteOnRemove(self.TVr_ent)
	self.TVr_ent:SetBodygroup(1,1)
	self.TVr_ent:SetBodygroup(4,1)
	self.TVr_ent:SetModelScale(0.65)
	--SafeRemoveEntityDelayed( self.TVr_ent, 8 )

	self:Timer(8, function()
		self.TVr_ent.TVreturn = true
	end)

	self.TVr_ent:CallOnRemove("TVrDied", function(ent)
		if IsValid(self) then
		end
		if IsValid(self.MyComponents[8].entity) then
				self.MyComponents[8].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	if IsValid(self.MyComponents[9].entity) then
				self.MyComponents[9].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	end)
end

function ENT:SpawnTVl()
	if IsValid(self.TVl_ent) then return end
	self.TVl_ent = ents.Create("npc_gianttv")
	local bpos, bang = self:GetBonePosition(self:LookupBone("tv.l"))
	self.TVl_ent:SetPos(bpos)
	self.TVl_ent:SetAngles(self:GetAngles())
	self.TVl_ent:SetOwner(self)
	self.TVl_ent.TVSkin = 4
	self.TVl_ent.TVColor = Color( 29, 0, 255, 20 )
	self.TVl_ent.TVBone = "tv.l"
	self.TVl_ent.TVBulletColor = Color(255,255,0,255)
	self.TVl_ent:Spawn()
	self:SetBodygroup(1, 1)
	if IsValid(self.MyComponents[10].entity) then
				self.MyComponents[10].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	if IsValid(self.MyComponents[11].entity) then
				self.MyComponents[11].entity:ManipulateBoneScale(0, Vector(0,0,0))
			end
	self:SetEntityRelationship(self.TVl_ent, D_LI, 99)
	self:DeleteOnRemove(self.TVl_ent)
	self.TVl_ent:SetBodygroup(1,1)
	self.TVl_ent:SetBodygroup(4,1)
	self.TVl_ent:SetModelScale(0.65)
	--SafeRemoveEntityDelayed( self.TVl_ent, 8 )

	self:Timer(8, function()
		self.TVl_ent.TVreturn = true
	end)

	self.TVl_ent:CallOnRemove("TVlDied", function(ent)
		if IsValid(self) then
		end
		if IsValid(self.MyComponents[10].entity) then
				self.MyComponents[10].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	if IsValid(self.MyComponents[11].entity) then
				self.MyComponents[11].entity:ManipulateBoneScale(0, Vector(1,1,1))
			end
	end)
end

function ENT:ManipulateBoneScaleSeq(id,scale)
	self:ManipulateBoneScale(id,scale)
	local childbones = self:GetChildBones(id)
	self:ManipulateBoneScaleSeq_2(id,scale)
end

function ENT:ManipulateBoneScaleSeq_2(id,scale)
	local childbones = self:GetChildBones(id)
	if istable(childbones) and #childbones > 0 then
		for k,child in pairs(childbones) do
			self:ManipulateBoneScale(child,scale)
			self:ManipulateBoneScaleSeq_2(child,scale)
		end
	end
end
function ENT:OnNewEnemy(enemy)
		self:CallInCoroutine(function(self, delay)
			if delay > 0.1 then return end
			if math.random(0,1) == 0 then
							self:EmitSound("tvtit_upgr/tvspeak3.wav", 150, 100, 1) 
						else
							self:EmitSound("tvtit_upgr/tvspeak1.wav", 150, 100, 1) 
						end	
				if IsValid(self.MyComponents[1].entity) then
					self.MyComponents[1].entity:SetSubMaterial(12,"my/tv002")
				end
				if IsValid(self.MyComponents[8].entity) then
					self.MyComponents[8].entity:SetSubMaterial(12,"my/tv003")
				end
				if IsValid(self.MyComponents[10].entity) then
					self.MyComponents[10].entity:SetSubMaterial(12,"my/tv005")
				end
				if IsValid(self.MyComponents[12].entity) then
					self.MyComponents[12].entity:SetSubMaterial(12,"my/tv004")
				end
		end)
		self:Timer(5, function(self)
				if IsValid(self.MyComponents[1].entity) then
					self.MyComponents[1].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
				if IsValid(self.MyComponents[8].entity) then
					self.MyComponents[8].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
				if IsValid(self.MyComponents[10].entity) then
					self.MyComponents[10].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
				if IsValid(self.MyComponents[12].entity) then
					self.MyComponents[12].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
			end)
end
function ENT:OnLastEnemy(enemy)
	self:Timer(2, function(self)
		self:CallInCoroutine(function(self, delay)
			if delay > 0.1 then return end
			if self:HasEnemy() then return end
			local myface_p = ents.FindByClass("player")
			if IsValid(myface_p[1]) then
				self:FaceTo(myface_p[1])
			end
						self:Timer(1, function(self)
				if self:HasEnemy() then return end
				self:EmitSound("tvtit_upgr/tvspeak5.wav", 150, 100, 1)
				if IsValid(self.MyComponents[1].entity) then
					self.MyComponents[1].entity:SetSubMaterial(12,"my/tv001")
				end
				if IsValid(self.MyComponents[8].entity) then
					self.MyComponents[8].entity:SetSubMaterial(12,"my/tv003")
				end
				if IsValid(self.MyComponents[10].entity) then
					self.MyComponents[10].entity:SetSubMaterial(12,"my/tv005")
				end
				if IsValid(self.MyComponents[12].entity) then
					self.MyComponents[12].entity:SetSubMaterial(12,"my/tv001")
				end
			end)
			self:Wait(5)
			self:Timer(5, function(self)
				if IsValid(self.MyComponents[1].entity) then
					self.MyComponents[1].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
				if IsValid(self.MyComponents[8].entity) then
					self.MyComponents[8].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
				if IsValid(self.MyComponents[10].entity) then
					self.MyComponents[10].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
				if IsValid(self.MyComponents[12].entity) then
					self.MyComponents[12].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
				end
			end)
		end)
	end)
	self.WantFly = false
	self.Fly_WantCharge = true
end

function ENT:OnTakeDamage(dmginfo,hitgroup ) 
	 
	if (dmginfo:GetDamageType() == 67108865 or dmginfo:GetDamageType() ==  67108864) then 
		return 0 
	end

	if dmginfo:GetAttacker():IsPlayer() then
		dmginfo:ScaleDamage(4)
	end
	dmginfo:ScaleDamage(0.65)
	
end



function ENT:HPPERC(ent) 
	return ent:Health()/(ent:GetMaxHealth()/100)	 
end



function ENT:OnContact(ent)
 
end
 
function ENT:OnLandOnGround()
	self:StopSound( "MechaCameraman_SKILL_START" )
	self:SetCollisionGroup(COLLISION_GROUP_NPC)
	self:SetMaxYawRate(120)

	if self.IsIntro then
		self.IsIntro = false
		self.JumpAnimation = self.DefaultJumpAnim
	end

	if IsValid(self.JetRTrail) then
		self.JetRTrail:Fire("Kill","",0)
	end
			 
		if IsValid(self) then
			util.ScreenShake( self:GetPos(), 20, 40, 5, 42000 )
			self:EmitSound("KOLMODS_STEPS/glasgavelen/glasgavelen_2_step_04-"..math.random(1, 2)..".wav", 150, 70, 1)
		 
		end	

	self:CallInCoroutine(function(self, delay)
		if delay > 0.1 then return end
		self:PlaySequenceAndMove("land")
	end)
	self.CanJumpK = true
	self.StepHeight = 40
end

 


function ENT:CustomInitialize()
	self.MyComponents = self:Skbidi_ComponentSettings()
	 
	if istable(self.MyComponents) then
		for i, mcomp in pairs(self.MyComponents) do
			self:CreateComponent(mcomp)
		end
	end
	self.DefaultYawRate = self:GetMaxYawRate()

	local settings = physenv.GetPerformanceSettings();
    settings.MaxVelocity = 30000;
    physenv.SetPerformanceSettings( settings );

	self.CarpetB = false
	self:StopSound( "MechaCameraman_IDLE" )

	sound.Add( {
		name = "MechaCameraman_IDLE",
		channel = CHAN_STATIC,
		volume = 0.5,
		level = 150,
		pitch = 80,
		sound = {
			"Speakerman_UPGR/idleloop2.wav"
		}
	})
	self:EmitSound( "MechaCameraman_IDLE" )
	 
	self:SetBodygroup(0,1)
	self:SetBodygroup(1,1)
	self:SetBodygroup(2,1)
	ParticleEffectAttach("DRG_SKBT_TVTITAN_UPGR_CORE",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Core"))
	ParticleEffectAttach("DRG_SKBT_TITITAN_UPGR_CHARGE",PATTACH_POINT_FOLLOW,self,self:LookupAttachment("Core"))
  	self:SetColor(Color(125,125,125))
	
	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_L_Clavicle"),Vector(1.2,1.2,1.2))
	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_R_Clavicle"),Vector(1.2,1.2,1.2))

	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_L_Upperarm"),Vector(1.1,1.1,1.1))
	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_R_Upperarm"),Vector(1.1,1.1,1.1))

	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_L_Forearm"),Vector(1.1,1.1,1.1))
	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_R_Forearm"),Vector(1.1,1.1,1.1))

	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_L_Hand"),Vector(1.2,1.2,1.2))
	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_R_Hand"),Vector(1.2,1.2,1.2))
	
 	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_L_Thigh"),Vector(1,1,1.2))
	self:ManipulateBoneScale(self:LookupBone("ValveBiped.Bip01_R_Thigh"),Vector(1,1,1.2))

	self:ManipulateBoneScale(self:LookupBone("backclaw.L"),Vector(1.2,1.2,1.2))
	self:ManipulateBoneScale(self:LookupBone("backclaw.R"),Vector(1.2,1.2,1.2))

 	self:ManipulateBoneScale(self:LookupBone("tvattach.L"),Vector(1.2,1.2,1.2))
	self:ManipulateBoneScale(self:LookupBone("tvattach.R"),Vector(1.2,1.2,1.2))
	
	self:ManipulateBoneScale(self:LookupBone("sword"),Vector(1.1,1.1,1.1))

	self:ManipulateBoneScale(self:LookupBone("tvsmall"),Vector(0,0,0))	

	self:ManipulateBonePosition(self:LookupBone("ValveBiped.Bip01_L_Clavicle"),Vector(0,1,15))
	self:ManipulateBonePosition(self:LookupBone("ValveBiped.Bip01_R_Clavicle"),Vector(0,1,-15))

	self:ManipulateBonePosition(self:LookupBone("ValveBiped.Bip01_L_Upperarm"),Vector(25,5,0))
	self:ManipulateBonePosition(self:LookupBone("ValveBiped.Bip01_R_Upperarm"),Vector(25,5,0))

	self:ManipulateBoneAngles(self:LookupBone("ValveBiped.Bip01_R_Upperarm"),Angle(-5,-5,0))
	self:ManipulateBoneAngles(self:LookupBone("ValveBiped.Bip01_L_Upperarm"),Angle(5,-5,0))

	self:ManipulateBoneAngles(self:LookupBone("ValveBiped.Bip01_R_Forearm"),Angle(0,-10,0))
	self:ManipulateBoneAngles(self:LookupBone("ValveBiped.Bip01_L_Forearm"),Angle(0,-10,0))
	
	self:ManipulateBonePosition(self:LookupBone("ValveBiped.Bip01_L_Thigh"),Vector(15,0,0))
	self:ManipulateBonePosition(self:LookupBone("ValveBiped.Bip01_R_Thigh"),Vector(-15,0,0))

	self:ManipulateBoneAngles(self:LookupBone("ValveBiped.Bip01_R_Calf"),Angle(5,0,0))
	self:ManipulateBoneAngles(self:LookupBone("ValveBiped.Bip01_L_Calf"),Angle(-5,0,0))

	self:ManipulateBoneAngles(self:LookupBone("tvattach.L"),Angle(0,0,30))
	self:ManipulateBoneAngles(self:LookupBone("tvattach.R"),Angle(0,0,30))

	self:ManipulateBoneAngles(self:LookupBone("backclaw.L"),Angle(20,0,0))
	self:ManipulateBoneAngles(self:LookupBone("backclaw.R"),Angle(-20,0,0))

	self.SKillAtttack = false

	self.CanJumpK = true

	self.RushMode = false
	self.RushPOS = self:GetPos()

	timer.Simple(1.5, function()
		if IsValid(self) then
			self.CanTransform = true
		end
	end)

	// Rel
	self:SetDefaultRelationship(D_HT)
 
	self.NextDash = true
	self.RushD = 0

	self.CanUseJumpScare = false

	timer.Simple(15, function()
		if IsValid(self) then
			self.CanUseJumpScare = true
		end
	end)
	self.CritDamage = false


	self.CanUsePsyAtt = false
	timer.Simple(4, function()
		if IsValid(self) then
			self.CanUsePsyAtt = true
		end
	end)

	self.WhiteLight1 = ents.Create("env_sprite")
	self.WhiteLight1:SetPos( self:GetAttachment(self:LookupAttachment("Core")).Pos )
	self.WhiteLight1:Fire("SetParentAttachment","Core")
	self.WhiteLight1:SetKeyValue( "renderfx", "14" )
	self.WhiteLight1:SetKeyValue( "model", "sprites/glow1.vmt")
	self.WhiteLight1:SetKeyValue( "scale","8")
	self.WhiteLight1:SetKeyValue( "spawnflags","1")
	self.WhiteLight1:SetKeyValue( "angles","0 0 0")
	self.WhiteLight1:SetKeyValue( "rendermode","3")
	self.WhiteLight1:SetKeyValue( "renderamt", "245")
	self.WhiteLight1:SetKeyValue( "rendercolor", "127 0 255" )
	self.WhiteLight1:SetParent(self)
	self.WhiteLight1:Spawn()

	self.WhiteLight1 = ents.Create("env_sprite")
	self.WhiteLight1:SetPos( self:GetAttachment(self:LookupAttachment("Core")).Pos )
	self.WhiteLight1:Fire("SetParentAttachment","Core")
	self.WhiteLight1:SetKeyValue( "renderfx", "14" )
	self.WhiteLight1:SetKeyValue( "model", "sprites/glow1.vmt")
	self.WhiteLight1:SetKeyValue( "scale","3")
	self.WhiteLight1:SetKeyValue( "spawnflags","1")
	self.WhiteLight1:SetKeyValue( "angles","0 0 0")
	self.WhiteLight1:SetKeyValue( "rendermode","3")
	self.WhiteLight1:SetKeyValue( "renderamt", "245")
	self.WhiteLight1:SetKeyValue( "rendercolor", "255 255 255" )
	self.WhiteLight1:SetParent(self)
	self.WhiteLight1:Spawn()

	self.CanUseDash = true
	self.CanUseTVup = true
	self.CanUseTVr = true
	self.CanUseTVl = true

	self.NextDoorCheck = 0
	self.NextBurnD = 0
	
	self.NextSHotMini = 0
	self.NextNuclearShot = 0

end
 
 
function ENT:Skbidi_ComponentSettings()
	local compset = {
	{
		model = "models/ivip/tv/philips_cineos.mdl",
		scale = 3,
		attach = "TVup",
		pos = Vector(-40,-60,0),
		ang = Angle(0,-90,-90),
		func = function(self,comp)
			comp:SetSkin(1)
			comp:SetSubMaterial(0,"sprops/textures/gear_metal")
			comp:SetSubMaterial(2,"sprops/textures/gear_metal")
		end
	},
	{
		model = "models/ivip/tv/philips_cineos.mdl",
		scale = 2.7,
		attach = "TV 3",
		pos = Vector(45,-110,200),
		ang = Angle(0,80,-87),
		func = function(self,comp)
			comp:SetSkin(1)
			comp:ManipulateBoneScale(0,Vector(0.3,1,1))
		end
	},
	{
		model = "models/ivip/tv/philips_cineos.mdl",
		scale = 2.7,
		attach = "TV 3",
		pos = Vector(35,-110,-70),
		ang = Angle(0,80,-87),
		func = function(self,comp)
			comp:SetSkin(1)
			comp:ManipulateBoneScale(0,Vector(0.3,1,1))
			comp:SetSubMaterial(0,"sprops/textures/gear_metal")
			comp:SetSubMaterial(2,"sprops/textures/gear_metal")
		end
	},
	{
		model = "models/props_combine/combineinnerwallcluster1024_002a.mdl",
		scale = 0.21,
		attach = "TVup",
		pos = Vector(100,-10,10),
		ang = Angle(0,180,-90),
		func = function(self,comp)
			
		end
	},
	{
		model = "models/combine_room/combine_monitor002.mdl",
		scale = 1.2,
		attach = "TVup",
		pos = Vector(30,30,80),
		ang = Angle(0,-110,-80),
		func = function(self,comp)
			
		end
	},
	{
		model = "models/combine_room/combine_monitor002.mdl",
		scale = 1.2,
		attach = "TVup",
		pos = Vector(30,30,-80),
		ang = Angle(0,-110,-100),
		func = function(self,comp)
			
		end
	},
	{
		model = "models/combine_room/combine_monitor002.mdl",
		scale = 1.3,
		attach = "TVup",
		pos = Vector(50,-40,0),
		ang = Angle(0,-90,0),
		func = function(self,comp)
			
		end
	},
	{
		model = "models/ivip/tv/philips_cineos.mdl",
		scale = 2.2,
		attach = "TVleft",
		pos = Vector(80,-30,-47),
		ang = Angle(30,90,-40),
		func = function(self,comp)
			comp:SetSkin(1)
			comp:SetSubMaterial(0,"sprops/textures/gear_metal")
			comp:SetSubMaterial(2,"sprops/textures/gear_metal")
		end
	},
	{
		model = "models/combine_room/combine_monitor002.mdl",
		scale = 0.7,
		attach = "TVleft",
		pos = Vector(-20,10,30),
		ang = Angle(25,-50,-45),
		func = function(self,comp)
			
		end
	},
	{
		model = "models/ivip/tv/philips_cineos.mdl",
		scale = 2.2,
		attach = "TVright",
		pos = Vector(-80,-30,-37),
		ang = Angle(30,90,40),
		func = function(self,comp)
			comp:SetSkin(1)
			comp:SetSubMaterial(0,"sprops/textures/gear_metal")
			comp:SetSubMaterial(2,"sprops/textures/gear_metal")
		end
	},
	{
		model = "models/combine_room/combine_monitor002.mdl",
		scale = 0.7,
		attach = "TVright",
		pos = Vector(20,-10,50),
		ang = Angle(160,50,50),
		func = function(self,comp)
			
		end
	},
	{
		model = "models/ivip/tv/philips_cineos.mdl",
		scale = 1,
		attach = "TV 6S",
		pos = Vector(0,0,30),
		ang = Angle(-20,90,180),
		func = function(self,comp)
			comp:SetSkin(1)
			comp:SetSubMaterial(0,"sprops/textures/gear_metal")
			comp:SetSubMaterial(2,"sprops/textures/gear_metal")
		end
	},
	{
		model = "models/fallout 3/backpack_6.mdl",
		scale = 17,
		attach = "Turb",
		pos = Vector(-40,-100,50),
		ang = Angle(0,180,-90),
		func = function(self,comp)
		end
	},
--[[
	{
		model = {
			"models/player/zelpa/male_07_extended_defaq.mdl",
			"models/player/zelpa/male_04_extended_defaq.mdl",
			"models/player/zelpa/male_09_extended_defaq.mdl",
			"models/player/zelpa/male_02_extended_defaq.mdl",
			"models/player/zelpa/male_03_extended_defaq.mdl",
			"models/player/zelpa/male_01_extended_defaq.mdl"
		},
		scale = 1,
		attach = "body_attach",
		pos = Vector(-40,0,-10),
		ang = Angle(-90,-90,0),
		bonemerge = true,
		func= function(self,comp)
			for i = 0, comp:GetBoneCount() do
				if not (self:GetBoneName(i) == "ValveBiped.Bip01_Head1" or self:GetBoneName(i) == "ValveBiped.Bip01_Neck1") then
					comp:ManipulateBoneScale(i, Vector(0,0,0))
				end
			end
			comp:ManipulateBoneScale(comp:DrG_SearchBone("Neck"), Vector(1.4,1.4,1.4))
			comp:ManipulateBoneScale(comp:DrG_SearchBone("Head"), Vector(1.4,1.4,1.4))
			self:AddHead(comp, "Head", "Head")
			local toilet = self:CreateToilet(Vector(0,0,0), Angle(0,0,0))
			comp:SetParent(toilet)
			toilet:ManipulateBoneAngles(toilet:DrG_SearchBone("Head"), Angle(0,90,-90))
			toilet:ManipulateBonePosition(toilet:DrG_SearchBone("Face"), Vector(-20,20,0))
		end
	},
]]
}

	return compset
end


function ENT:OnMeleeAttack(enemy)
	if self.CanAttack == false then return end

	if self:GetForward():Dot((self:GetEnemy():GetPos() - self:GetPos()):GetNormalized()) > math.cos(math.rad(30)) then 
 
		self:PlaySequenceAndMove("Attack "..math.random(1,8), 1,self.FaceEnemy)	 

		if math.random(1, 5) == 1 and (not (IsValid(self.TVup_ent)&&IsValid(self.TVr_ent)&&IsValid(self.TVl_ent)) ) then
			if self.NextNuclearShot != false then
				self.NextNuclearShot = false
				self:PlaySequenceAndMove("Skill 1", 1,self.FaceEnemy)	 
				timer.Simple(35, function()
					if IsValid(self) then
						self.NextNuclearShot = true
					end
				end)
			end
		elseif math.random(1, 4) == 3 then
			if self.CanUsePsyAtt != false then
				self.CanUsePsyAtt = false
				self:PlaySequenceAndMove("Skill 2", 1,self.FaceEnemy)	 
				timer.Simple(45, function()
					if IsValid(self) then
						self.CanUsePsyAtt = true
					end
				end)
			end
		else
			self:SpawnArm()
		end
	 
	end

end


function ENT:OnRangeAttack(enemy)
	if self.CanAttack == false then return end

	if self:GetForward():Dot((self:GetEnemy():GetPos() - self:GetPos()):GetNormalized()) > math.cos(math.rad(80)) then 
	
		if self.EnemyDist>1000 and self:IsOnGround() then
			if self.CanUseDash != false then
				self.CanUseDash = false
				timer.Create("JumpDash"..tostring(self),0.01,22,function()
					if IsValid(self) and IsValid(self:GetEnemy()) then
						self:Jump(40)
						self:SetVelocity( self:CalculateCurve(self:GetPos(), self:GetEnemy():GetPos(), 11800) )
					end
				end)		
				  
				timer.Simple(2, function()
					if IsValid(self) then
						self.CanUseDash = true
					end
				end)
			end
		 
		end

				if self.CanUseTVup != false then
				  self.CanUseTVup = false

				  self:SpawnTVUp()
				  
				  self:Timer(math.random(10.2,25), function()
				     self.CanUseTVup = true
				  end)
				end


				if self.CanUseTVr != false then
				  self.CanUseTVr = false

				  self:SpawnTVr()
				  
				  self:Timer(math.random(3.2,10.3), function()
				     self.CanUseTVr = true
				  end)
				end

				if self.CanUseTVl != false then
				  self.CanUseTVl = false

				  self:SpawnTVl()
				  
				  self:Timer(math.random(7.2,10.1), function()
				     self.CanUseTVl = true
				  end)
				end
	end

end

function ENT:OnLeaveGround()
	self:EmitSound("phx/epicmetal_soft1.wav", 100, 50, 1)
	if not IsValid(self.JetRTrail) then
		self.JetRTrail = ents.Create("info_particle_system")
		self.JetRTrail:SetKeyValue("effect_name","DRG_SKBT_TVSTRIDER_JETTRAIL")
		self.JetRTrail:SetPos(self:GetPos()+self:OBBCenter())
		self.JetRTrail:Fire("SetParentAttachment","turb")
		self.JetRTrail:SetAngles(self:GetAngles())
		self.JetRTrail:SetParent(self)
		self.JetRTrail:Spawn()
		self.JetRTrail:Activate()
		self.JetRTrail:Fire("Start","",0)
	end
	if !self:IsOnGround() then
			if self.JetEffects != true then
				self:EmitSound("skibidi_toilet/jetpack1.wav", 150, 90, 1) 				
				end
			end
end

function ENT:CalculateCurve(startPos, endPos, projVel)
	-- Oknoutyoun: https://gamedev.stackexchange.com/questions/53552/how-can-i-find-a-projectiles-launch-angle
	-- Negar: https://wikimedia.org/api/rest_v1/media/math/render/svg/4db61cb4c3140b763d9480e51f90050967288397
	local result = Vector(endPos.x - startPos.x, endPos.y - startPos.y, 0) -- Verchnagan deghe
	local pos_x = result:Length()
	local pos_y = endPos.z - startPos.z
	local grav = physenv.GetGravity():Length()
	local sqrtcalc1 = (projVel * projVel * projVel * projVel)
	local sqrtcalc2 = grav * ((grav * (pos_x * pos_x)) + (2 * pos_y * (projVel * projVel)))
	local calcsum = sqrtcalc1 - sqrtcalc2 -- Yergou tevere aveltsour
	if calcsum < 0 then -- Yete teve nevas e, ooremen sharnage
		calcsum = math.abs(calcsum)
	end
	local angsqrt =  math.sqrt(calcsum)
	local angpos = math.atan(((projVel * projVel) + angsqrt) / (grav * pos_x))
	local angneg = math.atan(((projVel * projVel) - angsqrt) / (grav * pos_x))
	local pitch = 1
	if angpos > angneg then
		pitch = angneg -- Yete asiga angpos enes ne, aveli veregele
	else
		pitch = angpos
	end
	result.z = math.tan(pitch) * pos_x
	return result:GetNormal() * projVel

end

 
 

function ENT:EatableENTSizeChecker(EatAble)
	if IsValid(EatAble) then
		self.enemy_BoxMin, self.enemy_BoxMax = EatAble:OBBMins(), EatAble:OBBMaxs()				
		self.enemy_SizeX = (math.abs(self.enemy_BoxMin.x)+math.abs(self.enemy_BoxMax.x))
		self.enemy_SizeY = (math.abs(self.enemy_BoxMin.y)+math.abs(self.enemy_BoxMax.y))
		self.enemy_SizeZ = (math.abs(self.enemy_BoxMin.z)+math.abs(self.enemy_BoxMax.z))	 

		return self.enemy_SizeZ
	end
end


 


function ENT:OnDeath(dmg, hitgroup)  
	self:EmitSound("Cameraman2_BIG/dsaodfir.wav", 90, 100, 1)
	self:CustomOnDeathOrRemove()
	self:EmitSound("skibidibop_series/lasershot.wav", 100, 90, 4)
				self:EmitSound("skibidibop_series/split_earth_tormented.wav", 150, 90, 1)
								self:EmitSound("skibidibop_series/explode_5a.wav", 150, 90, 1)
				self.ripourhero = ents.Create("info_particle_system")
				self.ripourhero:SetKeyValue("effect_name","explosion_huge")
				self.ripourhero:SetPos(self:GetPos())
				self.ripourhero:SetAngles(self:GetAngles())
				self.ripourhero:Spawn()
				self.ripourhero:Activate()
				self.ripourhero:Fire("Start","",0)	
end

function ENT:CustomOnDeathOrRemove()
	self:StopSound( "MechaCameraman_IDLE" )
	self:StopSound( "RED_SCREEN" )
	self:StopSound( "MechaCameraman_SKILL_START" )

	self:StopSound( "OnSpawn" )
	self:StopSound( "IdleLOOP" )
	self:StopSound( "Sink" )
	self:StopSound( "Dmg" )
	self:StopSound( "Preatt" )
	self:StopSound( "Charge1" )
	self:StopSound( "TsunamiBLAST" )
	self:StopSound( "ChargeTsunami" )
	for M=1,5 do
		self:StopSound( "MechaSpeakerman_SKILL_START" )
	end
	 
end
 


	
function ENT:OnRemove()
	self:CustomOnDeathOrRemove()
	 
end
	
function ENT:CreateComponent(component)
	if istable(component.model) then component.model = component.model[math.random(1,#component.model)] end
	if not isstring(component.model) then return end
	if not isnumber(component.scale) then component.scale = 1 end
	if not isvector(component.pos) then component.pos = Vector(0,0,0) end
	if not isangle(component.ang) then component.ang = Angle(0,0,0) end
	if not isfunction(component.func) then component.func = function(self,comp) end end
	if isstring(component.attach) then newattach = self:LookupAttachment(component.attach) if isnumber(newattach) then component.attach = newattach end end
	if isnumber(component.attach) then
			comp = ents.Create("base_anim")
			comp:SetNoDraw(false)
			comp:DrawShadow(true)
			comp:SetMoveType( MOVETYPE_NONE )
			comp:SetCollisionGroup(COLLISION_GROUP_WEAPON)
			comp:SetOwner( self )
			comp:SetModel( component.model )
			comp:SetModelScale( component.scale )
			comp:SetParent(self, component.attach)

			if isstring(component.material) then
				comp:SetMaterial(component.material)
			end
			if isnumber(component.skin) then
				comp:SetSkin(component.skin)
			end
			if IsColor(component.color) then
				comp:SetColor(component.color)
			end
			comp:Spawn()
			component.entity = comp
			comp:SetSolid(SOLID_NONE)
			comp:SetLocalPos(component.pos)
			comp:SetLocalAngles(component.ang)
			component.func(self,comp)
			--comp:Fire("setparentattachment", component.attach)
			if component.bonemerge then
			 comp:AddEffects(EF_BONEMERGE)
			end
	else
			comp = ents.Create("base_anim")
			comp:SetNoDraw(false)
			comp:DrawShadow(true)
			comp:SetMoveType( MOVETYPE_NONE )
			comp:SetCollisionGroup(COLLISION_GROUP_WEAPON)
			comp:SetOwner( self )
			comp:SetModel( component.model )
			comp:SetModelScale( component.scale )
			comp:SetParent(self)
			comp:SetLocalPos(component.pos)
			comp:SetLocalAngles(component.ang)

			if isstring(component.material) then
				comp:SetMaterial(component.material)
			end
			if isnumber(component.skin) then
				comp:SetSkin(component.skin)
			end
			if IsColor(component.color) then
				comp:SetColor(component.color)
			end
			comp:Spawn()
			component.entity = comp
			comp:SetSolid(SOLID_NONE)
			component.func(self,comp)
	end
end

function ENT:CustomThink()

	if IsValid(self) then
		if self:IsPossessed() then
			if self:GetVelocity():Length() > 100 then
				self:SetMaxYawRate(self.DefaultYawRate)
			else
				self:SetMaxYawRate(0)
			end
		else
			self:SetMaxYawRate(self.DefaultYawRate)
		end
	end

	if IsValid(self) then
		self:RemoveAllDecals()
	end

	if IsValid(self) then
		if IsValid(self:GetEnemy()) then
			self.EnemyPos = self:GetEnemy()
			self.EnemyDist = self:GetPos():Distance(self:GetEnemy():GetPos())
		end
	end	

	if self.SKillAtttack != false then
		self:Jump(40)
		self.loco:SetVelocity(self.SkillVEC)
	end
	

	if CurTime()>self.NextDoorCheck and GetConVarNumber("ai_disabled") == 0 then
		self.NextDoorCheck = CurTime()+0.2

		for k,v in pairs(ents.FindInSphere( self:GetPos()+self:GetForward()*100, 55)) do
 
			if IsValid(v) then			 
				if v:GetClass() == "prop_door_rotating" then 
					v:SetNotSolid(true)
					v:Fire("open") 
				end
				if v:GetClass() == "func_door_rotating" then 
					v:SetNotSolid(true)
					v:Fire("open") 
				end
				if v:GetClass() == "func_door" then
					v:SetNotSolid(true)
					v:Fire("open") 
				end
			end
		end	
	end

end
 
 

function ENT:FreezePlayer(ent)
 
	if IsValid(self.cent) then
		self.cent:Remove()
	end
 
	
	if ent:IsPlayer() then
		ent:Freeze(true)
	//	ent:StripWeapons()
	 	ent:SetNoDraw(true)

		self:SetIgnored(ent, true)

		/**/

		self.cent = ents.Create("prop_physics")
		self.cent:SetModel("models/dav0r/camera.mdl")
		self.cent:SetPos( self:GetAttachment(self:LookupAttachment("JumpScare")).Pos   ) //+ self:GetUp()*10+ self:GetRight()*-10 )
		self.cent:SetRenderMode(1)
		self.cent:Fire("SetParentAttachment","JumpScare")
		self.cent:SetColor(Color(255, 255, 255, 0))
		self.cent:DrawShadow(false)
		self.cent:SetMoveType( MOVETYPE_NONE )
		self.cent:SetParent(self)

	 

		if !IsValid(self.cent) then return end
		ent:SetViewEntity(self.cent)

	end
end

function ENT:Release_Proj(att, proj, target)
	if IsValid(self) then	
		if !self:IsPossessed() and not IsValid(self:GetEnemy()) then return end
			ParticleEffectAttach("DRG_SKIBIDI_SPEAKERMANC_CANNON_shot",PATTACH_POINT_FOLLOW,self,self:LookupAttachment(att))
		self:EmitSound("SpeakerTitan_V2_OF/exp_small_close1.wav", 0, 100, 1) 
		self.SHots = 1
		
		if self.CarpetB != false then
			self.SHots = 3
		end

		for M=1,self.SHots do
			self.proj = ents.Create(proj)		
			if self:IsPossessed() then
				self.proj:SetAngles((self.proj:GetVelocity()-self.proj:GetPos()):Angle()+self:GetAngles()+Angle(0,0,0))
			end
			if !self:IsPossessed() and IsValid(target) then
				self.proj:SetAngles((self.proj:GetVelocity()-self.proj:GetPos()):Angle()+self:GetAngles()+Angle(0,0,0))
			end
			self.proj:SetPos(self:GetAttachment(self:LookupAttachment("toilet_attach")).Pos ) --right
			self.proj:SetPos(self:GetPos()+self:GetRight()*-30+self:GetUp()*40)	

			self.proj:SetOwner(self)			
			self.proj:Spawn()			
			self.proj:Activate()
			self.proj:SetPhysicsAttacker(self)
				
			local phys = self.proj:GetPhysicsObject()
			if IsValid(phys) then
				phys:Wake()		 
				phys:EnableGravity(false)
							
				if !self:IsPossessed() then
					self.DIRV = self:GetEnemy():GetPos()+ self:GetEnemy():OBBCenter()+self:GetEnemy():GetForward()*0
				else
					if IsValid(self:GetClosestEnemy()) then
						self.DIRV = self:GetClosestEnemy():GetPos()+self:GetClosestEnemy():OBBCenter()
					else
						self.DIRV = self:PossessorTrace().HitPos 
					end
				end	
				
				if self:GetSequenceName(self:GetSequence()) == "Skill" then
					self.DIRV = self.DIRV+VectorRand()*0
				end
				self.proj:DrG_AimAt(self.DIRV, 15000)
				if math.random(1, 2) == 1 then
			self:EmitSound("npc/strider/strider_minigun.wav", 150, 90, 1)
		else
			self:EmitSound("npc/strider/strider_minigun2.wav", 150, 90, 1)
		end
				
				if IsValid(self) then
		local function RestoreCols(ent)
			timer.Simple(0.1, function()
				if IsValid(ent) then
					ent:SetSolid(SOLID_VPHYSICS)
				end
			end)
		end 
	 
	end
				--[[
							proj.OnContact = function(proj, ent)
								if IsValid(self) then
									if IsValid(ent) and (not self:IsAlly(ent)) and (ent != self) then
										local dmg_data = proj.DamageData
										local g_dmg = DamageInfo()
										g_dmg:SetDamage(dmg_data.dmg*proj:GetDamageAttackMultiplier())
										g_dmg:SetDamageType(dmg_data.dmg_type)
										g_dmg:SetAttacker(proj:GetOwner())
										g_dmg:SetReportedPosition(proj:GetPos())

										ent:TakeDamageInfo(g_dmg)

										local hatt = ents.Create("base_anim")
										hatt:SetModel(proj:GetModel())
										hatt:SetNoDraw(false)
										hatt:SetParent(ent)
										hatt:SetPos(proj:GetPos())
										hatt:SetAngles(proj:GetAngles())
										hatt:SetModelScale(5)

										if ent.IsDrGNextbot then
											ent:EmitSound("physics/metal/metal_sheet_impact_bullet1.wav",105,math.random(50,70))
										end

										proj:Remove()
									elseif (ent != self) then
										proj:Fire("Kill","",1.5)
									end
								else
								proj:Fire("Kill","",1.5)
								end
							end
							]]
				end
			end
	end
end

function ENT:StartSkill_Attack()
		if not (self:GetCooldown("speak3") > 0) then
				self:SetCooldown("speak3", math.random(8,9))
					self:EmitSound("tvtit_upgr/tvspeak10.wav", 150, 100, 1) 
			end
		if IsValid(self.MyComponents[1].entity) then
				self.MyComponents[1].entity:SetSubMaterial(12,"models/trevor_henderson/skbt_tvstrider_upgr/tv_screen_att")
			end
		if IsValid(self.MyComponents[2].entity) then
				self.MyComponents[2].entity:SetSubMaterial(12,"models/trevor_henderson/skbt_tvstrider_upgr/tv_screen_att")
			end
		if IsValid(self.MyComponents[3].entity) then
				self.MyComponents[3].entity:SetSubMaterial(12,"models/trevor_henderson/skbt_tvstrider_upgr/tv_screen_att")
			end
		if IsValid(self.MyComponents[8].entity) then
				self.MyComponents[8].entity:SetSubMaterial(12,"models/trevor_henderson/skbt_tvstrider_upgr/tv_screen_att")
			end
		if IsValid(self.MyComponents[10].entity) then
				self.MyComponents[10].entity:SetSubMaterial(12,"models/trevor_henderson/skbt_tvstrider_upgr/tv_screen_att")
			end
		if IsValid(self.MyComponents[12].entity) then
				self.MyComponents[12].entity:SetSubMaterial(12,"models/trevor_henderson/skbt_tvstrider_upgr/tv_screen_att")
			end		
		if IsValid(self) then	 
 			 sound.Add( {
			   name = "RED_SCREEN",
			   channel = CHAN_STATIC,
			   volume = 15,
			   level = 0,
			   pitch = 100,
			   sound = {
				   "tvtit_upgr/newredscreen.wav"
			   }
		   })
		   self:EmitSound( "RED_SCREEN" )
			self.FWDS = 0
			timer.Create("SkillSTART"..tostring(self),0.02,2000,function() 	
				if IsValid(self) then

					local enemies = ents.FindInSphere( self:GetPos(), 5000 )
					for M=1, #enemies do 
						 if enemies[M]:IsPlayer() then  
							 enemies[M]:ScreenFade( SCREENFADE.IN, Color( 255, 45, 45, 20 ), 0.1, 0.3 )
						 end
					  
						 if self:IsHostile(enemies[M]) != false then	 
							if enemies[M]:IsNPC() or enemies[M]:IsNextBot() then	
			 
								if enemies[M]:IsNextBot() then
									if isfunction(enemies[M].SetSpeed) then
										enemies[M]:SetSpeed(0)
									end
								end
											 
								enemies[M]:TakeDamage(216000, self)
								enemies[M]:SetEnemy(nil)
	  
								enemies[M]:SetPlaybackRate(.5)						  
							 end
						 end	 
					end
				end
			end)
			timer.Simple(5, function()
				if IsValid(self) then
 					self:EndSkill_Attack()
				end
			end)

			self:SetSkin(1)
		end
end
function ENT:EndSkill_Attack()
	if IsValid(self.MyComponents[1].entity) then
				self.MyComponents[1].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
			end
		if IsValid(self.MyComponents[2].entity) then
				self.MyComponents[2].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
			end
		if IsValid(self.MyComponents[3].entity) then
				self.MyComponents[3].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
			end
		if IsValid(self.MyComponents[8].entity) then
				self.MyComponents[8].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
			end
		if IsValid(self.MyComponents[10].entity) then
				self.MyComponents[10].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
			end
		if IsValid(self.MyComponents[12].entity) then
				self.MyComponents[12].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
			end
		if IsValid(self) then
 
			self:StopSound( "RED_SCREEN" )
	 		if IsValid(self.WeaponTrail211) then 
				self.WeaponTrail211:Fire("Kill","",0.11)	
			end 
			timer.Remove("SkillSTART"..tostring(self))
			self:SetSkin(0)
		end
end
function ENT:HandleAnimEvent(a,b,c,d,e)
 	//print(e)
	if e == "StartS1" then
		if IsValid(self) then	 
			self:StartSkill_Attack()
			if !IsValid(self.WeaponTrail211) then
				self.WeaponTrail211 = ents.Create("info_particle_system")
				self.WeaponTrail211:SetKeyValue("effect_name","DRG_SKBT_TVSTRIDER_TVSKILL")
				self.WeaponTrail211:SetPos(self:GetPos()+self:OBBCenter())
				self.WeaponTrail211:Fire("SetParentAttachment", "TVup")
				self.WeaponTrail211:SetAngles(self:GetAngles())
				self.WeaponTrail211:SetParent(self)
				self.WeaponTrail211:Spawn()
				self.WeaponTrail211:Activate()
				self.WeaponTrail211:Fire("Start","",0.0)	
			end
		end	
	elseif e == "Charge" then
		if IsValid(self) then
			self:EmitSound("tvtit_upgr/usecore2.wav", 150, 100, 1)
			if !IsValid(self.WeaponTrail) then
				self.WeaponTrail = ents.Create("info_particle_system")
				self.WeaponTrail:SetKeyValue("effect_name","DRG_SKBT_TITITAN_UPGR_CHARGE")
				self.WeaponTrail:SetPos(self:GetPos()+self:OBBCenter())
				self.WeaponTrail:Fire("SetParentAttachment","Core")
				self.WeaponTrail:SetAngles(self:GetAngles())
				self.WeaponTrail:SetParent(self)
				self.WeaponTrail:Spawn()
				self.WeaponTrail:Activate()
				self.WeaponTrail:Fire("Start","",0)	
			end
			if not (self:GetCooldown("speak3") > 0) then
				self:SetCooldown("speak3", math.random(15,15))
					self:EmitSound("tvtit_upgr/tvspeak9.wav", 150, 100, 1) 
			end
		end

	elseif e == "StartS2" then
		if IsValid(self) then
			if IsValid(self.WeaponTrail) then
				self.WeaponTrail:Fire("Kill","",0.0)	
			end
			self:EmitSound("TVTIT_UPGR/breath.wav", 150, 100, 1)
			if !IsValid(self.WeaponTrail2) then
				self.WeaponTrail2 = ents.Create("info_particle_system")
				self.WeaponTrail2:SetKeyValue("effect_name","DRG_SKBT_TITITAN_UPGR_STREAM")
				self.WeaponTrail2:SetPos(self:GetPos()+self:OBBCenter())
				self.WeaponTrail2:Fire("SetParentAttachment","Core")
				self.WeaponTrail2:SetAngles(self:GetAngles())
				self.WeaponTrail2:SetParent(self)
				self.WeaponTrail2:Spawn()
				self.WeaponTrail2:Activate()
				self.WeaponTrail2:Fire("Start","",0)	
			end

			self.FWDS = 0

			timer.Create("SkillSTART2"..tostring(self),0.02,2000,function() 	
				if IsValid(self) then
					self.FWDS = self.FWDS+500
					if self.FWDS>6000 then
						self.FWDS = 0
					end

					local enemies = ents.FindInSphere( self:GetPos()+self:OBBCenter()+self:GetForward()*self.FWDS, 800 )
					for M=1, #enemies do 
						 if enemies[M]:IsPlayer() then  
							 enemies[M]:ScreenFade( SCREENFADE.IN, Color( 145, 45, 245, 40 ), 0.1, 0.3 )
						 end
					  
						 if self:IsHostile(enemies[M]) != false then	 
							if enemies[M]:IsNPC() or enemies[M]:IsNextBot() then	
  
								enemies[M]:TakeDamage(886000, self)
				 					  
							 end
						 end	 
					end
				end
			end)


		end
	
	elseif e == "EndS2" then
		if IsValid(self) then
			if IsValid(self.WeaponTrail2) then
				self.WeaponTrail2:Fire("Kill","",0.0)	
			end
			timer.Remove("SkillSTART2"..tostring(self))


		end
	
	elseif e == "Step" then
		if IsValid(self) then
			self:EmitSound("KOLMODS_STEPS/glasgavelen/glasgavelen_2_step_04-"..math.random(1, 2)..".wav", 150, 60, 1)
		 
		end	

	elseif e == "Preatt" then
		if IsValid(self) then
 
 

		end	

	elseif e == "Melee" then
		if self:GetSequenceName(self:GetSequence()) == "Attack 4" or self:GetSequenceName(self:GetSequence()) == "shoot_airthen" then
			if not (self:GetCooldown("speak") > 0) then
					self:SetCooldown("speak", math.random(5,6))
				if math.random(0,1) == 0 then
							self:EmitSound("tvtit_upgr/tvspeak7.wav", 150, 100, 1) 
						else
							self:EmitSound("tvtit_upgr/tvspeak8.wav", 150, 100, 1) 
						end
				self:Timer(0.1, function()
					if IsValid(self.MyComponents[1].entity) then
						local randomstartskin = math.random(1,3)
									if randomstartskin == 1 then self.MyComponents[1].entity:SetSubMaterial(12,"my/tv002") else
										if randomstartskin == 2 then self.MyComponents[1].entity:SetSubMaterial(12,"my/tv002") else
											if randomstartskin == 3 then self.MyComponents[1].entity:SetSubMaterial(12,"my/tv006") end
									end
							end
					end
					self:Timer(6, function()
						if IsValid(self.MyComponents[1].entity) then
							self.MyComponents[1].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
						end
			          	end)
				end)
			end
				self:EmitSound("KOLMODS_SMASH/smash1.wav", 95, 90, 1)
			 
				ParticleEffect("DRG_MECHACAMERAMAN_SMASH", self:GetPos()+self:GetForward()*150, self:GetAngles(), nil)

				local enemies = ents.FindInSphere( self:GetPos(), 800 )
				for M=1, #enemies do 
					if self:IsHostile(enemies[M]) != false or enemies[M]:GetClass() == "prop_physics" then
						enemies[M]:TakeDamage(58000)
						
					end
				end

				return
			end

    self:Attack({
      damage = math.random(224000,357000),
      viewpunch = Angle(0,50,0),
      type = DMG_BLAST,
      range = 2685,
      angle = 95,
      force = Vector(1000,0,500),
    }, function(self, hit)
		if (#hit > 0) then	
			self:EmitSound("physics/metal/metal_sheet_impact_bullet1.wav",105,math.random(50,70))
			self:EmitSound("physics/body/body_medium_impact_hard"..math.random(1,6)..".wav", 95, 90, 1)
								self:EmitSound("skibidibop_series/explode_1.wav", 95, 190, 1)
									ParticleEffect("explosion_huge_j", self:GetPos(), self:GetAngles(), nil)
				ParticleEffect("explosion_huge_f", self:GetPos(), self:GetAngles(), nil)
		else
			self:EmitSound("npc/zombie/claw_miss"..math.random(1,2)..".wav", 100, 100, 1)
		end
			if self:IsPlayingSequence("attack 2") then
		ParticleEffect("explosion_huge_c", self:GetBonePosition(20), self:GetAngles(), nil)
		ParticleEffect("explosion_huge_d", self:GetBonePosition(20), self:GetAngles(), nil)
		self:EmitSound("skibidibop_series/explode_1.wav", 95, 100, 1)
		self:EmitSound("tvtit_upgr/usesword2.wav", 150, 100, 1) 
		if not (self:GetCooldown("speak2") > 0) then
			self:SetCooldown("speak2", math.random(7,9))
				if math.random(0,1) == 0 then
							self:EmitSound("tvtit_upgr/tvspeak4.wav", 150, 100, 1) 
						else
							self:EmitSound("tvtit_upgr/tvspeak5.wav", 150, 100, 1) 
						end
				self:Timer(0.1, function()
					if IsValid(self.MyComponents[1].entity) then
						if math.random(0,1) == 0 then
							self.MyComponents[1].entity:SetSubMaterial(12,"my/tv005")
						else
							self.MyComponents[1].entity:SetSubMaterial(12,"my/tv003")
						end
					end
					self:Timer(5, function()
						if IsValid(self.MyComponents[1].entity) then
							self.MyComponents[1].entity:SetSubMaterial(12,"models/ivip/tv/ekr2")
						end
			          	end)
				end)
			end
		if IsValid(self) then
				   local enemies = ents.FindInSphere( self:GetPos(), 4810 )
				   for M=1, #enemies do 
						if enemies[M]:IsPlayer() then  
							enemies[M]:ScreenFade( SCREENFADE.IN, Color( 45, 45, 245, 20 ), 0.1, 0.3 )
						end
				   end
		end
  	end
			if self:IsPlayingSequence("attack 5") then
		ParticleEffect("explosion_huge_c", self:GetBonePosition(20), self:GetAngles(), nil)
		ParticleEffect("explosion_huge_d", self:GetBonePosition(20), self:GetAngles(), nil)
		self:EmitSound("skibidibop_series/explode_1.wav", 95, 100, 1)
		self:EmitSound("tvtit_upgr/usesword2.wav", 150, 90, 1) 
		if IsValid(self) then
				   local enemies = ents.FindInSphere( self:GetPos(), 4810 )
				   for M=1, #enemies do 
						if enemies[M]:IsPlayer() then  
							enemies[M]:ScreenFade( SCREENFADE.IN, Color( 45, 45, 245, 20 ), 0.1, 0.3 )
						end
				   end
		end
  	end
			
			if self:IsPlayingSequence("attack 1") then
		ParticleEffect("explosion_huge_c", self:GetBonePosition(20), self:GetAngles(), nil)
		ParticleEffect("explosion_huge_d", self:GetBonePosition(20), self:GetAngles(), nil)
		self:EmitSound("skibidibop_series/explode_1.wav", 95, 100, 1)
		self:EmitSound("tvtit_upgr/usesword2.wav", 150, 90, 1) 
		if IsValid(self) then
				   local enemies = ents.FindInSphere( self:GetPos(), 4810 )
				   for M=1, #enemies do 
						if enemies[M]:IsPlayer() then  
							enemies[M]:ScreenFade( SCREENFADE.IN, Color( 45, 45, 245, 20 ), 0.1, 0.3 )
						end
				   end
		end
  	end
		if (#hit > 0) then	
			for M=1,#hit do
				local hitent = hit[M]
				if IsValid(hitent) and not self:IsAlly(hitent) then
					if hitent.IsDrGNextbot then
						hitent:Jump(5000)
						hitent:SetVelocity(self:GetForward()*1000+self:GetUp()*500)
					else
						hitent:SetVelocity(self:GetForward()*1000+self:GetUp()*500)
					end
					--[[
					local effect = ents.Create("info_particle_system")
					effect:SetKeyValue("effect_name","[8]ball_core")
					effect:SetPos(hitent:WorldSpaceCenter())
					effect:Spawn()
					effect:Activate()
					effect:Fire("Start","",0)
					effect:Fire("Kill","",0.2)
					]]
				end
			end
		end
    end)

		
	 
	end	

end




function ENT:EatableENTSizeChecker(EatAble)
	if IsValid(EatAble) then
		self.enemy_BoxMin, self.enemy_BoxMax = EatAble:OBBMins(), EatAble:OBBMaxs()				
		self.enemy_SizeX = (math.abs(self.enemy_BoxMin.x)+math.abs(self.enemy_BoxMax.x))
		self.enemy_SizeY = (math.abs(self.enemy_BoxMin.y)+math.abs(self.enemy_BoxMax.y))
		self.enemy_SizeZ = (math.abs(self.enemy_BoxMin.z)+math.abs(self.enemy_BoxMax.z))		 

		return self.enemy_SizeZ
	end
end
  
 


end
-- DO NOT TOUCH --
AddCSLuaFile()
DrGBase.AddNextbot(ENT)
