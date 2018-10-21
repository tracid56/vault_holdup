local rob = false
local robbers = {}
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('vault_holdup:toofar')
AddEventHandler('vault_holdup:toofar', function(robb)
	local _source = source
	local xPlayers = ESX.GetPlayers()
	rob = false
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		
		if (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff') then
			TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_cancelled_at', Stores[robb].nameofstore))
			TriggerClientEvent('vault_holdup:killblip', xPlayers[i])
		end
	end
	if robbers[_source] then
		TriggerClientEvent('vault_holdup:toofarlocal', _source)
		robbers[_source] = nil
		TriggerClientEvent('esx:showNotification', _source, _U('robbery_cancelled_at', Stores[robb].nameofstore))
	end
end)

RegisterServerEvent('vault_holdup:rob')
AddEventHandler('vault_holdup:rob', function(robb)
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(_source)
	local fleecacard = xPlayer.getInventoryItem('fleeca_card')
	local blainecard = xPlayer.getInventoryItem('blaine_card')
	local fleeca2card = xPlayer.getInventoryItem('fleeca2_card')
	local xPlayers = ESX.GetPlayers()

	if Stores[robb] then
		local store = Stores[robb]
		
		if (os.time() - store.lastrobbed) < Config.TimerBeforeNewRob and store.lastrobbed ~= 0 then
			TriggerClientEvent('esx:showNotification', _source, _U('recently_robbed', Config.TimerBeforeNewRob - (os.time() - store.lastrobbed)))
			return
		end

		local cops = 0
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			if (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'spolice') then
				cops = cops + 1
			end
		end
		
		if robb == "pac_standard" then
			if xPlayer.getInventoryItem('blaine_card').count >= 1 and xPlayer.getInventoryItem('fleeca_card').count >= 1 and xPlayer.getInventoryItem('fleeca2_card').count >= 1  then --fleeca2card > 0 and fleecacard > 0 and blainecard > 0 then
				TriggerClientEvent('esx:showNotification', _source, 'You have ~g~all~s~ required ~y~keycards')
				allowed = true
			else
				TriggerClientEvent('esx:showNotification', _source, 'This vault requires ~r~3~s~ ~y~Manager Keycards~s~ to open')
				allowed = false
			end
		else
			allowed = true
		end

		if rob == false then
			if xPlayer.getInventoryItem('drill').count >= 1 then
				if allowed then
					if cops >= Config.PoliceNumberRequired then
						if robb ~= "pac_standard" then
							xPlayer.removeInventoryItem('drill', 1)
						else
							xPlayer.removeInventoryItem('blaine_card', 1)
							xPlayer.removeInventoryItem('fleeca_card', 1)
							xPlayer.removeInventoryItem('fleeca2_card', 1)
						end
						rob = true
						for i=1, #xPlayers, 1 do
							local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
							if (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff' or xPlayer.job.name == 'spolice') then
								TriggerClientEvent('esx:showNotification', xPlayers[i], _U('rob_in_prog', store.nameofstore))
								TriggerClientEvent('vault_holdup:setblip', xPlayers[i], Stores[robb].position)
							end
						end
				
						TriggerClientEvent('esx:showNotification', _source, _U('started_to_rob', store.nameofstore))
						TriggerClientEvent('esx:showNotification', _source, _U('alarm_triggered'))
						TriggerClientEvent('esx_borrmaskin:startDrill', source)
						TriggerClientEvent('vault_holdup:currentlyrobbing', _source, robb)
						TriggerClientEvent('vault_holdup:starttimer', _source)
						
						Stores[robb].lastrobbed = os.time()
						robbers[_source] = robb
						local savedSource = _source
						SetTimeout(store.secondsRemaining * 1000, function()
				
							if robbers[savedSource] then
								rob = false
								if xPlayer then
									local award = store.reward
									TriggerClientEvent('vault_holdup:robberycomplete', savedSource, award)
									xPlayer.addAccountMoney('black_money', award)
									if robb ~= "pac_standard" then
										TriggerClientEvent('esx:showNotification', _source, 'You found a ~y~Managers Keycard')
										xPlayer.addInventoryItem(robb .. '_card', 1)
									end
									local xPlayers = ESX.GetPlayers()
									for i=1, #xPlayers, 1 do
										local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
										if (xPlayer.job.name == 'police' or xPlayer.job.name == 'sheriff') then
											TriggerClientEvent('esx:showNotification', xPlayers[i], _U('robbery_complete_at', store.nameofstore))
											TriggerClientEvent('vault_holdup:killblip', xPlayers[i])
										end
									end
								end
							end
						end)
					else
						TriggerClientEvent('esx:showNotification', _source, _U('min_police', Config.PoliceNumberRequired))
					end
				end
			else
				TriggerClientEvent('esx:showNotification', source, _U('need_drill'))
			end
		else
			TriggerClientEvent('esx:showNotification', _source, _U('robbery_already'))
		end
		
	end
end)
