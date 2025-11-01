local UIManager = {}

function UIManager.init()
    -- Carrega a biblioteca Orion
    local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/1F0T/OrionLib/main/source"))()

    -- Cria janela principal
    local window = OrionLib:MakeWindow({
        Name = "💀 Demon Fall — Auto Farm",
        HidePremium = false,
        SaveConfig = true,
        ConfigFolder = "DemonFallFarm"
    })

    -- Aba de Farm
    local farmTab = window:MakeTab({
        Name = "⚔️ Farm",
        Icon = "rbxassetid://6035199749",
        PremiumOnly = false
    })

    farmTab:AddToggle({
        Name = "Ativar Farm",
        Default = false,
        Save = false,
        Flag = "EnableFarm",
        Callback = function(value)
            _G.FarmingEnabled = value
        end
    })

    -- Aba Smart Config
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

    -- Aba Outros (Misc)
    local miscTab = window:MakeTab({
        Name = "📦 Outros",
        Icon = "rbxassetid://6031071050",
        PremiumOnly = false
    })

    miscTab:AddToggle({
        Name = "🚫 Anti Queda (Fall Damage)",
        Default = true,
        Save = false,
        Callback = function(value)
            _G.AntFallDamage = value
        end
    })

    OrionLib:Init()

    print("[✅] UIManager iniciado")
end

return UIManager
