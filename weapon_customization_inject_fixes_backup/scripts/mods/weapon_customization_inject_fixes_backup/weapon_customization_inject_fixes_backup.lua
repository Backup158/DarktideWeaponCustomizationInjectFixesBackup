local mod = get_mod("weapon_customization_inject_fixes_backup")
mod.version = "1.0"

local table = table
local ipairs = ipairs
local pairs = pairs
local vector3_box = Vector3Box

local _item = "content/items/weapons/player"
local _item_ranged = _item.."/ranged"
local _item_melee = _item.."/melee"
local _item_minion = "content/items/weapons/minions"

mod.on_all_mods_loaded = function()
    mod:info("weapon_customization_inject_fixes_backup v" .. mod.version .. " loaded uwu nya :3")
    local wc = get_mod("weapon_customization")
    if not wc then
		mod:error("Extended Weapon Customization mod required")
		return
	end
    -- ######################
    -- Ranged
    -- ######################
    -- Bolter
    table.prepend( wc.anchors.bolter_p1_m1.fixes, {
        -- Slims out combi flamer and moves it down a notch
        {   dependencies =  { "syn_plasma_combi_01",
            },
            underbarrel =   { position = vector3_box(0.0, 0.195, -0.0015), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.94, 0.94, 0.5)},
        },  
    })
    -- Laspistol
    table.prepend( wc.anchors.laspistol_p1_m1.fixes, {
        -- Moves back plasma barrel to integrate it more proportionally
        {   dependencies =  { "plas_barrel_01|plas_barrel_02|plas_barrel_03",
            },
            --muzzle =        { offset = true, position = vector3_box(0, 0.416, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.867, 1.84, 1.1)},
            muzzle =        { offset = true, position = vector3_box(0, 0.416, 0.032), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.867, 1.84, 1.1), hide_mesh = {{"muzzle", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
            barrel =        { offset = true, position = vector3_box(0, -0.004, -0.01), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.714, 0.365, 0.724)},  
            stock =         { offset = true, position = vector3_box(0, 0.007, 0.01), rotation = vector3_box(-36, 0, 0), scale = vector3_box(1, 2.665, 1)}, 
        },  
    })
    -- Helbore Lasgun
    table.prepend( wc.anchors.lasgun_p2_m1.fixes, {
        -- Moves tacax bayonet forwards and makes it smaller
        {   dependencies =  { "hatchet_head_mt_01|hatchet_head_mt_02|hatchet_head_mt_03|hatchet_head_mt_04|hatchet_head_mt_05", 
            },
            bayonet = {offset = true, position = vector3_box(0, 0.198, -0.048), rotation = vector3_box(-90, 0, 0), scale = vector3_box(1, 0.5, 0.5)},
        },
        -- Moves Syn's bipod back for MT Stubber (which I moved down)
        {   dependencies =  { "singlestubber_barrel_01|singlestubber_barrel_02|singlestubber_barrel_03", 
                "bipod_center_01"
            },
            barrel =        { offset = true, position = vector3_box(0, -0.018, -0.017), rotation = vector3_box(0, 0, 0), scale = vector3_box(.36, .5, .36)},
            bipod_center =  { offset = false, parent = "barrel", position = vector3_box(0.0, 0.6, -0.05), rotation = vector3_box(0, 0, 90), scale = vector3_box(0.5, 0.8, 0.75)},
        },
    })
    -- Recon Lasgun
    table.prepend( wc.anchors.lasgun_p3_m1.fixes, {
        -- Moves chainsword bayonet down to avoid blocking the barrel
        {   dependencies =  { "syn_chainsword_bayonet_01|syn_chainsword_bayonet_02|syn_chainsword_bayonet_03|syn_chainsword_bayonet_04|syn_chainsword_bayonet_05|syn_chainsword_bayonet_06|syn_chainsword_bayonet_07|syn_chainsword_bayonet_08|syn_chainsword_bayonet_09|syn_chainsword_bayonet_10", 
            },
            bayonet = {offset = false, position = vector3_box(0, -0.073, -0.086), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.75, 0.75, 0.75)},
        },
        {   dependencies =  { "syn_2hchainsword_bayonet_01|syn_2hchainsword_bayonet_02|syn_2hchainsword_bayonet_03|syn_2hchainsword_bayonet_04|syn_2hchainsword_bayonet_05|syn_2hchainsword_bayonet_06|syn_2hchainsword_bayonet_07", 
            },
            bayonet =       { offset = true, position = vector3_box(0, 0.361, -0.006), rotation = vector3_box(-90, 0, 0), scale = vector3_box(0.75, 0.75, 0.75),},
        },  
    })
    -- ######################
    -- Melee
    -- ######################
    -- Heavy Sword
    table.prepend( wc.anchors.combatsword_p2_m1.fixes, {
        -- Centers on this grip
        {   dependencies = {"ogryn_mt_blade_01",
                "falchion_grip_01",
            },
            body = {offset = false, parent = "grip", parent_node = 7, position = vector3_box(0, -0.006, 0), rotation = vector3_box(0, 0, 0), scale = vector3_box(.3, .365, 1)},   
        },  
    })
    -- Chain Axe
    table.prepend( wc.anchors.chainaxe_p1_m1.fixes, {
        -- Moves up shovel head to not be tiny
        {   dependencies = {"shovel_head_mt_01|shovel_head_mt_02|shovel_head_mt_03|shovel_head_mt_04|shovel_head_mt_05",
            },
            blade = {position = vector3_box(0, 0, 0.17), rotation = vector3_box(-1, 0, 0), scale = vector3_box(1, 1, 1), node = 1},
            teeth = {position = vector3_box(0, -0.038, 0.348), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 0.634, 0.75)},    
        },  
    })
    -- Knife
    table.prepend( wc.anchors.combatknife_p1_m1.fixes, {
        -- Moves up blade to fix minor clipping
        {   dependencies = {"ogrynbladehandle_01",
                "knife_body_03",
            },
            grip = {mesh_move = true, position = vector3_box(0, 0, -0.01), rotation = vector3_box(-1, 0, 0), scale = vector3_box(.35, .35, .45), node = 1},
            trinket_hook = {position = vector3_box(0, 0, -.064), rotation = vector3_box(0, 0, 0), scale = vector3_box(0.834, 0.834, 0.834)},    
            body = {position = vector3_box(0, 0, .06), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)}
        },  
    })
    -- Power Sword
    table.prepend(wc.anchors.powersword_p1_m1.fixes, {
        -- Turns sabre grips into pseudo 2handed grips
        {   dependencies = { "2h_chain_sword_mt_body_01|2h_chain_sword_mt_body_02|2h_chain_sword_mt_body_03|2h_chain_sword_mt_body_04",
                --"sabre_mt_grip_01|sabre_mt_grip_02|sabre_mt_grip_03|sabre_mt_grip_04|sabre_mt_grip_05",
                "sabre_grip_01|sabre_grip_02|sabre_grip_03|sabre_grip_04|sabre_grip_05",
            },
            grip =      { position = vector3_box(0, 0, 0.00), rotation = vector3_box(-1, 0, 0), scale = vector3_box(1.35, 1, 1.35), scale_node = 1},
            hilt =      { position = vector3_box(0, 0, 0.08), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1), node = 1},
            blade =     { position = vector3_box(0, 0, 0.096), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1.24, 1.14)},
            pommel =    { hide_mesh = {{"pommel", 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15}}},
        },  
    })
    -- Force Greatsword
    table.prepend(wc.anchors.forcesword_2h_p1_m1.fixes, {
        -- Moves up gap and makes crossguard smaller
        {   dependencies = {"2h_force_sword_hilt_01",
                "power_sword_grip_04",
                "2h_power_maul_pommel_03",
            },
            blade =     { position = vector3_box(0, 0, 0.154), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1.32)}, 
            hilt =      { position = vector3_box(0, 0, -0.008), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 0.76)}, 
            grip =      { position = vector3_box(0, 0, 0.0), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
            pommel =    { position = vector3_box(0, 0, -0.176), rotation = vector3_box(0, 0, 0), scale = vector3_box(1, 1, 1)},
        },  
    })
end
