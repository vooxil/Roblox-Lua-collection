months = {"January","Febuary","March","April","May","June","July","August","September","October","November","December"}
local players = game:GetService("Players")
local logfile = game.PlaceId.."_"..game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name.."_".."Chatlogs.txt"

local success, response = pcall(function()
readfile(logfile) --check if log file already exists
end)

if not success then
writefile(logfile, "") --if a log file doesn't already exist make a new blank one
end

function log(player,msg)
local creationdate = os.date("!*t", os.time() - (60 * 60 * 24 * player.AccountAge))
local endsep = "\n"
local name = "Username: "..player.Name..'\r\n'
local id = "User ID: "..player.UserId..'\r\n'
local message = "Message: "..msg..'\r\n'
local xtime = "OS Time: "..os.date("*t").hour..":"..os.date("*t").min..":"..os.date("*t").sec..'\r\n'
local xdate = "OS Date: "..os.date("*t").month.."/"..os.date("*t").day.."/"..os.date("*t").year..'\r\n'
local readablecreationdate = "Account created on: ".. months[creationdate.month].." "..creationdate.day..", "..creationdate.year..'\r\n'
local membership = "Membership type: "..tostring(player.MembershipType)..'\r\n'
local serverid = "Server ID: "..game.JobId..'\r\n'

local function checkmembership(player)
local membership = "Membership: None".."\r\n"
if player.MembershipType == Enum.MembershipType.Premium then
membership = "Membership: Premium".."\r\n"
end
return(membership)
end

local function checkposition(player)
local position = "CFrame: Character undetected"
if player.Character and player.Character.PrimaryPart then
position = "CFrame: "..tostring(player.Character.PrimaryPart.CFrame)
end
return(position)
end

if _G.XXIlogname == true then
	_G.processedmessage = name
end

_G.processedmessage = _G.processedmessage..message

if _G.XXIlogtime == true then
	_G.processedmessage = _G.processedmessage..xtime
end

if _G.XXIlogdate == true then
	_G.processedmessage = _G.processedmessage..xdate
end

if _G.XXIlogmembership == true then
	_G.processedmessage = _G.processedmessage..checkmembership(player)
end

if _G.XXIloguid == true then
	_G.processedmessage = _G.processedmessage..id
end

if _G.XXIlogserverid == true then
	_G.processedmessage = _G.processedmessage..serverid
end

if _G.XXIlogaccage == true then
	_G.processedmessage = _G.processedmessage..readablecreationdate
end

if _G.XXIlogshirt == true then
	_G.processedmessage = _G.processedmessage..checkshirt(player)
end

if _G.XXIlogposition == true then
	_G.processedmessage = _G.processedmessage..checkposition(player)
end

_G.processedmessage = _G.processedmessage..endsep

if readfile(logfile) == "" then
writefile(logfile, _G.processedmessage)
else
writefile(logfile, readfile(logfile)..'\r\n'.._G.processedmessage)
end

end -- End of log function

function process(player)
player.Chatted:Connect(function(msg)
log(player,msg)
    end)
end

for i, player in pairs(players:GetPlayers()) do process(player) end

players.PlayerAdded:Connect(function(player) process(player) end)
