hl.on("hyprland.start", function()
	hl.exec_cmd("regreet; hyprctl dispatch 'hl.dsp.exit()'")
end)


hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = 1,
})

hl.env("XCURSOR_SIZE", "20")
hl.env("HYPRCURSOR_SIZE", "20")


hl.config({
	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = true,
		background_color = 0x000000,
	},
})


