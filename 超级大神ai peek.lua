_DEBUG = true

local var_0_0 = require("ffi")
local var_0_1 = require("neverlose/b_renderer")
local var_0_2 = var_0_0.cdef
local var_0_3 = var_0_0.cast
local var_0_4 = var_0_0.new
local var_0_5 = bit.band
local var_0_6 = bit.bor
local var_0_7 = {}
local var_0_8 = {}
local var_0_9 = require("neverlose/beams")

local function var_0_10(arg_1_0, arg_1_1, arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	var_0_9.m_nType = 0
	var_0_9.m_nModelIndex = -1
	var_0_9.m_flHaloScale = 0
	var_0_9.m_flLife = 0.05
	var_0_9.m_flFadeLength = 0
	var_0_9.m_flWidth = 2
	var_0_9.m_flEndWidth = 1
	var_0_9.m_pszModelName = "sprites/physbeam.vmt"
	var_0_9.m_flAmplitude = 2.3
	var_0_9.m_flSpeed = 0
	var_0_9.m_nStartFrame = 0
	var_0_9.m_flFrameRate = 0
	var_0_9.m_color = color(arg_1_2, arg_1_3, arg_1_4, arg_1_5)
	var_0_9.m_nSegments = 2
	var_0_9.m_bRenderable = true
	var_0_9.m_nFlags = bit.bor(33544)
	var_0_9.m_vecStart = arg_1_0
	var_0_9.m_vecEnd = arg_1_1

	var_0_9.create_beam_points()
end

local var_0_11 = {
	{
		-10,
		10,
		2
	},
	{
		10,
		10,
		2
	},
	{
		-10,
		-10,
		2
	},
	{
		10,
		-10,
		2
	}
}

local function var_0_12(arg_2_0, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	local var_2_0 = vector(arg_2_0.x + var_0_11[1][1], arg_2_0.y + var_0_11[1][2], arg_2_0.z + var_0_11[1][3])
	local var_2_1 = vector(arg_2_0.x + var_0_11[2][1], arg_2_0.y + var_0_11[2][2], arg_2_0.z + var_0_11[2][3])
	local var_2_2 = vector(arg_2_0.x + var_0_11[3][1], arg_2_0.y + var_0_11[3][2], arg_2_0.z + var_0_11[3][3])
	local var_2_3 = vector(arg_2_0.x + var_0_11[4][1], arg_2_0.y + var_0_11[4][2], arg_2_0.z + var_0_11[4][3])

	var_0_10(var_2_0, var_2_1, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	var_0_10(var_2_0, var_2_2, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	var_0_10(var_2_2, var_2_3, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
	var_0_10(var_2_1, var_2_3, arg_2_1, arg_2_2, arg_2_3, arg_2_4)
end

local var_0_13 = {
	get = function(arg_3_0)
		return arg_3_0:get()
	end,
	set = function(arg_4_0, arg_4_1)
		return arg_4_0:set(arg_4_1)
	end,
	override = function(arg_5_0, arg_5_1)
		return arg_5_0:override(arg_5_1)
	end,
	group = function(arg_6_0)
		return ui.create(arg_6_0)
	end,
	color = function(arg_7_0, arg_7_1, arg_7_2)
		return arg_7_0:color_picker(arg_7_1, arg_7_2)
	end,
	tab = function(arg_8_0, arg_8_1)
		return ui.create(arg_8_0, arg_8_1)
	end,
	button = function(arg_9_0, arg_9_1, arg_9_2)
		return arg_9_0:button(arg_9_1, arg_9_2)
	end,
	label = function(arg_10_0, arg_10_1)
		return arg_10_0:label(arg_10_1)
	end,
	combo = function(arg_11_0, arg_11_1, arg_11_2)
		return arg_11_0:combo(arg_11_1, arg_11_2)
	end,
	table = function(arg_12_0, arg_12_1, arg_12_2)
		return arg_12_0:selectable(arg_12_1, arg_12_2)
	end,
	slider = function(arg_13_0, arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5, arg_13_6)
		return arg_13_0:slider(arg_13_1, arg_13_2, arg_13_3, arg_13_4, arg_13_5, arg_13_6)
	end,
	check = function(arg_14_0, arg_14_1, arg_14_2)
		if arg_14_2 == nil then
			return arg_14_0:switch(arg_14_1, false)
		end

		return arg_14_0:switch(arg_14_1, arg_14_2)
	end,
	refer = function(arg_15_0, arg_15_1, arg_15_2, arg_15_3)
		if #arg_15_3 > 1 then
			return ui.find(arg_15_0, arg_15_1, arg_15_2, arg_15_3[1], arg_15_3[2])
		end

		return ui.find(arg_15_0, arg_15_1, arg_15_2, arg_15_3[1])
	end,
	contains = function(arg_16_0, arg_16_1)
		for iter_16_0 = 1, #arg_16_0 do
			if arg_16_0[iter_16_0] == arg_16_1 then
				return true
			end
		end

		return false
	end,
	visible = function(arg_17_0, arg_17_1)
		return arg_17_0:visibility(arg_17_1)
	end,
	exec = function(arg_18_0)
		return utils.console_exec(arg_18_0)
	end,
	delay_call = function(arg_19_0, arg_19_1, arg_19_2)
		return utils.execute_after(arg_19_0, arg_19_1, arg_19_2)
	end
}
local var_0_14 = {
	inair = function(arg_20_0)
		if arg_20_0 == nil then
			arg_20_0 = arg_20_0.get_local_player()
		end

		return bit.band(arg_20_0.m_fFlags, 1) == 0
	end,
	velocity = function(arg_21_0)
		if arg_21_0 == nil then
			arg_21_0 = arg_21_0.get_local_player()
		end

		local var_21_0 = arg_21_0.m_vecVelocity

		return math.sqrt(var_21_0.x * var_21_0.x + var_21_0.y * var_21_0.y)
	end,
	crouching = function(arg_22_0)
		if arg_22_0 == nil then
			arg_22_0 = arg_22_0.get_local_player()
		end

		return bit.band(arg_22_0.m_fFlags, 4) == 0
	end,
	onhit = function(arg_23_0)
		return (bit.band(arg_23_0.m_flVelocityModifier))
	end,
	slow_walk = function()
		return var_0_13.get(reference.slowwalk)
	end
}
local var_0_15 = {
	is_grenade = function(arg_25_0)
		local var_25_0 = arg_25_0:get_player_weapon():get_weapon_index()

		return ({
			[46] = true,
			[45] = true,
			[43] = true,
			[44] = true,
			[48] = true,
			[47] = true,
			[68] = true
		})[var_25_0] or false
	end,
	get_state = function()
		local var_26_0 = entity.get_local_player()

		return var_0_14.Slow_walk() and 5 or var_0_14.inair(var_26_0) and 3 or not var_0_14.crouching(var_26_0) and 2 or var_0_14.velocity(var_26_0) > 5 and 4 or 6
	end,
	lerp = function(arg_27_0, arg_27_1, arg_27_2)
		return arg_27_0 + (arg_27_1 - arg_27_0) * arg_27_2 * globals.frametime
	end,
	is_key_release = function()
		local var_28_0 = common.is_button_down(87)
		local var_28_1 = common.is_button_down(65)
		local var_28_2 = common.is_button_down(83)
		local var_28_3 = common.is_button_down(68)

		if var_28_0 == false and var_28_1 == false and var_28_2 == false and var_28_3 == false then
			return true
		else
			return false
		end
	end,
	desync = function(arg_29_0)
		return arg_29_0.m_flPoseParameter[11] * 120 - 60
	end,
	extrapolate = function(arg_30_0, arg_30_1, arg_30_2, arg_30_3, arg_30_4)
		local var_30_0, var_30_1, var_30_2 = entity.get_prop(arg_30_0, "m_vecVelocity")
		local var_30_3 = arg_30_2 + globals.tickinterval() * var_30_0 * arg_30_1
		local var_30_4 = arg_30_3 + globals.tickinterval() * var_30_1 * arg_30_1
		local var_30_5 = arg_30_4 + globals.tickinterval() * var_30_2 * arg_30_1

		return var_30_3, var_30_4, var_30_5
	end
}
local var_0_16 = {
	inair = function(arg_31_0)
		if arg_31_0 == nil then
			arg_31_0 = arg_31_0.get_local_player()
		end

		return bit.band(arg_31_0.m_fFlags, 1) == 0
	end,
	velocity = function(arg_32_0)
		if arg_32_0 == nil then
			arg_32_0 = arg_32_0.get_local_player()
		end

		local var_32_0 = arg_32_0.m_vecVelocity

		return math.sqrt(var_32_0.x * var_32_0.x + var_32_0.y * var_32_0.y)
	end,
	extrapolate = function(arg_33_0, arg_33_1, arg_33_2, arg_33_3, arg_33_4)
		local var_33_0 = arg_33_0.m_vecVelocity
		local var_33_1 = arg_33_2 + globals.tickinterval * var_33_0.x * arg_33_1
		local var_33_2 = arg_33_3 + globals.tickinterval * var_33_0.y * arg_33_1
		local var_33_3 = arg_33_4 + globals.tickinterval * var_33_0.z * arg_33_1

		return var_33_1, var_33_2, var_33_3
	end,
	crouching = function(arg_34_0)
		if arg_34_0 == nil then
			arg_34_0 = arg_34_0.get_local_player()
		end

		return bit.band(arg_34_0.m_fFlags, 4) == 0
	end
}
local var_0_17 = {
	weapons = function(arg_35_0)
		return arg_35_0:get_player_weapon()
	end,
	origins = function(arg_36_0)
		return arg_36_0:get_origin()
	end,
	angles = function(arg_37_0)
		return arg_37_0:get_angles()
	end,
	eye_pos = function(arg_38_0)
		return arg_38_0:get_eye_position()
	end,
	hitbox_position = function(arg_39_0, arg_39_1)
		return arg_39_0:get_hitbox_position(arg_39_1)
	end,
	is_alive = function(arg_40_0)
		return arg_40_0:is_alive()
	end
}
local var_0_18 = {
	autopeek = var_0_13.tab("Autopeek", "Main"),
	keybinds = var_0_13.tab("Autopeek", "Keybinds"),
	tracing = var_0_13.tab("Autopeek", "Tracing Option"),
	visuals = var_0_13.tab("Autopeek", "Visuals")
}
local var_0_19 = {
	doubletap = var_0_13.refer("Aimbot", "Ragebot", "Main", {
		"Double Tap"
	}),
	quick_peek = var_0_13.refer("Aimbot", "Ragebot", "Main", {
		"Peek Assist"
	}),
	quick_peek_mode = var_0_13.refer("Aimbot", "Ragebot", "Main", {
		"Peek Assist",
		"Retreat Mode"
	}),
	damage = var_0_13.refer("Aimbot", "Ragebot", "Selection", {
		"Min. Damage"
	})
}
local var_0_20 = {
	key = var_0_13.check(var_0_18.keybinds, "Predict-Peek", false),
	safe_peek = var_0_13.check(var_0_18.keybinds, "Safe Peek"),
	manual_toggle = var_0_13.combo(var_0_18.keybinds, "Autopeek based", {
		"Quick Peek",
		"Manual"
	}),
	activate = var_0_13.check(var_0_18.keybinds, "[Manual] Autopeek key"),
	back_track = var_0_13.check(var_0_18.keybinds, "Force Backtrack"),
	retreat = var_0_13.check(var_0_18.keybinds, "Force Retreat", false),
	radius = var_0_13.slider(var_0_18.keybinds, "Force retreat radius", 1, 120, 30, true, ""),
	visuals = var_0_13.table(var_0_18.visuals, "Visuals", {
		"Indicator",
		"Circle",
		"Beam",
		"Retreat Circle"
	}),
	glow_enabled = var_0_13.check(var_0_18.visuals, "Glow Enabled", true),
	glow_radius = var_0_13.slider(var_0_18.visuals, "Glow Radius", 0, 8, 1, true, "°"),
	upward = var_0_13.color(var_0_18.visuals, "color picker #1", color(184, 187, 230, 230)),
	downard = var_0_13.color(var_0_18.visuals, "color picker #2", color(134, 137, 180, 80)),
	glow = var_0_13.slider(var_0_18.visuals, "Glow radius", 0, 8, 1, 1, nil),
	ignore = var_0_13.check(var_0_18.autopeek, "Ignore teammate", true),
	peekbot_polart = var_0_13.check(var_0_18.autopeek, "Individuals peek sets", false),
	autopeek_sets_manual = var_0_13.table(var_0_18.autopeek, "Human mode:", {
		"On Shot",
		"On Key Release"
	}),
	autopeek_sets_bot = var_0_13.table(var_0_18.autopeek, "Bot mode:", {
		"On Shot",
		"On Key Release"
	}),
	response = var_0_13.combo(var_0_18.tracing, "Autopeek response", {
		"Medium",
		"Fast(danger)",
		"Slow"
	}),
	trace_reference = var_0_13.combo(var_0_18.tracing, "Tracing reference", {
		"Rage Bot Damage",
		"Manual Damage"
	}),
	damage_radius = var_0_13.slider(var_0_18.tracing, "Damage", 1, 100, 20, true, ""),
	prediction = var_0_13.table(var_0_18.tracing, "Enemy:", {
		"Backtrack",
		"Teleport"
	}),
	range = var_0_13.slider(var_0_18.tracing, "Peeking Range", 5, 150, 60, true, "ft"),
	frequent = var_0_13.slider(var_0_18.tracing, "Detection Frequence", 5, 150, 35, true, "per"),
	detection = var_0_13.combo(var_0_18.tracing, "Tracing Method", {
		"Fraction (low fps)",
		"Damage (high fps)"
	})
}

local function var_0_21()
	local var_41_0 = var_0_13.get(var_0_20.manual_toggle) == "Manual key bind"
	local var_41_1 = var_0_13.contains(var_0_13.get(var_0_20.visuals), "Indicator")
	local var_41_2 = var_0_13.get(var_0_20.peekbot_polart)
	local var_41_3 = var_0_13.get(var_0_20.trace_reference) == "Manual Damage"
	local var_41_4 = var_0_13.get(var_0_20.retreat)

	var_0_13.visible(var_0_20.manual_toggle, var_41_0)
	var_0_13.visible(var_0_20.activate, var_41_0)
	var_0_13.visible(var_0_20.autopeek_sets_manual, var_41_2)
	var_0_13.visible(var_0_20.autopeek_sets_bot, var_41_2)
	var_0_13.visible(var_0_20.radius, var_41_4)
	var_0_13.visible(var_0_20.damage_radius, var_41_3)
end

var_0_21()

local var_0_22 = 3.141592653589793

local function var_0_23(arg_42_0)
	return arg_42_0 * (var_0_22 / 180)
end

local function var_0_24(arg_43_0, arg_43_1, arg_43_2)
	local var_43_0
	local var_43_1
	local var_43_2
	local var_43_3
	local var_43_4
	local var_43_5
	local var_43_6
	local var_43_7 = math.sin(var_0_23(arg_43_1))
	local var_43_8 = math.cos(var_0_23(arg_43_1))
	local var_43_9 = math.sin(var_0_23(arg_43_0))
	local var_43_10 = math.cos(var_0_23(arg_43_0))
	local var_43_11 = var_43_10 * var_43_8
	local var_43_12 = var_43_10 * var_43_7
	local var_43_13 = -var_43_9

	return var_43_11, var_43_12, var_43_13
end

local function var_0_25(arg_44_0, arg_44_1, arg_44_2, arg_44_3)
	arg_44_0 = arg_44_0 * arg_44_3
	arg_44_1 = arg_44_1 * arg_44_3
	arg_44_2 = arg_44_2 * arg_44_3

	return arg_44_0, arg_44_1, arg_44_2
end

local var_0_26

local function var_0_27()
	var_0_26 = render.camera_angles()
end

local function var_0_28(arg_46_0, arg_46_1)
	local var_46_0 = entity.get_local_player()
	local var_46_1 = var_0_17.eye_pos(var_46_0)
	local var_46_2 = var_0_26
	local var_46_3, var_46_4, var_46_5 = var_0_24(0, var_46_2.y + arg_46_0, 0)
	local var_46_6, var_46_7, var_46_8 = var_0_25(var_46_3, var_46_4, var_46_5, arg_46_1)
	local var_46_9 = vector(var_46_1.x + var_46_6, var_46_1.y + var_46_7, var_46_1.z + var_46_8)
	local var_46_10 = var_0_17.origins(var_46_0)

	return var_46_9
end

local function var_0_29(arg_47_0, arg_47_1)
	local var_47_0 = {}
	local var_47_1 = entity.get_local_player()

	if not var_0_13.get(var_0_20.ignore) then
		for iter_47_0, iter_47_1 in ipairs(entity.get_players()) do
			if not iter_47_1:is_enemy() and iter_47_1 == entity.get_local_player() then
				var_47_0[#var_47_0 + 1] = iter_47_1
			end
		end

		return utils.trace_line(arg_47_0, arg_47_1, var_47_1, nil, 1).end_pos
	else
		return utils.trace_line(arg_47_0, arg_47_1, var_47_1, nil, 1).end_pos
	end
end

local function var_0_30(arg_48_0, arg_48_1, arg_48_2, arg_48_3)
	local var_48_0 = entity.get_local_player()
	local var_48_1 = {}

	for iter_48_0, iter_48_1 in ipairs(entity.get_players()) do
		if not iter_48_1:is_enemy() and iter_48_1 == entity.get_local_player() then
			var_48_1[#var_48_1 + 1] = iter_48_1
		end
	end

	local var_48_2 = utils.trace_line(arg_48_1, arg_48_2, var_48_1)
	local var_48_3, var_48_4 = utils.trace_bullet(var_48_0, arg_48_1, arg_48_2, function(arg_49_0, arg_49_1)
		if not arg_49_0:is_enemy() and arg_49_0 == entity.get_local_player() then
			return true
		else
			return false
		end
	end)
	local var_48_5 = var_0_13.get(var_0_20.damage_radius)
	local var_48_6 = var_0_13.get(var_0_19.damage)
	local var_48_7 = var_0_13.get(var_0_20.trace_reference) == "Rage Bot Damage" and 1 or var_0_13.get(var_0_20.trace_reference) == "Manual Damage" and var_48_5
	local var_48_8 = var_0_17.is_alive(arg_48_0)
	local var_48_9 = arg_48_0:is_enemy()

	if var_48_8 and var_48_9 and arg_48_3 then
		if var_48_2.fraction == 1 then
			return var_48_3, 4
		end

		if var_48_7 < var_48_3 then
			return var_48_3, 2
		end
	end

	return 0, 1
end

local function var_0_31(arg_50_0, arg_50_1, arg_50_2, arg_50_3)
	local var_50_0 = entity.get_local_player()
	local var_50_1 = {}

	for iter_50_0, iter_50_1 in ipairs(entity.get_players()) do
		if not iter_50_1:is_enemy() and iter_50_1 == entity.get_local_player() then
			var_50_1[#var_50_1 + 1] = iter_50_1
		end
	end

	local var_50_2, var_50_3 = utils.trace_bullet(var_50_0, arg_50_1, arg_50_2, function(arg_51_0, arg_51_1)
		if not arg_51_0:is_enemy() and arg_51_0 == entity.get_local_player() then
			return true
		else
			return false
		end
	end)
	local var_50_4 = var_0_17.is_alive(arg_50_0)
	local var_50_5 = arg_50_0:is_enemy()

	if var_50_4 and var_50_5 and arg_50_3 then
		if var_50_2 > 0 then
			return var_50_2, 4
		end

		return 0, 1
	end
end

local var_0_32 = 0

local function var_0_33()
	local var_52_0 = entity.get_local_player()
	local var_52_1 = var_0_17.origins(var_52_0)
	local var_52_2 = vector(var_52_1.x, var_52_1.y, var_52_1.z - 9999)
	local var_52_3 = var_0_29(var_52_1, var_52_2)
	local var_52_4 = vector(var_0_16.extrapolate(var_52_0, 4, var_52_1.x, var_52_1.y, var_52_1.z)).z < var_52_1.z
	local var_52_5 = var_52_1:dist(var_52_3) < 50

	return var_52_4 and var_52_5
end

local var_0_34 = 0
local var_0_35 = 0

local function var_0_36()
	local var_53_0 = entity.get_local_player()

	if not var_53_0 then
		return
	end

	local var_53_1 = var_0_17.weapons(var_53_0)

	if var_53_1 == nil then
		return
	end

	if var_53_1.m_flNextPrimaryAttack == nil or var_53_0.m_flNextAttack == nil then
		return
	end

	local var_53_2 = globals.curtime

	if var_53_2 < var_53_1.m_flNextPrimaryAttack then
		var_0_35 = var_53_1.m_flNextPrimaryAttack - var_53_2
	elseif var_53_2 < var_53_0.m_flNextAttack then
		var_0_35 = var_53_0.m_flNextAttack - globals.curtime
	end

	return var_0_35 * 10
end

local function var_0_37()
	local var_54_0 = entity.get_local_player()

	if var_54_0 == nil then
		return
	end

	if not var_0_17.is_alive(var_54_0) then
		return
	end

	if var_0_36() < 1 then
		var_0_34 = 0
	end

	local var_54_1 = entity.get_local_player()
	local var_54_2 = var_0_17.weapons(var_54_1)
	local var_54_3 = bit.band(65535, var_54_2.m_iItemDefinitionIndex)
	local var_54_4 = var_54_2:get_classid() == 107
	local var_54_5 = ({
		[45] = true,
		[42] = true,
		[43] = true,
		[44] = true,
		[48] = true,
		[47] = true,
		[46] = true,
		[68] = true
	})[var_54_3] or false

	if var_54_4 or var_0_36() > 1 or var_54_5 or var_0_16.inair(var_54_1) and (not var_0_13.get(var_0_20.key) or not var_0_33()) then
		var_0_34 = 1
	end
end

local function var_0_38()
	var_0_34 = 1
end

events.render:set(var_0_37)
events.bullet_fire:set(var_0_38)

local function var_0_39(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4, arg_56_5)
	local var_56_0
	local var_56_1
	local var_56_2
	local var_56_3
	local var_56_4
	local var_56_5
	local var_56_6 = entity.get_local_player()

	if arg_56_3 == nil then
		var_56_3, var_56_4, var_56_5 = arg_56_0, arg_56_1, arg_56_2
		var_56_0, var_56_1, var_56_2 = var_0_17.eye_pos(var_56_6)

		if var_56_0 == nil then
			return
		end
	else
		var_56_0, var_56_1, var_56_2 = arg_56_0, arg_56_1, arg_56_2
		var_56_3, var_56_4, var_56_5 = arg_56_3, arg_56_4, arg_56_5
	end

	local var_56_7 = var_56_3 - var_56_0
	local var_56_8 = var_56_4 - var_56_1
	local var_56_9 = var_56_5 - var_56_2

	if var_56_7 == 0 and var_56_8 == 0 then
		return var_56_9 > 0 and 270 or 90, 0
	else
		local var_56_10 = math.deg(math.atan2(var_56_8, var_56_7))
		local var_56_11 = math.sqrt(var_56_7 * var_56_7 + var_56_8 * var_56_8)

		return math.deg(math.atan2(-var_56_9, var_56_11)), var_56_10
	end
end

local var_0_40 = 0

local function var_0_41(arg_57_0)
	var_0_40 = arg_57_0.view_angles.y
end

local function var_0_42(arg_58_0, arg_58_1)
	local var_58_0 = entity.get_local_player()
	local var_58_1 = var_0_17.origins(var_58_0)
	local var_58_2 = var_58_1:to(arg_58_1)

	if var_58_1.z == nil or entity.get_local_player() == nil then
		return
	end

	local var_58_3 = var_58_0.m_vecAbsOrigin
	local var_58_4, var_58_5 = var_0_39(var_58_3.x, var_58_3.y, var_58_3.z, arg_58_1.x, arg_58_1.y, arg_58_1.z)
	local var_58_6 = vector(var_58_2.x * math.cos(var_58_5 / 180 * math.pi) + var_58_2.y * math.sin(var_58_5 / 180 * math.pi), var_58_2.y * math.cos(var_58_5 / 180 * math.pi) - var_58_2.x * math.sin(var_58_5 / 180 * math.pi), var_58_2.z)

	arg_58_0.forwardmove = var_58_6.x * 450
	arg_58_0.sidemove = -var_58_6.y * 450
end

local function var_0_43()
	if var_0_13.get(var_0_19.doubletap) then
		var_0_19.doubletap:override(false)
	end
end

local function var_0_44()
	var_0_19.doubletap:override()
end

local function var_0_45(arg_61_0, arg_61_1, arg_61_2)
	if var_0_13.get(var_0_20.key) then
		if var_0_16.velocity(entity.get_local_player()) > 1 and arg_61_2 == "Attack" then
			var_0_43()

			arg_61_0.in_jump = 0
		end

		var_0_13.delay_call(0.5, var_0_44)
	end

	local var_61_0 = entity.get_local_player().m_vecAbsOrigin
	local var_61_1, var_61_2 = var_0_39(var_61_0.x, var_61_0.y, var_61_0.z, arg_61_1.x, arg_61_1.y, arg_61_1.z)

	arg_61_0.in_back = 0
	arg_61_0.in_moveleft = 0
	arg_61_0.in_moveright = 0
	arg_61_0.in_speed = 0
	arg_61_0.forwardmove = 450
	arg_61_0.in_forward = 1
	arg_61_0.move_yaw = var_61_2
	arg_61_0.sidemove = 0
end

local var_0_46
local var_0_47 = false
local var_0_48 = 0
local var_0_49 = false
local var_0_50 = false
local var_0_51
local var_0_52 = 0
local var_0_53 = false
local var_0_54 = false

local function var_0_55(arg_62_0, arg_62_1, arg_62_2, arg_62_3)
	if arg_62_0 then
		if arg_62_1 > 0 then
			var_0_45(arg_62_3, arg_62_2, "Attack")

			var_0_48 = 1
		else
			var_0_48 = 0
		end
	else
		print("Teleport detect, peeking Terminated.")
	end
end

local var_0_56 = false

local function var_0_57(arg_63_0, arg_63_1)
	local var_63_0 = var_0_13.get(var_0_20.peekbot_polart)
	local var_63_1 = entity.get_players(true)
	local var_63_2 = entity.get_local_player()
	local var_63_3 = var_0_17.eye_pos(var_63_2)

	if var_0_34 ~= 0 then
		var_0_56 = false

		var_0_13.override(var_0_19.quick_peek_mode, {
			"On Shot"
		})

		return
	end

	if var_0_49 == true then
		var_0_13.override(var_0_19.quick_peek_mode, {
			"On Shot",
			"On Key Release"
		})

		return
	end

	for iter_63_0 = var_0_13.get(var_0_20.key) and 35 or var_0_13.get(var_0_20.range), 1, -var_0_13.get(var_0_20.frequent) do
		local var_63_4 = var_0_28(arg_63_1, iter_63_0)
		local var_63_5 = var_0_29(var_63_3, var_63_4)

		for iter_63_1 = 1, #var_63_1 do
			local var_63_6 = var_63_1[iter_63_1]
			local var_63_7 = var_0_17.hitbox_position(var_63_6, 5)
			local var_63_8 = true
			local var_63_9
			local var_63_10

			if var_0_17.is_alive(var_63_6) and not var_63_6:is_dormant() and var_63_6:is_enemy() then
				if var_0_13.get(var_0_20.detection) == "Fraction (low fps)" then
					var_63_9, var_63_10 = var_0_30(var_63_6, var_63_5, var_63_7, var_63_8)
				elseif var_0_13.get(var_0_20.detection) == "Damage (high fps)" then
					var_63_9, var_63_10 = var_0_31(var_63_6, var_63_5, var_63_7, var_63_8)
				end

				if var_63_9 > 0 and var_63_10 ~= 1 then
					var_0_54 = true

					if var_63_0 then
						var_0_13.override(var_0_19.quick_peek_mode, {
							"On Shot"
						})
					end

					var_0_55(var_63_8, var_63_9, var_63_5, arg_63_0)

					return
				end
			end
		end
	end

	if var_0_53 == true then
		var_0_54 = false
	end

	if var_63_0 and not var_0_54 then
		var_0_13.set(var_0_19.quick_peek_mode, {
			"On Shot",
			"On Key Release"
		})

		var_0_56 = false
	end

	var_0_56 = false
end

local function var_0_58(arg_64_0)
	if not var_0_13.get(var_0_19.quick_peek) then
		var_0_46 = nil
		var_0_53 = true

		return
	end

	local var_64_0 = entity.get_local_player()
	local var_64_1 = var_0_17.origins(var_64_0)

	if var_0_46 == nil then
		var_0_46 = var_64_1

		return
	end

	if var_0_46:dist2d(var_64_1) > 1 and var_0_15.is_key_release() then
		var_0_53 = false
	else
		var_0_53 = true
	end

	if var_0_46:dist2d(var_64_1) > var_0_13.get(var_0_20.radius) and var_0_15.is_key_release() and var_0_54 then
		var_0_45(arg_64_0, var_0_46, "retreat")
	end

	if false then
		-- block empty
	end

	if var_0_54 and not var_0_53 and var_0_46:dist2d(var_64_1) ~= 0 and var_0_15.is_key_release() then
		var_0_45(arg_64_0, var_0_46, "retreat")
	end
end

;({}).tahoma = render.load_font("tahoma", 120, "b")

local function var_0_59(arg_65_0, arg_65_1, arg_65_2)
	render.circle_3d(arg_65_0, arg_65_1, arg_65_2, 90, 1, false)
end

local var_0_60 = {
	rising_beam = 0,
	alpha_beam = 0,
	alpha_circle = 0
}

function lerp(arg_66_0, arg_66_1, arg_66_2)
	return arg_66_0 + (arg_66_1 - arg_66_0) * arg_66_2
end

local function var_0_61(arg_67_0, arg_67_1)
	local var_67_0 = entity.get_players(true)
	local var_67_1 = entity.get_local_player()
	local var_67_2 = var_0_17.eye_pos(var_67_1)
	local var_67_3 = var_0_17.origins(var_67_1)
	local var_67_4 = vector(var_67_2.x, var_67_2.y, var_67_3.z + 2)
	local var_67_5

	var_67_5 = var_0_13.get(var_0_20.manual_toggle) == "Manual key bind"

	local var_67_6

	var_67_6 = var_0_13.get(var_0_20.manual_toggle) == "Bind with quick peek assist"

	local var_67_7 = var_0_13.get(var_0_19.quick_peek)
	local var_67_8 = var_0_13.get(var_0_20.key) and 35 or var_0_13.get(var_0_20.range)

	if var_0_34 == 0 then
		var_0_60.alpha_beam = lerp(var_0_60.alpha_beam, 180, globals.frametime * 6)
		var_0_60.alpha_circle = lerp(var_0_60.alpha_circle, 110, globals.frametime * 6)
		var_0_60.rising_beam = lerp(var_0_60.rising_beam, 8, globals.frametime * 3.5)
	else
		var_0_60.alpha_beam = lerp(var_0_60.alpha_beam, 50, globals.frametime * 6)
		var_0_60.alpha_circle = lerp(var_0_60.alpha_circle, not var_67_7 and 0 or 30, globals.frametime * 6)
		var_0_60.rising_beam = lerp(var_0_60.rising_beam, 0, globals.frametime * 3.5)
	end

	for iter_67_0 = var_67_8, 1, -var_0_13.get(var_0_20.frequent) do
		local var_67_9 = var_0_28(arg_67_0, iter_67_0)
		local var_67_10 = var_0_17.eye_pos(var_67_1)
		local var_67_11 = vector(var_67_9.x, var_67_9.y, var_67_9.z - 10000)
		local var_67_12 = var_0_29(var_67_9, var_67_11)
		local var_67_13 = vector(var_67_9.x, var_67_9.y, var_67_12.z + var_0_60.rising_beam)
		local var_67_14 = var_0_29(var_67_4, var_67_13)
		local var_67_15 = 0

		for iter_67_1 = 1, #var_67_0 do
			local var_67_16 = var_67_0[iter_67_1]

			if var_0_17.is_alive(var_67_16) and not var_67_16:is_dormant() and var_67_16:is_enemy() then
				local var_67_17 = var_0_17.hitbox_position(var_67_16, 5)
				local var_67_18 = true
				local var_67_19
				local var_67_20

				if var_0_13.get(var_0_20.detection) == "Fraction (low fps)" then
					local var_67_21

					var_67_21, var_67_20 = var_0_30(var_67_16, var_67_14, var_67_17, var_67_18)
				elseif var_0_13.get(var_0_20.detection) == "Damage (high fps)" then
					local var_67_22

					var_67_22, var_67_20 = var_0_31(var_67_16, var_67_14, var_67_17, var_67_18)
				end

				var_67_15 = bit.bor(var_67_15, var_67_20)
			end
		end

		local var_67_23 = render.world_to_screen(var_67_14)
		local var_67_24 = color(0, 255, 0, 180)
		local var_67_25 = color(255, 255, 0, 180)
		local var_67_26 = color(255, 255, 255, 180)

		if arg_67_1 == 1 then
			if bit.band(var_67_15, 4) == 4 then
				var_0_12(var_67_14, 0, 255, 0, var_0_60.alpha_beam)
			elseif bit.band(var_67_15, 2) == 2 then
				var_0_12(var_67_14, 255, 255, 0, var_0_60.alpha_beam)
			else
				var_0_12(var_67_14, 255, 255, 255, var_0_60.alpha_beam)
			end
		end

		if arg_67_1 == 2 then
			if bit.band(var_67_15, 4) == 4 then
				var_0_59(var_67_14, var_67_24, var_0_60.alpha_circle)
			elseif bit.band(var_67_15, 2) == 2 then
				var_0_59(var_67_14, var_67_25, var_0_60.alpha_circle)
			else
				var_0_59(var_67_14, var_67_26, var_0_60.alpha_circle)
			end
		end
	end
end

local var_0_62 = {
	color_1 = {
		0,
		0,
		0
	},
	tts = {
		0,
		0,
		0
	},
	ind_r = {
		0,
		0,
		0,
		0
	},
	ind_g = {
		0,
		0,
		0,
		0
	},
	ind_b = {
		0,
		0,
		0,
		0
	},
	ind_a = {
		0,
		0,
		0,
		0
	},
	offset = {
		0,
		0
	},
	ind_r_on = {
		80,
		255,
		255,
		204
	},
	ind_g_on = {
		255,
		255,
		215,
		255
	},
	ind_b_on = {
		80,
		0,
		0,
		153
	},
	ind_a_on = {
		255,
		255,
		255,
		255
	},
	ind_off = {
		184,
		184,
		184,
		150
	}
}
local var_0_63 = (function()
	local var_68_0 = {}

	local function var_68_1(arg_69_0)
		local var_69_0 = math.sin(math.rad(arg_69_0.x))
		local var_69_1 = math.cos(math.rad(arg_69_0.x))
		local var_69_2 = math.sin(math.rad(arg_69_0.y))
		local var_69_3 = math.cos(math.rad(arg_69_0.y))

		return vector(var_69_1 * var_69_3, var_69_1 * var_69_2, -var_69_0)
	end

	local function var_68_2(arg_70_0)
		local var_70_0 = math.sin(math.rad(arg_70_0.x))
		local var_70_1 = math.cos(math.rad(arg_70_0.x))
		local var_70_2 = math.sin(math.rad(arg_70_0.y))
		local var_70_3 = math.cos(math.rad(arg_70_0.y))
		local var_70_4 = math.sin(math.rad(arg_70_0.z))
		local var_70_5 = math.cos(math.rad(arg_70_0.z))

		return vector(-1 * var_70_4 * var_70_0 * var_70_3 + -1 * var_70_5 * -var_70_2, -1 * var_70_4 * var_70_0 * var_70_2 + -1 * var_70_5 * var_70_3, -1 * var_70_4 * var_70_1)
	end

	local function var_68_3(arg_71_0, arg_71_1, arg_71_2, arg_71_3, arg_71_4)
		return vector(arg_71_0.x + arg_71_1 * arg_71_2, arg_71_0.y + arg_71_1 * arg_71_3, arg_71_0.z + arg_71_1 * arg_71_4)
	end

	local var_68_4 = utils.create_interface("client.dll", "VClientEntityList003") or error("invalid interface", 2)
	local var_68_5 = utils.get_vfunc(3, "void*(__thiscall*)(void*, int)")

	var_0_0.cdef("typedef struct { float x; float y; float z; } bbvec3_t;")

	local var_68_6 = utils.get_vfunc(84, "bool(__thiscall*)(void*, int, bbvec3_t&)")
	local var_68_7 = utils.get_vfunc(468, "int(__thiscall*)(void*, void*)")
	local var_68_8 = utils.get_vfunc(469, "int(__thiscall*)(void*)")

	function var_68_0.thrid_person()
		local var_72_0 = entity.get_entities("CPredictedViewModel")

		for iter_72_0, iter_72_1 in ipairs(var_72_0) do
			local var_72_1 = {
				0,
				0,
				0
			}
			local var_72_2 = render.camera_angles()
			local var_72_3 = entity.get_local_player()
			local var_72_4 = var_72_3.m_vecOrigin
			local var_72_5 = var_72_3.m_vecOrigin
			local var_72_6 = var_72_3.m_vecOrigin
			local var_72_7 = var_68_1(var_72_2)
			local var_72_8 = var_68_2(var_72_5 + var_72_6)
			local var_72_9 = var_68_3(var_72_4, 1, var_72_8.x, var_72_8.y, var_72_8.z + 1.7)

			return (var_68_3(var_72_9, 30, var_72_7.x, var_72_7.y, var_72_7.z + 1.7))
		end
	end

	function var_68_0.first_person(arg_73_0)
		local var_73_0 = entity.get_local_player()
		local var_73_1 = var_0_17.weapons(var_73_0)[0]
		local var_73_2 = arg_73_0 and var_73_1.m_hWeaponWorldModel or var_73_0["m_hViewModel[0]"]

		if var_73_0 == nil or var_73_1 == nil then
			return
		end

		local var_73_3 = var_0_0.new("bbvec3_t[1]")
		local var_73_4 = var_68_5(var_68_4, var_73_2:get_index())
		local var_73_5 = arg_73_0 and var_68_8(var_73_1) or var_68_7(var_73_1, var_73_4)

		if var_73_5 > 0 and var_68_6(var_73_4, var_73_5, var_73_3[0]) then
			return {
				var_73_3[0].x,
				var_73_3[0].y,
				var_73_3[0].z
			}
		end
	end

	return var_68_0
end)()
local var_0_64 = (function()
	local var_74_0 = {}

	local function var_74_1(arg_75_0, arg_75_1, arg_75_2, arg_75_3, arg_75_4, arg_75_5, arg_75_6, arg_75_7, arg_75_8)
		var_0_1.rectangle(arg_75_0 + arg_75_4, arg_75_1, arg_75_2 - arg_75_4 * 2, arg_75_4, arg_75_5, arg_75_6, arg_75_7, arg_75_8)
		var_0_1.rectangle(arg_75_0, arg_75_1 + arg_75_4, arg_75_4, arg_75_3 - arg_75_4 * 2, arg_75_5, arg_75_6, arg_75_7, arg_75_8)
		var_0_1.rectangle(arg_75_0 + arg_75_4, arg_75_1 + arg_75_3 - arg_75_4, arg_75_2 - arg_75_4 * 2, arg_75_4, arg_75_5, arg_75_6, arg_75_7, arg_75_8)
		var_0_1.rectangle(arg_75_0 + arg_75_2 - arg_75_4, arg_75_1 + arg_75_4, arg_75_4, arg_75_3 - arg_75_4 * 2, arg_75_5, arg_75_6, arg_75_7, arg_75_8)
		var_0_1.rectangle(arg_75_0 + arg_75_4, arg_75_1 + arg_75_4, arg_75_2 - arg_75_4 * 2, arg_75_3 - arg_75_4 * 2, arg_75_5, arg_75_6, arg_75_7, arg_75_8)
		var_0_1.circle(arg_75_0 + arg_75_4, arg_75_1 + arg_75_4, arg_75_5, arg_75_6, arg_75_7, arg_75_8, arg_75_4, 180, 0.25)
		var_0_1.circle(arg_75_0 + arg_75_2 - arg_75_4, arg_75_1 + arg_75_4, arg_75_5, arg_75_6, arg_75_7, arg_75_8, arg_75_4, 90, 0.25)
		var_0_1.circle(arg_75_0 + arg_75_4, arg_75_1 + arg_75_3 - arg_75_4, arg_75_5, arg_75_6, arg_75_7, arg_75_8, arg_75_4, 270, 0.25)
		var_0_1.circle(arg_75_0 + arg_75_2 - arg_75_4, arg_75_1 + arg_75_3 - arg_75_4, arg_75_5, arg_75_6, arg_75_7, arg_75_8, arg_75_4, 0, 0.25)
	end

	local var_74_2 = 4
	local var_74_3 = var_74_2 + 2
	local var_74_4 = 45
	local var_74_5 = 20

	local function var_74_6(arg_76_0, arg_76_1, arg_76_2, arg_76_3, arg_76_4, arg_76_5, arg_76_6, arg_76_7, arg_76_8)
		var_0_1.rectangle(arg_76_0 + 2, arg_76_1 + arg_76_4 + var_74_3, 1, arg_76_3 - var_74_3 * 2 - arg_76_4 * 2, arg_76_5, arg_76_6, arg_76_7, arg_76_8)
		var_0_1.rectangle(arg_76_0 + arg_76_2 - 3, arg_76_1 + arg_76_4 + var_74_3, 1, arg_76_3 - var_74_3 * 2 - arg_76_4 * 2, arg_76_5, arg_76_6, arg_76_7, arg_76_8)
		var_0_1.rectangle(arg_76_0 + arg_76_4 + var_74_3, arg_76_1 + 2, arg_76_2 - var_74_3 * 2 - arg_76_4 * 2, 1, arg_76_5, arg_76_6, arg_76_7, arg_76_8)
		var_0_1.rectangle(arg_76_0 + arg_76_4 + var_74_3, arg_76_1 + arg_76_3 - 3, arg_76_2 - var_74_3 * 2 - arg_76_4 * 2, 1, arg_76_5, arg_76_6, arg_76_7, arg_76_8)
		var_0_1.circle_outline(arg_76_0 + arg_76_4 + var_74_3, arg_76_1 + arg_76_4 + var_74_3, arg_76_5, arg_76_6, arg_76_7, arg_76_8, arg_76_4 + var_74_2, 180, 0.25, 1)
		var_0_1.circle_outline(arg_76_0 + arg_76_2 - arg_76_4 - var_74_3, arg_76_1 + arg_76_4 + var_74_3, arg_76_5, arg_76_6, arg_76_7, arg_76_8, arg_76_4 + var_74_2, 270, 0.25, 1)
		var_0_1.circle_outline(arg_76_0 + arg_76_4 + var_74_3, arg_76_1 + arg_76_3 - arg_76_4 - var_74_3, arg_76_5, arg_76_6, arg_76_7, arg_76_8, arg_76_4 + var_74_2, 90, 0.25, 1)
		var_0_1.circle_outline(arg_76_0 + arg_76_2 - arg_76_4 - var_74_3, arg_76_1 + arg_76_3 - arg_76_4 - var_74_3, arg_76_5, arg_76_6, arg_76_7, arg_76_8, arg_76_4 + var_74_2, 0, 0.25, 1)
	end

	local function var_74_7(arg_77_0, arg_77_1, arg_77_2, arg_77_3, arg_77_4, arg_77_5, arg_77_6, arg_77_7, arg_77_8, arg_77_9)
		local var_77_0 = arg_77_8 / 255 * var_74_4

		var_0_1.rectangle(arg_77_0 + arg_77_4, arg_77_1, arg_77_2 - arg_77_4 * 2, 1, arg_77_5, arg_77_6, arg_77_7, arg_77_8)
		var_0_1.circle_outline(arg_77_0 + arg_77_4, arg_77_1 + arg_77_4, arg_77_5, arg_77_6, arg_77_7, arg_77_8, arg_77_4, 180, 0.25, 1)
		var_0_1.circle_outline(arg_77_0 + arg_77_2 - arg_77_4, arg_77_1 + arg_77_4, arg_77_5, arg_77_6, arg_77_7, arg_77_8, arg_77_4, 270, 0.25, 1)
		var_0_1.gradient(arg_77_0, arg_77_1 + arg_77_4, 1, arg_77_3 - arg_77_4 * 2, arg_77_5, arg_77_6, arg_77_7, arg_77_8, arg_77_5, arg_77_6, arg_77_7, var_77_0, false)
		var_0_1.gradient(arg_77_0 + arg_77_2 - 1, arg_77_1 + arg_77_4, 1, arg_77_3 - arg_77_4 * 2, arg_77_5, arg_77_6, arg_77_7, arg_77_8, arg_77_5, arg_77_6, arg_77_7, var_77_0, false)
		var_0_1.circle_outline(arg_77_0 + arg_77_4, arg_77_1 + arg_77_3 - arg_77_4, arg_77_5, arg_77_6, arg_77_7, var_77_0, arg_77_4, 90, 0.25, 1)
		var_0_1.circle_outline(arg_77_0 + arg_77_2 - arg_77_4, arg_77_1 + arg_77_3 - arg_77_4, arg_77_5, arg_77_6, arg_77_7, var_77_0, arg_77_4, 0, 0.25, 1)
		var_0_1.rectangle(arg_77_0 + arg_77_4, arg_77_1 + arg_77_3 - 1, arg_77_2 - arg_77_4 * 2, 1, arg_77_5, arg_77_6, arg_77_7, var_77_0)

		for iter_77_0 = 4, arg_77_9 do
			local var_77_1 = iter_77_0 / 2

			var_74_6(arg_77_0 - var_77_1, arg_77_1 - var_77_1, arg_77_2 + var_77_1 * 2, arg_77_3 + var_77_1 * 2, var_77_1, arg_77_5, arg_77_6, arg_77_7, arg_77_9 - var_77_1 * 2)
		end
	end

	function var_74_0.container(arg_78_0, arg_78_1, arg_78_2, arg_78_3, arg_78_4, arg_78_5, arg_78_6, arg_78_7, arg_78_8, arg_78_9, arg_78_10, arg_78_11, arg_78_12, arg_78_13)
		if arg_78_8 * 255 > 0 then
			render.blur(vector(arg_78_0, arg_78_1), vector(arg_78_0 + arg_78_2, arg_78_1 + arg_78_3), 2, 1, var_74_2)
		end

		var_74_1(arg_78_0, arg_78_1, arg_78_2, arg_78_3, var_74_2, arg_78_9, arg_78_10, arg_78_11, arg_78_12)
		var_74_7(arg_78_0, arg_78_1, arg_78_2, arg_78_3, var_74_2, arg_78_4, arg_78_5, arg_78_6, arg_78_8 * 255, arg_78_8 * var_74_5)

		if not arg_78_13 then
			return
		end

		arg_78_13(arg_78_0 + var_74_2, arg_78_1 + var_74_2, arg_78_2 - var_74_2 * 2, arg_78_3 - var_74_2 * 2)
	end

	return var_74_0
end)()

local function var_0_65(arg_79_0, arg_79_1, arg_79_2, arg_79_3)
	local var_79_0 = 6.5
	local var_79_1 = var_0_15.lerp(var_0_35 * 50, var_0_35 * 50, var_79_0)

	if var_79_1 >= 60 then
		var_79_1 = 60
	end

	local var_79_2 = var_0_34 == 0

	if not var_79_2 then
		var_0_62.color_1[1] = var_0_15.lerp(var_0_62.color_1[1], 230, var_79_0)
		var_0_62.color_1[2] = var_0_15.lerp(var_0_62.color_1[2], 50, var_79_0)
		var_0_62.color_1[3] = var_0_15.lerp(var_0_62.color_1[3], 50, var_79_0)
		var_0_62.tts[1] = var_0_15.lerp(var_0_62.tts[1], 3, 12)
		var_0_62.tts[2] = var_0_15.lerp(var_0_62.tts[2], 180, var_79_0)
		var_0_62.tts[3] = var_0_15.lerp(var_0_62.tts[3], var_79_1 > 1 and 5 or 1, 12)
	else
		var_0_62.color_1[1] = var_0_15.lerp(var_0_62.color_1[1], 0, var_79_0)
		var_0_62.color_1[2] = var_0_15.lerp(var_0_62.color_1[2], 255, var_79_0)
		var_0_62.color_1[3] = var_0_15.lerp(var_0_62.color_1[3], 0, var_79_0)
		var_0_62.tts[1] = var_0_15.lerp(var_0_62.tts[1], 0, var_79_0)
		var_0_62.tts[2] = var_0_15.lerp(var_0_62.tts[2], 0, var_79_0)
		var_0_62.tts[3] = var_0_15.lerp(var_0_62.tts[3], 1, 12)
	end

	for iter_79_0 = 1, 4 do
		local var_79_3 = iter_79_0 == 1 and arg_79_3 or iter_79_0 == 2 and arg_79_0 or iter_79_0 == 3 and arg_79_1 or iter_79_0 == 4 and arg_79_2

		var_0_62.ind_r[iter_79_0] = var_0_15.lerp(var_0_62.ind_r[iter_79_0], var_79_3 and var_0_62.ind_r_on[iter_79_0] or var_0_62.ind_off[1], 15)
		var_0_62.ind_g[iter_79_0] = var_0_15.lerp(var_0_62.ind_g[iter_79_0], var_79_3 and var_0_62.ind_g_on[iter_79_0] or var_0_62.ind_off[2], 15)
		var_0_62.ind_b[iter_79_0] = var_0_15.lerp(var_0_62.ind_b[iter_79_0], var_79_3 and var_0_62.ind_b_on[iter_79_0] or var_0_62.ind_off[3], 15)
		var_0_62.ind_a[iter_79_0] = var_0_15.lerp(var_0_62.ind_a[iter_79_0], var_79_3 and var_0_62.ind_a_on[iter_79_0] or var_0_62.ind_off[4], 15)
	end

	local var_79_4 = common.is_in_thirdperson()
	local var_79_5 = render.screen_size()
	local var_79_6 = var_79_5.x / 2
	local var_79_7 = var_79_5.y / 2
	local var_79_8 = render.world_to_screen(var_0_63.thrid_person()) ~= nil and render.world_to_screen(var_0_63.thrid_person())
	local var_79_9 = var_0_63.first_person(false)
	local var_79_10 = var_79_9 ~= nil and vector(var_79_9[1], var_79_9[2], var_79_9[3]) or nil
	local var_79_11 = var_79_10 ~= nil and render.world_to_screen(var_79_10) or vector(var_79_6 + 200, var_79_7 + 15)

	var_0_62.offset[1] = var_0_15.lerp(var_0_62.offset[1], var_79_4 and var_79_8.x - 20 or var_79_11.x - 50, 6)
	var_0_62.offset[2] = var_0_15.lerp(var_0_62.offset[2], var_79_4 and var_79_8.y or var_79_11.y - 50, 6)

	local var_79_12 = var_0_13.get(var_0_20.upward)
	local var_79_13 = var_0_13.get(var_0_20.downard)
	local var_79_14 = var_0_13.get(var_0_20.glow)

	var_0_64.container(var_0_62.offset[1] + 50, var_0_62.offset[2] + 30, 68, 25 + math.floor(var_0_62.tts[3] + 0.5), var_79_12.r, var_79_12.g, var_79_12.b, var_79_12.a, var_79_14, var_79_13.r, var_79_13.g, var_79_13.b, var_79_13.a)

	local var_79_15 = false

	var_0_1.rectangle(var_0_62.offset[1] + 54, var_0_62.offset[2] + 40 + var_0_62.tts[3], var_79_1, 2, 255, 255, 255, var_0_62.tts[2])
	var_0_1.text(var_0_62.offset[1] + 54, var_0_62.offset[2] + 33, 255, 255, 255, 255, "-", 0, "STAT")
	var_0_1.text(var_0_62.offset[1] + 74, var_0_62.offset[2] + 33, var_0_62.color_1[1], var_0_62.color_1[2], var_0_62.color_1[3], 255, "-", 0, var_79_2 and "ON" or "OFF")
	var_0_1.text(var_0_62.offset[1] + 100, var_0_62.offset[2] + 33, 255, 255, 255, var_79_15 and 180 or 150, "-", 0, var_79_15 and "BO" or "MA")

	for iter_79_1 = 1, 4 do
		local var_79_16 = iter_79_1 * 15 + 39
		local var_79_17 = iter_79_1 == 1 and "AP" or iter_79_1 == 2 and "PR" or iter_79_1 == 3 and "BT" or iter_79_1 == 4 and "SP"

		var_0_1.text(var_0_62.offset[1] + var_79_16, var_0_62.offset[2] + 43 + var_0_62.tts[3], var_0_62.ind_r[iter_79_1], var_0_62.ind_g[iter_79_1], var_0_62.ind_b[iter_79_1], var_0_62.ind_a[iter_79_1], "-", 0, var_79_17)
	end
end

local function var_0_66(arg_80_0)
	local var_80_0 = entity.get_local_player()

	if not var_0_17.is_alive(var_80_0) then
		return
	end

	local var_80_1 = var_0_13.get(var_0_19.quick_peek)

	var_0_58(arg_80_0)

	if var_80_1 then
		var_0_57(arg_80_0, 270)
		var_0_57(arg_80_0, 90)
	end
end

local function var_0_67(arg_81_0)
	local var_81_0 = entity.get_local_player()

	if var_81_0 == nil then
		return
	end

	if not var_0_17.is_alive(var_81_0) then
		return
	end

	var_0_21()

	local var_81_1 = var_0_13.get(var_0_19.quick_peek)

	var_0_27()

	local var_81_2 = var_0_13.contains(var_0_13.get(var_0_20.visuals), "Circle")
	local var_81_3 = var_0_13.contains(var_0_13.get(var_0_20.visuals), "Beam")
	local var_81_4 = var_0_13.contains(var_0_13.get(var_0_20.visuals), "Indicator")

	if var_81_1 and var_81_2 then
		var_0_61(270, 2)
		var_0_61(90, 2)
	end

	if var_81_1 and var_81_3 then
		var_0_61(270, 1)
		var_0_61(90, 1)
	end

	local var_81_5 = var_0_13.get(var_0_20.key)
	local var_81_6 = var_0_13.get(var_0_20.back_track)
	local var_81_7 = var_0_13.get(var_0_20.safe_peek)

	if var_81_4 then
		var_0_65(var_81_5, var_81_6, var_81_7, var_81_1)
	end
end

events.createmove:set(var_0_66)
events.render:set(var_0_67)
