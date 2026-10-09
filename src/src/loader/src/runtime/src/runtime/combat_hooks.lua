local CombatHooks = {}

function CombatHooks.initialize(STS2Locator, BoonToCard)
    if not ModUtil or not ModUtil.WrapBaseFunction then
        print("[StS2-Crosslink] ModUtil not detected. Hook registration aborted.")
        return
    end

    ModUtil.WrapBaseFunction("DamageEnemy", function(baseFunc, victim, triggerArgs)
        local damageDealt = baseFunc(victim, triggerArgs)

        if not STS2Locator.is_installed then
            return damageDealt
        end

        if triggerArgs and triggerArgs.AttackerTable == CurrentRun.Hero then
            local activeBoon = triggerArgs.SourceWeapon or "Attack"
            local card = BoonToCard.get_card_for_action(activeBoon)
            if card then
                CombatHooks.trigger_card_effect(card, victim, damageDealt)
            end
        end

        return damageDealt
    end)
end

function CombatHooks.trigger_card_effect(card, target, amount)
    print(string.format("[StS2-Crosslink] Triggered StS2 Card: %s on target %s", card.sts2_card, tostring(target.Name)))
end

return CombatHooks
