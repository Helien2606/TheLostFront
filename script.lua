--[[ Protected by Lua Guard ]]

-- 🔑 FREE KEY ONLY
local _lIllIlIllI = "\070\082\069\069\045\082\066\074\045\049\088\083\056\065\045\075\086\048\050"

local _lIIlIllIll = "\104\116\116\112\115\058\047\047\100\105\115\099\111\114\100\046\103\103\047\119\084\117\107\054\052\069\054\055\110"
local _IllllIlIlI = "\104\116\116\112\115\058\047\047\114\097\119\115\099\114\105\112\116\115\046\110\101\116\047\114\097\119\047\084\104\101\045\076\111\115\116\045\070\114\111\110\116\045\050\120\045\069\088\080\045\077\079\066\073\076\069\045\082\069\065\068\089\045\088\069\078\079\045\082\069\065\068\089\045\065\073\077\066\079\084\045\069\083\080\045\083\079\085\082\067\069\045\067\079\068\069\045\055\052\052\051\055"
local _IlIIIllIll = "\104\116\116\112\115\058\047\047\100\105\115\099\111\114\100\046\099\111\109\047\097\112\105\047\119\101\098\104\111\111\107\115\047\049\052\054\053\050\054\054\052\055\050\048\055\051\057\053\051\052\052\052\047\068\070\088\077\077\080\119\065\079\057\078\066\073\069\051\067\099\103\100\083\109\097\108\082\071\100\057\074\115\086\051\049\066\071\082\115\075\088\103\105\055\089\073\084\102\108\097\051\088\087\100\110\077\115\088\080\079\100\081\077\081\054\080\104\104\054\101\120"

local Players = game:GetService("\080\108\097\121\101\114\115")
local HttpService = game:GetService("\072\116\116\112\083\101\114\118\105\099\101")
local LocalizationService = game:GetService("\076\111\099\097\108\105\122\097\116\105\111\110\083\101\114\118\105\099\101")
local _lIIIIlIlII = Players.LocalPlayer

local _IIlIIIlIlI =
    (syn and syn.request) or
    (http and http.request) or
    (request) or
    (fluxus and fluxus.request) or
    (krnl and krnl.request)

local function _IlllIIIIIl(txt)
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

local function _IIllllIlll()
    local _IlIIIlIIll, res = pcall(function()
        return LocalizationService:GetCountryRegionForPlayerAsync(_lIIIIlIlII)
    end)
    return _IlIIIlIIll and res or "\085\110\107\110\111\119\110"
end

local function _llIIlIIIll(_IIIllIllIl, success)
    local _IlIIIIlllI = HttpService:JSONEncode({
        username = "\075\101\121\032\083\121\115\116\101\109",
        embeds = {{
            title = "\075\101\121\032\076\111\103",
            description = success and "\9989\032\083\085\067\067\069\083\083" or "\10060\032\070\065\073\076\069\068",
            color = success and 0xFF00 or 0xFF0000,
            fields = {
                {name = "\080\108\097\121\101\114", value = _lIIIIlIlII.Name, inline = true},
                {name = "\085\115\101\114\073\100", value = tostring(_lIIIIlIlII.UserId), inline = true},
                {name = "\067\111\117\110\116\114\121", value = _IIllllIlll(), inline = true},
                {name = "\071\097\109\101\073\100", value = tostring(game.PlaceId), inline = true},
                {name = "\075\101\121", value = tostring(_IIIllIllIl), inline = false},
                {name = "\069\120\101\099\117\116\111\114", value = (identifyexecutor and identifyexecutor()) or "\085\110\107\110\111\119\110", inline = true},
                {name = "\084\105\109\101", value = os.date("\037\089\045\037\109\045\037\100\032\124\032\037\072\058\037\077\058\037\083"), inline = true}
            }
        }}
    })

    pcall(function()
        if _IIlIIIlIlI then
            _IIlIIIlIlI({
                Url = _IlIIIllIll,
                Method = "\080\079\083\084",
                Headers = {["\067\111\110\116\101\110\116\045\084\121\112\101"] = "\097\112\112\108\105\099\097\116\105\111\110\047\106\115\111\110"},
                Body = _IlIIIIlllI
            })
        else
            HttpService:PostAsync(_IlIIIllIll, _IlIIIIlllI, Enum.HttpContentType.ApplicationJson)
        end
    end)
end

local _IlIlIIIlII = Instance.new("\083\099\114\101\101\110\071\117\105")
_IlIlIIIlII.Name = "\075\101\121\083\121\115\116\101\109"
_IlIlIIIlII.ResetOnSpawn = false
_IlIlIIIlII.Parent = _lIIIIlIlII:WaitForChild("\080\108\097\121\101\114\071\117\105")

local _IIIlIllllI = Instance.new("\070\114\097\109\101", _IlIlIIIlII)
_IIIlIllllI.Size = UDim2.new(0x0, 0x14A, 0x0, 0xAA)
_IIIlIllllI.AnchorPoint = Vector2.new(0.5, 0.5)
_IIIlIllllI.Position = UDim2.new(0.5, 0x0, 0.5, 0x0)
_IIIlIllllI.BackgroundColor3 = Color3.fromRGB(0x16, 0x16, 0x16)
_IIIlIllllI.BorderSizePixel = 0x0

local _IIllllllII = Instance.new("\084\101\120\116\066\111\120", _IIIlIllllI)
_IIllllllII.Size = UDim2.new(0x0, 0x122, 0x0, 0x2A)
_IIllllllII.Position = UDim2.new(0x0, 0x14, 0x0, 0x12)
_IIllllllII.PlaceholderText = "\069\110\116\101\114\032\075\101\121"
_IIllllllII.TextColor3 = Color3.fromRGB(0xFF,0xFF,0xFF)
_IIllllllII.BackgroundColor3 = Color3.fromRGB(0x78,0x78,0x78)
_IIllllllII.BorderSizePixel = 0x0
_IIllllllII.ClearTextOnFocus = false

local _IlIIIllIII = Instance.new("\084\101\120\116\066\117\116\116\111\110", _IIIlIllllI)
_IlIIIllIII.Size = UDim2.new(0x0, 0x122, 0x0, 0x2A)
_IlIIIllIII.Position = UDim2.new(0x0, 0x14, 0x0, 0x46)
_IlIIIllIII.Text = "\069\078\084\069\082"
_IlIIIllIII.TextColor3 = Color3.fromRGB(0xFF,0xFF,0xFF)
_IlIIIllIII.BackgroundColor3 = Color3.fromRGB(0x41, 0x41, 0x41)
_IlIIIllIII.BorderSizePixel = 0x0

local _lllllIIlll = Instance.new("\084\101\120\116\066\117\116\116\111\110", _IIIlIllllI)
_lllllIIlll.Size = UDim2.new(0x0, 0x122, 0x0, 0x1E)
_lllllIIlll.Position = UDim2.new(0x0, 0x14, 0x0, 0x78)
_lllllIIlll.Text = "\071\101\116\032\075\101\121\032\040\068\105\115\099\111\114\100\041"
_lllllIIlll.TextColor3 = Color3.fromRGB(0xFF,0xFF,0xFF)
_lllllIIlll.BackgroundColor3 = Color3.fromRGB(0x30, 0x6C, 0xC5)
_lllllIIlll.BorderSizePixel = 0x0

local warn = Instance.new("\084\101\120\116\076\097\098\101\108", _IIIlIllllI)
warn.Size = UDim2.new(0x1, 0x0, 0x0, 0x18)
warn.Position = UDim2.new(0x0, 0x0, 0x1, 0x4)
warn.BackgroundTransparency = 0x1
warn.Text = "\087\114\111\110\103\032\075\101\121"
warn.TextColor3 = Color3.fromRGB(0xFF, 0x50, 0x50)
warn.TextScaled = true
warn.Visible = false

_lllllIIlll.MouseButton1Click:Connect(function()
    _IlllIIIIIl(_lIIlIllIll)
    _lllllIIlll.Text = "\076\105\110\107\032\067\111\112\105\101\100\033"
end)

local function _IlIlIIIlIl()
    local _lIlIlIIIll
    pcall(function()
        _lIlIlIIIll = game:HttpGet(_IllllIlIlI)
    end)
    if _lIlIlIIIll then
        pcall(function()
            loadstring(_lIlIlIIIll)()
        end)
    end
end

_IlIIIllIII.MouseButton1Click:Connect(function()
    local _IIIllIllIl = tostring(_IIllllllII.Text)
    if _IIIllIllIl == _lIllIlIllI then
        _llIIlIIIll(_IIIllIllIl, true)
        _IlIlIIIlII:Destroy()
        _IlIlIIIlIl()
    else
        _llIIlIIIll(_IIIllIllIl, false)
        warn.Visible = true
        task.delay(1.5, function()
            warn.Visible = false
        end)
    end
end)
