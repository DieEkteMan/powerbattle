
AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

/*---------------------------------------------------------
   Name: Initialize
---------------------------------------------------------*/
function ENT:Initialize()

	self.Entity:DrawShadow( false )
	self.Entity:SetSolid( SOLID_NONE )
	
end

function ENT:Think()
end

