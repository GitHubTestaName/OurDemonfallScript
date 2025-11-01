-- Main.lua — Ponto de entrada do script Demon Fall Farm

-- Carrega os módulos externos do repositório
getgenv().UIManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestaName/OurDemonfallScript/main/UIManager.lua"))()
getgenv().Hooks = loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestaName/OurDemonfallScript/main/Hooks.lua"))()
getgenv().FarmCore = loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestaName/OurDemonfallScript/main/FarmCore.lua"))()
getgenv().TrinketManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestaName/OurDemonfallScript/main/TrinketManager.lua"))()
getgenv().MobUtils = loadstring(game:HttpGet("https://raw.githubusercontent.com/GitHubTestaName/OurDemonfallScript/main/MobUtils.lua"))()

-- Inicia os módulos
UIManager.init()
Hooks.init()
FarmCore.init()
TrinketManager.init()
MobUtils.init()

-- Status
print("✅ DemonFall Farm Script carregado com sucesso.")
