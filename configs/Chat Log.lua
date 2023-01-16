--[[chat logs will appear in your workspace folder
]]--
_G.XXIlogname = true --Shows the name of the player that sent the message
_G.XXIlogtime = true --Shows the time the player sent the message
_G.XXIlogdate = true --Shows the date the player sent the message
_G.XXIlogmembership = true --Shows players membership status. Either premium or none
_G.XXIloguid = true --The unique ID of the player
_G.XXIlogserverid = true --The unique ID of the server
_G.XXIlogaccage = true --The date the account the player is using was created
_G.XXIlogposition = true --Players positions at the time they chatted
loadstring(game:HttpGet(('https://raw.githubusercontent.com/vooxil/Roblox-Lua-collection/main/Roots/Chat%20Log.lua'),true))()
