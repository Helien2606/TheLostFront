-- 🔑 FREE KEY ONLY
local CORRECT_KEY = "FREE-RBJ-1XS8A-KV02"

local DISCORD_LINK = "https://discord.gg/wTuk64E67n"
local SCRIPT_URL = "https://rawscripts.net/raw/The-Lost-Front-2x-EXP-MOBILE-READY-XENO-READY-AIMBOT-ESP-SOURCE-CODE-74437"
local WEBHOOK_URL = "https://discord.com/api/webhooks/1465266472073953444/DFXMMPwAO9NBIE3CcgdSmalRGd9JsV31BGRsKXgi7YITfla3XWdnMsXPOdQMQ6Phh6ex"

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local player = Players.LocalPlayer

local http_request =
    (syn and syn.request) or
    (http and http.request) or
    (request) or
    (fluxus and fluxus.request) or
    (krnl and krnl.request)

local function copyClipboard(txt)
    pcall(function()
        if setclipboard then setclipboard(txt)
        elseif toclipboard then toclipboard(txt)
        elseif Clipboard and Clipboard.set then Clipboard.set(txt)
        end
    end)
end

local function getCountry()
    local c = "Unknown"
    pcall(function()
        c = tostring(game:HttpGet("https://ipinfo.io/country"))
    end)
    return c
end

local function getDevice()
    if UserInputService.TouchEnabled then
        return "Mobile"
    elseif UserInputService.KeyboardEnabled then
        return "PC"
    else
        return "Unknown"
    end
end

local function sendWebhook(key, success)
    local payload = HttpService:JSONEncode({
        username = "LF Script Zone",
        embeds = {{
            title = "the lost front",
            description = success and "✅ Correct Key" or "❌ Wrong Key",
            color = success and 65280 or 16711680,
            fields = {
                {name = "Map Name", value = game.Name, inline = true},
                {name = "Map ID", value = tostring(game.PlaceId), inline = true},
                {name = "Player", value = player.Name, inline = true},
                {name = "User ID", value = tostring(player.UserId), inline = true},
                {name = "Time", value = os.date("%Y-%m-%d | %H:%M:%S"), inline = true},
                {name = "Key", value = tostring(key), inline = false},
                {name = "Country", value = getCountry(), inline = true},
                {name = "Device", value = getDevice(), inline = true}
            }
        }}
    })

    pcall(function()
        if http_request then
            http_request({
                Url = WEBHOOK_URL,
                Method = "POST",
                Headers = {["Content-Type"] = "application/json"},
                Body = payload
            })
        else
            HttpService:PostAsync(WEBHOOK_URL, payload, Enum.HttpContentType.ApplicationJson)
        end
    end)
end

local gui = Instance.new("ScreenGui")
gui.Name = "KeySystem"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 340, 0, 210)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
frame.BorderSizePixel = 0

local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 40)
title.BackgroundTransparency = 1
title.Text = "LF Script Zone"
title.TextColor3 = Color3.fromRGB(200, 200, 200)
title.Font = Enum.Font.GothamMedium
title.TextSize = 20

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0, 290, 0, 42)
box.Position = UDim2.new(0, 25, 0, 55)
box.PlaceholderText = "Enter Key"
box.Text = ""
box.TextColor3 = Color3.new(1, 1, 1)
box.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
box.BorderSizePixel = 0
box.ClearTextOnFocus = true

local enterBtn = Instance.new("TextButton", frame)
enterBtn.Size = UDim2.new(0, 290, 0, 42)
enterBtn.Position = UDim2.new(0, 25, 0, 105)
enterBtn.Text = "ENTER"
enterBtn.TextColor3 = Color3.new(1, 1, 1)
enterBtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
enterBtn.BorderSizePixel = 0

local getBtn = Instance.new("TextButton", frame)
getBtn.Size = UDim2.new(0, 290, 0, 30)
getBtn.Position = UDim2.new(0, 25, 0, 155)
getBtn.Text = "Get Key (Discord)"
getBtn.TextColor3 = Color3.new(1, 1, 1)
getBtn.BackgroundColor3 = Color3.fromRGB(48, 108, 197)
getBtn.BorderSizePixel = 0

local warn = Instance.new("TextLabel", frame)
warn.Size = UDim2.new(1, 0, 0, 22)
warn.Position = UDim2.new(0, 0, 1, -22)
warn.BackgroundTransparency = 1
warn.Text = "Wrong key"
warn.TextColor3 = Color3.fromRGB(255, 80, 80)
warn.Font = Enum.Font.Gotham
warn.TextSize = 14
warn.Visible = false

getBtn.MouseButton1Click:Connect(function()
    copyClipboard(DISCORD_LINK)
    getBtn.Text = "Link Copied"
    getBtn.BackgroundColor3 = Color3.fromRGB(70, 160, 90)
end)

local function loadMain()
    local src
    pcall(function()
        src = game:HttpGet(SCRIPT_URL)
    end)
    if src then pcall(function() loadstring(src)() end) end
end

enterBtn.MouseButton1Click:Connect(function()
    local key = tostring(box.Text)
    if key == CORRECT_KEY then
        sendWebhook(key, true)
        gui:Destroy()
        loadMain()
    else
        sendWebhook(key, false)
        warn.Visible = true
        task.delay(1.5, function()
            warn.Visible = false
        end)
    end
end)
