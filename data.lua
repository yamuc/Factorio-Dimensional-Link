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


-- items
data:extend({
  {
    --item info
    type = 'item',
    name = 'yc:test-item',

    --sprite stuff
    icon = sprite 'advanced-fuel.png',
    icon_size = 64,

    --inventory stuff
    subgroup = 'energy', 
    order = 'y-a',

    --other
    place_result = 'yc:test-item',
    stack_size = 10
  }
})

-- recipies
data:extend({
  {
    type = 'recipe',
    name = 'yc:test-item',

    enabled = true,
    ingredients = {
      {'iron-plate', 50},
      {'iron-ore', 10}
    },

    results = {
      {type = 'item', name = 'yc:test-item', amount = 1},
      {type = 'item', name = 'iron-plate', probability = .5, amount = 10}
    },
    main_product = 'yc:test-item',

    energy_required = .5
  }
})

-- entities
local kr_entities_path = sprite ''
data:extend({
  {
    type = 'assembling-machine',
    name = 'yc:test-item',
    icon = sprite 'advanced-chemical-plant.png',
    icon_size = 64,
    icon_mipmaps = 4,
    flags = { "placeable-neutral", "placeable-player", "player-creation" },
    minable = { mining_time = 1, result = "yc:test-item" },
    max_health = 1500,
    collision_box = { { -3.25, -3.25 }, { 3.25, 3.25 } },
    selection_box = { { -3.5, -3.5 }, { 3.5, 3.5 } },
    animation = {
      layers = {
        {
          filename = kr_entities_path .. "advanced-chemical-plant/advanced-chemical-plant.png",
          priority = "high",
          width = 226,
          height = 268,
          shift = { 0, -0.48 },
          frame_count = 20,
          line_length = 5,
          animation_speed = 0.25,
          scale = 1,
          hr_version = {
            filename = kr_entities_path .. "advanced-chemical-plant/hr-advanced-chemical-plant.png",
            priority = "high",
            width = 451,
            height = 535,
            shift = { 0, -0.48 },
            frame_count = 20,
            line_length = 5,
            animation_speed = 0.25,
            scale = 0.5,
          },
        },
        {
          filename = kr_entities_path .. "advanced-chemical-plant/advanced-chemical-plant-sh.png",
          priority = "high",
          width = 258,
          height = 229,
          shift = { 0.33, 0.32 },
          frame_count = 1,
          repeat_count = 20,
          animation_speed = 0.25,
          scale = 1,
          draw_as_shadow = true,
          hr_version = {
            filename = kr_entities_path .. "advanced-chemical-plant/hr-advanced-chemical-plant-sh.png",
            priority = "high",
            width = 516,
            height = 458,
            shift = { 0.33, 0.32 },
            frame_count = 1,
            repeat_count = 20,
            animation_speed = 0.25,
            scale = 0.5,
            draw_as_shadow = true,
          },
        },
      },
    },
    crafting_speed = 1,
    energy_source = {
      type = "electric",
      usage_priority = 'secondary-input'
    },
    energy_usage = "1.75MW",
    ingredient_count = 6,
    crafting_categories = {'crafting', 'chemistry', 'basic-crafting'}
  }
})



















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
