ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_camp:getItem')
AddEventHandler('esx_camp:getItem', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.addInventoryItem(item, 1)
	TriggerClientEvent('esx:showNotification', source, '~b~You picked up a ' .. item)	
end)

RegisterServerEvent('esx_camp:drinkBeer')
AddEventHandler('esx_camp:drinkBeer', function(item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	TriggerClientEvent('esx_basicneeds:onDrinkBeer', source)
	TriggerClientEvent('esx_status:add', source, 'drunk', 150000)
	TriggerClientEvent('esx:showNotification', source, '~b~You drank Beer.')	
end)

ESX.RegisterUsableItem('campchair', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('campchair', 1)
TriggerClientEvent("esx_camp:spawnChair", source)
end)

ESX.RegisterUsableItem('tent', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('tent', 1)
TriggerClientEvent("esx_camp:spawnTent", source)
end)

ESX.RegisterUsableItem('wood', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('wood', 1)
TriggerClientEvent("esx_camp:spawnWood", source)
end)

ESX.RegisterUsableItem('bed', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('bed', 1)
TriggerClientEvent("esx_camp:spawnBed", source)
end)

ESX.RegisterUsableItem('cooler', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('cooler', 1)
TriggerClientEvent("esx_camp:spawnCooler", source)
end)

ESX.RegisterUsableItem('gazebo', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('gazebo', 1)
TriggerClientEvent("esx_camp:spawnGazebo", source)
end)

ESX.RegisterUsableItem('bbq', function(source)
local xPlayer = ESX.GetPlayerFromId(source)
xPlayer.removeInventoryItem('bbq', 1)
TriggerClientEvent("esx_camp:spawnBbq", source)
end)