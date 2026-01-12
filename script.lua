-- 🔐 إعدادات المفتاح
local CORRECT_KEY = "kasksbq31kdna01"
local DISCORD_LINK = "https://discord.gg/wTuk64E67n"
local SCRIPT_URL = "https://rawscripts.net/raw/The-Lost-Front-2x-EXP-MOBILE-READY-XENO-READY-AIMBOT-ESP-SOURCE-CODE-74437"
local WEBHOOK_URL = "https://discord.com/api/webhooks/1460148937452425370/ZkGJUrhfkaNHgs512LKdUmXHwIFinWdU75Eqg25pwDpXNnIEfdLG-s3ayFHcJOBdtcjH"

-- Services
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

-- GUI
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "KeySystem"

local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0,320,0,160)
frame.Position = UDim2.new(0.5,-160,0.5,-80)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0

local box = Instance.new("TextBox", frame)
box.Size = UDim2.new(0,280,0,40)
box.Position = UDim2.new(0,20,0,20)
box.PlaceholderText = "Enter Key Here"
box.Text = ""
box.TextColor3 = Color3.new(1,1,1)
box.BackgroundColor3 = Color3.fromRGB(40,40,40)
box.BorderSizePixel = 0
box.ClearTextOnFocus = false

local enterBtn = Instance.new("TextButton", frame)
enterBtn.Size = UDim2.new(0,280,0,40)
enterBtn.Position = UDim2.new(0,20,0,70)
enterBtn.Text = "ENTER"
enterBtn.TextColor3 = Color3.new(1,1,1)
enterBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
enterBtn.BorderSizePixel = 0

local getBtn = Instance.new("TextButton", frame)
getBtn.Size = UDim2.new(0,280,0,30)
getBtn.Position = UDim2.new(0,20,0,120)
getBtn.Text = "Get Key (Discord)"
getBtn.TextColor3 = Color3.new(1,1,1)
getBtn.BackgroundColor3 = Color3.fromRGB(48,108,197)
getBtn.BorderSizePixel = 0

local warn = Instance.new("TextLabel", frame)
warn.Size = UDim2.new(1,0,0,25)
warn.Position = UDim2.new(0,0,1,5)
warn.BackgroundTransparency = 1
warn.Text = "Wrong Key"
warn.TextColor3 = Color3.fromRGB(255,80,80)
warn.TextScaled = true
warn.Visible = false

getBtn.MouseButton1Click:Connect(function()
    if setclipboard then setclipboard(DISCORD_LINK) end
    getBtn.Text = "Link Copied!"
end)

local function sendWebhook(key)
    pcall(function()
        local content =
            "✅ **Key Used**\n" ..
            "👤 Player: **"..player.Name.."**\n" ..
            "🆔 UserId: **"..player.UserId.."**\n" ..
            "🎮 Game: **"..game.PlaceId.."**\n" ..
            "🕒 Time: **"..os.date("%Y-%m-%d | %H:%M:%S").."**\n" ..
            "🔑 Key: ```"..key.."```"

        request({
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode({content = content})
        })
    end)
end

enterBtn.MouseButton1Click:Connect(function()
    if box.Text == CORRECT_KEY then
        sendWebhook(box.Text)
        gui:Destroy()
        loadstring(game:HttpGet(SCRIPT_URL))()
    else
        warn.Visible = true
        task.delay(1.5, function()
            warn.Visible = false
        end)
    end
end)
