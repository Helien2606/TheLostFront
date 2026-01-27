-- 🔑 Hidden Key System

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

local http_request =
    (syn and syn.request) or
    (http and http.request) or
    (request) or
    (fluxus and fluxus.request) or
    (krnl and krnl.request)

-- تشفير Base64 بسيط
local function b64decode(data)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    data = string.gsub(data, '[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
        return r
    end):gsub('%d%d%d%d%d%d%d%d', function(x)
        local c=0
        for i=1,8 do c=c + (x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

-- المفتاح مخفي
local ENCODED_KEY = "RlJFRS1SQkotMVhTOEEtS1YwMg==" -- FREE-RBJ-1XS8A-KV02 مشفر
local CORRECT_KEY = b64decode(ENCODED_KEY)

-- Webhook مخفي
local ENCODED_WEBHOOK = "aHR0cHM6Ly9kaXNjb3JkLmNvbS9hcGkvd2ViaG9va3MvMTQ2NTI2NjQ3MjA3Mzk1MzQ0NC9ERlhNTVB3QU85TkJJRTNDY2dkU21hbFJHZDlKc1YzMUJHUnNLWGdpN1lJVGYsWXdkbk1zWFBPRHFLTVE2UGhoNmV4" 
local WEBHOOK_URL = b64decode(ENCODED_WEBHOOK)

local function copyClipboard(txt)
    pcall(function()
        if setclipboard then
            setclipboard(txt)
        elseif toclipboard then
            toclipboard(txt)
        elseif Clipboard and Clipboard.set then
            Clipboard.set(txt)
        end
    end)
end

local function sendWebhook(key, success)
    local payload = HttpService:JSONEncode({
        username = "Key System",
        embeds = {{
            title = "Key Log",
            description = success and "✅ SUCCESS" or "❌ FAILED",
            color = success and 65280 or 16711680,
            fields = {
                {name = "Player", value = player.Name, inline = true},
                {name = "UserId", value = tostring(player.UserId), inline = true},
                {name = "GameId", value = tostring(game.PlaceId), inline = true},
                {name = "Key", value = tostring(key), inline = false},
                {name = "Executor", value = (identifyexecutor and identifyexecutor()) or "Unknown", inline = true},
                {name = "Time", value = os.date("%Y-%m-%d | %H:%M:%S"), inline = true}
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
frame.Size = UDim2.new(0, 330, 0, 170)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.Position = UDim2.new(0.5, 0, 0.5, 0)
frame.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
frame.BorderSizePixel = 0

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0, 290, 0, 42)
box.Position = UDim2.new(0, 20, 0, 18)
box.PlaceholderText = "Enter Key"
box.TextColor3 = Color3.fromRGB(255,255,255)
box.BackgroundColor3 = Color3.fromRGB(120,120,120)
box.BorderSizePixel = 0
box.ClearTextOnFocus = false

local enterBtn = Instance.new("TextButton", frame)
enterBtn.Size = UDim2.new(0, 290, 0, 42)
enterBtn.Position = UDim2.new(0, 20, 0, 70)
enterBtn.Text = "ENTER"
enterBtn.TextColor3 = Color3.fromRGB(255,255,255)
enterBtn.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
enterBtn.BorderSizePixel = 0

local getBtn = Instance.new("TextButton", frame)
getBtn.Size = UDim2.new(0, 290, 0, 30)
getBtn.Position = UDim2.new(0, 20, 0, 120)
getBtn.Text = "Get Key (Discord)"
getBtn.TextColor3 = Color3.fromRGB(255,255,255)
getBtn.BackgroundColor3 = Color3.fromRGB(48, 108, 197)
getBtn.BorderSizePixel = 0

local warn = Instance.new("TextLabel", frame)
warn.Size = UDim2.new(1, 0, 0, 24)
warn.Position = UDim2.new(0, 0, 1, 4)
warn.BackgroundTransparency = 1
warn.Text = "Wrong Key"
warn.TextColor3 = Color3.fromRGB(255, 80, 80)
warn.TextScaled = true
warn.Visible = false

getBtn.MouseButton1Click:Connect(function()
    copyClipboard("https://discord.gg/wTuk64E67n")
    getBtn.Text = "Link Copied!"
end)

local function loadMain()
    local src
    pcall(function()
        src = game:HttpGet("https://rawscripts.net/raw/The-Lost-Front-2x-EXP-MOBILE-READY-XENO-READY-AIMBOT-ESP-SOURCE-CODE-74437")
    end)
    if src then
        pcall(function()
            loadstring(src)()
        end)
    end
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
