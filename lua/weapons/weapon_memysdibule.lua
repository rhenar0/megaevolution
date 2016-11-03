SWEP.PrintName = "Mega Evolution de Mysdibule"
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

  net.Start("MysdibuleTimerChangeMEA")
  net.WriteEntity(ply)
  net.Send(ply)

  net.Start("MysdibuleTimerStopMEA")
  net.WriteEntity(ply)
  net.Send(ply)

timer.Create("MEM", 0.5, 5, function()
  for i=1,50 do
	local ply = self.Owner
	ParticleEffect( "spectra_blast", ply:GetPos(), ply:GetAngles(), nil )
	ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)
  end
end)

net.Receive("MysdibuleTimerChangeMEAOK", function()
  local ply = self.Owner
  local plyveri = net.ReadEntity()

  local plysteam = ply:SteamID64()
  local plyveristeam = ply:SteamID64()

  if (plysteam == plyveristeam) then
	  plyveri:SetModel("models/yunpolmodels/pokemon/gen 3/mega mawile.mdl")
    plyveri:SetHealth(4000)
    plyveri:SetArmor(500)
    plyveri:Give("sfw_phasma")
  end
end)

net.Receive("MysdibuleTimerStopMEAOK",function()
  local ply = self.Owner
  local plyveri = net.ReadEntity()

  local plysteam = ply:SteamID64()
  local plyveristeam = ply:SteamID64()

  if (plysteam == plyveristeam) then
    plyveri:SetModel("models/yunpolmodels/pokemon/gen 3/mawile.mdl")
    plyveri:SetHealth(1200)
    plyveri:SetArmor(0)
    plyveri:StripWeapon("sfw_phasma")
    plyveri:StripWeapon("weapon_memysdibule")

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
