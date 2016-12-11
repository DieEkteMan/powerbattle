AddCSLuaFile()

EFFECT.Mat = Material( "models/props_combine/portalball001_sheet" )
--EFFECT.Mat = Material( "models/effects/comball_tape" )

--[[---------------------------------------------------------
   Init( data table )
-----------------------------------------------------------]]
function EFFECT:Init( data )

	self.Entity = data:GetEntity()
	self.Radius = data:GetRadius()
    self.Center = self.Entity:OBBCenter()
    self:SetPos( self.Entity:GetPos() )

    self.EndTime = CurTime() + 30

end

--[[---------------------------------------------------------
   THINK
-----------------------------------------------------------]]
function EFFECT:Think()

    self:SetPos( self.Entity:GetPos() )
    self.Center = self.Entity:OBBCenter()
    if self.Radius < 300 then self.Radius = self.Radius + 10 end

	return ( CurTime() < self.EndTime )

end

--[[---------------------------------------------------------
   Draw the effect
-----------------------------------------------------------]]
function EFFECT:Render()

    render.SetMaterial( self.Mat )

    local pos = self:GetPos() + self.Center

    render.DrawSphere( pos, self.Radius, 7, 7, Color( 255, 255, 255, 255) )

end
