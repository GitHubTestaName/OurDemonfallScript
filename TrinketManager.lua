local TrinketManager = {}

-- Configuração
local TRINKET_FOLDER = workspace:FindFirstChild("Debris") or workspace
local TRINKET_NAMES = {
    "Trinket", "Money", "Ore", "RareItem"
}

-- Retorna true se o objeto for um trinket
local function isTrinket(obj)
    for _, name in ipairs(TRINKET_NAMES) do
        if obj.Name:lower():find(name:lower()) then
            return true
        end
    end
    return false
end

-- Retorna o trinket mais próximo
local function getClosestTrinket()
    local closest = nil
    local shortest = math.huge
    local player = game.Players.LocalPlayer
    local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not root then return nil end

    for _, item in ipairs(TRINKET_FOLDER:GetDescendants()) do
        if item:IsA("BasePart") and isTrinket(item) then
            local dist = (item.Position - root.Position).Magnitude
            if dist < shortest then
                shortest = dist
                closest = item
            end
        end
    end

    return closest
end

-- Move o player até o trinket
local function moveToTrinket(trinket)
    if not trinket then return end
    local root = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
    if not root then return end
    root.CFrame = trinket.CFrame + Vector3.new(0, 2, 0)
end

function TrinketManager.init()
    task.spawn(function()
        while task.wait(1) do
            if _G.FarmingEnabled then continue end
            if not _G.TrinketFarm then continue end

            local trinket = getClosestTrinket()
            if trinket then
                moveToTrinket(trinket)
                wait(0.5)
            end
        end
    end)
end

return TrinketManager
