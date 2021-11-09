ESX = nil

noclip = false
vehnoclip = false
god = false
revive = false
heal = false
invisible = false
freeze = false
CMS = {}


Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


function DrawPlayerInfo(target)
	drawTarget = target
	drawInfo = true
end

function StopDrawPlayerInfo()
	drawInfo = false
	drawTarget = 0
end


Citizen.CreateThread( function()
	while true do
		Citizen.Wait(500)
		if drawInfo and not stopSpectateUpdate then
			local localPlayerPed = PlayerPedId()
			local targetPed = GetPlayerPed(drawTarget)
			local targetGod = GetPlayerInvincible(drawTarget)
			
			local tgtCoords = GetEntityCoords(targetPed)
			if tgtCoords and tgtCoords.x ~= 0 then
				SetEntityCoords(localPlayerPed, tgtCoords.x, tgtCoords.y, tgtCoords.z - 10.0, 0, 0, 0, false)
			end
		else
			Citizen.Wait(1000)
		end
	end
end)

TriggerEvent('chat:addSuggestion', '/r', 'Reply (DM) to player', {
	{ name="id", help="The ID of the player" },
    { name="message", help="Message" },
})

TriggerEvent('chat:addSuggestion', '/kick', 'Kick player', {
	{ name="id", help="The ID of the player" },
    { name="message", help="Kick Message" },
})

TriggerEvent('chat:addSuggestion', '/a', 'Talk in Admin Chat', {
    { name="message", help="Chat Message" },
})


TriggerEvent('chat:addSuggestion', '/tp', 'Teleport to Coordinate', {
    { name="X", help="X Coordinate" },
    { name="Y", help="Y Coordinate" },
    { name="Z", help="Z Coordinate" },
})

TriggerEvent('chat:addSuggestion', '/id', 'Displays your server ID in chat', {
})

TriggerEvent('chat:addSuggestion', '/setjob', 'Set a Players\' job', {
    { name="id", help="Target ID" },
    { name="job", help="Job Name" },
    { name="grade", help="Rank/Grade" },
})

TriggerEvent('chat:addSuggestion', '/car', 'Spawn a vehicle', {
    { name="model", help="Vehicle Model" },
})

TriggerEvent('chat:addSuggestion', '/dv', 'Destroy Vehicle', {
    { name="radius", help="(Optional) - Radius" },
})

TriggerEvent('chat:addSuggestion', '/giveaccountmoney', 'Give a player money to a specified account', {
    { name="id", help="Target Server ID" },
    { name="account", help="account to give money to" },
    { name="amount", help="Quantity to give" },
})

TriggerEvent('chat:addSuggestion', '/giveitem', 'Give a specified quantity of an item to a player', {
    { name="id", help="Target Server ID" },
    { name="account", help="Item to give" },
    { name="amount", help="Quantity to give" },
})

TriggerEvent('chat:addSuggestion', '/giveweapon', 'Give a player a weapon with X ammo', {
    { name="id", help="Target Server ID" },
    { name="account", help="Weapon to give" },
    { name="amount", help="Ammo to give" },
})

TriggerEvent('chat:addSuggestion', '/clearinventory', 'Clear a player\'s ITEMS (NOT WEAPONS)', {
    { name="id", help="Target Server ID" },
})

TriggerEvent('chat:addSuggestion', '/clearinventory', 'Clear a player\'s WEAPONS (NOT items)', {
    { name="id", help="Target Server ID" },
})

TriggerEvent('chat:addSuggestion', '/setjob', 'Set a Players\' job', {
    { name="id", help="Target ID" },
    { name="job", help="Group" },
})

TriggerEvent('chat:addSuggestion', '/clearall', 'Clear chat for all players', {

})

TriggerEvent('chat:addSuggestion', '/slay', 'Kill a Player', {
    { name="id", help="Target ID" },
})

TriggerEvent('chat:addSuggestion', '/freeze', 'Freeze a Player', {
    { name="id", help="Target ID" },
})

TriggerEvent('chat:addSuggestion', '/unfreeze', 'Unfreeze a Player', {
    { name="id", help="Target ID" },
})

TriggerEvent('chat:addSuggestion', '/report', 'Submit a report to ingame staff', {
    { name="id", help="Message" },
})

RegisterNetEvent("CMS:giveCar")
AddEventHandler("CMS:giveCar", function(model)
    local playerPed = PlayerPedId()
    local coordinates = GetEntityCoords(playerPed)
    local carExist = false

    ESX.Game.SpawnVehicle(model, coordinates, 0.0, function(vehicle)
        if DoesEntityExist(vehicle) then
            carExist = true
            TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
        end
    end)
    if not carExist then
        TriggerEvent('chatMessage', "SYSTEM", {255, 0, 0}, "Invalid Vehicle Code!")
    end
end)

RegisterNetEvent("CMS_admin:killPlayer")
AddEventHandler("CMS_admin:killPlayer", function()
  SetEntityHealth(PlayerPedId(), 0)
end)

RegisterNetEvent("CMS-admin:requestSpectate")
AddEventHandler('CMS-admin:requestSpectate', function(playerServerId, tgtCoords)
	local localPlayerPed = PlayerPedId()
	if ((not tgtCoords) or (tgtCoords.z == 0.0)) then tgtCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerServerId))) end
	if playerServerId == GetPlayerServerId(PlayerId()) then 
		if oldCoords then
			RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
			Wait(500)
			SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
			oldCoords=nil
		end
		spectatePlayer(GetPlayerPed(PlayerId()),GetPlayerFromServerId(PlayerId()),GetPlayerName(PlayerId()))
		frozen = false
		return 
	else
		if not oldCoords then
			oldCoords = GetEntityCoords(PlayerPedId())
		end
	end
	SetEntityCoords(localPlayerPed, tgtCoords.x, tgtCoords.y, tgtCoords.z - 10.0, 0, 0, 0, false)
	frozen = true
	stopSpectateUpdate = true
	local adminPed = localPlayerPed
	local playerId = GetPlayerFromServerId(playerServerId)
	repeat
		Wait(200)
		playerId = GetPlayerFromServerId(playerServerId)
	until ((GetPlayerPed(playerId) > 0) and (playerId ~= -1))
	spectatePlayer(GetPlayerPed(playerId),playerId,GetPlayerName(playerId))
	stopSpectateUpdate = false 
end)

RegisterCommand(Config.Command, function()
    ESX.TriggerServerCallback("CMS-admin:checkStaff", function(isStaff) --Perms check
        if isStaff then
            if Config.Tnotify then
                exports['t-notify']:Alert({
                    style = 'warning',
                    message = _U('admin_menu')
                })
            elseif Config.ESX then
                ESX.ShowNotification(_U('admin_menu'), false, false, 0) -- Show Menu Open notification
            elseif Config.mythic then
                exports['mythic_notify']:DoHudText('success', _U('admin_menu'))
            end
            OpenAdminmenu()
        else -- Deny if no perms
            if Config.Tnotify then
                exports['t-notify']:Alert({
                    style = "error",
                    message = _U('perms_false')
                })
            elseif Config.ESX then
                ESX.ShowNotification(_U('perms_false'), false, false, 0) -- No perms, display notification
            elseif Config.mythic then
                exports['mythic_notify']:DoHudText('error', _U('perms_false'))
            end
        end
    end)
end, false)

RegisterKeyMapping(Config.Command, _U('suggest'), 'keyboard', Config.Key) -- Key map

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(15)
        if noclip then --Swimming noclip
            local ped = PlayerPedId()
            local x, y, z = getPos()
            local px, py, pz = getCamDirection()
            local speed=  Config.NoClipSpeed

            if IsControlPressed(0, 32) then
                x = x + speed * px
				y = y + speed * py
				z = z + speed * pz

			elseif IsControlPressed(0, 33) then
				x = x - speed * px
				y = y - speed * py
				z = z - speed * pz
			end

            SetEntityVelocity(ped, 0.05, 0.05, 0.05)
            SetEntityCoordsNoOffset(ped, x, y, z, true, true, true)
        end

        if vehnoclip then --Vehicle noclip
            local ped = GetVehiclePedIsIn(PlayerPedId(), false)
            local x, y, z = getPos()
            local px, py, pz = getCamDirection()
            local speed = Config.NoClipSpeed
            if IsControlPressed(0, 32) then
                x = x + speed * px
				y = y + speed * py
				z = z + speed * pz

			elseif IsControlPressed(0, 33) then
				x = x - speed * px
				y = y - speed * py
				z = z - speed * pz
			end

            SetEntityVelocity(ped, 0.05, 0.05, 0.05)
            SetEntityCoordsNoOffset(ped, x, y, z, true, true, true)
        end
    end
end)


function OpenAdminmenu()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'admin_actions', {
        title       = _U('top_level_title'),
        align       = Config.MenuAlign,
        elements    = {
            {label = _U('player_list'), value = 'player_list'}, --Open player list
            {label = _U('super_menu'), value = 'super_menu'}, -- Open SA Menu
            {label = _U('moderator_menu'), value = 'moderator_menu'}, -- Open Mod+ Menu
            {label = _U('tmoderator_menu'), value = 'tmoderator_menu'}, -- Open TMod Menu
            {label = _U('reports_menu'), value = 'reports_menu'} --Reports menu (BETA)        
    }},function(data, menu)
        if data.current.value == 'player_list' then
            ESX.TriggerServerCallback("CMS-admin:playersOnline", function(players)
                local elements = {}
                for i = 1, #players, 1 do -- Populate menu with all players ingame
                    table.insert(elements, {
                        label = players[i].name .. ' | ' .. players[i].source .. ' | ' .. players[i].group,
                        value = players[i].source,
                        name = players[i].name
                    })
                end
                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_list', {
                    title   = _U('player_list'),
                    align   = Config.MenuAlign,
                    elements = elements
                }, function(data2, menu2)
                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_name', {
                        title       = _U('player_name', data2.current.value),
                        align       = Config.MenuAlign,
                        elements = BuildElements()
                    }, function(data3, menu3)
                        menu3.close()
                        local name = data2.current.name
                        local PlayerID = data2.current.value
                        if data3.current.value == 'spectate' then
                            local playerPed = PlayerPedId()
                            SetEntityVisible(playerPed, false, 0)
                            Wait(500)
                            TriggerServerEvent('CMS-admin:teleportcloseenough', GetPlayerServerId(PlayerId()), PlayerID)
                            TriggerEvent('CMS-admin:requestSpectate', PlayerID)
                        elseif data3.current.value == 'screenshot' then
                            --Do something
                        elseif data3.current.value == 'kick' then
                            TriggerServerEvent('CMS-admin:kickPlayer', PlayerID, name)
                            ESX.UI.Menu.CloseAll()
                        elseif data3.current.value == 'ban' then
                            ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'ban',
                        {
                            title = _U('enter_reason')
                        },function(data4, menu4)
                            local reason = data4.value
                            TriggerServerEvent('CMS-admin:banPlayer', reason, PlayerID)
                            menu4.close()
                        end)
                        elseif data3.current.value == 'freeze' then
                            freeze = not freeze
                            if freeze then
                                ExecuteCommand('freeze ' .. PlayerID)
                            else
                                ExecuteCommand('unfreeze ' .. PlayerID)
                            end
                        elseif data3.current.value == 'goto' then
                            TriggerServerEvent('CMS-admin:goToPlayer',GetPlayerServerId(PlayerId()), PlayerID, name)
                        elseif data3.current.value == 'bring' then
                            TriggerServerEvent('CMS-admin:bringPlayer', PlayerID, GetPlayerServerId(PlayerId()), name)
                            --TriggerServerEvent('CMS-admin:bringPlayer', PlayerPedId, PlayerId)
                        elseif data3.current.value == 'open_inventory' then
                            --print(GetPlayerFromServerId(PlayerID))
                            TriggerServerEvent("mf-inventory:search", GetPlayerServerId(GetPlayerFromServerId(PlayerID), PlayerID))
                        elseif data3.current.value == 'slap' then
                            --ApplyForceToEntity(ped, 1, 9500.0, 3.0, 7100.0, 1.0, 0.0, 0.0, 1, false, true, false, false)
                        end
                    end, function(data3, menu3)
                        menu3.close()
                    end)
                end, function(data2, menu2)
                    menu2.close()
                end)
            end)
        elseif data.current.value == 'super_menu' then
        ESX.TriggerServerCallback("CMS-admin:checkSAdmin", function(isSAdmin)
            if isSAdmin then
                local elements = {
                    {label = _U('god'), value = 'god'},
                    {label = _U('inv'), value = 'inv'},
                    {label = _U('tpveh'), value = 'tpveh'},
                    {label = _U('fix'), value = 'fix'},
                    {label = _U('ped'), value = 'ped'},
                    {label = _U('noclipveh'), value = 'noclipveh'},
                    {label = _U('heal'), value = 'heal'},
                    {label = _U('revive'), value = 'revive'},
                    {label = _U('tpm'), value = 'tpm'},
                    {label = _U('goto'), value = 'goto'},
                    {label = _U('bring'), value = 'bring'},
                    {label = _U('noclip'), value = 'noclip'},
                    {label = _U('dv'), value = 'dv'},
                    {label = _U('del_chat'), value = 'del_chat'},
                    {label = _U('del_veh_time'), value = 'del_veh_time'},
                }

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'super_menu', {
                    title       = _U('super_menu'),
                    align       = Config.MenuAlign,
                    elements    = elements
                }, function(data2, menu2)
                    local choice = data2.current.value
                    if choice == 'god' then
                        TriggerEvent('CMS-admin:god')
                    elseif choice == 'inv' then
                        TriggerEvent('CMS-admin:invisible')
                    elseif choice == 'tpveh' then
                        GoVeh()
                    elseif choice == 'fix' then
                        TriggerEvent( 'CMS-admin:repairVehicle')
                    elseif choice == 'ped' then
                        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), 'ped_menu', {
                            title = _U('ped'),
                        }, function(menuData, menuHandle)
                            local pedModel = menuData.value
                                        
                            if not type(pedModel) == "number" then pedModel = 'pedModel' end
                            if IsModelInCdimage(pedModel) then
                                while not HasModelLoaded(pedModel) do
                                    Citizen.Wait(15)
                                    RequestModel(pedModel)
                                end
                                SetPlayerModel(PlayerId(), pedModel)
                                menuHandle.close()
                            else
                                if Config.Tnotify then
                                exports['t-notify']:Alert({
                                    style  =  'info',
                                    message  =  _U('ped_false') .. pedModel
                                })
                                elseif Config.ESX then
                                    ESX.ShowNotification(_U('ped_false'), false, false, 0)
                                elseif Config.mythic then
                                    exports['mythic_notify']:DoHudText('error', _U('ped_false'))
                                end
                            end
                        end, function(menuData, menuHandle)
                            menuHandle.close()
                        end)
                    elseif choice == 'noclipveh' then   
                        TriggerEvent('CMS-admin:noclipveh')
                    elseif choice == 'heal' then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'heal',
                        {
                            title = _U('enter_id')
                        },
                        function(dialogData, dialogMenu)
                            local identifier = tonumber(dialogData.value)
                            if identifier then
                                TriggerEvent('CMS-admin:healPlayer', identifier , "FINDING NAME IS WIP")
                                ESX.UI.Menu.CloseAll()
                            else
                                exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                                --ESX.ShowNotification(_U('invalid_entry'))
                                ESX.UI.Menu.CloseAll()
                            end
                        end) 
                    elseif choice == 'revive' then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'revive',
                        {
                            title = _U('enter_id')
                        },
                        function(dialogData, dialogMenu)
                        local identifier = tonumber(dialogData.value)
                        if identifier then 
                            TriggerServerEvent('CMS-admin:revivePlayer', identifier)
                            local playerIdx = GetPlayerFromServerId(identifier)
                            local ped = GetPlayerPed(playerIdx)
                            SetEntityHealth(ped, GetEntityMaxHealth(ped))
                            ESX.UI.Menu.CloseAll()
                        else
                            exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                            ESX.UI.Menu.CloseAll()
                        end
                    end)
                    elseif choice == 'tpm' then
                        TeleportToMarker()
                    elseif choice == 'goto' then 
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'tpm',
                        {
                        title = _U('enter_id')
                        },
                        function(dialogData, dialogMenu)
                            local identifier = tonumber(dialogData.value)
                            if identifier then
                                TriggerServerEvent('CMS-admin:goToPlayer',GetPlayerServerId(PlayerId()), identifier, "FINDING NAME IS WIP")
                                ESX.UI.Menu.CloseAll()
                            else
                                exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                                ESX.UI.Menu.CloseAll()
                            end
                        end) 
                    elseif choice == 'bring' then
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'bring',
                        {
                        title = _U('enter_id')
                        },
                        function(dialogData, dialogMenu)
                            local identifier = tonumber(dialogData.value)
                            if identifier then
                                TriggerServerEvent('CMS-admin:bringPlayer', identifier, GetPlayerServerId(PlayerId()), "FINDING NAME IS WIP")
                                ESX.UI.Menu.CloseAll()
                            else
                                exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                                ESX.UI.Menu.CloseAll()
                            end
                        end)
                    elseif choice == 'noclip' then
                        TriggerEvent('CMS-admin:noclip')
                    elseif choice == 'dv' then
                        TriggerEvent('esx:deleteVehicle')
                    elseif choice == 'del_chat' then
                        TriggerServerEvent('CMS-admin:clearchat')
                    elseif choice == 'del_veh_time' then
                        TriggerServerEvent('CMS-admin:delallveh')
                    end
                end, function(data2, menu2)
                    menu2.close()
                end)
            else
            --ESX.ShowNotification(_U('perms_false'), false, false, 0) -- No perms, display notification
                exports['mythic_notify']:DoHudText('error', _U('perms_false'))
            end
        end)
        elseif data.current.value == 'moderator_menu' then
        ESX.TriggerServerCallback("CMS-admin:checkMod", function(isMod)
            if isMod then
                local elements = {
                    {label = _U('heal'), value = 'heal'},
                    {label = _U('revive'), value = 'revive'},
                    {label = _U('tpm'), value = 'tpm'},
                    {label = _U('goto'), value = 'goto'},
                    {label = _U('bring'), value = 'bring'},
                    {label = _U('noclip'), value = 'noclip'},
                    {label = _U('dv'), value = 'dv'},
                    {label = _U('del_chat'), value = 'del_chat'},
                    {label = _U('del_veh_time'), value = 'del_veh_time'},
                }

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'moderator_menu', {
                    title       = _U('moderator_menu'),
                    align       = Config.MenuAlign,
                    elements    = elements
                }, function(data2, menu2)
                    local choice = data2.current.value
                if choice == 'heal' then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'bring',
                    {
                        title = _U('enter_id')
                    },
                    function(dialogData, dialogMenu)
                        local identifier = tonumber(dialogData.value)
                        if identifier then
                            TriggerEvent('CMS-admin:healPlayer', identifier , "FINDING NAME IS WIP")
                            ESX.UI.Menu.CloseAll()
                        else
                            exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                            ESX.UI.Menu.CloseAll()
                        end
                    end) 
                elseif choice == 'revive' then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'revive',
                    {
                        title = _U('enter_id')
                    },
                    function(dialogData, dialogMenu)
                    local identifier = tonumber(dialogData.value)
                    if identifier then 
                        TriggerServerEvent('CMS-admin:revivePlayer', identifier)
                        local playerIdx = GetPlayerFromServerId(identifier)
                        local ped = GetPlayerPed(playerIdx)
                        SetEntityHealth(ped, GetEntityMaxHealth(ped))
                        ESX.UI.Menu.CloseAll()
                    else
                        exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                        ESX.UI.Menu.CloseAll()
                    end
                end)
                elseif choice == 'tpm' then
                    TeleportToMarker()
                elseif choice == 'goto' then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'tpm',
                    {
                    title = _U('enter_id')
                    },
                    function(dialogData, dialogMenu)
                        local identifier = tonumber(dialogData.value)
                        if identifier then
                            TriggerServerEvent('CMS-admin:goToPlayer',GetPlayerServerId(PlayerId()), identifier, "FINDING NAME IS WIP")
                            ESX.UI.Menu.CloseAll()
                        else
                            exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                            ESX.UI.Menu.CloseAll()
                        end
                    end)  
                elseif choice == 'bring' then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'bring',
                    {
                    title = _U('enter_id')
                    },
                    function(dialogData, dialogMenu)
                        local identifier = tonumber(dialogData.value)
                        if identifier then
                            TriggerServerEvent('CMS-admin:bringPlayer', identifier, GetPlayerServerId(PlayerId()), "FINDING NAME IS WIP")
                            ESX.UI.Menu.CloseAll()
                        else
                            exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                            ESX.UI.Menu.CloseAll()
                        end
                    end)
                elseif choice == 'noclip' then
                    TriggerEvent('CMS-admin:noclip')
                elseif choice == 'dv' then
                    TriggerEvent('esx:deleteVehicle')
                elseif choice == 'del_chat' then
                    TriggerServerEvent('CMS-admin:clearchat')
                elseif choice == 'del_veh_time' then
                    TriggerServerEvent('CMS-admin:delallveh')
                end
            end, function(data2, menu2)
                menu2.close()
            end)
            else
                exports['mythic_notify']:DoHudText('error', _U('mod_perms_false'))
            end
        end)
        elseif data.current.value == 'tmoderator_menu' then
            local elements = {
                {label = _U('revive'), value = 'revive'},
                {label = _U('tpm'), value = 'tpm'},
                {label = _U('goto'), value = 'goto'},
                {label = _U('bring'), value = 'bring'},
                {label = _U('noclip'), value = 'noclip'},
                {label = _U('dv'), value = 'dv'},
            }
            ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'tmoderator_menu', {
                title       = _U('tmoderator_menu'),
                align       = Config.MenuAlign,
                elements    = elements
            }, function(data2, menu2)
                local choice = data2.current.value
                if choice == 'revive' then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'revive',
                    {
                        title = _U('enter_id')
                    },
                    function(dialogData, dialogMenu)
                    local identifier = tonumber(dialogData.value)
                    if identifier then 
                        TriggerServerEvent('CMS-admin:revivePlayer', identifier)
                        local playerIdx = GetPlayerFromServerId(identifier)
                        local ped = GetPlayerPed(playerIdx)
                        SetEntityHealth(ped, GetEntityMaxHealth(ped))
                        ESX.UI.Menu.CloseAll()
                    else
                        exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                        ESX.UI.Menu.CloseAll()
                    end
                end)
                elseif choice == 'tpm' then
                    TeleportToMarker()
                elseif choice == 'goto' then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'tpm',
                    {
                    title = _U('enter_id')
                    },
                    function(dialogData, dialogMenu)
                    local identifier = tonumber(dialogData.value)
                    if identifier then
                        TriggerServerEvent('CMS-admin:goToPlayer',GetPlayerServerId(PlayerId()), identifier, "FINDING NAME IS WIP")
                        ESX.UI.Menu.CloseAll()
                    else
                        exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                        ESX.UI.Menu.CloseAll()
                    end

                end)  
                elseif choice == 'bring' then
                    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'bring',
                    {
                    title = _U('enter_id')
                    },
                    function(dialogData, dialogMenu)
                    local identifier = tonumber(dialogData.value)
                    if identifier then
                        TriggerServerEvent('CMS-admin:bringPlayer', identifier, GetPlayerServerId(PlayerId()), "FINDING NAME IS WIP")
                        ESX.UI.Menu.CloseAll()
                    else
                        exports['mythic_notify']:DoHudText('error', _U('invalid_entry'))
                        ESX.UI.Menu.CloseAll()
                    end

                end)
                elseif choice == 'noclip' then
                    TriggerEvent('CMS-admin:noclip')
                elseif choice == 'dv' then
                    TriggerEvent('esx:deleteVehicle')
                end
            end, function(data2, menu2)
                menu2.close()
            end)
        elseif data.current.value == 'reports_menu' then
            ESX.UI.Menu.CloseAll()
            exports['mythic_notify']:DoHudText('error', 'WIP')
        end

    end, function(data, menu)
        menu.close()
    end)
end  
            
getPos = function()
    local x,y,z = table.unpack(GetEntityCoords(PlayerPedId(),true))
    return x,y,z
end

getCamDirection = function()
    local heading = GetGameplayCamRelativeHeading()+GetEntityHeading(PlayerPedId())
    local pitch = GetGameplayCamRelativePitch()

    local x = -math.sin(heading*math.pi/180.0)
    local y = math.cos(heading*math.pi/180.0)
    local z = math.sin(pitch*math.pi/180.0)

    local len = math.sqrt(x*x+y*y+z*z)
	if len ~= 0 then
        x = x/len
        y = y/len
        z = z/len
      end
  
      return x,y,z
  end

TeleportToMarker = function()
    ESX.TriggerServerCallback("CMS-admin:checkStaff", function(isStaff)
        if isStaff then
            local WaypointHandle = GetFirstBlipInfoId(8)

            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)

                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)

                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)

                        break
                    end
                    Citizen.Wait(10)
                end
            if Config.Tnotify then
                exports['t-notify']:Alert
                ({
                    style  =  'success',
                    message  =  _U('tp_true')
                })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('tp_true'), false, false, 0)
                end
            else
                if Config.Tnotify then
                    exports['t-notify']:Alert
                    ({
                        style  =  'info',
                        message  =  _U('tp_false')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('tp_false'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('error', _U('tp_false'))
                end
            end
        else
            if Config.Tnotify then
            exports['t-notify']:Alert({
                style  =  'error',
                message = _U('user_perms')
            })
            elseif Config.ESX then
                ESX.ShowNotification(_U('user_perms'), false, false, 0)
            elseif Config.mythic then
                exports['mythic_notify']:DoHudText('error', _U('tp_false'))
            end
        end
    end)
end




function GoVeh()
    ESX.TriggerServerCallback("CMS-admin:checkStaff", function(isStaff)
        if isStaff then
            local playerPed = PlayerPedId()
            local playerPedPos = GetEntityCoords(playerPed, true)
            local CloseVeh = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 4)
            local CloseVehPos = GetEntityCoords(CloseVeh, true)
            local CloseAir = GetClosestVehicle(GetEntityCoords(playerPed, true), 1000.0, 0, 10000)
            local CloseAirPos = GetEntityCoords(CloseAir, true)
            if Config.Tnotify then
                exports['t-notify']:Alert({
                    style  =  'info',
                    message  =  _U('veh_wait'),
                    duration = 1200
                })
            elseif Config.ESX then
                ESX.ShowNotification(_U('veh_wait'), false, false, 0)
            end
            Citizen.Wait(1600)
            if (CloseVeh == 0) and (CloseAir == 0) then
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'error',
                        message  =  _U('veh_false')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('veh_false'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('error', _U('veh_false'))
                end
            elseif (CloseVeh == 0) and (CloseAir ~= 0) then
                if IsVehicleSeatFree(CloseAir, -1) then
                    SetPedIntoVehicle(playerPed, CloseAir, -1)
                    SetVehicleDoorsLocked(CloseAir, 1)
                    SetVehicleNeedsToBeHotwired(CloseAir, false)
                    Citizen.Wait(1)
                else
                    local driverPed = GetPedInVehicleSeat(CloseAir, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, CloseAir, -1)
                    SetVehicleDoorsLocked(CloseAir, 1)
                    SetVehicleNeedsToBeHotwired(CloseAir, false)
                    Citizen.Wait(1)
                end
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'success',
                        message  =  _U('veh_true')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('veh_true'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('error', _U('veh_true'))
                end
            elseif (CloseVeh ~= 0) and (CloseAir == 0) then
                if IsVehicleSeatFree(CloseVeh, -1) then
                    SetPedIntoVehicle(playerPed, CloseVeh, -1)
                    SetVehicleDoorsLocked(CloseVeh, 1)
                    SetVehicleNeedsToBeHotwired(CloseVeh, false)
                    Citizen.Wait(1)
                else
                    local driverPed = GetPedInVehicleSeat(CloseVeh, -1)
                    ClearPedTasksImmediately(driverPed)
                    SetEntityAsMissionEntity(driverPed, 1, 1)
                    DeleteEntity(driverPed)
                    SetPedIntoVehicle(playerPed, CloseVeh, -1)
                    SetVehicleDoorsLocked(CloseVeh, 1)
                    SetVehicleNeedsToBeHotwired(CloseVeh, false)
                    Citizen.Wait(1)
                end
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'success',
                        message  =  _U('veh_true')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('veh_true'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('error', _U('veh_true'))
                end
            elseif (CloseVeh ~= 0) and (CloseAir ~= 0) then
                if Vdist(CloseVehPos.x, CloseVehPos.y, CloseVehPos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) < Vdist(CloseAirPos.x, CloseAirPos.y, CloseAirPos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                    if IsVehicleSeatFree(CloseVeh, -1) then
                        SetPedIntoVehicle(playerPed, CloseVeh, -1)
                        SetVehicleAlarm(CloseVeh, false)
                        SetVehicleDoorsLocked(CloseVeh, 1)
                        SetVehicleNeedsToBeHotwired(CloseVeh, false)
                        Citizen.Wait(1)
                    else
                        local driverPed = GetPedInVehicleSeat(CloseVeh, -1)
                        ClearPedTasksImmediately(driverPed)
                        SetEntityAsMissionEntity(driverPed, 1, 1)
                        DeleteEntity(driverPed)
                        SetPedIntoVehicle(playerPed, CloseVeh, -1)
                        SetVehicleAlarm(CloseVeh, false)
                        SetVehicleDoorsLocked(CloseVeh, 1)
                        SetVehicleNeedsToBeHotwired(CloseVeh, false)
                        Citizen.Wait(1)
                    end
                elseif Vdist(CloseVehPos.x, CloseVehPos.y, CloseVehPos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) > Vdist(CloseAirPos.x, CloseAirPos.y, CloseAirPos.z, playerPedPos.x, playerPedPos.y, playerPedPos.z) then
                    if IsVehicleSeatFree(CloseAir, -1) then
                        SetPedIntoVehicle(playerPed, CloseAir, -1)
                        SetVehicleAlarm(CloseAir, false)
                        SetVehicleDoorsLocked(CloseAir, 1)
                        SetVehicleNeedsToBeHotwired(CloseAir, false)
                        Citizen.Wait(1)
                    else
                        local driverPed = GetPedInVehicleSeat(CloseAir, -1)
                        ClearPedTasksImmediately(driverPed)
                        SetEntityAsMissionEntity(driverPed, 1, 1)
                        DeleteEntity(driverPed)
                        SetPedIntoVehicle(playerPed, CloseAir, -1)
                        SetVehicleAlarm(CloseAir, false)
                        SetVehicleDoorsLocked(CloseAir, 1)
                        SetVehicleNeedsToBeHotwired(CloseAir, false)
                        Citizen.Wait(1)
                    end
                end
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'success',
                        message  =  _U('veh_true')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('veh_true'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('error', _U('veh_true'))
                end
                Citizen.Wait(1)
            end
        else
            if Config.Tnotify then
                exports['t-notify']:Alert({
                    style  =  'error',
                    message  =  _U('user_perms')
                })
            elseif Config.ESX then
                ESX.ShowNotification(_U('user_perms'), false, false, 0)
            elseif Config.mythic then
                exports['mythic_notify']:DoHudText('error', _U('user_perms'))
            end
        end
    end)
end

RegisterNetEvent('CMS-admin:noclipveh')
AddEventHandler('CMS-admin:noclipveh',function()
    ESX.TriggerServerCallback("CMS-admin:checkStaff", function(isStaff)
        if isStaff then
            vehnoclip = not vehnoclip
            if vehnoclip == true then
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'success',
                        message  =  _U('noclip_true')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('noclip_true'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('success', _U('noclip_true'))
                end
            else
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'error',
                        message  =  _U('noclip_false')
                    })
                elseif Config.ESX then
                    exports['mythic_notify']:DoHudText('error', _U('noclip_false'))
                end
            end
        else
            if Config.Tnotify then
                exports['t-notify']:Alert({
                    style  =  'error',
                    message  =  _U('user_perms')
                })
            elseif Config.ESX then
                ESX.ShowNotification(_U('user_perms'), false, false, 0)
            elseif Config.mythic then
                exports['mythic_notify']:DoHudText('error', _U('user_perms'))
            end
        end
    end)
end)

RegisterNetEvent('CMS-admin:noclip')
AddEventHandler('CMS-admin:noclip',function()
    ESX.TriggerServerCallback("CMS-admin:checkStaff", function(isStaff)
        if isStaff then
            ped = PlayerPedId()
            noclip = not noclip
            if noclip == true then
                RequestAnimDict("swimming@base")
                while not HasAnimDictLoaded("swimming@base") do
                    Citizen.Wait(0)
                end
                TaskPlayAnim(ped, "swimming@base", "dive_idle", -25.0, -8.0, -1, 1, 0, false, false, false)
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'success',
                        message  =  _U('noclip_true')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('noclip_true'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('success', _U('noclip_true'))
                end
            else
                ClearPedTasks(ped)
                if Config.Tnotify then
                    exports['t-notify']:Alert({
                        style  =  'error',
                        message  =  _U('noclip_false')
                    })
                elseif Config.ESX then
                    ESX.ShowNotification(_U('noclip_false'), false, false, 0)
                elseif Config.mythic then
                    exports['mythic_notify']:DoHudText('error', _U('noclip_false'))
                end
            end
        else
            if Config.Tnotify then
                exports['t-notify']:Alert({
                    style  =  'error',
                    message  =  _U('user_perms')
                })
            elseif Config.ESX then
                ESX.ShowNotification(_U('user_perms'), false, false, 0)
            elseif Config.mythic then
                exports['mythic_notify']:DoHudText('error', _U('user_perms'))
            end
        end
    end)
end)

RegisterNetEvent('CMS-admin:invisible')
AddEventHandler('CMS-admin:invisible', function()
	invisible = not invisible
	local ped = PlayerPedId()
	SetEntityVisible(ped, not invisible, false)
	if invisible == true then
			if Config.Tnotify then
			exports['t-notify']:Alert({
				style  =  'success',
				message  =  _U('inv_true')
			})
		elseif Config.ESX then
			ESX.ShowNotification(_U('inv_true'), false, false, 0)
        elseif Config.mythic then
            exports['mythic_notify']:DoHudText('success', _U('inv_true'))
        end
	else
		if Config.Tnotify then
			exports['t-notify']:Alert({
				style  =  'error',
				message  =  _U('inv_false')
			})
		elseif Config.ESX then
			ESX.ShowNotification(_U('inv_false'), false, false, 0)
        elseif Config.mythic then
            exports['mythic_notify']:DoHudText('error', _U('inv_false'))
        end
	end
end)

RegisterNetEvent('CMS-admin:god')
AddEventHandler('CMS-admin:god', function()
	local playerPed = PlayerPedId()
    god = not god
    if god == true then
	    SetEntityInvincible(playerPed, god, true)
	    if Config.Tnotify then
	    	exports['t-notify']:Alert({
			style  =  'success',
			message  =  _U('god_true')
		})
	    elseif Config.ESX then
			ESX.ShowNotification(_U('god_true'), false, false, 0)
        elseif Config.mythic then
            exports['mythic_notify']:DoHudText('success', _U('god_true'))
        end
    else
        if Config.Tnotify then
            exports['t-notify']:Alert({
                style  =  'error',
                message  =  _U('god_false')
            })
        elseif Config.ESX then
            ESX.ShowNotification(_U('god_false'), false, false, 0)
        elseif Config.mythic then
            exports['mythic_notify']:DoHudText('error', _U('god_false'))
        end
    end

end)   

RegisterNetEvent('CMS-admin:healPlayer')
AddEventHandler('CMS-admin:healPlayer', function(identifier, name)
    local pedIdx = GetPlayerFromServerId(identifier)
    local ped = GetPlayerPed(pedIdx)
	SetEntityHealth(ped, 200)
	SetPedArmour(ped, 100)
	ClearPedBloodDamage(ped)
 	ResetPedVisibleDamage(ped)
	ClearPedLastWeaponDamage(ped)
	if Config.Tnotify then
		exports['t-notify']:Alert({
			style  =  'success',
			message  =  _U('heal_true')
       	})
	elseif Config.ESX then
		ESX.ShowNotification(_U('heal_true', name), false, false, 0)
    elseif Config.mythic then
        exports['mythic_notify']:DoHudText('success', _U('heal_true'))
    end
end)

RegisterNetEvent('CMS-admin:repairVehicle')
AddEventHandler('CMS-admin:repairVehicle', function()
	local ply = PlayerPedId()
	local plyVeh = GetVehiclePedIsIn(ply)
	if IsPedInAnyVehicle(ply) then 
		SetVehicleFixed(plyVeh)
		SetVehicleDeformationFixed(plyVeh)
		SetVehicleUndriveable(plyVeh, false)
		SetVehicleEngineOn(plyVeh, true, true)
		if Config.Tnotify then
			exports['t-notify']:Alert({
				style  =  'success',
				message  =  _U('fix_true')
			})
		elseif Config.ESX then
			ESX.ShowNotification(_U('fix_true'), false, false, 0)
        elseif Config.mythic then
            exports['mythic_notify']:DoHudText('success', _U('fix_true'))
        end
	else
		if Config.Tnotify then
			exports['t-notify']:Alert({
				style  =  'error',
				message  =  _U('fix_false')
			})
		elseif Config.ESX then
			ESX.ShowNotification(_U('fix_false'), false, false, 0)
        elseif Config.mythic then
            exports['mythic_notify']:DoHudText('error', _U('fix_false'))
        end
	end
end)

RegisterNetEvent("esx_admin:freezePlayer")
AddEventHandler("esx_admin:freezePlayer", function(input)
    local player = PlayerId()
	local ped = PlayerPedId()
    if input == 'freeze' then
        SetEntityCollision(ped, false)
        FreezeEntityPosition(ped, true)
        SetPlayerInvincible(player, false)
    elseif input == 'unfreeze' then
        SetEntityCollision(ped, true)
	    FreezeEntityPosition(ped, false)
        SetPlayerInvincible(player, false)
    end
end)


RegisterNetEvent("CMS-admin:goToPlayer")
AddEventHandler("CMS-admin:goToPlayer", function(plyCoords)
    SetEntityCoords(PlayerPedId(), plyCoords, false, false, false, true)
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        ESX.UI.Menu.CloseAll()
    end
end)

function BuildElements()
    elements = 
    {
        {label = _U('spectate'), value = 'spectate'},
        {label = _U('kick'), value = 'kick'},
        {label = _U('freeze'), value = 'freeze'},
        {label = _U('goto'), value = 'goto'},
        {label = _U('bring'), value = 'bring'},
        {label = _U('open_inventory'), value = 'open_inventory'},
    }
    ESX.TriggerServerCallback("CMS-admin:checkMod", function(isMod)
        if isMod then
            elements = {}
            elements = 
            {
                {label = _U('spectate'), value = 'spectate'},
                {label = _U('screenshot'), value = 'screenshot'},
                {label = _U('kick'), value = 'kick'},
                {label = _U('ban'), value = 'ban'},
                {label = _U('freeze'), value = 'freeze'},
                {label = _U('goto'), value = 'goto'},
                {label = _U('bring'), value = 'bring'},
                {label = _U('open_inventory'), value = 'open_inventory'},
            }
        end
    end)
    ESX.TriggerServerCallback("CMS-admin:checkSAdmin", function(isSAdmin)
        if isSAdmin then
            elements = {}
            elements = 
            {
                {label = _U('spectate'), value = 'spectate'},
                {label = _U('screenshot'), value = 'screenshot'},
                {label = _U('kick'), value = 'kick'},
                {label = _U('ban'), value = 'ban'},
                {label = _U('freeze'), value = 'freeze'},
                {label = _U('goto'), value = 'goto'},
                {label = _U('bring'), value = 'bring'},
                {label = _U('open_inventory'), value = 'open_inventory'},
                {label = _U('slap'), value = 'slap'},
            }
        end
    end)
    return elements
end

function spectatePlayer(targetPed,target,name)
	local playerPed = PlayerPedId() -- yourself
	enable = true
	if (target == PlayerId() or target == -1) then 
		enable = false
		print("Target Player is ourselves, disabling spectate.")
        SetEntityVisible(playerPed, true, 0)
		SetEntityCollision(playerPed, true, true)
		SetEntityInvincible(playerPed, false)
		NetworkSetEntityInvisibleToNetwork(playerPed, false)

	end
	if(enable)then
		SetEntityVisible(playerPed, false, 0)
		SetEntityCollision(playerPed, false, false)
		SetEntityInvincible(playerPed, true)
		NetworkSetEntityInvisibleToNetwork(playerPed, true)
		Citizen.Wait(200) -- to prevent target player seeing you
		if targetPed == playerPed then
			Wait(500)
			targetPed = GetPlayerPed(target)
		end
		local targetx,targety,targetz = table.unpack(GetEntityCoords(targetPed, false))
		RequestCollisionAtCoord(targetx,targety,targetz)
		NetworkSetInSpectatorMode(true, targetPed)
		
		DrawPlayerInfo(target)
		ESX.ShowNotification(_U('started_spec'), false, false, 0)
	else
		if oldCoords then
			RequestCollisionAtCoord(oldCoords.x, oldCoords.y, oldCoords.z)
			Wait(500)
			SetEntityCoords(playerPed, oldCoords.x, oldCoords.y, oldCoords.z, 0, 0, 0, false)
			oldCoords=nil
		end
		NetworkSetInSpectatorMode(false, targetPed)
		StopDrawPlayerInfo()
		ESX.ShowNotification(_U('stopped_spec'), false, false, 0)
        SetEntityCoords(playerPed, 0, 0, 0, false, false, false, true)
		frozen = false
		Citizen.Wait(200) -- to prevent staying invisible
		SetEntityVisible(playerPed, true, 0)
		SetEntityCollision(playerPed, true, true)
		SetEntityInvincible(playerPed, false)
		NetworkSetEntityInvisibleToNetwork(playerPed, false)
	end
end