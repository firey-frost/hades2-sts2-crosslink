local UINotices = {}

function UINotices.show_missing_sts2_notice()
        if ScreenPresentationData and ScreenPresentationData.Notification then
                    thread(function()
                                wait(2.0)
                                        CreateTextBox({
                                                            Text = "CROSS-LINK NOTICE: Slay the Spire 2 not detected on Steam.\nRunning in fallback mode.",
                                                                            Font = "Spectral",
                                                                                            FontSize = 24,
                                                                                                            Color = {1.0, 0.4, 0.4, 1.0},
                                                                                                                            OffsetX = 0,
                                                                                                                                            OffsetY = -380,
                                                                                                                                                            Justification = "Center",
                                                                                                                                                                            Duration = 7.0
                                        })
                                    end)
                                else
                                            print("[StS2-Crosslink] Warning: Slay the Spire 2 not installed on Steam.")
                                end
                            end

                            return UINotices
                            
                                        }))