local stringfind = string.find
local makestring = tostring
function IsANigga(player)
    if player.CharacterAppearanceLoaded then
        if player.Character:FindFirstChild('Head') then
            local brickcolor = makestring(player.Character.Head.BrickColor)
            if stringfind(brickcolor:lower(), 'brown') or stringfind(brickcolor:lower(), 'black') then
                player:Kick("You're a negro!")
            end
        end
    end
end

for i, v in pairs(game:GetService('Players'):GetPlayers()) do
    if v == game.Players.LocalPlayer then
        IsANigga(v)
    end
end
