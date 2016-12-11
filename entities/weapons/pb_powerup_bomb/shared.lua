AddCSLuaFile()


SWEP.Author                         =   "Rowie & "
SWEP.Base                           = "weapon_base"
SWEP.PrintName                      = "BOMB!"
SWEP.Instructions                   = [[ Shoot to activate! You will suicide with a bomb ]]

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
SWEP.AbilitySound = {"vo/npc/male01/runforyourlife01.wav", "vo/canals/female01/gunboat_farewell.wav", "vo/canals/male01/stn6_incoming.wav"}


function SWEP:Initialize()
    self:SetHoldType( "pistol" )
end

function SWEP:PrimaryAttack()
    local ply = self.Owner
    local last = 1
    
    for t = 10, 1, -1 do
        timer.Simple( math.log( t ), function()
            if !IsValid( ply ) or !ply:Alive() then return end
            ply:SetColor( ColorRand() )
            ply:SetPlayerColor( Vector( math.Rand(0, 1), math.Rand(0, 1), math.Rand(0, 1) ) )
        end )
        last = math.log( t )
    end

    timer.Simple( 2, function()
        if !IsValid( ply ) or !ply:Alive() then return end
        if SERVER then
            ply:Kill()
            local explode = ents.Create( "env_explosion" )
            explode:SetPos( ply:GetPos() )
            explode:SetOwner( ply:GetPos() )
            explode:Spawn()
            explode:SetKeyValue( "iMagnitude", "105" )
            explode:Fire( "Explode", 0, 0 )
            explode:EmitSound( "weapon_AWP.Single", 1000, 1000 )
        end
    end)

    timer.Simple( 2.1, function()
        ply:SetModelScale( 1, 0.1 )
        ply:SetColor( Color( 255, 255, 255, 255 ) )
    end)
end



function SWEP:SecondaryAttack()

end























