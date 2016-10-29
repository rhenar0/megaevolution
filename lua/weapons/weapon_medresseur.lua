SWEP.PrintName = "Mega Evolution Dresseur"
SWEP.Author = "Rhenar"
SWEP.Instructions = "Clique gauche pour faire Mega Evoluer votre pokemon"

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

function SWEP:Initialize()

if (SERVER) then

	util.AddNetworkString("MegaEvolution")

end

end

function SWEP:PrimaryAttack()

self.Weapon:SetNextPrimaryFire( CurTime() + 5 )

timer.Create("mmdresseur", 0.1, 50, function()

	if (SERVER) then

		net.Start("MegaEvolution")
		net.Broadcast()

	end
end)

	local ply = self.Owner
	ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)

end