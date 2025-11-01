local FarmCore = {}

-- Cooldown entre ataques
local AttackCooldown = 0.5
local lastAttack = 0

-- Simulações de ações (substitua pelas reais se necessário)
local function doM1() keypress(0x46) keyrelease(0x46) end
local function doM2() keypress(0x47) keyrelease(0x47) end
local function doExecute() keypress(0x45) keyrelease(0x45) end

-- Estados do mob (substitua com sua lógica real se necessário)
local function isDown(mob) return mob:FindFirstChild("Down") end
local function isRagdoll(mob) return mob:FindFirstChild("Ragdoll") end
local function isBusy(mob) return mob:FindFirstChild("Busy") end
local function isExecuting(mob) return mob:FindFirstChild("Executing") end
local function isFullyDead(mob) return mob:FindFirstChild("Executed") end
local function isBlocking(mob) return mob:FindFirstChild("Blocking") end
local function isPlayerBusy() return false end -- adaptar com base em seu personagem

function FarmCore.init()
    task.spawn(function()
        while task.wait(0.1) do
            if not _G.FarmingEnabled then continue end

            local mob = _G.CurrentTarget
            if not mob or not mob:IsDescendantOf(workspace) then continue end
            if isPlayerBusy() then continue end

            if isFullyDead(mob) then continue end
            if isExecuting(mob) then continue end

            if isDown(mob) and isRagdoll(mob) then
                if _G.ExecuteOnlyIfDownAndRagdoll then
                    doExecute()
                    lastAttack = tick()
                    task.wait(1) -- Delay para loot
                    continue
                end
            end

            if isBlocking(mob) then
                doM2()
                lastAttack = tick()
                continue
            end

            if tick() - lastAttack < AttackCooldown then continue end
            if isBusy(mob) then continue end

            doM1()
            lastAttack = tick()
        end
    end)

    print("[✅] FarmCore iniciado")
end

return FarmCore
