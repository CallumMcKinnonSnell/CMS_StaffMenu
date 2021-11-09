
CMS = {}

-- Add your webhook here
local webhook    = "https://discord.com/api/webhooks/843132731088175104/bAUHLzTbe60xp-oYZRtuYFHO9zokvjY4PKUX2OAW6g4VMsSg18Dz2FSyv4YW9NoPR4Tk"

-- Add your admins/mods here
local CMSSAdmins = {
--Super Admins
'fb01bfbc47c96cfcfb36cd6c91042edf4314bac3', -- Alannah
'8124bae1ecc6574fd31d682de5a961608caa74a8', -- Kiera
'e6924ebb34ad9b902e596f35f1722a5bf493fe35', -- JoeMac
'efaa14c0195d962e0b5d74a6bed26a0fb2047f57', -- Conzo
'b26a4bd158013962ddea3f34736c37c4ed92c768', -- Harry 
'ea6ca7a2a682dc418cd7a92073175587b7fafdc3', -- Vxprx
'3ddb89a98e8ce64145f87d2eba041421dd974b51', -- Calllum
'731e9f8a976238b0d46951bfe74b7e5995470beb', -- Avionix
'a95ef5ef429c4959c93d98cbc63de391a0713cb0', -- Phil

--TEST BOTS
'2754ef66f24c26d8e939b3cd8c8d8fd3ffe3eb85', -- Muzza
'c3b565d0ed0bfb26c3d6442133952fd6e2a78b57', -- Eskimo
}

local CMSModerators = {
--Super Admins
'fb01bfbc47c96cfcfb36cd6c91042edf4314bac3', -- Alannah
'8124bae1ecc6574fd31d682de5a961608caa74a8', -- Kiera
'e6924ebb34ad9b902e596f35f1722a5bf493fe35', -- JoeMac
'efaa14c0195d962e0b5d74a6bed26a0fb2047f57', -- Conzo
'b26a4bd158013962ddea3f34736c37c4ed92c768', -- Harry 
'ea6ca7a2a682dc418cd7a92073175587b7fafdc3', -- Vxprx
'3ddb89a98e8ce64145f87d2eba041421dd974b51', -- Calllum
'731e9f8a976238b0d46951bfe74b7e5995470beb', -- Avionix
'a95ef5ef429c4959c93d98cbc63de391a0713cb0', -- Phil
--Admins

'67c910a131e33bc4eef0416d1b02207aa7cb1253', -- Jess
'2754ef66f24c26d8e939b3cd8c8d8fd3ffe3eb85', -- Muzza
--Senior Mods

'7bb2ee6005abd068895820f2b4f886dd6c87f367', -- Spidey
'e37e83af3488d5b8d9baf4afbf17996e9d1ada59', -- _22
'065160db8a372234f6e4e2b63d9d016c859ff878', -- Sanders
'1321af3663a36067d8203cda0ad07dac27e14fac', -- Visker
'df6a26a6b19c1c8771e0eb9ee9503092b1cdb708', -- Earthworm
'2b1bb6a7aacdd10578751515fa32ee4121347c8d', -- Matt

--Moderators

'f27f25c6f17c9521f636effabb1f52fdf51c439d', -- Concage
'eb5cb39ec4fbecf79d4fe9fa10437baca5d298bd', -- Snack
'2a47317c6db77bb533b850dae8d537afefdf3e10', -- Jarhead
'a86547c6cd32a4ace6c51cd153e72f8b4f7f7499', -- Notes
'681eb278ccbbb07bc832fe714b4d75c13b2203f7', -- Robster
'446fea1d832c9b9bf9ee1dd434ba9c46356ec340', -- Cody
'a5359cc22b29d0bd690a7650e8f125398daa9079', -- Clemens
'cc88fbadc4cbebfc5ccdf771b265b95dfa3ec509', -- Jokery
'01034c65aa6f8a7acbd94c83f75f0e9c5c6ef46b', -- Xercia  
'c3b565d0ed0bfb26c3d6442133952fd6e2a78b57', -- Eskimo


}

local CMSStaff = {
--Super Admins
'fb01bfbc47c96cfcfb36cd6c91042edf4314bac3', -- Alannah
'8124bae1ecc6574fd31d682de5a961608caa74a8', -- Kiera
'e6924ebb34ad9b902e596f35f1722a5bf493fe35', -- JoeMac
'efaa14c0195d962e0b5d74a6bed26a0fb2047f57', -- Conzo
'b26a4bd158013962ddea3f34736c37c4ed92c768', -- Harry 
'ea6ca7a2a682dc418cd7a92073175587b7fafdc3', -- Vxprx
'3ddb89a98e8ce64145f87d2eba041421dd974b51', -- Calllum
'731e9f8a976238b0d46951bfe74b7e5995470beb', -- Avionix
'a95ef5ef429c4959c93d98cbc63de391a0713cb0', -- Phil
--Admins

'67c910a131e33bc4eef0416d1b02207aa7cb1253', -- Jess
'2754ef66f24c26d8e939b3cd8c8d8fd3ffe3eb85', -- Muzza
--Senior Mods

'7bb2ee6005abd068895820f2b4f886dd6c87f367', -- Spidey
'e37e83af3488d5b8d9baf4afbf17996e9d1ada59', -- _22
'065160db8a372234f6e4e2b63d9d016c859ff878', -- Sanders
'1321af3663a36067d8203cda0ad07dac27e14fac', -- Visker
'df6a26a6b19c1c8771e0eb9ee9503092b1cdb708', -- Earthworm
'2b1bb6a7aacdd10578751515fa32ee4121347c8d', -- Matt

--Moderators

'f27f25c6f17c9521f636effabb1f52fdf51c439d', -- Concage
'eb5cb39ec4fbecf79d4fe9fa10437baca5d298bd', -- Snack
'2a47317c6db77bb533b850dae8d537afefdf3e10', -- Jarhead
'a86547c6cd32a4ace6c51cd153e72f8b4f7f7499', -- Notes
'681eb278ccbbb07bc832fe714b4d75c13b2203f7', -- Robster
'446fea1d832c9b9bf9ee1dd434ba9c46356ec340', -- Cody
'a5359cc22b29d0bd690a7650e8f125398daa9079', -- Clemens
'cc88fbadc4cbebfc5ccdf771b265b95dfa3ec509', -- Jokery
'01034c65aa6f8a7acbd94c83f75f0e9c5c6ef46b', -- Xercia   

--Trial Moderators
'c3b565d0ed0bfb26c3d6442133952fd6e2a78b57', -- Eskimo
'b8f208d0b473de0bcaf9fc5ca3dfa00f9f8d9827', -- Tollz.
}

ESX = nil 


--------------------------------------------
--
-- Admin Reply / R
--
-- args[1] = Server ID of player to DM
-- args[2]...#args[] = Message
--
---------------------------------------------
RegisterCommand("r", function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
		if xPlayer.getGroup() ~= "user" then
			local tPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
            local message = ""
			if tPlayer then
                for i=2, #args, 1 do
                    message = message .. " "..  args[i]
                end
                --local msg = GetPlayerName(source) .. " Has replied to " .. GetPlayerName(args[1]) .. " with the message: '" .. message .. "'"
                --exports.LCRP_Logging:discord(msg,source,tonumber(args[1]),'Reply','Reply',false)
            TriggerClientEvent('chatMessage', source, "STAFF REPLY: ", {255,0, 0}, args[1] .. ": ".. message)
            TriggerClientEvent('chatMessage', tPlayer.source, "STAFF REPLY: ", {255,0, 0}, message)
			else
				TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "No Player!")
			end
		else
			TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
		end
	end
end)


---------------------------------------------
--
-- Kick
--
-- args[1] = Server ID of player to kick
-- args[2]...#args[] = Kick message
--
---------------------------------------------
RegisterCommand("kick", function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getGroup() ~= "user" then
            local tPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
            local message = ""
            if tPlayer then
                for i=2, #args, 1 do
                    message = message .. " " .. args[i]
                end
                exports.LCRP_Logging:discord("Reason: " .. message, source, tonumber(args[1]), "Kick", "Kick", false)
                TriggerClientEvent("chatMessage", source, "KICK: ", {255,0,0}, args[1] .." | " .. GetPlayerName(args[1]) .. " |: " .. message)
                DropPlayer(tonumber(args[1]), "Reason: ".. message)
            else
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "No Player!")
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
    end
end)

---------------------------------------------
--
-- Admin Chat
--
-- args[1]...#args[] = Admin Chat message
--
---------------------------------------------
RegisterCommand("a", function(source, args, rawCommand)	-- /a command for adminchat
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getGroup() ~= "user" then
			if args[1] then
				local message = string.sub(rawCommand, 3)
				local xAll = ESX.GetPlayers()
                --local msg = GetPlayerName(source) .. ": " .. message
                --exports.LCRP_Logging:discord(msg,source,0,'AdminChat','AdminChat',false)
				for i=1, #xAll, 1 do
					local xTarget = ESX.GetPlayerFromId(xAll[i])
					if xTarget.getGroup() ~= "user" then
						TriggerClientEvent('chatMessage', xTarget.source, _U('adminchat', GetPlayerName(source) .." | ".. xPlayer.source, xPlayer.getGroup(), message))
					end
				end
			else
				TriggerClientEvent('chatMessage', xPlayer.source, _U('invalid_input', 'AdminChat'))
			end
		end
	end
end, false)


---------------------------------------------
--
-- TP
--
-- args[1] = X Coordinate
-- args[2] = Y Coordinate
-- args[3] = Z Coordinate
--
---------------------------------------------
RegisterCommand("tp", function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
            local goX = tonumber(args[1])
            local goY = tonumber(args[2])
            local goZ = tonumber(args[3])
            if goX and goY and goZ then
                xPlayer.setCoords({x = goX, y = goY, z =goZ})
                local message = GetPlayerName(source) .. "Has Teleported to X = " .. goX .. ", Y = ".. goY .. ", Z = " .. goZ
                exports.LCRP_Logging:discord(message, source, 0, "Teleport", "Teleport", false)
            else
                TriggerClientEvent('chatMessage', xPlayer.source, _U('invalid_input', 'AdminChat'))
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
    end
end)

------------------------------
--
-- Show ID
--
------------------------------
RegisterCommand("id", function(source, args, rawCommand)
    if source ~= 0 then
        TriggerClientEvent("esx_admin:ID", source)
    end
end)


----------------------------------------
--
-- Set job
--
-- args[1] = Target Player Server ID
-- args[2] = Job name
-- args[3] = Rank
--
-----------------------------------------
RegisterCommand("setjob", function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
            if ESX.DoesJobExist(args[2], args[3]) then
                local tPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
                if tPlayer then
                    tPlayer.setJob(args[2], tonumber(args[3]))
                    local message = GetPlayerName(source) .. " set " .. GetPlayerName(args[1]) .. "'s job to " .. tostring(args[2]) .. " with the rank of " .. tostring(args[3])
                    exports.LCRP_Logging:discord(message, source, tonumber(args[1]), "SetJob", "SetJob", false)
                else
                    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "No Player!")
                end
            else
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Job is invalid, or grade does not exist.")
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
    end
end)

------------------------------------
--
-- Give car
--
-- args[1] = model
--
------------------------------------
RegisterCommand("car", function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getGroup() ~= "user" then
            local model = tostring(args[1])
            if model then
                local pName = GetPlayerName(source)
                TriggerClientEvent("CMS:giveCar", source, model)
                local message = GetPlayerName(source) .. " tried to spawn the following Vehicle: " ..  model
                exports.LCRP_Logging:discord(message, source, 0, "SpawnCar", "SpawnCar", false)

            else
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Vehicle!")
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
    end
end)

--------------------------------------------------------
--
-- Delete Vehicle
--
-- args[1] = Radius (When not present, defaults to 2)
--
--------------------------------------------------------
RegisterCommand("dv", function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getGroup() ~= "user" then
            local radius = tonumber(args[1])
            if radius then
                TriggerClientEvent("esx:deleteVehicle",source, radius)
            else
                TriggerClientEvent("esx:deleteVehicle",source, 2)
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
    end
end)

-------------------------
--
-- Give Account Money
-- 
-- args[1] = Target Player Server ID
-- args[2] = Target Account
-- args[3] = Amount
--
-------------------------
RegisterCommand("giveaccountmoney", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        local tPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
        if tPlayer then
            if tPlayer.getAccount(tostring(args[2])) then
                local amount = tonumber(args[3])
                if amount then
                    tPlayer.addAccountMoney(tostring(args[2]), amount)
                    local message = GetPlayerName(source) .. " gave " .. GetPlayerName(args[1]) .. " £" .. amount .. " to the following account: " .. tostring(args[2])
                    exports.LCRP_Logging:discord(message, source, args[1], "GiveAccountMoney", "GiveAccountMoney", false)
                else
                    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Amount!")
                end
            else
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Account!")
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Target!")
        end
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
    end
end)

-------------------------
--
-- Give Item
-- 
-- args[1] = Target Player Server ID
-- args[2] = Item
-- args[3] = Quantity
--
-------------------------
RegisterCommand("giveitem", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        local tPlayer = ESX.GetPlayerFromId(args[1])
        if tPlayer then
            local itemName = string.lower(tostring(args[2]))
            if string.sub(itemName, 1, 6) == "weapon" then
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You cannot use this to give weapons!")
            else
                local amount = tonumber(args[3]) 
                if amount then
                    tPlayer.addInventoryItem(tostring(args[2]), amount)
                    local message = GetPlayerName(source) .. "has given " .. GetPlayerName(args[1]) .. " " .. amount .. "x " .. itemName
                    exports.LCRP_Logging:discord(message, source, args[1], "GiveItem", "GiveItem", false)
                else
                    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Amount!")
                end
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Target!")
        end
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
    end
end)

-------------------------
--
-- Give Weapon
-- 
-- args[1] = Target Player Server ID
-- args[2] = Weapon
-- args[3] = Ammunition
--
-------------------------
RegisterCommand("giveweapon", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        local tPlayer = ESX.GetPlayerFromId(args[1])
        if tPlayer then
            local itemName = string.lower(tostring(args[2]))
            if string.sub(itemName, 1, 6) ~= "weapon" then
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You cannot use this to give items!")
            else
                local ammo = tonumber(args[3]) 
                if ammo then
                    local lN, weapon = xPlayer.getWeapon(itemName)
                    if not weapon then
                        tPlayer.addWeapon(itemName, ammo)
                        local message = GetPlayerName(source) .. "has given " .. GetPlayerName(args[1]) .. " " .. itemName .. "with " .. ammo .. "x ammuition."
                        exports.LCRP_Logging:discord(message, source, args[1], "GiveWeapon", "GiveWeapon", false)
                    else
                        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Player already has this weapon.")    
                    end
                else
                    TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Amount!")
                end
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Target!")
        end
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
    end
end)

---------------------------------------------------
--
-- Clear Inventory
--
-- args[1] = Server ID of the player to be cleared
--
---------------------------------------------------
RegisterCommand("clearinventory", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        local tPlayer = ESX.GetPlayerFromId(args[1])
        if tPlayer then
            exports["mf-inventory"]:clearInventory(tPlayer.identifier)
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Target!")
        end
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
    end
end)

---------------------------------------------------
--
-- Clear Loadout
--
-- args[1] = Server ID of the player to be cleared
--
---------------------------------------------------
RegisterCommand("clearloadout", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
        local tPlayer = ESX.GetPlayerFromId(args[1])
        if tPlayer then
            exports["mf-inventory"]:clearLoadout(tPlayer.identifier)
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Target!")
        end
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
    end
end)

----------------------------------------
--
-- Set Group
--
-- args[1] = Server ID of player to set
-- args[2] = Group
--
----------------------------------------
RegisterCommand("setgroup", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "superadmin" then
        local tPlayer = ESX.GetPlayerFromId(args[1])
        if tPlayer then
            tPlayer.setGroup(args[2])
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Target!")
        end
    else
        TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
    end
end)
-------------------
--
-- Clear all (chat)
-- 
------------------- 
RegisterCommand("clearall", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    TriggerClientEvent('chat:clear', -1)
end)

-------------------------------------------
--
-- Kill / Slay
--
-- args[1] = Server ID of player to kill.
--
-------------------------------------------
RegisterCommand("slay", function(source, args, rawCommand)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getGroup() == "admin" or xPlayer.getGroup() == "superadmin" then
            local tPlayer = ESX.GetPlayerFromId(tonumber(args[1]))
            if tPlayer then
                TriggerClientEvent("CMS_admin:killPlayer", tPlayer.source)
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "You Killed " .. GetPlayerName(args[1]))
            else
                TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Invalid Target!")
            end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
    end
end)

-------------------------------------------
--
-- Freeze
--
-- args[1] = Server ID of player to Freeze.
--
-------------------------------------------
RegisterCommand("freeze", function(source, args, rawCommand)	-- /freeze [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
  		if xPlayer.getGroup() ~= "user" then
            print(args[1])
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			TriggerClientEvent("esx_admin:freezePlayer", xTarget.source, 'freeze')
					TriggerClientEvent("chatMessage", xPlayer.source, _U('freeze_admin', args[1]))
					TriggerClientEvent("chatMessage", xTarget.source, _U('freeze_player'))
      			else
        			TriggerClientEvent("chatMessage", xPlayer.source, _U('not_online', 'FREEZE'))
      			end
    		else
		      	TriggerClientEvent("chatMessage", xPlayer.source, _U('invalid_input', 'FREEZE'))
    		end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
	end
end, false)


-------------------------------------------
--
-- Unfreeze
--
-- args[1] = Server ID of player to Unfreeze.
--
-------------------------------------------
RegisterCommand("unfreeze", function(source, args, rawCommand)	-- /unfreeze [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
  		if xPlayer.getGroup ~= "user" then
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			TriggerClientEvent("esx_admin:freezePlayer", xTarget.source, 'unfreeze')
					TriggerClientEvent("chatMessage", xPlayer.source, _U('unfreeze_admin', args[1]))
					TriggerClientEvent("chatMessage", xTarget.source, _U('unfreeze_player'))
      			else
        			TriggerClientEvent("chatMessage", xPlayer.source, _U('not_online', 'UNFREEZE'))
      			end
    		else
      			TriggerClientEvent("chatMessage", xPlayer.source, _U('invalid_input', 'UNFREEZE'))
    		end
        else
            TriggerClientEvent('chatMessage', source, "SYSTEM", {255, 0, 0}, "Insufficient Permissions!")
        end
	end
end, false)


-------------------------------------------
--
-- Report
--
-- args[1]...#args[] = Report Message
--
-------------------------------------------
RegisterCommand("report", function(source, args, rawCommand)	-- /report [MESSAGE]		send report message to all online admins
    local xPlayer = ESX.GetPlayerFromId(source)
  if args[1] then
      local message = string.sub(rawCommand, 8)
      local xAll = ESX.GetPlayers()
      for i=1, #xAll, 1 do
            local xTarget = ESX.GetPlayerFromId(xAll[i])
            if xTarget.getGroup() ~= "user" then		-- you can exclude some ranks to NOT reciveing reports
              if xPlayer.source ~= xTarget.source then
                  TriggerClientEvent('chatMessage', xTarget.source, _U('report', xPlayer.getName(), xPlayer.source, message))
              end
            end
      end
      TriggerClientEvent('chatMessage', xPlayer.source, _U('report', xPlayer.getName(), xPlayer.source, message))
  else
      TriggerClientEvent('chatMessage', xPlayer.source, _U('invalid_input', 'REPORT'))
  end
end, false)


--------------------------------------------------------------------------------------------------------------------------------------------

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("CMS-admin:requestSpectate")
AddEventHandler('CMS-admin:requestSpectate', function(playerId)
    local tgtCoords = GetEntityCoords(GetPlayerPed(playerId))
    TriggerClientEvent("CMS-admin:requestSpectate", source, playerId, tgtCoords)
end)

ESX.RegisterServerCallback('CMS-admin:checkStaff', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    identifier = identifier:sub(7)
    for a, v in pairs(CMSStaff) do
        if v == identifier then
            cb(true)
            return
        end
    end
    cb(false)
end)

ESX.RegisterServerCallback('CMS-admin:checkMod', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    identifier = identifier:sub(7)
    for a, v in pairs(CMSModerators) do
        if v == identifier then
            cb(true)
            return
        end
    end
    cb(false)
end)

ESX.RegisterServerCallback('CMS-admin:checkSAdmin', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.getIdentifier()
    identifier = identifier:sub(7)
    for a, v in pairs(CMSSAdmins) do
        if v == identifier then
            cb(true)
            return
        end
    end
    cb(false)
end)

RegisterServerEvent('CMS-admin:banPlayer')
AddEventHandler('CMS-admin:banPlayer', function(reason, PlayerID)
    local bPlayer = ESX.GetPlayerFromId(PlayerID)
    TriggerEvent("BanSql:ICheat", reason, tonumber(bPlayer.source))
end)



RegisterServerEvent('CMS-admin:CheckStaff')
AddEventHandler('CMS-admin:CheckStaff', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local CMS_identifier = xPlayer.getIdentifier()
    CMS_identifier = CMS_identifier:sub(7)
    for a, v in pairs(CMSStaff) do 
        if v == CMS_identifier then 
            TriggerClientEvent('CMS-admin:CheckStaff', source, true)
            return true 
        end
    end 
    return false 
end)

RegisterServerEvent('CMS-admin:CheckMod')
AddEventHandler('CMS-admin:CheckMod', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local CMS_identifier = xPlayer.getIdentifier()
    CMS_identifier = CMS_identifier:sub(7)
    for a, v in pairs(CMSModerators) do 
        if v == CMS_identifier then 
            TriggerClientEvent('CMS-admin:CheckMod', source, true)
            return true 
        end
    end 
    return false 
end)

RegisterServerEvent('CMS-admin:CheckSAdmin')
AddEventHandler('CMS-admin:CheckSAdmin', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local CMS_identifier = xPlayer.getIdentifier()
    CMS_identifier = CMS_identifier:sub(7)
    for a, v in pairs(CMSSAdmins) do 
        if v == CMS_identifier then 
            TriggerClientEvent('CMS-admin:CheckSAdmin', source, true)
            return true 
        end
    end 
    return false 
end)

ESX.RegisterServerCallback('CMS-admin:playersOnline', function(source, cb)
    local players  = {}
    for k, v  in ipairs(GetPlayers()) do
        local xPlayer = ESX.GetPlayerFromId(v)
        if xPlayer then
            table.insert(players, {
                source      = xPlayer.source,
                identifier  = xPlayer.getIdentifier(),
                name        = GetPlayerName(v),
                job         = xPlayer.getJob(),
                group       = xPlayer.getGroup()
            })
        end
    end
    --TriggerClientEvent('table', source, players)
    cb(players)
end)

---------- Bring / Bringback ----------
RegisterCommand("bring", function(source, args, rawCommand)	-- /bring [ID]
	if source ~= 0 then
	  	local xPlayer = ESX.GetPlayerFromId(source)
	  	if xPlayer.getGroup() ~= "user" then
	    	if args[1] and tonumber(args[1]) then
	      		local targetId = tonumber(args[1])
	      		local xTarget = ESX.GetPlayerFromId(targetId)
	      		if xTarget then
	        		local targetCoords = xTarget.getCoords()
	        		local playerCoords = xPlayer.getCoords()
	        		xTarget.setCoords(playerCoords)
                    --local msg = GetPlayerName(source) .. " has brought " ..GetPlayerName(targetId) .. " to their location. Coordinates are - \n(x = " .. playerCoords.x .. ", y = " .. playerCoords.y .. ", z = " .. playerCoords.z .. ")."
                    --exports.LCRP_Logging:discord(msg, source, targetId, 'Bring', 'Bring', false)
	        		TriggerClientEvent("chatMessage", xPlayer.source, _U('bring_adminside', args[1]))
	        		TriggerClientEvent("chatMessage", xTarget.source, _U('bring_playerside'))
	      		else
	        		TriggerClientEvent("chatMessage", xPlayer.source, _U('not_online', 'BRING'))
	      		end
	    	else
	      		TriggerClientEvent("chatMessage", xPlayer.source, _U('invalid_input', 'BRING'))
	    	end
	  	end
	end
end, false)

---------- goto/goback ----------
RegisterCommand("goto", function(source, args, rawCommand)	-- /goto [ID]
	if source ~= 0 then
  		local xPlayer = ESX.GetPlayerFromId(source)
  		if xPlayer.getGroup() ~= "user" then
    		if args[1] and tonumber(args[1]) then
      			local targetId = tonumber(args[1])
      			local xTarget = ESX.GetPlayerFromId(targetId)
      			if xTarget then
        			local targetCoords = xTarget.getCoords()
        			local playerCoords = xPlayer.getCoords()
        			xPlayer.setCoords(targetCoords)
                    --local msg = GetPlayerName(source) .. " has teleported to " .. GetPlayerName(targetId) .. " at Coordinates - \n(x = " .. targetCoords.x .. ", y = " .. targetCoords.y .. ", z = " .. targetCoords.z .. ")."
                    --exports.LCRP_Logging:discord(msg, source, targetId, 'Goto', 'Goto', false)
        			TriggerClientEvent("chatMessage", xPlayer.source, _U('goto_admin', args[1]))
					TriggerClientEvent("chatMessage", xTarget.source,  _U('goto_player'))
      			else
        			TriggerClientEvent("chatMessage", xPlayer.source, _U('not_online', 'GOTO'))
      			end
    		else
      			TriggerClientEvent("chatMessage", xPlayer.source, _U('invalid_input', 'GOTO'))
    		end
  		end
	end
end, false)


-- SERVER OPTIONS START

RegisterServerEvent('CMS-admin:clearchat')
AddEventHandler('CMS-admin:clearchat', function()
    local xPlayers    = ESX.GetPlayers()
    for i=1, #xPlayers, 1 do
        local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
        TriggerClientEvent('chat:clear', xPlayers[i], -1)
    end
end, false)


RegisterServerEvent('CMS-admin:revivePlayer')
AddEventHandler('CMS-admin:revivePlayer', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
		local yPlayer = ESX.GetPlayerFromId(target)
		TriggerClientEvent('lcrp_revive_ambulance_82382', target)
        TriggerClientEvent('MF_SkeletalSystem:HealBones')
		print(('ADMIN REVIVE: %s attempted to revive!'):format(xPlayer.identifier))
end)

RegisterServerEvent('CMS-admin:teleportcloseenough')
AddEventHandler('CMS-admin:teleportcloseenough', function(staffID, PlayerId, name)
    if source ~= 0 then
        local xPlayer = ESX.GetPlayerFromId(source)
        if PlayerId and tonumber(PlayerId) then
            local targetID = tonumber(PlayerId)
            local xTarget = ESX.GetPlayerFromId(targetID)
            if xTarget then
                TriggerClientEvent("CMS-admin:goToPlayer", staffID, GetEntityCoords(GetPlayerPed(PlayerId)))
            else
                --Come up with something
            end
        end
    end
end)

RegisterServerEvent('CMS-admin:goToPlayer')
AddEventHandler('CMS-admin:goToPlayer', function(staffID, Playerid, name)
    if source ~= 0 then
    local xPlayer = ESX.GetPlayerFromId(source)
        if Playerid and tonumber(Playerid) then
            local targetId = tonumber(Playerid)
            local xTarget = ESX.GetPlayerFromId(targetId)
            if xTarget then
                --staffID is the staff member GOING
                --Playerid is the player going TO
                TriggerClientEvent("CMS-admin:goToPlayer", staffID, GetEntityCoords(GetPlayerPed(Playerid)))
                if Config.Tnotify then
                    TriggerClientEvent('t-notify:client:Custom', xPlayer.source, {
                        style = 'info', 
                        duration = 2500,
                        message = _U('goto_admin', name)
                    })
                    TriggerClientEvent('t-notify:client:Custom', xTarget.source, {
                        style = 'info', 
                        duration = 2500,
                        message = _U('goto_player')
                    })
                elseif Config.ESX then
                    xPlayer.showHelpNotification(_U('goto_admin', name), false, false, 5000)
                    xTarget.showHelpNotification(_U('goto_player', name), false, false, 5000)
                end
            end
        end
    end
end)


RegisterServerEvent('CMS-admin:bringPlayer')
AddEventHandler('CMS-admin:bringPlayer', function(staffID, Playerid, name)
    if source ~= 0 then
    local xPlayer = ESX.GetPlayerFromId(staffID)
        if Playerid and tonumber(Playerid) then
            local targetId = tonumber(Playerid)
            local xTarget = ESX.GetPlayerFromId(targetId)
            if xTarget then 
                TriggerClientEvent("CMS-admin:goToPlayer", staffID, GetEntityCoords(GetPlayerPed(Playerid)))
                if Config.Tnotify then
                    TriggerClientEvent('t-notify:client:Custom', xPlayer.source, {
                        style = 'info', 
                        duration = 2500,
                        message = _U('bring_admin', name)
                    })
                    TriggerClientEvent('t-notify:client:Custom', xTarget.source, {
                        style = 'info', 
                        duration = 2500,
                        message = _U('bring_player')
                    })
                elseif Config.ESX then
                    xTarget.showHelpNotification(_U('bring_admin', name), false, false, 5000)
                    xPlayer.showHelpNotification(_U('bring_player', name), false, false, 5000)
                    TriggerClientEvent("CMS-admin:goToPlayer", staffID, GetEntityCoords(GetPlayerPed(Playerid)))
                end
            end
        end
    end
end)

RegisterServerEvent('CMS-admin:delallveh')
AddEventHandler('CMS-admin:delallveh', function(source)
        local msg = ''
        msg = 'Vehicle Wipe in 60s, this is automatic and cannot be stopped.'
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> ^1[LCRP]: <br> {1}</div>', --Adjust the rsgba for colour and opacity :)
            args = {  fal, msg }
        })
        Wait(30000)
        msg = 'Vehicle Wipe in 30s, this is automatic and cannot be stopped.'
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> ^1[LCRP]: <br> {1}</div>', --Adjust the rsgba for colour and opacity :)
            args = { fal, msg }
        })
        Wait(15000)
        msg = 'Vehicle Wipe in 15s, this is automatic and cannot be stopped.'
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> ^1[LCRP]: <br> {1}</div>', --Adjust the rsgba for colour and opacity :)
            args = { fal, msg }
        })
        Wait(10000)
        msg = 'Vehicle Wipe in 5s, this is automatic and cannot be stopped.'
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> ^1[LCRP]: <br> {1}</div>', --Adjust the rsgba for colour and opacity :)
            args = { fal, msg }
        })
        Wait(5000)
        TriggerClientEvent("wld:delallveh", -1)
        msg = 'Vehicle Wipe Complete.'
        TriggerClientEvent('chat:addMessage', -1, {
            template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(0, 0, 0, 0.6); border-radius: 3px;"><i class="fab fa-twitter"></i> ^1[LCRP]: <br> {1}</div>', --Adjust the rsgba for colour and opacity :)
            args = { fal, msg }
        })
    end)
-- PLAYER OPTIONS END

-- COMMANDS START


RegisterCommand('admin', function(source, args, rawCommand)
	if source ~= 0 then
		local xPlayer = ESX.GetPlayerFromId(source)
        if Config.Tnotify then
            TriggerClientEvent('t-notify:client:Custom', source, {
                style  =  'info',
                duration = 5000,
                message  =  _U('your_rank', xPlayer.getGroup())
            })
        elseif Config.ESX then
            xPlayer.showHelpNotification( _U('your_rank', xPlayer.getGroup()), false, false, 10000)
        end
        sendDisc(webhook, _U('rank_hook') .. source, Config.Admin, _U('rank2_hook', xPlayer.getGroup()), 16769280)
    elseif source ~=-1 then
        print(_U('console_id') .. source)
	end
end, false)

--[[RegisterCommand("report", function(source, args, rawCommand)
    local xPlayer = ESX.GetPlayerFromId(source)
    if args[1] then
        local msg = string.sub(rawCommand, 8)
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
                local xTarget = ESX.GetPlayerFromId(xPlayers[i])
                if PE.isAdmin then
                    if xPlayer.source ~= xTarget.source then
                        TriggerClientEvent('chatMessage', xTarget.source, _U('your_report', xPlayer.source, msg))
                    end
                end
        end
        TriggerClientEvent('chatMessage', xPlayer.source, _U('your_report', xPlayer.source, msg))
    else
        if Config.Tnotify then
            TriggerClientEvent('t-notify:client:Custom', xPlayer.source, {
                style  =  'info',
                duration = 5000,
                message  =  _U('your_rank')
            })
        elseif Config.ESX then
            xPlayer.showHelpNotification(_U('no_report'), false, false, 5000)
        end
    end
end, false)
]]
AddEventHandler('playerConnecting', function()
    local name = GetPlayerName(source)
    local hex = GetPlayerIdentifier(source)
    sendDisc(webhook, name .. _U('join_hook'), Config.Hex, _U('join2_hook') .. hex, 16769280)
end)

AddEventHandler('playerDropped', function()
    local name = GetPlayerName(source)
    local endp = GetPlayerEndpoint(source)
    sendDisc(webhook, name .. _U('leave_hook'), Config.EndP, _U('leave2_hook') .. endp, 16769280)
end)

function sendDisc(webhook, name, image, message, color)
    local avatar     = Config.Avatar
    local embeds = {
        {
            ["title"]           = "CMS - Admin Menu",
            ["image"] ={
                ["url"]         =  image,
            },
            ["color"]           = color,
            ["description"]     = message, name,
            ["footer"]          = {
            ["text"]            = "Lost County RP",
            ["icon_url"]        = Config.Icon,
           },
        }
    }
    
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
end


