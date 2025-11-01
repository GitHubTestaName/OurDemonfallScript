local MobUtils = {}

-- Configuração
local MOB_FOLDER = workspace:WaitForChild("NPCs") or workspace:FindFirstChildOfClass("Folder")

-- Retorna distância entre player e mob
local function getDistance(a, b)
	if not a or not b then return math.huge end
	return (a.Position - b.Position).Magnitude
end

-- Verifica se o mob está morto
local function isFullyDead(mob)
	return mob:FindFirstChild("Executed") ~= nil
end

-- Retorna lista de todos os mobs válidos
local function getAllMobs()
	local mobs = {}
	for _, npc in ipairs(MOB_FOLDER:GetChildren()) do
		if npc:IsA("Model") and not isFullyDead(npc) then
			table.insert(mobs, npc)
		end
	end
	return mobs
end

-- Retorna o mob mais próximo do player
function MobUtils.getClosestMob()
	local closest = nil
	local shortestDist = math.huge
	local player = game.Players.LocalPlayer
	local root = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

	if not root then return nil end

	for _, mob in ipairs(getAllMobs()) do
		local hrp = mob:FindFirstChild("HumanoidRootPart")
		if hrp then
			local dist = getDistance(root, hrp)
			if dist < shortestDist then
				shortestDist = dist
				closest = mob
			end
		end
	end

	return closest
end

-- Atualiza a cada 0.2s o alvo atual
function MobUtils.init()
	task.spawn(function()
		while task.wait(0.2) do
			if _G.FarmingEnabled then
				local target = MobUtils.getClosestMob()
				if target then
					_G.CurrentTarget = target
				end
			end
		end
	end)
end

return MobUtils
