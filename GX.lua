print("Configuring Ultra Gx...")
local Services = {}
Services.RunService = game:GetService("RunService")


local IsExploit = not Services.RunService:IsStudio()

local CustomFunctions = {}
CustomFunctions.SetHidden = sethiddenproperty or set_hidden_property or set_hidden_prop

local UltraGX = {}


function UltraGX.new(Class, Properties)

	local NewInstance = Instance.new(Class)


	for i,v in pairs(Properties) do
		if NewInstance[i] ~= nil and i ~= "Parent" then
			NewInstance[i] = v
		end
	end


	if Properties.Parent then
		NewInstance.Parent = Properties.Parent
	end

	return NewInstance
end

function UltraGX.SetProperty(Object, Properties)

	for i,v in pairs(Properties) do
		if Object[i] ~= nil and i ~= "Parent" then
			Object[i] = v
		end
	end


	if Properties.Parent then
		Object.Parent = Properties.Parent
	end
end

print("Loaded GX Functions")

local Lighting = game:GetService("Lighting")
local Terrain = workspace.Terrain

local LightingSaves = UltraGX.new("Folder", {Name = "LightingSaves", Parent = nil})

print("Setup Files")

print("Starting Ultra GX")
function UltraGX.Enhance(Settings)
	local GraphicSettings = Settings or {
		FogEnabled = true,
		WaterEnabled = true
	}


	for i,v in ipairs(Lighting:GetChildren()) do
		if v:IsA("PostEffect") and not string.find(v.Name, "UltraGX") then
			v.Parent = LightingSaves
		end
	end




	if GraphicSettings.FogEnabled then
		UltraGX.SetProperty(Lighting, {
			FogEnd = 500,
			FogStart = 25
		})
	end

	if IsExploit then
		CustomFunctions.SetHidden(Lighting, "Technology", Enum.Technology.Future)
		settings().Rendering.QualityLevel = 21
	end


	if GraphicSettings.WaterEnabled then
		UltraGX.SetProperty(Terrain, {
			WaterColor = Color3.fromRGB(131, 165, 164),
			WaterReflectance = 0.05,
			WaterTransparency = 1,
			WaterWaveSize = 0.05,
			WaterWaveSpeed = 25
		})
	end


	UltraGX.LightingEffects = {
		UltraGX.new("BloomEffect", {
			Name = "UltraGXBloom",
			Parent = Lighting,
			Intensity = 0.75,
			Size = 15,
			Threshold = 0.95
		}),
		UltraGX.new("BlurEffect", {
			Name = "UltraGXBlur",
			Parent = Lighting,
			Size = 1
		}),
		UltraGX.new("DepthOfFieldEffect", {
			Name = "UltraGXDepth",
			Parent = Lighting,
			FarIntensity = 0.15,
			FocusDistance = 0.05,
			InFocusRadius = 20,
			NearIntensity = 0.75
		}),
		UltraGX.new("SunRaysEffect", {
			Name = "UltraGXRays",
			Parent = Lighting,
			Intensity = 0.25,
			Spread = 0.5
		})
	}
end

print("GX Modifications Loaded")

print("Running GX Stabliser...")
UltraGX.Enhance({
	FogEnabled = true,
	WaterEnabled = true
})
print("Stablised GX")

print("GX GRAPHICS V4 LOADED")
return UltraGX
