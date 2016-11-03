SWEP.PrintName = "Mega Evolution de Dracaufeu"
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

  net.Start("DracoTimerChangeMEA")
  net.WriteEntity(ply)
  net.Send(ply)

  net.Start("DracoTimerStopMEA")
  net.WriteEntity(ply)
  net.Send(ply)

timer.Create("MED", 0.5, 5, function()
  for i=1,50 do
	local ply = self.Owner
	ParticleEffect( "spectra_blast", ply:GetPos(), ply:GetAngles(), nil )
	ParticleEffect( "spectra_tracer", ply:GetPos(), ply:GetAngles(), nil)
  end
end)

net.Receive("DracoTimerChangeMEAOK", function()
  local ply = self.Owner
  local plyveri = net.ReadEntity()

  local plysteam = ply:SteamID64()
  local plyveristeam = ply:SteamID64()

  if (plysteam == plyveristeam) then
  local rd = math.random(1,2)
  if (rd == 1) then
    plyveri:SetModel("models/lucian/pokemon/charizard_mega_y.mdl")
  elseif (rd == 2) then
    plyveri:SetModel("models/lucian/pokemon/charizard_mega_x.mdl")
  else
    plyveri:SetModel("models/lucian/pokemon/charizard_mega_x.mdl")
  end
  plyveri:SetHealth(4000)
  plyveri:SetArmor(500)
  plyveri:Give("sfw_phasma")
  end
end)

net.Receive("DracoTimerStopMEAOK",function()
  local ply = self.Owner
  local plyveri = net.ReadEntity()

  local plysteam = ply:SteamID64()
  local plyveristeam = ply:SteamID64()

  if (plysteam == plyveristeam) then
  plyveri:SetModel("models/lucian/pokemon/charizard.mdl")
  plyveri:SetHealth(1200)
  plyveri:SetArmor(0)
  plyveri:StripWeapon("sfw_phasma")
  plyveri:StripWeapon("weapon_medracofeu")

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
