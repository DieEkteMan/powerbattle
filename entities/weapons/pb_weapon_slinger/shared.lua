SWEP.Author			= "GamerTech13 & Rowie"
SWEP.Category 		= "SpiderMan"
SWEP.Contact		= ""
SWEP.Purpose		= "Allows you to be Spider-Man"
SWEP.Instructions	= "Left click to web swing\nRight Click to shoot webs"

SWEP.Spawnable			= false
SWEP.AdminSpawnable		= true
SWEP.HoldType 			= "pistol"
SWEP.PrintName			= "Slinger"			
SWEP.Slot				= 2
SWEP.SlotPos			= 0
SWEP.DrawAmmo			= false
SWEP.DrawCrosshair		= true
SWEP.ViewModel			= "models/weapons/v_pistol.mdl"
SWEP.WorldModel			= "models/weapons/w_pistol.mdl"
SWEP.ViewModelFlip = true
SWEP.Primary.ClipSize 				= 1
SWEP.Primary.DefaultClip 			= 1 
SWEP.Primary.Ammo 					= "none"
SWEP.Primary.Automatic  			= false 
SWEP.Primary.Recoil 				= 0
SWEP.Primary.Damage 				= 0

SWEP.Secondary.ClipSize 			= -1
SWEP.Secondary.DefaultClip 			= -1
SWEP.Secondary.Ammo     			= "none"
SWEP.Secondary.Automatic 			= false

SWEP.ShouldDropOnDie 				= false 

function SWEP:Initialize()
if CLIENT then
self:SetWeaponHoldType("pistol")
end
end

function SWEP:Think()
	if !self.Owner:IsOnGround() then
	self.Owner:SetAllowFullRotation(true)
	elseif self.Owner:IsOnGround() then
	self.Owner:SetAllowFullRotation(false)
	end
	if (!self.Owner || self.Owner == NULL) then return end
	
	if ( self.Owner:KeyPressed( IN_ATTACK ) ) then
		if CLIENT then
		self:SetWeaponHoldType("pistol")
		end
		self:StartAttack()
		
	elseif ( self.Owner:KeyDown( IN_ATTACK ) && inRange ) then
	
		self:UpdateAttack()
		
	elseif ( self.Owner:KeyReleased( IN_ATTACK ) && inRange ) then
		if CLIENT then
		self:SetWeaponHoldType("pistol")
		end
		self:EndAttack( true )
	
	end
	if self.Owner:IsOnGround() then
		if ( self.Owner:KeyPressed( IN_JUMP )) then
			self.Owner:SetVelocity(self.Owner:GetUp() * 500)
		end
	end
	if ( self.Owner:KeyPressed( IN_ATTACK2 ) ) then
		if CLIENT then
		self:SetWeaponHoldType("pistol")
		end
		self:Attack2()
		
	end
	if ( self.Owner:KeyReleased( IN_ATTACK2 ) ) then
		if CLIENT then
		timer.Simple(0.31, function()
		self:SetWeaponHoldType("normal")
		end)
		end
	end

end

function SWEP:DoTrace( endpos )
	local trace = {}
		trace.start = self.Owner:GetShootPos()
		trace.endpos = trace.start + (self.Owner:GetAimVector() * 14096)
		if(endpos) then trace.endpos = (endpos - self.Tr.HitNormal * 7) end
		trace.filter = { self.Owner, self.Weapon }
		
	self.Tr = nil
	self.Tr = util.TraceLine( trace )
end

function SWEP:StartAttack()
	local gunPos = self.Owner:GetShootPos()
	local disTrace = self.Owner:GetEyeTrace()
	local hitPos = disTrace.HitPos
	
	local x = (gunPos.x - hitPos.x)^2;
	local y = (gunPos.y - hitPos.y)^2;
	local z = (gunPos.z - hitPos.z)^2;
	local distance = math.sqrt(x + y + z);
	
	local distanceCvar = GetConVarNumber("rope_distance")
	inRange = false
	if distance <= distanceCvar then
		inRange = true
	end
	
	if inRange then
		if (SERVER) then
			
			if (!self.Beam) then
				self.Beam = ents.Create( "rope" )
					self.Beam:SetPos( self.Owner:GetShootPos() )
				self.Beam:Spawn()
			end
			
			self.Beam:SetParent( self.Owner )
			self.Beam:SetOwner( self.Owner )
		
		end
		
		self:DoTrace()
		self.speed = 10000
		self.startTime = CurTime()
		self.endTime = CurTime() + self.speed
		self.dt = -1
		
		if (SERVER && self.Beam) then
			self.Beam:GetTable():SetEndPos( self.Tr.HitPos )
		end
		
		self:UpdateAttack()
		
	else
	end
end

function SWEP:UpdateAttack()

	self.Owner:LagCompensation( true )
	
	disTrace = self.Owner:GetEyeTrace()
	hitPos = disTrace.HitPos
	endpos = self.Tr.HitPos
	if (SERVER && self.Beam) then
		self.Beam:GetTable():SetEndPos( endpos )
	end

	lastpos = endpos
	
	
			if ( self.Tr.Entity:IsValid() ) then
			
					endpos = self.Tr.Entity:GetPos()
					if ( SERVER ) then
					self.Beam:GetTable():SetEndPos( endpos )
					end
			
			end
			
			local vVel = (endpos - self.Owner:GetPos())
			local Distance = endpos:Distance(self.Owner:GetPos())
			
			local et = (self.startTime + (Distance/self.speed))
			if(self.dt != 0) then
				self.dt = (et - CurTime()) / (et - self.startTime)
			end
			if(self.dt < 0) then
				self.dt = 0
			end
			
			if(self.dt == 0) then
			zVel = self.Owner:GetVelocity().z
			vVel = vVel:GetNormalized()*(math.Clamp(Distance,0,7))
				if( SERVER ) then
				local gravity = GetConVarNumber("sv_Gravity")
				vVel:Add(Vector(0,0,(gravity/100)*1.5))
				if(zVel < 0) then
					vVel:Sub(Vector(0,0,zVel/100))
				end
				self.Owner:SetVelocity(vVel)
				end
			end
	
	endpos = nil
	
	self.Owner:LagCompensation( false )
	
end

function SWEP:EndAttack( shutdownsound )
	
	if ( CLIENT ) then return end
	if ( !self.Beam ) then return end
	
	self.Beam:Remove()
	self.Beam = nil
	
end

function SWEP:Attack2()
			

	if (CLIENT) then return end
		local CF = self.Owner:GetFOV()
		if CF == 90 then
			self.Owner:SetFOV(30,.3)
		elseif CF == 30 then
			self.Owner:SetFOV(90,.3)
	end
end
if SERVER then
function SWEP:Deploy()
	self.Owner.ShouldReduceFallDamage = true
	return true
end
 
function SWEP:Holster()
	self:EndAttack( false )
	self.Owner.ShouldReduceFallDamage = false
	return true
end
 
local function ReduceFallDamage(ent, dmginfo)
	if ent:IsPlayer() and ent.ShouldReduceFallDamage and dmginfo:IsFallDamage() then
		dmginfo:SetDamage(0)
	end
end
 
hook.Add("EntityTakeDamage", "ReduceFallDamage", ReduceFallDamage)
end
function SWEP:OnRemove()
	self:EndAttack( false )
	return true
end
function SWEP:PrimaryAttack()
	if not inRange then
	self.Weapon:SendWeaponAnim(ACT_VM_SWINGMISS)
	elseif inRange then
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)
	timer.Simple(0.2, function()
	self.Weapon:EmitSound("web/webfire.wav")
	end)
	timer.Simple(0.5, function() self.Weapon:SendWeaponAnim(ACT_VM_IDLE_LOWERED) end)
	end
end

function SWEP:SecondaryAttack()

end