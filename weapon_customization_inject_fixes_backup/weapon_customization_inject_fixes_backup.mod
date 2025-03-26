return {
    run = function()
        fassert(rawget(_G, "new_mod"), "`weapon_customization_inject_fixes_backup` encountered an error loading the Darktide Mod Framework.")

        new_mod("weapon_customization_inject_fixes_backup", {
            mod_script       = "weapon_customization_inject_fixes_backup/scripts/mods/weapon_customization_inject_fixes_backup/weapon_customization_inject_fixes_backup",
            mod_data         = "weapon_customization_inject_fixes_backup/scripts/mods/weapon_customization_inject_fixes_backup/weapon_customization_inject_fixes_backup_data",
            mod_localization = "weapon_customization_inject_fixes_backup/scripts/mods/weapon_customization_inject_fixes_backup/weapon_customization_inject_fixes_backup_localization",
        })
    end,
    packages = {},
}
