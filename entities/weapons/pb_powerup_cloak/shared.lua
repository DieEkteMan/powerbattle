AddCSLuaFile()


SWEP.Author 						=	"Rowie"
SWEP.Base 							= "weapon_base"
SWEP.PrintName 						= "Cloak"
SWEP.Instructions 					= [[ Press Left Mouse Button to activate ]]

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


local function uncloak()
	local ply = self.Owner
	self.Owner:SetMaterial("models/glass")
	self.Weapon:SetMaterial("models/glass")
	self.Owner:PrintMessage( HUD_PRINTCENTER, "Cloak Off" )

end

function SWEP:PrimaryAttack()
	local ply = self.Owner
	self.Owner:SetColor( Color(255, 255, 255, 3) ) 			
	self.Owner:SetMaterial( "sprites/heatwave" )
	self.Weapon:SetMaterial("sprites/heatwave")
	self.Owner:PrintMessage( HUD_PRINTCENTER, "Cloak On" )
	if ( SERVER ) then SafeRemoveEntity( self.Owner:StripWeapon( "pb_powerup_cloak" ) ) end

	timer.Create( "Uncloak", 15, 1, uncloak )
end



function SWEP:SecondaryAttack()

end