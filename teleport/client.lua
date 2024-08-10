Citizen.CreateThread(function()
    local options = {}

    for k, v in pairs(Config.Tps) do
        table.insert(options, {
            title = v[7] or v[4],
            onSelect = function() fights(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8], v[9]) end
        })
    end

    lib.registerContext({
        id = 'teleport',
        title = Config.Title,
        options = options
    })
end)

-- function fights(x, y, z)
--     local rand = math.random(1,100)
--     SetEntityCoords(PlayerPedId(), x, y, z)
-- end
function fights(x, y, z, x2, y2, z2)
    if x2 and y2 and z2 then -- Check if there are two vector3 positions
        local rand = math.random(1,100)
        if rand <= 50 then
            SetEntityCoords(PlayerPedId(), x, y, z)
        else
            SetEntityCoords(PlayerPedId(), x2, y2, z2)
        end
    else -- Only one vector3 position
        SetEntityCoords(PlayerPedId(), x, y, z)
    end
end


RegisterCommand('tpmenu', function()
    lib.showContext('teleport')
end)

RegisterKeyMapping('tpmenu', 'teleport menu', 'keyboard', 'HOME')