AddCSLuaFile()


SWEP.Author                         =   "Rowie"
SWEP.Base                           = "weapon_base"
SWEP.PrintName                      = "Shield"
SWEP.Instructions                   = [[ Shoot to activate! This will shield you for 30 seconds! Make it count! ]]

SWEP.ViewModel                      = "models/weapons/c_357.mdl"
SWEP.ViewModelFlip                  = false
SWEP.UseHands                       = true
SWEP.WorldModel                     = "models/weapons/w_357.mdl"
SWEP.SetHoldType                    = "pistol"

SWEP.Weight                         = 1
SWEP.AutoSwitchTo                   = false
SWEP.AutoSwitchFrom                 = false

SWEP.Slot                           = 1
SWEP.SlotPos                        = 0

SWEP.DrawAmmo                       = false
SWEP.DrawCrosshair                  = false

SWEP.Spawnable                      = false
SWEP.AdminSpawnable                 = false

SWEP.Primary.ClipSize               = 1
SWEP.Primary.DefaultClip            = 1 
SWEP.Primary.Ammo                   = "none"
SWEP.Primary.Automatic              = false 
SWEP.Primary.Recoil                 = 0
SWEP.Primary.Damage                 = 0

SWEP.Secondary.ClipSize             = -1
SWEP.Secondary.DefaultClip          = -1
SWEP.Secondary.Ammo                 = "none"
SWEP.Secondary.Automatic            = false

SWEP.ShouldDropOnDie                = false 


function SWEP:Initialize()
    self:SetHoldType( "pistol" )
end

function SWEP:PrimaryAttack()
    local ply = self.Owner
    
    local effectdata = EffectData()
    effectdata:SetEntity( ply )
    effectdata:SetRadius( 5 )
    
    if ( SERVER ) then self.Owner:GodEnable() end

    util.Effect( "pb_shield", effectdata, true, true )
    for _,v in pairs( player.GetAll() ) do
        if v:GetPos():Distance( ply:GetPos() ) < 300 then
            local effect = EffectData()
            effect:SetEntity( v )
        end
    end
    if ( SERVER ) then SafeRemoveEntity( self.Owner:StripWeapon( "pb_powerup_shield" ) ) end

    timer.Simple(30, function()
    ply:PrintMessage( HUD_PRINTCENTER, "Shield disabled!" )
    ply:RemoveFlags( FL_GODMODE )
    end)
end



function SWEP:SecondaryAttack()

end