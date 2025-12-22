local master_flowchart_data = {}
local master_common_data = {}

local data_modules = {
    "civ_data.flowchart_data",
    "civ_data.armor_data",
    "civ_data.common_data",
    "civ_data.sites_data",
    "civ_data.position_data",
}

local function deep_merge(t1, t2)
    for k, v2 in pairs(t2) do
        local v1 = t1[k]
        if type(v1) == "table" and type(v2) == "table" then
            deep_merge(v1, v2)
        else
            t1[k] = v2
        end
    end
end

for _, module_path in ipairs(data_modules) do
    local success, data_module = pcall(require, module_path)
    if success then

        if data_module.flowchart_data then
            deep_merge(master_flowchart_data, data_module.flowchart_data)
            log("DATA_MANAGER: Merged flowchart data from '" .. module_path .. "'.")
        end

        -- *** CORRECTED SECTION ***
        if data_module.position_data then
            -- Merge position data into the flowchart data because it uses the flowchart structure
            deep_merge(master_flowchart_data, data_module.position_data)
            -- Updated log message for clarity
            log("DATA_MANAGER: Merged position data (as flowchart) from '" .. module_path .. "'.")
        end
        -- *** END CORRECTION ***

        if data_module.common_data then
            deep_merge(master_common_data, data_module.common_data)
            log("DATA_MANAGER: Merged general common data from '" .. module_path .. "'.")
        end

        log("DATA_MANAGER: Successfully loaded and processed data from '" .. module_path .. "'.")
    else
        log("DATA_MANAGER: ERROR loading data module '" .. module_path .. "': " .. tostring(data_module))
    end
end

return {
    flowchart_data = master_flowchart_data,
    common_data = master_common_data,
}
