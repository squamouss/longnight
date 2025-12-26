local armor_data = {}

armor_data.armor_all = {
    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_BLOCK:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_BLOCK:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_BLOCK:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_block",
"limbs_block"
 }
},
    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_CYLINDER:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_CYLINDER:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_CYLINDER:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_cylinder",
"limbs_cylinder"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_WEDGE:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_WEDGE:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_WEDGE:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_wedge",
"limbs_wedge"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_OBLATE:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_OBLATE:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_OBLATE:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_oblate",
"limbs_oblate"
 }
},
    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_OBLONG:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_OBLONG:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_OBLONG:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_oblong",
"limbs_oblong"
 }
},
    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_PROW:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_PROW:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_PROW:FORCED]
]], weight = 10,
 next_level_tables = {
"helmet_prow",
"limbs_prow"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_PYRAMID:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_PYRAMID:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_PYRAMID:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_pyramid",
"limbs_pyramid"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_CONICAL:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_CONICAL:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_CONICAL:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_cone",
"limbs_cone"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_HOOKED:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_HOOKED:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_HOOKED:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_hook",
"limbs_hook"
 }
},


    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_ANATOMICAL:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_ANATOMICAL:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_ANATOMICAL:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_anatomical",
"limbs_anatomical"
 }
},

    { value = [[
[ARMOR:ITEM_ARMOR_CORE_FULL_SKELETAL:FORCED]
[ARMOR:ITEM_ARMOR_CORE_SEGM_SKELETAL:FORCED]
[ARMOR:ITEM_ARMOR_CORE_PART_SKELETAL:FORCED]
]], weight = 10, 
next_level_tables = {
"helmet_skeleton",
"limbs_anatomical"
 }
},


}




armor_data.helmet_sphere = {
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
