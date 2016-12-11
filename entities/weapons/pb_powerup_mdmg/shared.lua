AddCSLuaFile()


SWEP.Author 						=	"Rowie"
SWEP.Base 							= "weapon_base"
SWEP.PrintName 						= "Moar Damage!"
SWEP.Instructions 					= [[ Shoot to activate! This will double your damage for 20 seconds! Make it count! ]]

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

SWEP.Spawnable 						= false
SWEP.AdminSpawnable 				= false

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
	self.Owner:SetPlayerColor( Vector(255, 255, 255, 3) ) 			
	self.Owner:SetMaterial( "sprites/heatwave" )
	self.Owner:PrintMessage( HUD_PRINTCENTER, "Cloak On" )
	if ( SERVER ) then SafeRemoveEntity( self.Owner:StripWeapon( "pb_powerup_cloak" ) ) end

	timer.Simple(15, function()
	ply:SetMaterial( "models/glass" )
	ply:PrintMessage( HUD_PRINTCENTER, "You are no longer cloaked!" )
	end)
end



function SWEP:SecondaryAttack()

end