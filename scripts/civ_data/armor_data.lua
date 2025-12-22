local armor_data = {}

armor_data.armor_all = {
    { value = [[
[ARMOR:ITEM_ARMOR_CORE_BLOCK:FORCED]
]], weight = 10, next_level_tables = {
"helmet_block"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_WEDGE:FORCED]
]], weight = 10, next_level_tables = {
"helmet_wedge"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_SPHERE:FORCED]
]], weight = 10, next_level_tables = {
"helmet_sphere"
 }
},
    { value = [[
[ARMOR:ITEM_ARMOR_CORE_PROW:FORCED]
]], weight = 10, next_level_tables = {
"helmet_prow"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_PYRAMID:FORCED]
]], weight = 10, next_level_tables = {
"helmet_pyramid"
 }
},


    { value = [[
[ARMOR:ITEM_ARMOR_CORE_CONICAL:FORCED]
]], weight = 10, next_level_tables = {
"armor_cone"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_HOOKED:FORCED]
]], weight = 10, next_level_tables = {
"helmet_hook"
 }
},


    { value = [[
[ARMOR:ITEM_ARMOR_CORE_ANATOMICAL:FORCED]
]], weight = 10, next_level_tables = {
"armor_anatomical"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_SKELETAL:FORCED]
]], weight = 10, next_level_tables = {
"armor_skeleton"
 }
},


}





armor_data.helm_sphere = {
    { value = [[
[HELM:ITEM_HELM_SKUL_SPHR:FORCED]
[HELM:ITEM_HELM_FRWD_OBLG:FORCED]
[HELM:ITEM_HELM_BKWD_OBLG:FORCED]
[HELM:ITEM_HELM_TALL_OBLG:FORCED]
[HELM:ITEM_HELM_BROD_OBLG:FORCED]
[HELM:ITEM_HELM_WIDE_EPSL:FORCED]
[HELM:ITEM_HELM_FULL_SPHR:FORCED]
]], weight = 3 },
    { value = [[
[HELM:ITEM_HELM_SKUL_SPHR:FORCED]
[HELM:ITEM_HELM_FRWD_CONE:FORCED]
[HELM:ITEM_HELM_TALL_CONE:FORCED]
[HELM:ITEM_HELM_BROD_OBLG:FORCED]
[HELM:ITEM_HELM_WIDE_CONE:FORCED]
[HELM:ITEM_HELM_FULL_SPHR:FORCED]
]], weight = 1 },
    { value = [[
[HELM:ITEM_HELM_SKUL_WDGE:FORCED]
]], weight = 1 },
}

armor_data.helm_pyramid = {
    { value = [[
[HELM:ITEM_HELM_SKUL_SPHR:FORCED]
]], weight = 3, next_level_tables = {"helm_angle2"} },
    { value = [[
[HELM:ITEM_HELM_SKUL_FACE:FORCED]
]], weight = 1, next_level_tables = {"guard_angle2"} },
    { value = [[
[HELM:ITEM_HELM_SKUL_WDGE:FORCED]
]], weight = 1, next_level_tables = {"guard_angle2"} },
}


armor_data.helm_block = {
    { value = [[
[HELM:ITEM_HELM_SKUL_SPHR:FORCED]
]], weight = 3, next_level_tables = {"helm_round2"} },
    { value = [[
[HELM:ITEM_HELM_SKUL_CYLN:FORCED]
]], weight = 1, next_level_tables = {"guard_round"} },
    { value = [[
[HELM:ITEM_HELM_SKUL_BLOK:FORCED]
]], weight = 1, next_level_tables = {"guard_round"} },
    { value = [[
[HELM:ITEM_HELM_SKUL_WDGE:FORCED]
]], weight = 1, next_level_tables = {"guard_round"} },
}


return {
    armor_data = armor_data
}
