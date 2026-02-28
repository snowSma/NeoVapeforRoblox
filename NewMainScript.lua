repeat wait() until game:IsLoaded() == true
print("========== VAPE DEBUG START ==========")
print("Game loaded successfully!")
wait(1)
print("Waiting complete")

local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end

local getasset = getsynasset or getcustomasset
if getasset == nil then
	getgenv().getcustomasset = function(location) return "rbxasset://"..location end
	getasset = getgenv().getcustomasset
end
print("getasset function:", getasset ~= nil)

local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport
print("queueteleport function:", queueteleport ~= nil)

local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
print("requestfunc function:", requestfunc ~= nil)

-- Rest of the code continues...
if not (getasset and requestfunc and queueteleport) then
	print("FAILED: Vape not supported with your exploit.")
	print("Missing:", getasset == nil and "getasset " or "", requestfunc == nil and "requestfunc " or "", queueteleport == nil and "queueteleport" or "")
	return
end
print("All functions present, continuing...")
repeat wait() until game:IsLoaded() == true
wait(1) -- Extra wait for game to fully load

local function GetURL(scripturl)
	if shared.VapeDeveloper then
		return readfile("vape/"..scripturl)
	else
		return game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/"..scripturl, true)
	end
end

-- Better compatibility for different executors
local getasset = getsynasset or getcustomasset or function(path)
    return "rbxasset://"..path
end

local queueteleport = syn and syn.queue_on_teleport or queue_on_teleport or fluxus and fluxus.queue_on_teleport or function() end

local requestfunc = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request or function()
    return {StatusCode = 200, Body = ""}
end

-- Remove the executor check or make it a warning instead
if not (requestfunc and queueteleport) then
	warn("Some features may not work with your executor.")
end

-- Continue with rest of script...
