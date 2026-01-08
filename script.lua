-- 🔐 إعدادات المفتاح
local CORRECT_KEY = "kasksbq31kdna"
local DISCORD_LINK = "https://discord.gg/wTuk64E67n"

-- رابط السكربت اللي تبي يشغّل بعد المفتاح صحيح
local SCRIPT_URL = "https://rawscripts.net/raw/The-Lost-Front-2x-EXP-MOBILE-READY-XENO-READY-AIMBOT-ESP-SOURCE-CODE-74437"

-- خدمات
local Players = game:GetService("Players")
local player = Players.LocalPlayer

-- واجهة GUI
local gui = Instance.new("ScreenGui")
gui.Name = "KeySystem"
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Parent = gui
frame.Size = UDim2.new(0, 320, 0, 160)
frame.Position = UDim2.new(0.5, -160, 0.5, -80)
frame.BackgroundColor3 = Color3.fromRGB(25,25,25)
frame.BorderSizePixel = 0

-- TextBox لإدخال المفتاح
local box = Instance.new("TextBox")
box.Parent = frame
box.Size = UDim2.new(0, 280, 0, 40)
box.Position = UDim2.new(0, 20, 0, 20)
box.PlaceholderText = "Enter Key Here"
box.Text = ""
box.TextColor3 = Color3.fromRGB(255,255,255)
box.BackgroundColor3 = Color3.fromRGB(40,40,40)
box.BorderSizePixel = 0
box.ClearTextOnFocus = false

-- زر START
local enterBtn = Instance.new("TextButton")
enterBtn.Parent = frame
enterBtn.Size = UDim2.new(0, 280, 0, 40)
enterBtn.Position = UDim2.new(0, 20, 0, 70)
enterBtn.Text = "ENTER"
enterBtn.TextColor3 = Color3.fromRGB(255,255,255)
enterBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
enterBtn.BorderSizePixel = 0

-- زر Get Key
local getBtn = Instance.new("TextButton")
getBtn.Parent = frame
getBtn.Size = UDim2.new(0, 280, 0, 30)
getBtn.Position = UDim2.new(0, 20, 0, 120)
getBtn.Text = "Get Key (Discord)"
getBtn.TextColor3 = Color3.fromRGB(255,255,255)
getBtn.BackgroundColor3 = Color3.fromRGB(48,108,197)
getBtn.BorderSizePixel = 0

-- حدث الضغط على Get Key
getBtn.MouseButton1Click:Connect(function()
if setclipboard then
setclipboard(DISCORD_LINK)
end
getBtn.Text = "Link Copied!"
end)

-- تحقق من المفتاح عند الضغط ENTER
enterBtn.MouseButton1Click:Connect(function()
if box.Text == CORRECT_KEY then
gui:Destroy()
loadstring(game:HttpGet(SCRIPT_URL))()
else
box.Text = "Wrong Key"
end
end)
