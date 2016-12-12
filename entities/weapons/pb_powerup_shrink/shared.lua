AddCSLuaFile()


SWEP.Author 						=	"Rowie"
SWEP.Base 							= "weapon_base"
SWEP.PrintName 						= "Shrink yourself!"
SWEP.Instructions 					= [[ Shoot to activate! This will shrink you for 30 seconds! Make it count! ]]

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
	self.Owner:SetRunSpeed( self.Owner:GetRunSpeed() * 1.5 )
    self.Owner:SetWalkSpeed( self.Owner:GetWalkSpeed() * 1.5 )
    self.Owner:SetModelScale( self.Owner:GetModelScale() / 2.5, 1 )
    self.Owner:SetHealth( self.Owner:Health() / 2.5 )
	self.Owner:PrintMessage( HUD_PRINTCENTER, "Shrunken!" )
	if ( SERVER ) then SafeRemoveEntity( self.Owner:StripWeapon( "pb_powerup_shrink" ) ) end

	timer.Simple(30, function()
	ply:SetRunSpeed( 500 )
    ply:SetWalkSpeed( 250 )
   	ply:SetModelScale( 1, 1 )
	ply:PrintMessage( HUD_PRINTCENTER, "You now have your normal size back!" )
	end)
end



function SWEP:SecondaryAttack()

end