-- Main.lua — Ponto de entrada do script Demon Fall Farm

local repo = "https://raw.githubusercontent.com/GitHubTestaName/OurDemonfallScript/main/"

-- Carrega os módulos externos
getgenv().UIManager       = loadstring(game:HttpGet(repo .. "UIManager.lua"))()
getgenv().Hooks           = loadstring(game:HttpGet(repo .. "Hooks.lua"))()
getgenv().FarmCore        = loadstring(game:HttpGet(repo .. "FarmCore.lua"))()
getgenv().TrinketManager  = loadstring(game:HttpGet(repo .. "TrinketManager.lua"))()
getgenv().MobUtils        = loadstring(game:HttpGet(repo .. "MobUtils.lua"))()

-- Inicia os módulos
getgenv().Hooks.init()
getgenv().UIManager.init()
getgenv().MobUtils.init()
getgenv().FarmCore.init()
getgenv().TrinketManager.init()

-- Status
print("✅ DemonFall Farm Script carregado com sucesso.")
