SWEP.PrintName = "Mega Evolution de Lucario"
SWEP.Author = "Rhenar"
SWEP.Category = "Mega Evolution"
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

	timer.Create("MEL", 0.5, 5, function()
	  for i=1,50 do
		local ply = self.Owner
		ParticleEffect( "spectra_blast", ply:GetPos(), ply:GetAngles(), nil )
		ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)
	  end
	end)

	timer.Create("ChangeMEL", 2.5, 1, function()
		local ply = self.Owner
		ply:SetModel("models/player/pokemon/megalucario.mdl")
	  ply:SetHealth(4000)
	  ply:SetArmor(500)
	  ply:Give("sfw_phasma")
	end)

	timer.Create("StopMEL", 75, 1, function()
	  local ply = self.Owner
	  ply:SetModel("models/smashbros/lucario_player/lucario_player.mdl")
	  ply:SetHealth(1200)
	  ply:SetArmor(0)
	  ply:StripWeapon("sfw_phasma")
	  ply:StripWeapon("weapon_melucario")

	  for i=1,5 do
	  ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)
	  end

	end)

		local ply = self.Owner
		ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)


	  self:SetNextPrimaryFire(CurTime()+120)


end
