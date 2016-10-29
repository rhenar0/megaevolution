AddCSLuaFile()
AddCSLuaFile( "effects/fxbase.lua" )
include( "effects/fxbase.lua" )

EFFECT.Speed	= 13000
EFFECT.Length	= 64

function EFFECT:Think()
	
	util.ParticleTracerEx( 
		"spectra_tracer", --particle system
		self.StartPos, --startpos
		self.EndPos, --endpos
		self.Entity:EntIndex(), --entity index
		1, --do whiz effect
		-1  --attachment
	)
	
	return false
	
end