script.on_init(function()
  game.create_force("EE_arachnid")
  if game.forces["arachnid"] ~= nil then
	game.merge_forces("arachnid", "EE_arachnid")
  end
end)
