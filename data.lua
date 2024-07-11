--data.lua


-- Start by adding new buildings, recipies and items
-- I think just having the prototypes be ore => shards => canister would work



--Functions adapted from the eradicators hand crank generator example mod
local function config(name)
  return settings.startup['yc:'..name].value
  end

local function sprite(name)
  return '__dimensional-link__/sprites/'..name
  end
  
local function sound(name)
  return '__dimensional-link__/sounds/'..name
  end























-- Old code from the tutorial left in for reference
 
--[[ 
local fireArmor = table.deepcopy(data.raw["armor"]["heavy-armor"]) -- copy the table that defines the heavy armor item into the fireArmor variable

fireArmor.name = "fire-armor"
fireArmor.icons = {
  {
    icon = fireArmor.icon,
    icon_size = fireArmor.icon_size,
    tint = {r=1,g=0,b=0,a=0.5}
  },
}

fireArmor.resistances = {
  {
    type = "physical",
    decrease = 6,
    percent = 10
  },
  {
    type = "explosion",
    decrease = 10,
    percent = 30
  },
  {
    type = "acid",
    decrease = 5,
    percent = 30
  },
  {
    type = "fire",
    decrease = 0,
    percent = 100
  }
}

-- create the recipe prototype from scratch
local recipe = {
  type = "recipe",
  name = "fire-armor",
  enabled = true,
  energy_required = 8, -- time to craft in seconds (at crafting speed 1)
  ingredients = {{"copper-plate", 200}, {"steel-plate", 50}},
  result = "fire-armor"
}

data:extend{fireArmor, recipe}
 ]]
