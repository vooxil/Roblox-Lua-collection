-- this version has working playlist & currently playing
--[[
https://developer.spotify.com/console/get-several-tracks/
user-read-playback-state
user-read-playback-position
user-modify-playback-state
user-read-recently-played
user-follow-modify
user-read-currently-playing
]]
-- ctts Matteo❤#6537
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UIS = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local Mouse = Players.LocalPlayer:GetMouse()

function randomString()local length = math.random(10,20);local array = {};for i = 1, length do array[i] = string.char(math.random(32, 126)) end;return table.concat(array);end
function tween(object, goal, Callback, tweeninfo)
	local tween = TweenService:Create(object, tweeninfo or TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), goal)
	tween.Completed:Connect(Callback or function() end)
	tween:Play()
end


function ResizeScrollingFrame(ScrollingFrame, UiListUiGrid, offset)
	ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, UiListUiGrid.AbsoluteContentSize.Y + offset or 10) 
end
function getAbsoluteSize(frame)
	local totalSize = Vector2.new()

	for _, Child in pairs(frame:GetChildren()) do
		if Child:IsA("GuiBase2d") then
			totalSize += Child.AbsoluteSize
		end
	end

	return totalSize
end

local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()
function message(text)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 3;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)

	task.spawn(function()
		local msg = Instance.new("Message",workspace)
		msg.Text = tostring(text)
		task.wait(5)
		msg:Destroy()
	end)
end
function normalmessage(title, text, timee)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 3;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)

	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "default"}
	)
end
function confirmnotification(title, text, timee, callback)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 3;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)

	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80), Time = timee or 10, Type = "option"},
		{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84), Callback = callback or function(state)end}
	)
end 
function warnmessage(title, text, timee)
	task.spawn(function()
		local notif = Instance.new("Sound");notif.Parent = game.SoundService;notif.SoundId = "rbxassetid://4590657391";notif.Volume = 5;notif:Play();notif.Stopped:Wait();notif:Destroy()
	end)
	Notification:Notify(
		{Title = title, Description = text},
		{OutlineColor = Color3.fromRGB(80, 80, 80),Time = timee or 5, Type = "image"},
		{Image = "http://www.roblox.com/asset/?id=6023426923", ImageColor = Color3.fromRGB(255, 84, 84)}
	)
end

local GUI = {};
do
	-- StarterGui.main_gui
	GUI["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
	GUI["1"]["Name"] = randomString()

	local s,e = pcall(function()
		if get_hidden_gui or gethui then
			local HIDEUI = get_hidden_gui or gethui
			GUI["1"]["Parent"] = HIDEUI()
		elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then
			syn.protect_gui(GUI["1"])
			GUI["1"]["Parent"] = game:GetService("CoreGui")
		elseif game:GetService("CoreGui"):FindFirstChild('RobloxGui') then
			GUI["1"]["Parent"] = game:GetService("CoreGui").RobloxGui
		else
			GUI["1"]["Parent"] = game:GetService("CoreGui")
		end
	end)
	if e then GUI["1"]["Parent"] = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"); end

	GUI["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;

	-- StarterGui.main_gui.OAuthTokenFrame
	GUI["2"] = Instance.new("Frame", GUI["1"]);
	GUI["2"]["BorderSizePixel"] = 0;
	GUI["2"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["2"]["BackgroundTransparency"] = 1;
	GUI["2"]["Size"] = UDim2.new(0, 430, 0, 129);
	GUI["2"]["Position"] = UDim2.new(0.5, 0, 0.5196688175201416, 0);
	GUI["2"]["Visible"] = false;
	GUI["2"]["Name"] = [[OAuthTokenFrame]];

	-- StarterGui.main_gui.OAuthTokenFrame.DropShadowHolder
	GUI["3"] = Instance.new("Frame", GUI["2"]);
	GUI["3"]["ZIndex"] = 0;
	GUI["3"]["BorderSizePixel"] = 0;
	GUI["3"]["BackgroundTransparency"] = 1;
	GUI["3"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["3"]["Name"] = [[DropShadowHolder]];

	-- StarterGui.main_gui.OAuthTokenFrame.DropShadowHolder.DropShadow
	GUI["4"] = Instance.new("ImageLabel", GUI["3"]);
	GUI["4"]["ZIndex"] = 0;
	GUI["4"]["BorderSizePixel"] = 0;
	GUI["4"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
	GUI["4"]["ScaleType"] = Enum.ScaleType.Slice;
	GUI["4"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["4"]["ImageTransparency"] = 0.5;
	GUI["4"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["4"]["Image"] = [[rbxassetid://6014261993]];
	GUI["4"]["Size"] = UDim2.new(1, 47, 1, 47);
	GUI["4"]["Name"] = [[DropShadow]];
	GUI["4"]["BackgroundTransparency"] = 1;
	GUI["4"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.main_gui.OAuthTokenFrame.UICorner
	GUI["5"] = Instance.new("UICorner", GUI["2"]);


	-- StarterGui.main_gui.OAuthTokenFrame.Main
	GUI["6"] = Instance.new("Frame", GUI["2"]);
	GUI["6"]["BorderSizePixel"] = 0;
	GUI["6"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
	GUI["6"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["6"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["6"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	GUI["6"]["Name"] = [[Main]];

	-- StarterGui.main_gui.OAuthTokenFrame.Main.UICorner
	GUI["7"] = Instance.new("UICorner", GUI["6"]);


	-- StarterGui.main_gui.OAuthTokenFrame.Main.OAuthToken
	GUI["8"] = Instance.new("TextButton", GUI["6"]);
	GUI["8"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
	GUI["8"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["8"]["Size"] = UDim2.new(0.949999988079071, 0, 0, 32);
	GUI["8"]["Name"] = [[OAuthToken]];
	GUI["8"]["Text"] = [[]];
	GUI["8"]["Position"] = UDim2.new(0.5, 0, 0.43798449635505676, 0);

	-- StarterGui.main_gui.OAuthTokenFrame.Main.OAuthToken.UICorner
	GUI["9"] = Instance.new("UICorner", GUI["8"]);
	GUI["9"]["CornerRadius"] = UDim.new(0, 4);

	-- StarterGui.main_gui.OAuthTokenFrame.Main.OAuthToken.UIStroke
	GUI["a"] = Instance.new("UIStroke", GUI["8"]);
	GUI["a"]["Color"] = Color3.fromRGB(83, 83, 83);
	GUI["a"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	-- StarterGui.main_gui.OAuthTokenFrame.Main.OAuthToken.Title
	GUI["b"] = Instance.new("TextBox", GUI["8"]);
	GUI["b"]["CursorPosition"] = -1;
	GUI["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	GUI["b"]["TextWrapped"] = true;
	GUI["b"]["TextSize"] = 14;
	GUI["b"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	GUI["b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["b"]["BackgroundTransparency"] = 1;
	GUI["b"]["PlaceholderText"] = [[OAuth Token (https://developer.spotify.com/console/get-playlist-tracks)]];
	GUI["b"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["b"]["Text"] = [[]];
	GUI["b"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["b"]["Font"] = Enum.Font.Gotham;
	GUI["b"]["Name"] = [[Title]];
	GUI["b"]["ClearTextOnFocus"] = false;

	-- StarterGui.main_gui.OAuthTokenFrame.Main.OAuthToken.UIPadding
	GUI["c"] = Instance.new("UIPadding", GUI["8"]);
	GUI["c"]["PaddingTop"] = UDim.new(0, 6);
	GUI["c"]["PaddingRight"] = UDim.new(0, 6);
	GUI["c"]["PaddingBottom"] = UDim.new(0, 6);
	GUI["c"]["PaddingLeft"] = UDim.new(0, 6);

	-- StarterGui.main_gui.OAuthTokenFrame.Main.Label
	GUI["d"] = Instance.new("Frame", GUI["6"]);
	GUI["d"]["BackgroundColor3"] = Color3.fromRGB(91, 0, 0);
	GUI["d"]["AnchorPoint"] = Vector2.new(0.5, 0);
	GUI["d"]["BackgroundTransparency"] = 1;
	GUI["d"]["Size"] = UDim2.new(0.949999988079071, 0, 0, 20);
	GUI["d"]["Position"] = UDim2.new(0.5, 0, 0, 0);
	GUI["d"]["Name"] = [[Label]];

	-- StarterGui.main_gui.OAuthTokenFrame.Main.Label.Title
	GUI["e"] = Instance.new("TextLabel", GUI["d"]);
	GUI["e"]["TextWrapped"] = true;
	GUI["e"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	GUI["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["e"]["TextSize"] = 14;
	GUI["e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["e"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["e"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["e"]["Text"] = [[Enter your OAuth Token Here ]];
	GUI["e"]["Name"] = [[Title]];
	GUI["e"]["Font"] = Enum.Font.GothamBold;
	GUI["e"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.OAuthTokenFrame.Main.Label.UIPadding
	GUI["f"] = Instance.new("UIPadding", GUI["d"]);
	GUI["f"]["PaddingTop"] = UDim.new(0, 6);
	GUI["f"]["PaddingRight"] = UDim.new(0, 6);
	GUI["f"]["PaddingBottom"] = UDim.new(0, 6);
	GUI["f"]["PaddingLeft"] = UDim.new(0, 6);

	-- StarterGui.main_gui.OAuthTokenFrame.Main.Button
	GUI["10"] = Instance.new("TextButton", GUI["6"]);
	GUI["10"]["BackgroundColor3"] = Color3.fromRGB(0, 255, 128);
	GUI["10"]["AnchorPoint"] = Vector2.new(0.5, 1);
	GUI["10"]["Size"] = UDim2.new(0.949999988079071, 0, 0, 32);
	GUI["10"]["Name"] = [[Button]];
	GUI["10"]["Text"] = [[]];
	GUI["10"]["Position"] = UDim2.new(0.5, 0, 0.9205297827720642, 0);

	-- StarterGui.main_gui.OAuthTokenFrame.Main.Button.UICorner
	GUI["11"] = Instance.new("UICorner", GUI["10"]);
	GUI["11"]["CornerRadius"] = UDim.new(0, 4);

	-- StarterGui.main_gui.OAuthTokenFrame.Main.Button.UIStroke
	GUI["12"] = Instance.new("UIStroke", GUI["10"]);
	GUI["12"]["Color"] = Color3.fromRGB(83, 83, 83);
	GUI["12"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	-- StarterGui.main_gui.OAuthTokenFrame.Main.Button.Title
	GUI["13"] = Instance.new("TextLabel", GUI["10"]);
	GUI["13"]["TextWrapped"] = true;
	GUI["13"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["13"]["TextSize"] = 14;
	GUI["13"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["13"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["13"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["13"]["Text"] = [[Continue]];
	GUI["13"]["Name"] = [[Title]];
	GUI["13"]["Font"] = Enum.Font.Gotham;
	GUI["13"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.MainFrame
	GUI["14"] = Instance.new("Frame", GUI["1"]);
	GUI["14"]["BorderSizePixel"] = 0;
	GUI["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["14"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["14"]["BackgroundTransparency"] = 1;
	GUI["14"]["Size"] = UDim2.new(0, 500, 0, 500);
	GUI["14"]["Position"] = UDim2.new(0.5, 0, 0.5422182679176331, 0);
	GUI["14"]["Name"] = [[MainFrame]];

	-- StarterGui.main_gui.MainFrame.DropShadowHolder
	GUI["15"] = Instance.new("Frame", GUI["14"]);
	GUI["15"]["ZIndex"] = 0;
	GUI["15"]["BorderSizePixel"] = 0;
	GUI["15"]["BackgroundTransparency"] = 1;
	GUI["15"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["15"]["Name"] = [[DropShadowHolder]];

	-- StarterGui.main_gui.MainFrame.DropShadowHolder.DropShadow
	GUI["16"] = Instance.new("ImageLabel", GUI["15"]);
	GUI["16"]["ZIndex"] = 0;
	GUI["16"]["BorderSizePixel"] = 0;
	GUI["16"]["SliceCenter"] = Rect.new(49, 49, 450, 450);
	GUI["16"]["ScaleType"] = Enum.ScaleType.Slice;
	GUI["16"]["ImageColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["16"]["ImageTransparency"] = 0.5;
	GUI["16"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["16"]["Image"] = [[rbxassetid://6014261993]];
	GUI["16"]["Size"] = UDim2.new(1, 47, 1, 47);
	GUI["16"]["Name"] = [[DropShadow]];
	GUI["16"]["BackgroundTransparency"] = 1;
	GUI["16"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);

	-- StarterGui.main_gui.MainFrame.UICorner
	GUI["17"] = Instance.new("UICorner", GUI["14"]);


	-- StarterGui.main_gui.MainFrame.Main
	GUI["18"] = Instance.new("Frame", GUI["14"]);
	GUI["18"]["BorderSizePixel"] = 0;
	GUI["18"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
	GUI["18"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["18"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["18"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	GUI["18"]["Name"] = [[Main]];

	-- StarterGui.main_gui.MainFrame.Main.UICorner
	GUI["19"] = Instance.new("UICorner", GUI["18"]);


	-- StarterGui.main_gui.MainFrame.Main.PlaylistsLabel
	GUI["1a"] = Instance.new("Frame", GUI["18"]);
	GUI["1a"]["BackgroundColor3"] = Color3.fromRGB(91, 0, 0);
	GUI["1a"]["AnchorPoint"] = Vector2.new(0.5, 0);
	GUI["1a"]["BackgroundTransparency"] = 1;
	GUI["1a"]["Size"] = UDim2.new(0.949999988079071, 0, 0, 20);
	GUI["1a"]["Position"] = UDim2.new(0.5, 0, 0, 0);
	GUI["1a"]["Name"] = [[PlaylistsLabel]];

	-- StarterGui.main_gui.MainFrame.Main.PlaylistsLabel.Title
	GUI["1b"] = Instance.new("TextLabel", GUI["1a"]);
	GUI["1b"]["TextWrapped"] = true;
	GUI["1b"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	GUI["1b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["1b"]["TextSize"] = 14;
	GUI["1b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["1b"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["1b"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["1b"]["Text"] = [[Playlists]];
	GUI["1b"]["Name"] = [[Title]];
	GUI["1b"]["Font"] = Enum.Font.GothamBold;
	GUI["1b"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.MainFrame.Main.PlaylistsLabel.Title.UICorner
	GUI["1c"] = Instance.new("UICorner", GUI["1b"]);


	-- StarterGui.main_gui.MainFrame.Main.PlaylistsLabel.UIPadding
	GUI["1d"] = Instance.new("UIPadding", GUI["1a"]);
	GUI["1d"]["PaddingTop"] = UDim.new(0, 6);
	GUI["1d"]["PaddingRight"] = UDim.new(0, 6);
	GUI["1d"]["PaddingBottom"] = UDim.new(0, 6);
	GUI["1d"]["PaddingLeft"] = UDim.new(0, 6);

	-- StarterGui.main_gui.MainFrame.Main.Playlists
	GUI["1e"] = Instance.new("ScrollingFrame", GUI["18"]);
	GUI["1e"]["Active"] = true;
	GUI["1e"]["CanvasSize"] = UDim2.new(0, 0, 0.5, 0);
	GUI["1e"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
	GUI["1e"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
	GUI["1e"]["Size"] = UDim2.new(0, 463, 0, 297);
	GUI["1e"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["1e"]["ScrollBarThickness"] = 0;
	GUI["1e"]["Position"] = UDim2.new(0.035999998450279236, 0, 0.07400000095367432, 0);
	GUI["1e"]["Name"] = [[Playlists]];

	-- StarterGui.main_gui.MainFrame.Main.Playlists.UIListLayout
	GUI["1f"] = Instance.new("UIListLayout", GUI["1e"]);
	GUI["1f"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
	GUI["1f"]["Padding"] = UDim.new(0, 10);
	GUI["1f"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

	-- StarterGui.main_gui.MainFrame.Main.Playlists.InvisibleTop
	GUI["20"] = Instance.new("Frame", GUI["1e"]);
	GUI["20"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18);
	GUI["20"]["BackgroundTransparency"] = 1;
	GUI["20"]["LayoutOrder"] = -1;
	GUI["20"]["Size"] = UDim2.new(0, 430, 0, 11);
	GUI["20"]["Position"] = UDim2.new(0.03563714772462845, 0, 0, 0);
	GUI["20"]["Name"] = [[InvisibleTop]];

	-- StarterGui.main_gui.MainFrame.Main.Playlists.InvisibleTop.UICorner
	GUI["21"] = Instance.new("UICorner", GUI["20"]);


	-- StarterGui.main_gui.MainFrame.Main.Playlists.UICorner
	GUI["22"] = Instance.new("UICorner", GUI["1e"]);


	-- StarterGui.main_gui.MainFrame.Main.Playlists.InvisibleDown
	GUI["23"] = Instance.new("Frame", GUI["1e"]);
	GUI["23"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18);
	GUI["23"]["BackgroundTransparency"] = 1;
	GUI["23"]["LayoutOrder"] = 999999999;
	GUI["23"]["Size"] = UDim2.new(0, 430, 0, 11);
	GUI["23"]["Position"] = UDim2.new(0.03563714772462845, 0, 0, 0);
	GUI["23"]["Name"] = [[InvisibleDown]];

	-- StarterGui.main_gui.MainFrame.Main.Playlists.InvisibleDown.UICorner
	GUI["24"] = Instance.new("UICorner", GUI["23"]);

	-- StarterGui.main_gui.MainFrame.Main.SettingsLabel
	GUI["37"] = Instance.new("Frame", GUI["18"]);
	GUI["37"]["BackgroundColor3"] = Color3.fromRGB(91, 0, 0);
	GUI["37"]["AnchorPoint"] = Vector2.new(0.5, 0);
	GUI["37"]["BackgroundTransparency"] = 1;
	GUI["37"]["Size"] = UDim2.new(0.949999988079071, 0, 0, 20);
	GUI["37"]["Position"] = UDim2.new(0.49799999594688416, 0, 0.6800000071525574, 0);
	GUI["37"]["Name"] = [[SettingsLabel]];

	-- StarterGui.main_gui.MainFrame.Main.SettingsLabel.Title
	GUI["38"] = Instance.new("TextLabel", GUI["37"]);
	GUI["38"]["TextWrapped"] = true;
	GUI["38"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	GUI["38"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["38"]["TextSize"] = 14;
	GUI["38"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["38"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["38"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["38"]["Text"] = [[Settings]];
	GUI["38"]["Name"] = [[Title]];
	GUI["38"]["Font"] = Enum.Font.GothamBold;
	GUI["38"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.MainFrame.Main.SettingsLabel.Title.UICorner
	GUI["39"] = Instance.new("UICorner", GUI["38"]);


	-- StarterGui.main_gui.MainFrame.Main.SettingsLabel.UIPadding
	GUI["3a"] = Instance.new("UIPadding", GUI["37"]);
	GUI["3a"]["PaddingTop"] = UDim.new(0, 6);
	GUI["3a"]["PaddingRight"] = UDim.new(0, 6);
	GUI["3a"]["PaddingBottom"] = UDim.new(0, 6);
	GUI["3a"]["PaddingLeft"] = UDim.new(0, 6);

	-- StarterGui.main_gui.MainFrame.created
	GUI["3b"] = Instance.new("TextLabel", GUI["14"]);
	GUI["3b"]["TextWrapped"] = true;
	GUI["3b"]["TextScaled"] = true;
	GUI["3b"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["3b"]["TextSize"] = 14;
	GUI["3b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["3b"]["Size"] = UDim2.new(0.2901780605316162, 0, 0.036326415836811066, 0);
	GUI["3b"]["Text"] = [[Made by mstudio45#5590]];
	GUI["3b"]["Name"] = [[created]];
	GUI["3b"]["Font"] = Enum.Font.Gotham;
	GUI["3b"]["BackgroundTransparency"] = 1;
	GUI["3b"]["Position"] = UDim2.new(-6.103515914901436e-08, 0, 0.9636735916137695, 0);

	-- StarterGui.main_gui.MainFrame.exit
	GUI["3ceeeeeeeeeeeeeeeeeeeeeee"] = Instance.new("TextButton", GUI["14"]);
	GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]["BackgroundColor3"] = Color3.fromRGB(255, 0, 0);
	GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]["AnchorPoint"] = Vector2.new(0.5, 1);
	GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]["Size"] = UDim2.new(0.12084130942821503, 0, 0, 32);
	GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]["Name"] = [[exit]];
	GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]["Text"] = [[]];
	GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]["Position"] = UDim2.new(0.9025793671607971, 0, 0.9865297675132751, 0);

	-- StarterGui.main_gui.MainFrame.exit.UICorner
	GUI["3deeeeeeeeeeeeeeeeeeeeeee"] = Instance.new("UICorner", GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]);
	GUI["3deeeeeeeeeeeeeeeeeeeeeee"]["CornerRadius"] = UDim.new(0, 4);

	-- StarterGui.main_gui.MainFrame.exit.UIStroke
	GUI["3eeeeeeeeeeeeeeeeeeeeeeee"] = Instance.new("UIStroke", GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]);
	GUI["3eeeeeeeeeeeeeeeeeeeeeeee"]["Color"] = Color3.fromRGB(83, 83, 83);
	GUI["3eeeeeeeeeeeeeeeeeeeeeeee"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	-- StarterGui.main_gui.MainFrame.exit.Title
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"] = Instance.new("TextLabel", GUI["3ceeeeeeeeeeeeeeeeeeeeeee"]);
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["TextWrapped"] = true;
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["TextSize"] = 14;
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["Text"] = [[Exit]];
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["Name"] = [[Title]];
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["Font"] = Enum.Font.Gotham;
	GUI["3feeeeeeeeeeeeeeeeeeeeeee"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.CurrentlyPlaying
	GUI["40"] = Instance.new("Frame", GUI["1"]);
	GUI["40"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18);
	GUI["40"]["Size"] = UDim2.new(0, 394, 0, 204);
	GUI["40"]["Position"] = UDim2.new(0.6944240927696228, 0, 0.7165541648864746, 0);
	GUI["40"]["Name"] = [[CurrentlyPlaying]];

	-- StarterGui.main_gui.CurrentlyPlaying.Song
	GUI["41"] = Instance.new("Frame", GUI["40"]);
	GUI["41"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
	GUI["41"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
	GUI["41"]["Size"] = UDim2.new(0.9500000476837158, 0, 0.8414265513420105, 0);
	GUI["41"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
	GUI["41"]["Name"] = [[Song]];

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Title
	GUI["42"] = Instance.new("TextLabel", GUI["41"]);
	GUI["42"]["TextWrapped"] = true;
	GUI["42"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	GUI["42"]["TextYAlignment"] = Enum.TextYAlignment.Top;
	GUI["42"]["TextScaled"] = true;
	GUI["42"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["42"]["TextSize"] = 14;
	GUI["42"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["42"]["Size"] = UDim2.new(0.709409236907959, 0, 0.44346001744270325, 0);
	GUI["42"]["Text"] = [[Song]];
	GUI["42"]["Name"] = [[Title]];
	GUI["42"]["Font"] = Enum.Font.GothamBold;
	GUI["42"]["BackgroundTransparency"] = 1;
	GUI["42"]["Position"] = UDim2.new(0.2882955074310303, 0, 0.000647239969111979, 0);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.By
	GUI["43"] = Instance.new("TextLabel", GUI["41"]);
	GUI["43"]["TextWrapped"] = true;
	GUI["43"]["TextXAlignment"] = Enum.TextXAlignment.Left;
	GUI["43"]["TextScaled"] = true;
	GUI["43"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["43"]["TextSize"] = 14;
	GUI["43"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["43"]["Size"] = UDim2.new(0.709409236907959, 0, 0.15195725858211517, 0);
	GUI["43"]["Text"] = [[By: Spotify]];
	GUI["43"]["Name"] = [[By]];
	GUI["43"]["Font"] = Enum.Font.Gotham;
	GUI["43"]["BackgroundTransparency"] = 1;
	GUI["43"]["Position"] = UDim2.new(0.2882955074310303, 0, 0.43751510977745056, 0);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.ImageLabel
	GUI["44"] = Instance.new("ImageLabel", GUI["41"]);
	GUI["44"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["44"]["Image"] = [[rbxasset://textures/ui/GuiImagePlaceholder.png]];
	GUI["44"]["Size"] = UDim2.new(0, 100, 0, 100);
	GUI["44"]["Position"] = UDim2.new(0, 0, -0.020663965493440628, 0);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.ImageLabel.UICorner
	GUI["45"] = Instance.new("UICorner", GUI["44"]);


	-- StarterGui.main_gui.CurrentlyPlaying.Song.PauseResume
	GUI["46"] = Instance.new("TextButton", GUI["41"]);
	GUI["46"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 128);
	GUI["46"]["AnchorPoint"] = Vector2.new(0.5, 1);
	GUI["46"]["Size"] = UDim2.new(0.24789723753929138, 0, 0, 32);
	GUI["46"]["Name"] = [[PauseResume]];
	GUI["46"]["Text"] = [[]];
	GUI["46"]["Position"] = UDim2.new(0.496714323759079, 0, 0.9782251715660095, 0);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.PauseResume.UICorner
	GUI["47"] = Instance.new("UICorner", GUI["46"]);
	GUI["47"]["CornerRadius"] = UDim.new(0, 4);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.PauseResume.UIStroke
	GUI["48"] = Instance.new("UIStroke", GUI["46"]);
	GUI["48"]["Color"] = Color3.fromRGB(83, 83, 83);
	GUI["48"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	-- StarterGui.main_gui.CurrentlyPlaying.Song.PauseResume.Title
	GUI["49"] = Instance.new("TextLabel", GUI["46"]);
	GUI["49"]["TextWrapped"] = true;
	GUI["49"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["49"]["TextSize"] = 14;
	GUI["49"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["49"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["49"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["49"]["Text"] = [[Pause]];
	GUI["49"]["Name"] = [[Title]];
	GUI["49"]["Font"] = Enum.Font.Gotham;
	GUI["49"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.CurrentlyPlaying.Song.UICorner
	GUI["4a"] = Instance.new("UICorner", GUI["41"]);


	-- StarterGui.main_gui.CurrentlyPlaying.Song.UIPadding
	GUI["4b"] = Instance.new("UIPadding", GUI["41"]);
	GUI["4b"]["PaddingTop"] = UDim.new(0, 6);
	GUI["4b"]["PaddingRight"] = UDim.new(0, 6);
	GUI["4b"]["PaddingBottom"] = UDim.new(0, 6);
	GUI["4b"]["PaddingLeft"] = UDim.new(0, 6);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Next
	GUI["4c"] = Instance.new("TextButton", GUI["41"]);
	GUI["4c"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
	GUI["4c"]["AnchorPoint"] = Vector2.new(0.5, 1);
	GUI["4c"]["Size"] = UDim2.new(0.24789723753929138, 0, 0, 32);
	GUI["4c"]["Name"] = [[Next]];
	GUI["4c"]["Text"] = [[]];
	GUI["4c"]["Position"] = UDim2.new(0.8351404666900635, 0, 0.9782251715660095, 0);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Next.UICorner
	GUI["4d"] = Instance.new("UICorner", GUI["4c"]);
	GUI["4d"]["CornerRadius"] = UDim.new(0, 4);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Next.UIStroke
	GUI["4e"] = Instance.new("UIStroke", GUI["4c"]);
	GUI["4e"]["Color"] = Color3.fromRGB(83, 83, 83);
	GUI["4e"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Next.Title
	GUI["4f"] = Instance.new("TextLabel", GUI["4c"]);
	GUI["4f"]["TextWrapped"] = true;
	GUI["4f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["4f"]["TextSize"] = 14;
	GUI["4f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["4f"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["4f"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["4f"]["Text"] = [[Next]];
	GUI["4f"]["Name"] = [[Title]];
	GUI["4f"]["Font"] = Enum.Font.Gotham;
	GUI["4f"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Previous
	GUI["50"] = Instance.new("TextButton", GUI["41"]);
	GUI["50"]["BackgroundColor3"] = Color3.fromRGB(28, 28, 28);
	GUI["50"]["AnchorPoint"] = Vector2.new(0.5, 1);
	GUI["50"]["Size"] = UDim2.new(0.24789723753929138, 0, 0, 32);
	GUI["50"]["Name"] = [[Previous]];
	GUI["50"]["Text"] = [[]];
	GUI["50"]["Position"] = UDim2.new(0.1615738868713379, 0, 0.9782251715660095, 0);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Previous.UICorner
	GUI["51"] = Instance.new("UICorner", GUI["50"]);
	GUI["51"]["CornerRadius"] = UDim.new(0, 4);

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Previous.UIStroke
	GUI["52"] = Instance.new("UIStroke", GUI["50"]);
	GUI["52"]["Color"] = Color3.fromRGB(83, 83, 83);
	GUI["52"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Previous.Title
	GUI["53"] = Instance.new("TextLabel", GUI["50"]);
	GUI["53"]["TextWrapped"] = true;
	GUI["53"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["53"]["TextSize"] = 14;
	GUI["53"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["53"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["53"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["53"]["Text"] = [[Previous]];
	GUI["53"]["Name"] = [[Title]];
	GUI["53"]["Font"] = Enum.Font.Gotham;
	GUI["53"]["BackgroundTransparency"] = 1;

	-- StarterGui.main_gui.CurrentlyPlaying.Song.Time
	GUI["54"] = Instance.new("TextLabel", GUI["41"]);
	GUI["54"]["TextWrapped"] = true;
	GUI["54"]["TextScaled"] = true;
	GUI["54"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["54"]["TextSize"] = 14;
	GUI["54"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["54"]["Size"] = UDim2.new(0.6580036282539368, 0, 0.11124344915151596, 0);
	GUI["54"]["Text"] = [[1:00 / 2:30]];
	GUI["54"]["Name"] = [[Time]];
	GUI["54"]["Font"] = Enum.Font.Gotham;
	GUI["54"]["BackgroundTransparency"] = 1;
	GUI["54"]["Position"] = UDim2.new(0.168845072388649, 0, 0.6254249811172485, 0);

	-- StarterGui.main_gui.CurrentlyPlaying.UICorner
	GUI["55"] = Instance.new("UICorner", GUI["40"]);
	
	-- Settings
	-- StarterGui.a.MainFrame.Reset0Auth
	GUI["Reset0Auth"] = Instance.new("TextButton", GUI["14"]);
	GUI["Reset0Auth"]["BackgroundColor3"] = Color3.fromRGB(0, 255, 129);
	GUI["Reset0Auth"]["AnchorPoint"] = Vector2.new(0.5, 1);
	GUI["Reset0Auth"]["Size"] = UDim2.new(0.949999988079071, 0, 0, 32);
	GUI["Reset0Auth"]["Name"] = [[Reset0Auth]];
	GUI["Reset0Auth"]["Text"] = [[]];
	GUI["Reset0Auth"]["Position"] = UDim2.new(0.5, 0, 0.8045297861099243, 0);

	-- StarterGui.a.MainFrame.Reset0Auth.UICorner
	GUI["Reset0Auth2f"] = Instance.new("UICorner", GUI["Reset0Auth"]);
	GUI["Reset0Auth2f"]["CornerRadius"] = UDim.new(0, 4);

	-- StarterGui.a.MainFrame.Reset0Auth.UIStroke
	GUI["Reset0Auth30"] = Instance.new("UIStroke", GUI["Reset0Auth"]);
	GUI["Reset0Auth30"]["Color"] = Color3.fromRGB(84, 84, 84);
	GUI["Reset0Auth30"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

	-- StarterGui.a.MainFrame.Reset0Auth.Title
	GUI["Reset0Auth31"] = Instance.new("TextLabel", GUI["Reset0Auth"]);
	GUI["Reset0Auth31"]["TextWrapped"] = true;
	GUI["Reset0Auth31"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	GUI["Reset0Auth31"]["TextSize"] = 14;
	GUI["Reset0Auth31"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
	GUI["Reset0Auth31"]["AutomaticSize"] = Enum.AutomaticSize.Y;
	GUI["Reset0Auth31"]["Size"] = UDim2.new(1, 0, 1, 0);
	GUI["Reset0Auth31"]["Text"] = [[Reset OAuth Token]];
	GUI["Reset0Auth31"]["Name"] = [[Title]];
	GUI["Reset0Auth31"]["Font"] = Enum.Font.Gotham;
	GUI["Reset0Auth31"]["BackgroundTransparency"] = 1;
end

local GUI_ = GUI["1"]

httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local getcustomasset = getcustomasset or getsynasset

if not isfolder then
	warn("Missing File System.")
	warn("Script made by mstudio45#5590")
	warnmessage("SPOTIFYPLAYER", "Missing File System. Script will not load.")
	return
end
if not httprequest then
	warn("Missing http request function.")
	warn("Script made by mstudio45#5590")
	warnmessage("SPOTIFYPLAYER", "Missing http request function. Script will not load.")
	return
end

if not getcustomasset then
	warnmessage("SPOTIFYPLAYER", "Images will not load, missing 'getcustomasset' function.")
end

local CONFIG_NAME = "SpotifyPlayer_mstudio45"
local OAuthTokenTXT = CONFIG_NAME.."/".."OAuthToken.txt"
local CachedSongImages = CONFIG_NAME.."/CachedSongImages"
local function checkdir(NAME) if not isfolder(NAME) then makefolder(NAME) end end
checkdir(CONFIG_NAME)
checkdir(CachedSongImages)

local _token_valid = false
local _token = ""

local scriptRunning = true

function OAuthOpen()
	GUI_.OAuthTokenFrame.Visible = true
end
function OAuthClose()
	GUI_.OAuthTokenFrame.Visible = false
end

function MainOpen()
	if GUI_.OAuthTokenFrame.Visible == true and _token_valid == true then
		OAuthClose()
	end
	GUI_.MainFrame.Visible = true
	GUI_.CurrentlyPlaying.Visible = true
end
function MainClose()
	GUI_.CurrentlyPlaying.Visible = false
	GUI_.MainFrame.Visible = false
end

GUI_.CurrentlyPlaying.Visible = false
MainClose()OAuthClose()

GUI_.OAuthTokenFrame.Main.Button.MouseButton1Click:Connect(function()
	_token = GUI_.OAuthTokenFrame.Main.OAuthToken.Title.Text
	_token_valid = true
	task.spawn(function()
		normalmessage("SPOTIFYPLAYER", "Trying to save OAuth Token!")
		local s,e
		repeat task.wait()
			s,e = pcall(function()
				writefile(OAuthTokenTXT, _token)
			end)
		until not e and s
		normalmessage("SPOTIFYPLAYER", "OAuth Token saved!")
		OAuthClose()
		MainOpen()
	end)
end)

if isfile(OAuthTokenTXT) then
	_token = readfile(OAuthTokenTXT)
	_token_valid = true
else
	OAuthOpen()
	repeat task.wait() until _token_valid == true
end

OAuthClose()MainOpen()

local function spotify_POST(url)
	httprequest({
		Url = url,
		Method = "POST",
		Headers = {
			["Authorization"] = "Bearer " .. _token,
			["Accept"] = "application/json",
			["Content-Type"] = "application/json"
		}
	})
end
local function spotify_PUT(url)
	httprequest({
		Url = url,
		Method = "PUT",
		Headers = {
			["Authorization"] = "Bearer " .. _token,
			["Accept"] = "application/json",
			["Content-Type"] = "application/json"
		}
	})
end
local function spotify_GET(url)
	local data = httprequest({
		Url = url,
		Method = "GET",
		Headers = {
			["Authorization"] = "Bearer " .. _token,
			["Accept"] = "application/json",
			["Content-Type"] = "application/json"
		}
	})
	return HttpService:JSONDecode(data.Body)
end

function PlaylistExample(PlaylistName, Tracks)
	local Playlist = {}

	-- Render
	do
		-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample
		Playlist["25"] = Instance.new("ScrollingFrame", GUI["1e"]);
		Playlist["25"]["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		Playlist["25"]["BackgroundColor3"] = Color3.fromRGB(18, 18, 18);
		Playlist["25"]["AutomaticCanvasSize"] = Enum.AutomaticSize.XY;
		Playlist["25"]["Size"] = UDim2.new(0, 430, 0, 263);
		Playlist["25"]["ScrollBarThickness"] = 0;
		Playlist["25"]["Position"] = UDim2.new(0.03455723449587822, 0, 0.01687205210328102, 0);
		Playlist["25"]["Name"] = PlaylistName or "Unknown Playlist";

		-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample.UICorner
		Playlist["26"] = Instance.new("UICorner", Playlist["25"]);


		-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample.PlaylistName
		Playlist["27"] = Instance.new("Frame", Playlist["25"]);
		Playlist["27"]["BackgroundColor3"] = Color3.fromRGB(91, 0, 0);
		Playlist["27"]["AnchorPoint"] = Vector2.new(0.5, 0);
		Playlist["27"]["BackgroundTransparency"] = 1;
		Playlist["27"]["LayoutOrder"] = -1;
		Playlist["27"]["Size"] = UDim2.new(0.949999988079071, 0, 0, 20);
		Playlist["27"]["Position"] = UDim2.new(0.5, 0, 0, 0);
		Playlist["27"]["Name"] = [[PlaylistName]];

		-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample.PlaylistName.Title
		Playlist["28"] = Instance.new("TextLabel", Playlist["27"]);
		Playlist["28"]["TextWrapped"] = true;
		Playlist["28"]["TextYAlignment"] = Enum.TextYAlignment.Top;
		Playlist["28"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		Playlist["28"]["TextSize"] = 14;
		Playlist["28"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
		Playlist["28"]["AutomaticSize"] = Enum.AutomaticSize.Y;
		Playlist["28"]["Size"] = UDim2.new(1, 0, 1, 0);
		Playlist["28"]["Text"] = PlaylistName or "Unknown Playlist";
		Playlist["28"]["Name"] = [[Title]];
		Playlist["28"]["Font"] = Enum.Font.GothamBold;
		Playlist["28"]["BackgroundTransparency"] = 1;

		-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample.PlaylistName.Title.UICorner
		Playlist["29"] = Instance.new("UICorner", Playlist["28"]);


		-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample.PlaylistName.UIPadding
		Playlist["2a"] = Instance.new("UIPadding", Playlist["27"]);
		Playlist["2a"]["PaddingTop"] = UDim.new(0, 6);
		Playlist["2a"]["PaddingRight"] = UDim.new(0, 6);
		Playlist["2a"]["PaddingBottom"] = UDim.new(0, 6);
		Playlist["2a"]["PaddingLeft"] = UDim.new(0, 6);

		-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.UIListLayout
		Playlist["36"] = Instance.new("UIListLayout", Playlist["25"]);
		Playlist["36"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center;
		Playlist["36"]["Padding"] = UDim.new(0, 15);
		Playlist["36"]["SortOrder"] = Enum.SortOrder.LayoutOrder;
	end

	function Playlist:AddSong(track_info)
		if not track_info or typeof(track_info) ~= "table" then return end
		
		-- Render
		do
			-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample.Song
			Playlist["2b"] = Instance.new("Frame", Playlist["25"]);
			Playlist["2b"]["BackgroundColor3"] = Color3.fromRGB(50, 50, 50);
			Playlist["2b"]["AnchorPoint"] = Vector2.new(0.5, 0);
			Playlist["2b"]["Size"] = UDim2.new(0.949999988079071, 0, 0.4890650808811188, 20);
			Playlist["2b"]["Position"] = UDim2.new(0.5, 0, 0.11406844109296799, 0);
			Playlist["2b"]["Name"] = [[Song]];

			-- StarterGui.main_gui.MainFrame.Main.Playlists.PlaylistExample.Song.UIPadding
			Playlist["2c"] = Instance.new("UIPadding", Playlist["2b"]);
			Playlist["2c"]["PaddingTop"] = UDim.new(0, 6);
			Playlist["2c"]["PaddingRight"] = UDim.new(0, 6);
			Playlist["2c"]["PaddingBottom"] = UDim.new(0, 6);
			Playlist["2c"]["PaddingLeft"] = UDim.new(0, 6);

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.Title
			Playlist["2d"] = Instance.new("TextLabel", Playlist["2b"]);
			Playlist["2d"]["TextWrapped"] = true;
			Playlist["2d"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Playlist["2d"]["TextYAlignment"] = Enum.TextYAlignment.Top;
			Playlist["2d"]["TextScaled"] = true;
			Playlist["2d"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Playlist["2d"]["TextSize"] = 14;
			Playlist["2d"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Playlist["2d"]["Size"] = UDim2.new(0.6580036282539368, 0, 0.47603046894073486, 0);
			Playlist["2d"]["Text"] = [[Song]];
			Playlist["2d"]["Name"] = [[Title]];
			Playlist["2d"]["Font"] = Enum.Font.GothamBold;
			Playlist["2d"]["BackgroundTransparency"] = 1;
			Playlist["2d"]["Position"] = UDim2.new(0.33970028162002563, 0, 0.022382447496056557, 0);

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.By
			Playlist["2e"] = Instance.new("TextLabel", Playlist["2b"]);
			Playlist["2e"]["TextWrapped"] = true;
			Playlist["2e"]["TextXAlignment"] = Enum.TextXAlignment.Left;
			Playlist["2e"]["TextScaled"] = true;
			Playlist["2e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Playlist["2e"]["TextSize"] = 14;
			Playlist["2e"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
			Playlist["2e"]["Size"] = UDim2.new(0.6580036282539368, 0, 0.1631179302930832, 0);
			Playlist["2e"]["Text"] = [[Spotify]];
			Playlist["2e"]["Name"] = [[By]];
			Playlist["2e"]["Font"] = Enum.Font.Gotham;
			Playlist["2e"]["BackgroundTransparency"] = 1;
			Playlist["2e"]["Position"] = UDim2.new(0.33970028162002563, 0, 0.4913366734981537, 0);

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.ImageLabel
			Playlist["2f"] = Instance.new("ImageLabel", Playlist["2b"]);
			Playlist["2f"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Playlist["2f"]["Image"] = [[rbxasset://textures/ui/PlaylistImagePlaceholder.png]];
			Playlist["2f"]["Size"] = UDim2.new(0, 100, 0, 100);
			Playlist["2f"]["Position"] = UDim2.new(0, 0, -0.020663965493440628, 0);

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.ImageLabel.UICorner
			Playlist["30"] = Instance.new("UICorner", Playlist["2f"]);


			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.Play
			Playlist["31"] = Instance.new("TextButton", Playlist["2b"]);
			Playlist["31"]["BackgroundColor3"] = Color3.fromRGB(0, 255, 128);
			Playlist["31"]["AnchorPoint"] = Vector2.new(0.5, 1);
			Playlist["31"]["Size"] = UDim2.new(0.9977038502693176, 0, 0, 32);
			Playlist["31"]["Name"] = [[Play]];
			Playlist["31"]["Text"] = [[]];
			Playlist["31"]["Position"] = UDim2.new(0.4988519549369812, 0, 0.9914208650588989, 0);

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.Play.UICorner
			Playlist["32"] = Instance.new("UICorner", Playlist["31"]);
			Playlist["32"]["CornerRadius"] = UDim.new(0, 4);

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.Play.UIStroke
			Playlist["33"] = Instance.new("UIStroke", Playlist["31"]);
			Playlist["33"]["Color"] = Color3.fromRGB(83, 83, 83);
			Playlist["33"]["ApplyStrokeMode"] = Enum.ApplyStrokeMode.Border;

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.Play.Title
			Playlist["34"] = Instance.new("TextLabel", Playlist["31"]);
			Playlist["34"]["TextWrapped"] = true;
			Playlist["34"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
			Playlist["34"]["TextSize"] = 14;
			Playlist["34"]["TextColor3"] = Color3.fromRGB(0, 0, 0);
			Playlist["34"]["AutomaticSize"] = Enum.AutomaticSize.Y;
			Playlist["34"]["Size"] = UDim2.new(1, 0, 1, 0);
			Playlist["34"]["Text"] = [[Add to Queue]];
			Playlist["34"]["Name"] = [[Title]];
			Playlist["34"]["Font"] = Enum.Font.Gotham;
			Playlist["34"]["BackgroundTransparency"] = 1;

			-- StarterPlaylist.main_Playlist.MainFrame.Main.Playlists.PlaylistExample.Song.UICorner
			Playlist["35"] = Instance.new("UICorner", Playlist["2b"]);
		end

		-- Logic
		do
			Playlist["2d"]["Text"] = track_info.track.name
			Playlist["2b"]["Name"] = track_info.track.name

			-- Getting Artists
			local SongArtists = ""
			local ArtistsTable = {}
			for _, artist in next, track_info.track.artists do
				table.insert(ArtistsTable, artist.name)
			end
			Playlist["2e"]["Text"] = string.format("%s%s", table.concat(ArtistsTable, ", "), SongArtists)
			
			if getcustomasset then
				task.defer(function()
					if track_info.track.album.images then
						for _,image in pairs(track_info.track.album.images) do
							if scriptRunning == false then break end
							
							if image.url ~= nil then
								local song_image_name = track_info.track.name .. "_" .. Playlist["2e"]["Text"]
								local song_file = CachedSongImages.."/"..song_image_name..".png"
								if not isfile(song_file) then
									pcall(function()
										writefile(song_file, game:HttpGet(image.url))
									end)
								end
								
								task.wait()
								task.defer(function()
									if isfile(song_file) then 
										local song_image_rbxasset = getcustomasset(song_file) 
										if song_image_rbxasset then
											Playlist["2f"].Image = song_image_rbxasset
										end
									end
								end)

								break
							end
						end
					end
				end)
			end

			local ADDTOQUEUEDEBOUNCE = false
			Playlist["31"].MouseButton1Click:Connect(function()
				if ADDTOQUEUEDEBOUNCE == false then
					ADDTOQUEUEDEBOUNCE = true
					Playlist["34"]["Text"] = [[Added to Queue!]];
					task.spawn(function()
						spotify_POST("https://api.spotify.com/v1/me/player/queue?uri="..track_info.track.uri)
					end)
					task.wait(2)
					Playlist["34"]["Text"] = [[Add to Queue]];
					ADDTOQUEUEDEBOUNCE = false
				end
			end)
		end
	end

	-- Logic
	do
		local PlaylistTracks = nil
		repeat
			PlaylistTracks = spotify_GET(Tracks)
			if PlaylistTracks and PlaylistTracks.items then
				break
			end

			task.wait(10)
		until PlaylistTracks and PlaylistTracks.items

		local num = 0
		for _, Track in pairs(PlaylistTracks.items) do
			Playlist:AddSong(Track)
			task.wait(.1)
		end
	end
end

local isMobile = false
local mobiletoggles,mobiletoggleerr=pcall(function()
	local platform = game:GetService("UserInputService"):GetPlatform()
	isMobile = (platform == Enum.Platform.Android or platform == Enum.Platform.IOS)
end)

-- Currently Playing
--local SongImage = nil
--pcall(function() SongImage = Drawing.new("Image") end)
--function changeimagepos()
--	if SongImage then SongImage.Position = Vector2.new(GUI_.CurrentlyPlaying.Song.ImageLabel.AbsolutePosition.X, GUI_.CurrentlyPlaying.Song.ImageLabel.AbsolutePosition.Y+36) end
--end
--changeimagepos();if SongImage then SongImage.Size = Vector2.new(100, 100) end

task.defer(function()
	local function ConvertDurS(s)
		return string.format("%02i:%02i", s/60%60, s%60)
	end

	local PAUSEDEBOUNCE = false
	local SongPlaying = false
	GUI_.CurrentlyPlaying.Song.PauseResume.MouseButton1Click:Connect(function()
		if SongPlaying == true then
			GUI_.CurrentlyPlaying.Song.PauseResume.Title.Text = "Resume"
			spotify_PUT("https://api.spotify.com/v1/me/player/pause")
		elseif SongPlaying == false then
			GUI_.CurrentlyPlaying.Song.PauseResume.Title.Text = "Pause"
			spotify_PUT("https://api.spotify.com/v1/me/player/play")
		end
	end)

	GUI_.CurrentlyPlaying.Song.Next.MouseButton1Click:Connect(function()
		spotify_POST("https://api.spotify.com/v1/me/player/next")
	end)
	GUI_.CurrentlyPlaying.Song.Previous.MouseButton1Click:Connect(function()
		spotify_POST("https://api.spotify.com/v1/me/player/previous")
	end)
	
	local CurSongName = Instance.new("StringValue", GUI_)
	CurSongName.Name = "current_song_name__dont_touch"
	local cursong_image, cursong_artists = "", ""
	CurSongName:GetPropertyChangedSignal("Value"):Connect(function()
		task.wait(.5)
		local song_image_name = GUI_.CurrentlyPlaying.Song.Title.Text .. "_" .. GUI_.CurrentlyPlaying.Song.By.Text
		local song_file = CachedSongImages.."/"..song_image_name..".png"
		if not isfile(song_file) then
			pcall(function()
				writefile(song_file, game:HttpGet(cursong_image))
			end)
		end

		task.wait()
		task.defer(function()
			if isfile(song_file) then 
				local song_image_rbxasset = getcustomasset(song_file) 
				if song_image_rbxasset then
					GUI_.CurrentlyPlaying.Song.ImageLabel.Image = song_image_rbxasset
				end
			end
		end)
	end)
	
	task.defer(function()
		while task.wait(isMobile and 2 or 1) do
			if scriptRunning == false then break end
			repeat task.wait() until _token_valid == true

			--	pcall(function()
			local CurSong = spotify_GET("https://api.spotify.com/v1/me/player/currently-playing")
			local SongArtists = ""

			-- Checks
			if not CurSong then
				SongPlaying = false
				print(CurSong)
				task.wait(5)
				return
			end
			if not CurSong.item then
				SongPlaying = false
				print(CurSong)
				task.wait(5)
				return
			end
			GUI_.CurrentlyPlaying.Visible = true
			--if SongImage then SongImage.Visible = true end
			
			GUI_.CurrentlyPlaying.Song.PauseResume.Visible = true
			GUI_.CurrentlyPlaying.Song.Next.Visible = true	
			GUI_.CurrentlyPlaying.Song.Previous.Visible = true
			SongPlaying = CurSong.is_playing

			-- Getting Artists
			local ArtistsTable = {}
			for _, artist in next, CurSong.item.artists do
				table.insert(ArtistsTable, artist.name)
			end

			GUI_.CurrentlyPlaying.Song.By.Text = string.format("%s%s", table.concat(ArtistsTable, ", "), SongArtists)
			GUI_.CurrentlyPlaying.Song.Title.Text = CurSong.item.name
			GUI_.CurrentlyPlaying.Song.Time.Text = ConvertDurS(CurSong.progress_ms/1000) .. " / " .. ConvertDurS(CurSong.item.duration_ms/1000)

			if CurSongName.Value ~= GUI_.CurrentlyPlaying.Song.Title.Text then
				CurSongName.Value = GUI_.CurrentlyPlaying.Song.Title.Text
			end
			
			pcall(function()
				cursong_image = CurSong.item.album.images[1].url
			end)
			--end)
		end
	end)
end)

-- Playlists
do
	task.defer(function()
		local playlists = nil
		repeat
			playlists = spotify_GET("https://api.spotify.com/v1/me/playlists?offset=0&limit=20")
			if playlists and playlists.items then
				break
			end

			task.wait(10)
		until playlists and playlists.items

		for _, playlist in pairs(playlists.items) do
			if playlist.type == "playlist" then
				if playlist.tracks.total > 0 then
					PlaylistExample((playlist.name or "Playlist").." by "..(playlist.owner.display_name or "Unknown Creator"), playlist.tracks.href)
				end
			end
		end
	end)
end

GUI["Reset0Auth"].MouseButton1Click:Connect(function()
	pcall(function()
		delfile(OAuthTokenTXT)
	end)
	_token = ""
	_token_valid = false
	MainClose()
	OAuthOpen()
end)

-- Dragging (CurrentlyPlaying)
do
	local UIS = game:GetService('UserInputService')
	local frame = GUI_.CurrentlyPlaying
	local dragToggle = nil
	local dragSpeed = 0
	local dragStart = nil
	local startPos = nil
	local function updateInput(input)
		--changeimagepos()
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end

-- Dragging (MainFrame)
do
	local UIS = game:GetService('UserInputService')
	local frame = GUI_.MainFrame
	local dragToggle = nil
	local dragSpeed = 0
	local dragStart = nil
	local startPos = nil
	local function updateInput(input)
		local delta = input.Position - dragStart
		local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
		game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
	end

	frame.InputBegan:Connect(function(input)
		if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
			dragToggle = true
			dragStart = input.Position
			startPos = frame.Position
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragToggle = false
				end
			end)
		end
	end)

	UIS.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			if dragToggle then
				updateInput(input)
			end
		end
	end)
end

GUI["3ceeeeeeeeeeeeeeeeeeeeeee"].MouseButton1Click:Connect(function()
	warn("GUI Closed.")
	MainClose()
	scriptRunning = false
	GUI["1"]:Destroy()
	--if SongImage then
	--	SongImage:Remove() 
	--end
end)
