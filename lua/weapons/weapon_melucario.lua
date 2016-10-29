SWEP.PrintName = "Mega Evolution Lucario"
SWEP.Author = "Rhenar"
SWEP.Instructions = "Clique gauche pour Mega Evoluer"

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"

SWEP.Weight	= 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.DrawAmmo = false
SWEP.DrawCrosshair = false

SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

function SWEP:PrimaryAttack()

	local ply = self.Owner
	ply:EmitSound("megaevolution/me.mp3")

	timer.Create("MEB", 0.5, 5, function()
	for i=1,50 do

	local ply = self.Owner
	ParticleEffect( "spectra_blast", ply:GetPos(), ply:GetAngles(), nil )
	ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)
	MsgC("KK")
	end
	end)

	local ply = self.Owner
	ply:ConCommand("say /megalucario")


	local ply = self.Owner
	ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)


	self:SetNextPrimaryFire(CurTime()+120)

end
