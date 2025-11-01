-- Main.lua
local repoBase = "https://raw.githubusercontent.com/GitHubTestaName/OurDemonfallScript/main/"

-- Carrega módulos principais
local UIManager = loadstring(game:HttpGet(repoBase .. "UIManager.lua"))()
local Hooks = loadstring(game:HttpGet(repoBase .. "Hooks.lua"))()
local FarmCore = loadstring(game:HttpGet(repoBase .. "FarmCore.lua"))()
local MobUtils = loadstring(game:HttpGet(repoBase .. "MobUtils.lua"))()
local TrinketManager = loadstring(game:HttpGet(repoBase .. "TrinketManager.lua"))()

-- Inicializa sistemas
Hooks.init()
UIManager.init()
MobUtils.init()
FarmCore.init()
TrinketManager.init()

print("[✅] OurDemonfallScript carregado com sucesso!")
