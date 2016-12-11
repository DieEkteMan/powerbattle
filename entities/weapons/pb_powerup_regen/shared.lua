AddCSLuaFile()


SWEP.Author 						=	"Rowie"
SWEP.Base 							= "weapon_base"
SWEP.PrintName 						= "Health Regen"
SWEP.Instructions 					= [[ Shoot to activate! This will regen your health]]

SWEP.ViewModel						= "models/weapons/c_357.mdl"
SWEP.ViewModelFlip 					= false
SWEP.UseHands						= true
SWEP.WorldModel 					= "models/weapons/w_357.mdl"
SWEP.SetHoldType					= "pistol"

SWEP.Weight 						= 1
SWEP.AutoSwitchTo 					= false
SWEP.AutoSwitchFrom 				= false

SWEP.Slot 							= 1
SWEP.SlotPos 						= 0

SWEP.DrawAmmo 						= false
SWEP.DrawCrosshair 					= false

SWEP.Spawnable 						= true
SWEP.AdminSpawnable 				= true

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
	self:SetHoldType( "pistol" )
end

function SWEP:PrimaryAttack()
	local ply = self.Owner
	self.Owner:PrintMessage( HUD_PRINTCENTER, "Regenerating health" )
	if ( SERVER ) then SafeRemoveEntity( self.Owner:StripWeapon( "pb_powerup_regen" ) ) end

	timer.Create( "REGEN" ..ply:UserID(), 1, 10, function()
		ply:SetHealth( math.Clamp( ply:Health() + 10, 1, ply:GetMaxHealth() ) )
	end)
end



function SWEP:SecondaryAttack()

end