local UIManager = {}

function UIManager.init()
    -- Usa biblioteca de UI (você pode trocar se usar outra)
    local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
    
    local window = OrionLib:MakeWindow({
        Name = "💀 Demon Fall — Auto Farm",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "DemonFallFarm"
    })

    -- Página: Controle de Farm
    local farmTab = window:MakeTab({
        Name = "⚔️ Farm",
        Icon = "rbxassetid://6035199749",
        PremiumOnly = false
    })

    farmTab:AddLabel("Configurações de Farm")
    farmTab:AddToggle({
        Name = "Ativar Farm",
        Default = false,
        Save = false,
        Flag = "EnableFarm",
        Callback = function(value)
            _G.FarmingEnabled = value
        end
    })

    -- Página: Configs Inteligentes
    local smartTab = window:MakeTab({
        Name = "🧠 Smart Config",
        Icon = "rbxassetid://6031075938",
        PremiumOnly = false
    })

    smartTab:AddToggle({
        Name = "Executar somente se 'Down' + 'Ragdoll'",
        Default = true,
        Save = false,
        Callback = function(value)
            _G.ExecuteOnlyIfDownAndRagdoll = value
        end
    })

    -- Página: Outros
    local miscTab = window:MakeTab({
        Name = "📦 Outros",
        Icon = "rbxassetid://6031071050",
        PremiumOnly = false
    })

    miscTab:AddToggle({
        Name = "🚫 Anti Fall Damage",
        Default = true,
        Save = false,
        Callback = function(value)
            _G.AntFallDamage = value
        end
    })

    miscTab:AddLabel("Mais proteções em breve...")

    -- Iniciar UI
    OrionLib:Init()
end

return UIManager
