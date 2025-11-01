local Hooks = {}

function Hooks.init()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Async = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("Async")
    local mt = getrawmetatable(game)

    -- Evita hook duplicado
    if not _G._originalNamecall then
        setreadonly(mt, false)
        _G._originalNamecall = mt.__namecall

        mt.__namecall = newcclosure(function(self, ...)
            local method = getnamecallmethod()
            local args = { ... }

            -- Proteção contra dano de queda
            if _G.AntFallDamage and self == Async and method == "FireServer" then
                if args[1] == "Character" and args[2] == "FallDamageServer" then
                    warn("🚫 Fall damage BLOQUEADO via __namecall")
                    return
                end
            end

            return _G._originalNamecall(self, ...)
        end)

        setreadonly(mt, true)
    end

    -- Ativa por padrão
    _G.AntFallDamage = true
end

return Hooks
