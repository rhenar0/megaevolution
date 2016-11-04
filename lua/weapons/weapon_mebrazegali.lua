SWEP.PrintName = "Mega Evolution de Brazegali"
SWEP.Author = "Rhenar"
SWEP.Category = "Mega Evolution"
SWEP.Instructions = "Clique gauche pour Mega Evoluer pendant 75 secondes"

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

SWEP.WorldModel = ""

SWEP.ViewModelFOV = 62
SWEP.ViewModelFlip = false
SWEP.AnimPrefix  = "rpg"

function SWEP:PrimaryAttack()

  local ply = self.Owner
  ply:EmitSound("megaevolution/me.mp3")

if SERVER then

  local ply = self.Owner

  net.Start("BrazTimerChangeMEA")
  net.WriteEntity(ply)
  net.Send(ply)

  net.Start("BrazTimerStopMEA")
  net.WriteEntity(ply)
  net.Send(ply)

timer.Create("MEB", 0.5, 5, function()
  for i=1,50 do
	local ply = self.Owner
	ParticleEffect( "spectra_blast", ply:GetPos(), ply:GetAngles(), nil )
	ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)
  end
end)

net.Receive("BrazTimerChangeMEAOK", function()
  local ply = self.Owner
  local plyveri = net.ReadEntity()

  local plysteam = ply:SteamID64()
  local plyveristeam = ply:SteamID64()

  if (plysteam == plyveristeam) then
	  plyveri:SetModel("models/lucian/pokemon/blaziken_mega.mdl")
    plyveri:SetHealth(6000)
    plyveri:SetArmor(1000)
    plyveri:Give("sfw_phasma")
  end
end)

net.Receive("BrazTimerStopMEAOK",function()
  local ply = self.Owner
  local plyveri = net.ReadEntity()

  local plysteam = ply:SteamID64()
  local plyveristeam = ply:SteamID64()

  if (plysteam == plyveristeam) then
    plyveri:SetModel("models/player/pokemon/blazikenpm.mdl")
    plyveri:SetHealth(3000)
    plyveri:SetArmor(0)
    plyveri:StripWeapon("sfw_phasma")
    plyveri:StripWeapon("weapon_mebrazegali")

    for i=1,5 do
      ParticleEffect( "spectra_tracer", plyveri:GetPos(), plyveri:GetAngles(), nil)
    end
  end
end)

end

	local ply = self.Owner
	ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)

  self:SetNextPrimaryFire(CurTime()+120)

end
