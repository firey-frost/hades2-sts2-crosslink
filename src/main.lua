-- Hades II x Slay the Spire 2 Crosslink
-- Author: firey-frost
local STS2Locator = require("src.loader.sts2_locator")
local UINotices = require("src.runtime.ui_notices")
local CombatHooks = require("src.runtime.combat_hooks")

local CrosslinkMod = {
    Version = "1.0.1"
}

function CrosslinkMod.Init()
    print("[StS2-Crosslink] Initializing Hades II x StS2 Crosslink v" .. CrosslinkMod.Version)

    local found = STS2Locator.detect()
    if found then
        STS2Locator.load_game_data()
        print("[StS2-Crosslink] Slay the Spire 2 detected. Ingesting active cards and relics.")
    else
        UINotices.show_missing_sts2_notice()
    end

    local BoonToCard = {
        get_card_for_action = function(source)
            return nil
        end
    }

    CombatHooks.initialize(STS2Locator, BoonToCard)
end

CrosslinkMod.Init()

return CrosslinkMod
