
  resource.AddFile("sound/megaevolution/me.mp3")
  resource.AddFile("particles/megaevolution/spectra_fx.pcf")

  PrecacheParticleSystem( "spectra_blast" )
  PrecacheParticleSystem( "spectra_tracer" )

  game.AddParticles( "particles/spectra_fx.pcf" )
