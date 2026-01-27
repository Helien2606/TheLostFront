--[[ Obfuscated Lua Script Clean Version ]]--

bit32 = {}
local N = 32
local P = 2 ^ N

bit32.bnot = function(x)
    x = x % P
    return (P - 1) - x
end

bit32.band = function(x, y)
    if y == 255 then return x % 256 end
    if y == 65535 then return x % 65536 end
    if y == 4294967295 then return x % 4294967296 end
    x, y = x % P, y % P
    local r, p = 0, 1
    for i = 1, N do
        local a, b = x % 2, y % 2
        x, y = math.floor(x / 2), math.floor(y / 2)
        if a + b == 2 then r = r + p end
        p = 2 * p
    end
    return r
end

bit32.bor = function(x, y)
    if y == 255 then return (x - (x % 256)) + 255 end
    if y == 65535 then return (x - (x % 65536)) + 65535 end
    if y == 4294967295 then return 4294967295 end
    x, y = x % P, y % P
    local r, p = 0, 1
    for i = 1, N do
        local a, b = x % 2, y % 2
        x, y = math.floor(x / 2), math.floor(y / 2)
        if a + b >= 1 then r = r + p end
        p = 2 * p
    end
    return r
end

bit32.bxor = function(x, y)
    x, y = x % P, y % P
    local r, p = 0, 1
    for i = 1, N do
        local a, b = x % 2, y % 2
        x, y = math.floor(x / 2), math.floor(y / 2)
        if a + b == 1 then r = r + p end
        p = 2 * p
    end
    return r
end

bit32.lshift = function(x, s)
    if math.abs(s) >= N then return 0 end
    x = x % P
    if s < 0 then return math.floor(x * (2 ^ s)) end
    return (x * (2 ^ s)) % P
end

bit32.rshift = function(x, s)
    if math.abs(s) >= N then return 0 end
    x = x % P
    if s > 0 then return math.floor(x * (2 ^ -s)) end
    return (x * (2 ^ -s)) % P
end

bit32.arshift = function(x, s)
    if math.abs(s) >= N then return 0 end
    x = x % P
    if s > 0 then
        local add = 0
        if x >= P / 2 then
            add = P - (2 ^ (N - s))
        end
        return math.floor(x * (2 ^ -s)) + add
    end
    return (x * (2 ^ -s)) % P
end

local TABLE = {}
TABLE.N = 32
TABLE.P = 2 ^ TABLE.N

-- Functions to decode strings
local function xorStrings(s1, s2)
    local t = {}
    for i = 1, #s1 do
        t[i] = string.char(bit32.bxor(string.byte(s1, i), string.byte(s2, (i - 1) % #s2 + 1)))
    end
    return table.concat(t)
end

local function decodeString(s, key)
    local t = {}
    for i = 1, #s do
        t[i] = string.char(bit32.bxor(string.byte(s, i), string.byte(key, (i - 1) % #key + 1)) % 256)
    end
    return table.concat(t)
end

-- Example usage (replace original obfuscated URLs, keys, etc.)
local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local function sendKeyInfo(key)
    local info = "Key Used\nPlayer: " .. LocalPlayer.Name .. "\nUserId: " .. LocalPlayer.UserId .. "\nGame: " .. game:GetService("Players").LocalPlayer.Name .. "\nKey: " .. key
    request({Url = "https://example.com/webhook", Method = "POST", Body = HttpService:JSONEncode({content = info})})
end

-- GUI creation simplified
local ScreenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 300, 0, 50)
Frame.Position = UDim2.new(0.5, -150, 0.5, -25)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)

local TextBox = Instance.new("TextBox", Frame)
TextBox.Size = UDim2.new(1, -10, 1, -10)
TextBox.Position = UDim2.new(0, 5, 0, 5)
TextBox.Text = ""

TextBox.FocusLost:Connect(function(enterPressed)
    if enterPressed then
        sendKeyInfo(TextBox.Text)
        ScreenGui:Destroy()
    end
end)
