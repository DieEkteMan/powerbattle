AddCSLuaFile()


SWEP.Author 						=	"Rowie"
SWEP.Base 							= "weapon_base"
SWEP.PrintName 						= "Prophunt!"
SWEP.Instructions 					= [[ Shoot to activate! This will turn you into a prop for 30 seconds! Make it count! ]]

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
	self.Owner:SetModel( "models/props_junk/plasticbucket001a.mdl" )		
	
	if ( SERVER ) then SafeRemoveEntity( self.Owner:StripWeapon( "pb_powerup_prop" ) ) end

	timer.Simple(15, function()
	self.Owner:SetModel( "models/player/kleiner.mdl" )
	ply:PrintMessage( HUD_PRINTCENTER, "You are no longer a prop!" )
	end)
end



function SWEP:SecondaryAttack()

end