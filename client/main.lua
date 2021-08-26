ESX        = nil
Config              = {}
Config.Sitable = {prop_skid_chair_01 = { scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.05},}
Config.MaxDistance = 1.0
Config.Interactables = {'prop_skid_chair_01'}

local item = 0

closestChair = {
	"prop_skid_chair_01"
}

closestTent = {
	"prop_skid_tent_01"
}

closestWood = {
	"prop_beach_fire"
}

closestBed = {
	"prop_skid_sleepbag_1"
}

closestCooler = {
	"prop_coolbox_01"
}

closestGazebo = {
	"prop_gazebo_02"
}

closestBbq = {
	"prop_bbq_5"
}

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(5)

		TriggerEvent("esx:getSharedObject", function(library)
			ESX = library
		end)
    end

    if ESX.IsPlayerLoaded() then
		ESX.PlayerData = ESX.GetPlayerData()
	end
end)

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(response)
	ESX.PlayerData = response
end)


--chair
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestChair do
            local x = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(closestChair[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                chair   = GetEntityCoords(entity)
                drawText3D(chair.x, chair.y, chair.z + 0.4, '⚙️')				
                while IsControlPressed(0, 38) do
				drawText3D(chair.x, chair.y, chair.z + 0.4, '[~g~F~s~] to pickup~s~')
				break
				end
				if IsControlPressed(0, 23) then
				TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
				Citizen.Wait(3000)
				local item = 'campchair'
				TriggerServerEvent('esx_camp:getItem', item)
				DeleteObject(entity)
				ClearPedTasks(PlayerPedId())
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('esx_camp:spawnChair')
AddEventHandler('esx_camp:spawnChair', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	Citizen.Wait(3000)
	ClearPedTasks(PlayerPedId())
    AddChair()
end)

function AddChair()
	local ped= GetPlayerPed(-1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.2, 0.0)
    local heading = GetEntityHeading(ped)
	local pedcoords = GetEntityCoords(ped)

		local chairinfo = {
            x= coords.x,
            y= coords.y,
            z= coords.z,
            h= heading,
            propid=0,
            }

            local ModelHash = GetHashKey('prop_skid_chair_01')
            local Prop = CreateObject(ModelHash, 0, 0, 0, true, true, true)
            chairinfo.propid = Prop
                SetEntityCoords(Prop, chairinfo.x, chairinfo.y, chairinfo.z-0.60, 0, 0, 0, false)
                SetEntityHeading(Prop, chairinfo.h)
				--PlaceObjectOnGroundProperly(Prop)
				Citizen.Wait(100)
                FreezeEntityPosition(chairinfo.propid, true)
    check = true
end

--tent
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestTent do
            local x = GetClosestObjectOfType(playerCoords, 1.0, GetHashKey(closestTent[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                tent   = GetEntityCoords(entity)
				drawText3D(tent.x, tent.y, tent.z + 0.4, '⚙️')				
                while IsControlPressed(0, 38) do
                drawText3D(tent.x, tent.y, tent.z + 0.4, '[~g~H~s~] to pickup ~b~Tent~s~')
				break
				end
                if IsControlJustReleased(0, 74) and DoesEntityExist(entity) then
				TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
				Citizen.Wait(3000)
				local item = 'tent'
				TriggerServerEvent('esx_camp:getItem', item)
				DeleteObject(entity)
				ClearPedTasks(PlayerPedId())
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('esx_camp:spawnTent')
AddEventHandler('esx_camp:spawnTent', function()
	TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
	Citizen.Wait(3000)
	ClearPedTasks(PlayerPedId())
    AddTent()
end)

function AddTent()
	local ped= GetPlayerPed(-1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.2, 0.0)
    local heading = GetEntityHeading(ped)
	local pedcoords = GetEntityCoords(ped)

		local tentinfo = {
            x= coords.x,
            y= coords.y,
            z= coords.z,
            h= heading,
            propid=0,
            }

            local ModelHash = GetHashKey('prop_skid_tent_01')
            local Prop = CreateObject(ModelHash, 0, 0, 0, true, true, true)
            tentinfo.propid = Prop
                SetEntityCoords(Prop, tentinfo.x, tentinfo.y, tentinfo.z-0.35, 0, 0, 0, false)
                SetEntityHeading(Prop, tentinfo.h)
				--PlaceObjectOnGroundProperly(Prop)
				Citizen.Wait(100)
                FreezeEntityPosition(tentinfo.propid, true)
    check = true
end

--wood
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestWood do
            local x = GetClosestObjectOfType(playerCoords, 1.5, GetHashKey(closestWood[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                wood   = GetEntityCoords(entity)
				drawText3D(wood.x, wood.y, wood.z + 0.4, '⚙️')				
                while IsControlPressed(0, 38) do
                drawText3D(wood.x, wood.y, wood.z + 0.4, '[~g~H~s~] to pickup ~b~Wood~s~')
				break
				end
                if IsControlJustReleased(0, 74) and DoesEntityExist(entity) then
				ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
				TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
				Citizen.Wait(2500)
				end)
				local item = 'wood'
				TriggerServerEvent('esx_camp:getItem', item)
				DeleteObject(entity)
				ClearPedTasks(PlayerPedId())
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('esx_camp:spawnWood')
AddEventHandler('esx_camp:spawnWood', function()
	ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
	TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2500)
	ClearPedTasks(PlayerPedId())
    AddWood()
	end)
end)

function AddWood()
	local ped= GetPlayerPed(-1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.2, 0.0)
    local heading = GetEntityHeading(ped)
	local pedcoords = GetEntityCoords(ped)

		local woodinfo = {
            x= coords.x,
            y= coords.y,
            z= coords.z,
            h= heading,
            propid=0,
            }

            local ModelHash = GetHashKey('prop_beach_fire')
            local Prop = CreateObject(ModelHash, 0, 0, 0, true, true, true)
            woodinfo.propid = Prop
                SetEntityCoords(Prop, woodinfo.x, woodinfo.y+0.5, woodinfo.z-0.80, 0, 0, 0, false)
                SetEntityHeading(Prop, woodinfo.h)
				--PlaceObjectOnGroundProperly(Prop)
				Citizen.Wait(100)
                FreezeEntityPosition(woodinfo.propid, true)
    check = true
end

--bed
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestBed do
            local x = GetClosestObjectOfType(playerCoords, 1.5, GetHashKey(closestBed[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                bed   = GetEntityCoords(entity)
				drawText3D(bed.x, bed.y, bed.z + 0.4, '⚙️')				
                while IsControlPressed(0, 38) do
                drawText3D(bed.x, bed.y, bed.z + 0.4, '[~g~H~s~] to pickup ~b~Bed~s~')
				break
				end				
                if IsControlJustReleased(0, 74) and DoesEntityExist(entity) then
				ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
				TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
				Citizen.Wait(2500)
				end)
				local item = 'bed'
				TriggerServerEvent('esx_camp:getItem', item)
				DeleteObject(entity)
				ClearPedTasks(PlayerPedId())
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('esx_camp:spawnBed')
AddEventHandler('esx_camp:spawnBed', function()
	ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
	TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2500)
	ClearPedTasks(PlayerPedId())
    AddBed()
	end)
end)

function AddBed()
	local ped= GetPlayerPed(-1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.2, 0.0)
    local heading = GetEntityHeading(ped)
	local pedcoords = GetEntityCoords(ped)

		local bedinfo = {
            x= coords.x,
            y= coords.y,
            z= coords.z,
            h= heading,
            propid=0,
            }

            local ModelHash = GetHashKey('prop_skid_sleepbag_1')
            local Prop = CreateObject(ModelHash, 0, 0, 0, true, true, true)
            bedinfo.propid = Prop
                SetEntityCoords(Prop, bedinfo.x, bedinfo.y+0.5, bedinfo.z-0.80, 0, 0, 0, false)
                SetEntityHeading(Prop, bedinfo.h)
				PlaceObjectOnGroundProperly(Prop)
				Citizen.Wait(100)
                FreezeEntityPosition(bedinfo.propid, true)
    check = true
end

--cooler
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestCooler do
            local x = GetClosestObjectOfType(playerCoords, 1.5, GetHashKey(closestCooler[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                cooler   = GetEntityCoords(entity)
				drawText3D(cooler.x, cooler.y, cooler.z + 0.4, '⚙️')				
                while IsControlPressed(0, 38) do
                drawText3D(cooler.x, cooler.y, cooler.z + 0.4, '[~g~H~s~] to pickup ~b~Cooler~s~ [~g~F~s~] to drink ~b~Beer~s~')
				break
				end				
                if IsControlJustReleased(0, 74) and DoesEntityExist(entity) then
				ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
				TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
				Citizen.Wait(2500)
				end)
				local item = 'cooler'
				TriggerServerEvent('esx_camp:getItem', item)
				DeleteObject(entity)
				ClearPedTasks(PlayerPedId())
                elseif IsControlJustReleased(0, 23) and DoesEntityExist(entity) then
				TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
				Citizen.Wait(3000)
				ClearPedTasks(PlayerPedId())
				Citizen.Wait(3000)
				TriggerServerEvent('esx_camp:drinkBeer')
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('esx_camp:spawnCooler')
AddEventHandler('esx_camp:spawnCooler', function()
	ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
	TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2500)
	ClearPedTasks(PlayerPedId())
    AddCooler()
	end)
end)

function AddCooler()
	local ped= GetPlayerPed(-1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.2, 0.0)
    local heading = GetEntityHeading(ped)
	local pedcoords = GetEntityCoords(ped)

		local coolerinfo = {
            x= coords.x,
            y= coords.y,
            z= coords.z,
            h= heading,
            propid=0,
            }

            local ModelHash = GetHashKey('prop_coolbox_01')
            local Prop = CreateObject(ModelHash, 0, 0, 0, true, true, true)
            coolerinfo.propid = Prop
                SetEntityCoords(Prop, coolerinfo.x, coolerinfo.y+0.5, coolerinfo.z-0.60, 0, 0, 0, false)
                SetEntityHeading(Prop, coolerinfo.h)
				PlaceObjectOnGroundProperly(Prop)
				Citizen.Wait(100)
                FreezeEntityPosition(coolerinfo.propid, true)
    check = true
end

--gazebo
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestGazebo do
            local x = GetClosestObjectOfType(playerCoords, 1.5, GetHashKey(closestGazebo[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                gazebo   = GetEntityCoords(entity)
				drawText3D(gazebo.x, gazebo.y, gazebo.z + 0.5, '⚙️')				
                while IsControlPressed(0, 38) do
                drawText3D(gazebo.x, gazebo.y, gazebo.z + 0.4, '[~g~H~s~] to pickup ~b~Gazebo~s~')
				break
				end				
                if IsControlJustReleased(0, 74) and DoesEntityExist(entity) then
				ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
				TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
				Citizen.Wait(2500)
				end)
				local item = 'gazebo'
				TriggerServerEvent('esx_camp:getItem', item)
				DeleteObject(entity)
				ClearPedTasks(PlayerPedId())
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('esx_camp:spawnGazebo')
AddEventHandler('esx_camp:spawnGazebo', function()
	ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
	TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2500)
	ClearPedTasks(PlayerPedId())
    AddGazebo()
	end)
end)

function AddGazebo()
	local ped= GetPlayerPed(-1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.2, 0.0)
    local heading = GetEntityHeading(ped)
	local pedcoords = GetEntityCoords(ped)

		local gazeboinfo = {
            x= coords.x,
            y= coords.y,
            z= coords.z,
            h= heading,
            propid=0,
            }

            local ModelHash = GetHashKey('prop_gazebo_02')
            local Prop = CreateObject(ModelHash, 0, 0, 0, true, true, true)
            gazeboinfo.propid = Prop
                SetEntityCoords(Prop, gazeboinfo.x, gazeboinfo.y, gazeboinfo.z, 0, 0, 0, false)
                SetEntityHeading(Prop, gazeboinfo.h)
				PlaceObjectOnGroundProperly(Prop)
				Citizen.Wait(100)
                FreezeEntityPosition(gazeboinfo.propid, true)
    check = true
end

--bbq
Citizen.CreateThread(function()
    Citizen.Wait(100)
    while true do
        
        local sleep = 1000
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        
        for i = 1, #closestBbq do
            local x = GetClosestObjectOfType(playerCoords, 1.5, GetHashKey(closestBbq[i]), false, false, false)
            local entity = nil
            if DoesEntityExist(x) then
                sleep  = 5
                entity = x
                bbq   = GetEntityCoords(entity)
				drawText3D(bbq.x, bbq.y, bbq.z + 0.5, '⚙️')				
                while IsControlPressed(0, 38) do
                drawText3D(bbq.x, bbq.y, bbq.z + 0.4, '[~g~H~s~] to pickup ~b~BBQ~s~')
				break
				end				
                if IsControlJustReleased(0, 74) and DoesEntityExist(entity) then
				ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
				TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
				Citizen.Wait(2500)
				end)
				local item = 'bbq'
				TriggerServerEvent('esx_camp:getItem', item)
				DeleteObject(entity)
				ClearPedTasks(PlayerPedId())
                end
                break
            else
                sleep = 1000
            end
        end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('esx_camp:spawnBbq')
AddEventHandler('esx_camp:spawnBbq', function()
	ESX.Streaming.RequestAnimDict("anim@amb@clubhouse@tutorial@bkr_tut_ig3@", function()
	TaskPlayAnim(PlayerPedId(), "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", "machinic_loop_mechandplayer", 8.0, -8.0, -1, 0, 0, false, false, false)
	Citizen.Wait(2500)
	ClearPedTasks(PlayerPedId())
    AddBbq()
	end)
end)

function AddBbq()
	local ped= GetPlayerPed(-1)
    local coords = GetOffsetFromEntityInWorldCoords(ped, 0.0, 1.2, 0.0)
    local heading = GetEntityHeading(ped)
	local pedcoords = GetEntityCoords(ped)

		local bbqinfo = {
            x= coords.x,
            y= coords.y,
            z= coords.z,
            h= heading,
            propid=0,
            }

            local ModelHash = GetHashKey('prop_bbq_5')
            local Prop = CreateObject(ModelHash, 0, 0, 0, true, true, true)
            bbqinfo.propid = Prop
                SetEntityCoords(Prop, bbqinfo.x, bbqinfo.y, bbqinfo.z, 0, 0, 0, false)
                SetEntityHeading(Prop, bbqinfo.h)
				PlaceObjectOnGroundProperly(Prop)
				Citizen.Wait(100)
                FreezeEntityPosition(bbqinfo.propid, true)
    check = true
end