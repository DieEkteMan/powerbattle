AddCSLuaFile()


SWEP.Author 						=	"Rowie"
SWEP.Base 							= "weapon_base"
SWEP.PrintName 						= "Armor"
SWEP.Instructions 					= [[ Shoot to activate! This will will give you 100% body armor! ]]

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
	if ( SERVER ) then self.Owner:SetArmor(100) end
	if ( SERVER ) then SafeRemoveEntity( self.Owner:StripWeapon( "pb_powerup_armor" ) ) end
end



function SWEP:SecondaryAttack()

end