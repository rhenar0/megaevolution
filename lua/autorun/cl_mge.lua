-- Absol

if CLIENT then


net.Receive("AbsolTimerChangeMEA", function()

  local ply = net.ReadEntity()

  timer.Create("ChangeMEA", 2.5, 1, function()
    net.Start("AbsolTimerChangeMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

net.Receive("AbsolTimerStopMEA", function()

  local ply = net.ReadEntity()

  timer.Create("StopMEA", 75, 1, function()
    net.Start("AbsolTimerStopMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

-- Dracofeu

net.Receive("DracoTimerChangeMEA", function()

  local ply = net.ReadEntity()

  timer.Create("ChangeMED", 2.5, 1, function()
    net.Start("DracoTimerChangeMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

net.Receive("DracoTimerStopMEA", function()

  local ply = net.ReadEntity()

  timer.Create("StopMED", 75, 1, function()
    net.Start("DracoTimerStopMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

-- Brazegali

net.Receive("BrazTimerChangeMEA", function()

  local ply = net.ReadEntity()

  timer.Create("ChangeMEB", 2.5, 1, function()
    net.Start("BrazTimerChangeMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

net.Receive("BrazTimerStopMEA", function()

  local ply = net.ReadEntity()

  timer.Create("StopMEB", 75, 1, function()
    net.Start("BrazTimerStopMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

-- Mysdibule

net.Receive("MysdiTimerChangeMEA", function()

  local ply = net.ReadEntity()

  timer.Create("ChangeMEM", 2.5, 1, function()
    net.Start("MysdiTimerChangeMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

net.Receive("MysdiTimerStopMEA", function()

  local ply = net.ReadEntity()

  timer.Create("StopMEM", 75, 1, function()
    net.Start("MysdiTimerStopMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

-- Lucario

net.Receive("LucarioTimerChangeMEA", function()

  local ply = net.ReadEntity()

  timer.Create("LucarioMEL", 2.5, 1, function()
    net.Start("LucarioTimerChangeMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

net.Receive("LucarioTimerStopMEA", function()

  local ply = net.ReadEntity()

  timer.Create("StopMEL", 75, 1, function()
    net.Start("LucarioTimerStopMEAOK")
    net.WriteEntity(ply)
    net.SendToServer()
  end)

end)

end
