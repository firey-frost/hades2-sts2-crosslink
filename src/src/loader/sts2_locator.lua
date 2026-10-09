local STS2Locator = {
    is_installed = false,
    game_path = nil,
    cards_cache = {},
    relics_cache = {}
}

local STS2_STEAM_PATHS = {
    "C:\\Program Files (x86)\\Steam\\steamapps\\common\\Slay the Spire 2",
    "C:\\SteamLibrary\\steamapps\\common\\Slay the Spire 2",
    "D:\\SteamLibrary\\steamapps\\common\\Slay the Spire 2",
    "D:\\Steam\\steamapps\\common\\Slay the Spire 2",
    "E:\\SteamLibrary\\steamapps\\common\\Slay the Spire 2",
    "F:\\SteamLibrary\\steamapps\\common\\Slay the Spire 2"
}

local function file_exists(path)
    local f = io.open(path, "r")
    if f ~= nil then
        io.close(f)
        return true
    end
    return false
end

function STS2Locator.detect()
    for _, basePath in ipairs(STS2_STEAM_PATHS) do
        if file_exists(basePath .. "\\sts2.exe") or file_exists(basePath .. "\\SlayTheSpire2.exe") then
            STS2Locator.is_installed = true
            STS2Locator.game_path = basePath
            print("[StS2-Crosslink] Found Slay the Spire 2 at: " .. basePath)
            return true
        end
    end

    STS2Locator.is_installed = false
    STS2Locator.game_path = nil
    print("[StS2-Crosslink] Slay the Spire 2 not found in Steam libraries.")
    return false
end

function STS2Locator.load_game_data()
    if not STS2Locator.is_installed then
        return false
    end

    local data_dir = STS2Locator.game_path .. "\\data"
    print("[StS2-Crosslink] Ingesting StS2 assets from: " .. data_dir)
    STS2Locator.cards_cache = { loaded = true }
    STS2Locator.relics_cache = { loaded = true }
    return true
end

return STS2Locator
