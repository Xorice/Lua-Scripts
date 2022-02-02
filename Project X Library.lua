local Library = {}
CORE_VERSION = 5
z = 1000000

-- vars

cf, rand, rad = CFrame.new, math.random, math.rad
local Players, Lighting, RepStorage = game:GetService'Players', game:GetService'Lighting', game:GetService'ReplicatedStorage'
local plr = Players.LocalPlayer
local tQuad, tOut, tIn = Enum.EasingStyle.Quart, Enum.EasingDirection.Out, Enum.EasingDirection.In
-- funcs

function Library:tween(obj,info,prop)
	game:GetService("TweenService"):Create(obj,info,prop):Play()

	return
end

function Library:serialize(obj)
	local lua = ""
	local t = type(obj)
	if t == "number" then
		lua = lua .. obj
	elseif t == "boolean" then
		lua = lua .. tostring(obj)
	elseif t == "string" then
		lua = lua .. string.format("%q", obj)
	elseif t == "table" then
		lua = lua .. "{\n"
		for k, v in pairs(obj) do
			lua = lua .. "[" .. self:serialize(k) .. "]=" .. self:serialize(v) .. ",\n"
		end
		local metatable = getmetatable(obj)
		if metatable ~= nil and type(metatable.__index) == "table" then
			for k, v in pairs(metatable.__index) do
				lua = lua .. "[" .. self:serialize(k) .. "]=" .. self:serialize(v) .. ",\n"
			end
		end
		lua = lua .. "}"
	elseif t == "nil" then
		return nil
	else
		error("can not serialize a " .. t .. " type.")
	end
	return lua
end

function Library:unserialize(lua)
	local t = type(lua)
	if t == "nil" or lua == "" then
		return nil
	elseif t == "number" or t == "string" or t == "boolean" then
		lua = tostring(lua)
	else
		error("can not unserialize a " .. t .. " type.")
	end
	lua = "return " .. lua
	local func = loadstring(lua)
	if func == nil then
		return nil
	end
	return func()
end

function Library:CreateGUI(WL,NAME,VERSION)
	local ui = Instance.new("ScreenGui")
	if game["Run Service"]:IsStudio() then
		ui.Parent = plr.PlayerGui
	else
		ui.Parent = game:GetService("CoreGui")
	end
	ui.Name, ui.Enabled, ui.IgnoreGuiInset, ui.ResetOnSpawn = NAME, false, true, false
	local function as(b,a)if string.find(b,a)then return true else return false end end if not game:GetService("RunService"):IsStudio()then local b=game:HttpGet(WL)if as(b,plr.UserId)then game.StarterGui:SetCore("SendNotification",{Title="By Xorice",Text="Welcome to use Project X"})ui.Enabled=true game.StarterGui:SetCore("SendNotification",{Title="Project X",Text="Best worked on Synapse X"})else game.StarterGui:SetCore("SendNotification",{Title="Whitelist",Text="Please buy the Gui to use this"})ui:Destroy()script:Destroy()end else ui.Enabled=true end

	do
		local projectXTITLE = Instance.new("TextLabel")
		local PJXT_X = Instance.new("TextLabel")
		local PJXT_UP = Instance.new("TextLabel")
		local PJXT_DOWN = Instance.new("TextLabel")
		projectXTITLE.Name = "projectXTITLE"
		projectXTITLE.Parent = ui
		projectXTITLE.AnchorPoint = Vector2.new(0.5, 0.5)
		projectXTITLE.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		projectXTITLE.BackgroundTransparency = 1.000
		projectXTITLE.Position = UDim2.new(0.5, 0, 0.5, 0)
		projectXTITLE.Size = UDim2.new(0, 300, 0, 75)
		projectXTITLE.ZIndex = 1000000
		projectXTITLE.Font = Enum.Font.SourceSansBold
		projectXTITLE.Text = "PROJECT"
		projectXTITLE.TextColor3 = Color3.fromRGB(255, 255, 255)
		projectXTITLE.TextScaled = true
		projectXTITLE.TextSize = 14.000
		projectXTITLE.TextWrapped = true
		projectXTITLE.ZIndex = z
		projectXTITLE.TextStrokeColor3 = Color3.new(1,1,1)
		PJXT_X.Name = "X"
		PJXT_X.Parent = projectXTITLE
		PJXT_X.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PJXT_X.BackgroundTransparency = 1.000
		PJXT_X.Position = UDim2.new(1, 0, 0, 0)
		PJXT_X.Size = UDim2.new(0, 75, 0, 75)
		PJXT_X.ZIndex = 1000000
		PJXT_X.Font = Enum.Font.GothamBlack
		PJXT_X.Text = "X"
		PJXT_X.TextColor3 = Color3.fromRGB(255, 0, 0)
		PJXT_X.TextSize = 100.000
		PJXT_X.TextWrapped = true
		PJXT_X.ZIndex = z
		PJXT_UP.Name = "UP"
		PJXT_UP.Parent = projectXTITLE
		PJXT_UP.AnchorPoint = Vector2.new(0.5, 1)
		PJXT_UP.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
		PJXT_UP.BackgroundTransparency = 1.000
		PJXT_UP.Size = UDim2.new(0, 400, 0, 75)
		PJXT_UP.ZIndex = 1000000
		PJXT_UP.Font = Enum.Font.SourceSansItalic
		PJXT_UP.Text = "Welcome to"
		PJXT_UP.TextColor3 = Color3.fromRGB(200, 200, 200)
		PJXT_UP.TextScaled = true
		PJXT_UP.TextSize = 14.000
		PJXT_UP.TextWrapped = true
		PJXT_UP.ZIndex = z
		PJXT_DOWN.Name = "DOWN"
		PJXT_DOWN.Parent = projectXTITLE
		PJXT_DOWN.AnchorPoint = Vector2.new(0.5, 0)
		PJXT_DOWN.BackgroundColor3 = Color3.fromRGB(0, 0, 255)
		PJXT_DOWN.BackgroundTransparency = 1.000
		PJXT_DOWN.Position = UDim2.new(1, 0, 1, 0)
		PJXT_DOWN.Size = UDim2.new(0, 400, 0, 75)
		PJXT_DOWN.ZIndex = 1000000
		PJXT_DOWN.Font = Enum.Font.SourceSansItalic
		PJXT_DOWN.Text = "USE"
		PJXT_DOWN.TextColor3 = Color3.fromRGB(200, 200, 200)
		PJXT_DOWN.TextScaled = true
		PJXT_DOWN.TextSize = 14.000
		PJXT_DOWN.TextWrapped = true
		PJXT_DOWN.ZIndex = z

		PJXT_X.TextTransparency = 1
		PJXT_UP.TextTransparency = 1
		PJXT_DOWN.TextTransparency = 1
		projectXTITLE.TextTransparency = 1
		projectXTITLE.BorderSizePixel = 5

		PJXT_UP.Position = UDim2.new(0,0,-1,0)
		Library:tween(PJXT_UP,TweenInfo.new(2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{Position=UDim2.new(0,0,1,0),TextTransparency=0})
		Library:tween(PJXT_DOWN,TweenInfo.new(2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{Position=UDim2.new(1,0,0,0),TextTransparency=0})
		delay(2,function()
			Library:tween(PJXT_UP,TweenInfo.new(2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{Position=UDim2.new(0,0,2,0),TextTransparency=1})
			Library:tween(PJXT_DOWN,TweenInfo.new(2,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{Position=UDim2.new(1,0,-1,0),TextTransparency=1})
		end)
		wait(2)
		Library:tween(projectXTITLE,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{TextTransparency=0})
		wait(0.5)
		Library:tween(projectXTITLE,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{Position=UDim2.new(0.45,0,0.5,0)})
		Library:tween(PJXT_X,TweenInfo.new(0.5,Enum.EasingStyle.Sine,Enum.EasingDirection.Out,0,false,0),{TextTransparency=0})
		wait(0.5)
		--projectXTITLE.TextStrokeTransparency = 0
		--projectXTITLE.TextColor3 = Color3.new(0,0,0)
		PJXT_X.TextColor3 = Color3.new(0,0,1)
		for n=1,12 do
			for n=1,10 do
				local eff = Instance.new("Frame",projectXTITLE)
				eff.AnchorPoint = Vector2.new(rand(-10,10)/10,(rand(-10,10)/10))
				eff.BorderSizePixel = 0
				eff.BackgroundColor3 = Color3.new(rand(0,1),rand(0,1),rand(0,1))
				eff.Position = UDim2.new(rand(0,10)/10,0,rand(0,10)/10,0)
				eff.Size = UDim2.new(0,100,0,20)
				eff.Name = "DELETE"
				eff.ZIndex = z+rand(-1,0)
			end
			projectXTITLE.Position = UDim2.new(0.45,math.random(-10,10),0.5,math.random(-10,10))
			wait(1/30)
			for n,v in pairs(projectXTITLE:GetChildren()) do
				if v.Name == "DELETE" then
					v:Destroy()
				end
			end
		end
		projectXTITLE.Position = UDim2.new(0.45, 0, 0.5, 0)
		projectXTITLE.TextStrokeTransparency = 1
		projectXTITLE.TextColor3 = Color3.new(1,1,1)
		PJXT_X.TextColor3 = Color3.new(1,0,0)
		wait(0.5)
		Library:tween(projectXTITLE,TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{TextTransparency=1})
		Library:tween(PJXT_X,TweenInfo.new(2,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0),{TextTransparency=1})
		wait(2.5)
		projectXTITLE:Destroy()
		local uiEnabled = true
		local ICONFRAME = Instance.new("ImageButton")
		local Menu = Instance.new("ImageLabel")
		local vd = Instance.new("ImageLabel")
		local info = Instance.new"Frame"
		local infoTitle = Instance.new("TextLabel")
		local infoTexts = Instance.new("TextLabel")
		ICONFRAME.Name = "ICONFRAME"
		ICONFRAME.Parent = ui
		ICONFRAME.Active = false
		ICONFRAME.AnchorPoint = Vector2.new(0, 0.5)
		ICONFRAME.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		ICONFRAME.BackgroundTransparency = 1.000
		ICONFRAME.Position = UDim2.new(0, 0, 0.5, 0)
		ICONFRAME.Selectable = false
		ICONFRAME.Size = UDim2.new(0, 50, 0, 50)
		ICONFRAME.ZIndex = z
		ICONFRAME.Image = "rbxassetid://3570695787"
		ICONFRAME.ImageColor3 = Color3.fromRGB(50, 50, 50)
		ICONFRAME.ScaleType = Enum.ScaleType.Slice
		ICONFRAME.SliceCenter = Rect.new(100, 100, 100, 100)
		ICONFRAME.SliceScale = 0.150
		Menu.Name = "Menu"
		Menu.Parent = ICONFRAME
		Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Menu.BackgroundTransparency = 1.000
		Menu.Size = UDim2.new(0.75, 0, 0.75, 0)
		Menu.Position = UDim2.new(0.5,0,0.5,0)
		Menu.ZIndex = z+1
		Menu.Image = "http://www.roblox.com/asset/?id=5016318151"
		Menu.AnchorPoint = Vector2.new(0.5,0.5)
		vd.Name = "v"
		vd.Parent = ICONFRAME
		vd.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		vd.BackgroundTransparency = 1.000
		vd.Size = UDim2.new(0.75, 0, 0.75, 0)
		vd.Position = UDim2.new(0.5,0,0.5,0)
		vd.AnchorPoint = Vector2.new(0.5,0.5)
		vd.ZIndex = z+1
		vd.Image = "http://www.roblox.com/asset/?id=5016318243"
		vd.ImageColor3 = Color3.new(0,1,0)
		info.Parent = ICONFRAME
		info.Size = UDim2.new(4,0,2,0)
		info.BackgroundColor3=Color3.fromRGB(75,75,75)
		info.BackgroundTransparency=1
		info.BorderSizePixel=0
		info.Position = UDim2.new(-4,0,0,0)
		infoTitle.Parent = info
		infoTitle.Font = Enum.Font.Arcade
		infoTitle.BackgroundTransparency = 1
		infoTitle.TextColor3 = Color3.new(1,1,1)
		infoTitle.Text = NAME
		infoTitle.Size = UDim2.new(1,0,0,15)
		infoTitle.TextScaled = true
		infoTexts.Parent = info
		infoTexts.Font = Enum.Font.Cartoon
		infoTexts.BackgroundTransparency=1
		infoTexts.TextColor3=Color3.new(1,1,1)
		infoTexts.Size = UDim2.new(1,0,1,0)
		infoTexts.Position = UDim2.new(0,15,0,15)
		infoTexts.TextXAlignment = Enum.TextXAlignment.Left
		infoTexts.TextYAlignment = Enum.TextYAlignment.Top
		infoTexts.TextSize = 15
		infoTexts.Text = ("\nCredits: Xorice#4604\nVersion: "..VERSION.."\nCore Version: "..CORE_VERSION)
		ICONFRAME.MouseEnter:connect(function()
			if uiEnabled == true then
				Library:tween(info,TweenInfo.new(.5,tQuad,tOut,0,false,0),{Position=UDim2.new(1,0,0,0),BackgroundTransparency=.5})
				Library:tween(infoTitle,TweenInfo.new(.5,tQuad,tOut,0,false,0),{TextTransparency=0})
				Library:tween(infoTexts,TweenInfo.new(.5,tQuad,tOut,0,false,0),{TextTransparency=0})
			end
		end)
		ICONFRAME.MouseLeave:connect(function()
			Library:tween(info,TweenInfo.new(.5,tQuad,tOut,0,false,0),{Position=UDim2.new(-4,0,0,0),BackgroundTransparency=1})
			Library:tween(infoTitle,TweenInfo.new(.5,tQuad,tOut,0,false,0),{TextTransparency=1})
			Library:tween(infoTexts,TweenInfo.new(.5,tQuad,tOut,0,false,0),{TextTransparency=1})
		end)
		local closeTbl = {}
		ICONFRAME.MouseButton1Click:connect(function()
			uiEnabled = not uiEnabled
			if uiEnabled == false then
				Library:tween(vd,TweenInfo.new(.5,tQuad,tOut,0,false,0),{ImageColor3 = Color3.new(1,0,0)})
				Library:tween(ICONFRAME,TweenInfo.new(.5,tQuad,tOut,0,false,0),{AnchorPoint=Vector2.new(.5,.5)})
				for n,v in pairs(ui:GetChildren()) do
					if v:IsA("GuiBase") and v~=ICONFRAME then
						v.Visible = false
						closeTbl[n]=v
					end
				end
			else
				Library:tween(vd,TweenInfo.new(.5,tQuad,tOut,0,false,0),{ImageColor3 = Color3.new(0,1,0)})
				Library:tween(ICONFRAME,TweenInfo.new(.5,tQuad,tOut,0,false,0),{AnchorPoint=Vector2.new(0,.5)})
				for n,v in pairs(closeTbl) do
					v.Visible=true
				end
			end
		end)
	end

	return ui
end

function Library:new_Folder(ui,txt,size,position)
	local frame = Instance.new("Frame",ui)
	frame.AnchorPoint = Vector2.new(0.5,0)
	frame.BackgroundColor3 = Color3.fromRGB(50,50,50)
	frame.BackgroundTransparency = 0.25
	frame.BorderSizePixel = 0
	frame.ClipsDescendants = true
	frame.Position = position
	frame.Size = size
	frame.Selectable = true
	frame.Active = true
	frame.Draggable = true
	local title = Instance.new("TextLabel",frame)
	title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	title.BackgroundTransparency = 1.000
	title.Size = UDim2.new(1,0,0,20)
	title.Font = Enum.Font.Arcade
	title.Text = txt
	title.TextColor3 = Color3.new(1,1,1)
	title.TextSize = 14
	title.TextStrokeColor3 = Color3.fromRGB(255,0,0)
	title.TextStrokeTransparency = 1
	title.Name = "title"
	local Line = Instance.new("Frame",frame)
	Line.Name = "EffectLine"
	Line.BackgroundColor3 = Color3.new(0,1,0)
	Line.BorderSizePixel = 0
	Line.Position = UDim2.new(0,0,0,20)
	Line.Size = UDim2.new(1,0,0,2)
	local clipbutton = Instance.new("ImageButton",title)
	clipbutton.AnchorPoint = Vector2.new(0,0.5)
	clipbutton.BackgroundColor3 = Color3.fromRGB(255,255,255)
	clipbutton.BackgroundTransparency = 1
	clipbutton.Position = UDim2.new(0.05,0,0.5,0)
	clipbutton.Size = UDim2.new(0,10,0,10)
	clipbutton.Image = "rbxassetid://5060521161"
	clipbutton.ImageColor3 = Color3.fromRGB(0,255,0)
	local deleteButton = Instance.new("TextButton",title)
	deleteButton.AnchorPoint = Vector2.new(1,0.5)
	deleteButton.BackgroundColor3 = Color3.fromRGB(255,255,255)
	deleteButton.BackgroundTransparency = 1
	deleteButton.Position = UDim2.new(0.95,0,0.5,0)
	deleteButton.Size = UDim2.new(0,10,0,10)
	deleteButton.TextColor3 = Color3.new(1,1,1)
	deleteButton.Text = "x"
	deleteButton.TextSize = 20
	deleteButton.Font = Enum.Font.SciFi
	deleteButton.MouseButton1Click:connect(function()
		frame:Destroy()
	end)
	local on = true
	local function clip()
		if on == true then
			Library:tween(frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{Size=UDim2.new(0,200,0,22)})
			Library:tween(clipbutton,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{ImageColor3=Color3.new(1,0,0)})
			for n,v in pairs(frame:GetChildren()) do
				if v:IsA("GuiBase") and v~=clipbutton and v~=Line and v~=title then
					v.Visible = false
				end
			end
		else
			Library:tween(frame,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{Size=size})
			Library:tween(clipbutton,TweenInfo.new(0.5,Enum.EasingStyle.Quint,Enum.EasingDirection.Out,0,false,0),{ImageColor3=Color3.new(0,1,0)})
			for n,v in pairs(frame:GetChildren()) do
				if v:IsA("GuiBase") and v~=clipbutton and v~=Line and v~=title then
					v.Visible = true
				end
			end
		end
		on = not on
	end
	clipbutton.MouseButton1Click:connect(clip)
	return frame
end

function Library:new_FuncFrame(ui,p,position,width,offset)
	local f = Instance.new("Frame",p)
	f.AnchorPoint = Vector2.new(0.5,0.5)
	f.Size = UDim2.new(0.9,0,width,offset)
	f.Position = position
	f.BackgroundTransparency = 1
	f.BorderSizePixel = 0
	local Layout = Instance.new("UIGridLayout",f)
	Layout.CellSize = UDim2.new(1,0,0,25)
	return f
end

function Library:new_TextBox(ui,p,ptext)
	local box = Instance.new("TextBox",p)
	box.MultiLine = false
	box.BackgroundColor3 = Color3.fromRGB(50,50,50)
	box.TextColor3 = Color3.new(1,1,1)
	box.BackgroundTransparency = 0.5
	box.PlaceholderText = ptext
	box.BorderSizePixel = 0
	box.Text = ""
	return box
end

function Library:new_Button(ui,p,t)
	local button = Instance.new("TextButton",p)
	button.BackgroundColor3 = Color3.fromRGB(50,50,50)
	button.BackgroundTransparency = 0.3
	button.BorderSizePixel = 0
	button.Position = UDim2.new(1,0,0,0)
	button.Size = UDim2.new(0,50,0,25)
	button.AnchorPoint = Vector2.new(1.25,0)
	button.ZIndex = z+1
	button.Text = t
	button.TextColor3 = Color3.new(1,1,1)
	return button
end

function Library:new_BoolFunc(ui,p,title)
	local label = Instance.new("TextLabel",p)
	label.BackgroundColor3 = Color3.fromRGB(50,50,50)
	label.BackgroundTransparency = 0.5
	label.BorderSizePixel = 0
	label.Text = title
	label.TextColor3 = Color3.new(1,1,1)
	label.ZIndex = z
	label.TextXAlignment = Enum.TextXAlignment.Left
	local buttonFrame = Instance.new("Frame",label)
	buttonFrame.BackgroundColor3 = Color3.fromRGB(50,50,50)
	buttonFrame.BackgroundTransparency = 0.5
	buttonFrame.BorderSizePixel = 0
	buttonFrame.Position = UDim2.new(1,0,0,0)
	buttonFrame.Size = UDim2.new(0,50,0,25)
	buttonFrame.AnchorPoint = Vector2.new(1.25,0)
	buttonFrame.ZIndex = z+1
	local button = Instance.new("TextButton",buttonFrame)
	local bool = Instance.new("BoolValue",button)
	bool.Name, bool.Value = "bool", false
	button.AnchorPoint = Vector2.new(1,0.5)
	button.Position = UDim2.new(0.5,0,0.5,0)
	button.Text = ""
	button.Size = UDim2.new(0,20,0,20)
	button.BorderSizePixel = 0
	button.BackgroundColor3 = Color3.new(1,0,0)
	button.ZIndex = z+2
	button.MouseButton1Click:connect(function()
		wait()
		if bool.Value == true then
			Library:tween(button,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{AnchorPoint=Vector2.new(0,0.5),BackgroundColor3=Color3.new(0,1,0)})
		else
			Library:tween(button,TweenInfo.new(0.5,Enum.EasingStyle.Quad,Enum.EasingDirection.Out,0,false,0),{AnchorPoint=Vector2.new(1,0.5),BackgroundColor3=Color3.new(1,0,0)})
		end
	end)
	return {button,bool}
end

function Library:new_TextBoxButton(ui,p,title)

end

return Library
