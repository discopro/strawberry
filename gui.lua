local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "StrawberryGUI", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})

--Player Tab--

local PlayerTab = Window:MakeTab({
	Name = "Admin",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local victim

PlayerTab:AddTextbox({
	Name = "VictimsName",
	Default = "",
	TextDisappear = false,
	Callback = function(Value)
		victim = Value
	end	  
})

PlayerTab:AddButton({
	Name = "KillAll",
	Callback = function()
		for _,v in pairs(game.Players:GetChildren()) do
			local args = {
				[1] = v.Character.Humanoid,
				[2] = 1000,
				[3] = 0,
				[4] = 0
			}
			game:GetService("ReplicatedStorage").GE_Engine.Events.Damage:FireServer(unpack(args))
		end
	end    
})

PlayerTab:AddButton({
	Name = "KillVictim",
	Callback = function()
		pcall(function()
			local args = {
				[1] = game.Players:FindFirstChild(victim).Character.Humanoid,
				[2] = 1000,
				[3] = 0,
				[4] = 0
			}
			game:GetService("ReplicatedStorage").GE_Engine.Events.Damage:FireServer(unpack(args))
		end)
	end    
})

PlayerTab:AddButton({
	Name = "GodMode (MAY HAVE TO CLICK A COUPLE TIMES)",
	Callback = function()
		local args = {
			[1] = game.Players.LocalPlayer.Character.Humanoid,
			[2] = -10000000000,
			[3] = 0,
			[4] = 0
		}
		game:GetService("ReplicatedStorage").GE_Engine.Events.Damage:FireServer(unpack(args))
	end    
})


--Player Tab End--

--Settings Tab--

local SettingsTab = Window:MakeTab({
	Name = "Settings",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

local SettingsSection = SettingsTab:AddSection({
	Name = "Settings"
})

SettingsSection:AddButton({
	Name = "Destroy UI",
	Callback = function()
		OrionLib:Destroy()
	end    
})

--Settings End--

OrionLib:Init() --UI Lib End
