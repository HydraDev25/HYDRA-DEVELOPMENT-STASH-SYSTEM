local ox_inventory = exports.ox_inventory

RegisterServerEvent("hydra_stast:openStash")
AddEventHandler("hydra_stast:openStash", function(index)
    local src = source

    local citizenid = GetPlayerCitizenId(src)
    if not citizenid then return end

    local stash_id = 'stash_' .. citizenid

    MySQL.Async.fetchScalar('SELECT citizenid FROM hydra_stashes WHERE citizenid = ?', {citizenid}, function(result)
        if not result then
            MySQL.Async.execute('INSERT INTO hydra_stashes (citizenid) VALUES (?)', {citizenid})
        end

        ox_inventory:openInventory(src, {
            type = 'stash',
            id = stash_id,
            label = 'Personal Stash',
            slots = Config.SlotCount,
            weight = Config.MaxWeight,
        })
    end)
end)

function GetPlayerCitizenId(src)
    local identifiers = GetPlayerIdentifiers(src)
    for _, id in ipairs(identifiers) do
        if string.sub(id, 1, string.len("citizenid:")) == "citizenid:" then
            return string.sub(id, 10)
        end
    end
    return nil
end
