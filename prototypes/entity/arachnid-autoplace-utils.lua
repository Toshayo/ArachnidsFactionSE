local noise = require("noise")

local control_name = "arachnid-base"
local arachnid_base_control_setting = noise.get_control_setting(control_name)

local tne = noise.to_noise_expression
local litexp = noise.literal_expression

local onehalf_exp = tne(1)/2
local onethird_exp = tne(1)/3

local function generate_arachnid_base_probability_expression()
  local seed1 = 345
  local pi_over_3 = tne(math.pi)/3

  -- arachnid_base_border_width gives the width of the border in which probability ramps up from 0 to 1.
  -- i.e. slope = 1 / border_width, and height = radius / border_width
  -- In practice, a probabilty of about 1/9 will result in a solid carpet of biter bases,
  -- which is why this border width is so high (ignoring blobbiness, most of the inner part of the 'border' would be solid biter bases)
  local arachnid_base_border_width = 31

  -- Spots per square meter (should be a very small fraction):
  local frequency_expression = noise.max(0, noise.var("arachnid-base-frequency"))
  local spot_radius_expression = noise.max(0, noise.var("arachnid-base-radius"))
  -- multiply by spot_radius_expression to keep slope constant:
  local spot_height_expression = spot_radius_expression / arachnid_base_border_width
  local spot_quantity_expression = pi_over_3 * spot_radius_expression * spot_radius_expression * spot_height_expression
  -- spot_quantity_expression = noise.compile_time_log("Spot quantity: ", spot_quantity_expression)
  local density_expression = spot_quantity_expression * frequency_expression
  -- density_expression = noise.compile_time_log("Density: ", density_expression)

  local basement_value = -1005

  local spots = tne{
    type = "function-application",
    function_name = "spot-noise",
    arguments = {
      x = noise.var("x"),
      y = noise.var("y"),
      seed0 = noise.var("map_seed"),
      seed1 = tne(seed1),
      region_size = tne(512),
      candidate_point_count = tne(100),
      density_expression = litexp(density_expression), -- low-frequency noise evaluate for an entire region
      spot_quantity_expression = litexp(spot_quantity_expression), -- used to figure out where spots go
      hard_region_target_quantity = tne(false), -- it's fine for large spots to push region quantity past the target
      spot_radius_expression = litexp(spot_radius_expression),
      spot_favorability_expression = litexp(1),
      basement_value = tne(basement_value),
      maximum_spot_basement_radius = tne(128)
    }
  }

  local blob_amplitude_multiplier = 0.2 * spot_height_expression * (0.1 + 0.9 * noise.clamp(noise.var("distance") / 3000, 0, 1))
  local blobs = tne{
    type = "function-application",
    function_name = "factorio-basis-noise",
    arguments = {
      x = noise.var("x"),
      y = noise.var("y"),
      seed0 = noise.var("map_seed"),
      seed1 = tne(seed1),
      input_scale = tne(1/8),
      output_scale = tne(1)
    }
  } + tne{
    type = "function-application",
    function_name = "factorio-basis-noise",
    arguments = {
      x = noise.var("x"),
      y = noise.var("y"),
      seed0 = noise.var("map_seed"),
      seed1 = tne(seed1),
      input_scale = tne(1/24),
      output_scale = tne(1)
    }
  } + tne{
    type = "function-application",
    function_name = "factorio-basis-noise",
    arguments = {
      x = noise.var("x"),
      y = noise.var("y"),
      seed0 = noise.var("map_seed"),
      seed1 = tne(seed1),
      input_scale = tne(1/64),
      output_scale = tne(2)
    }
  }

  blobs = (blobs - 0.6) * blob_amplitude_multiplier - 0.4

  local starting_area_sharpness = 23
  local starting_area_hole = noise.min(0, starting_area_sharpness * (noise.var("distance") / noise.var("starting_area_radius") - 1))

  return spots + blobs + starting_area_hole
end

data:extend{
  {
    type = "noise-expression",
    name = "arachnid-base-intensity",
    expression = noise.define_noise_function( function(x,y,tile,map)
      -- biter placement stops increasing in "intensity" after 75 chunks
      return noise.clamp(tile.distance, 0, 75*32) / 325
    end)
  },
  {
    type = "noise-expression",
    name = "arachnid-base-radius",
    expression = noise.define_noise_function( function(x,y,tile,map)
      --return arachnid_base_control_setting.size_multiplier ^ onehalf_exp * 20
      return arachnid_base_control_setting.size_multiplier ^ onehalf_exp * (tne(15) + 4 * noise.var("arachnid-base-intensity"))
    end)
  },
  {
    type = "noise-expression",
    name = "arachnid-base-frequency",
    expression = noise.define_noise_function( function(x,y,tile,map)
      local bases_per_km2 = 10 + 3 * noise.var("arachnid-base-intensity")
      return arachnid_base_control_setting.frequency_multiplier * bases_per_km2 / 1000000
    end)
  },
  {
    type = "noise-expression",
    name = "arachnid_base_probability",
    expression = generate_arachnid_base_probability_expression()
  }
}

local arachnid_random_seed = 1
local function new_random_seed()
  arachnid_random_seed = arachnid_random_seed + 1
  return arachnid_random_seed
end

local function arachnid_autoplace(params)
  distance_factor = params.distance_factor or 1
  order = params.order or "b[arachnid]-misc"
  is_turret = params.is_turret or false

  local distance_unit = 312
  local distance_outside_starting_area = noise.var("distance") - noise.var("starting_area_radius")

  -- Units with a higher distance_factor will appear farther out by one
  -- distance_unit per distance_factor
  local distance_height_multiplier = noise.max(0, 1 + (distance_outside_starting_area - distance_unit * distance_factor) * 0.003 * distance_factor)

  local probability_expression = noise.var("arachnid_base_probability") * distance_height_multiplier
  -- limit probability so that it never quite reaches 1,
  -- because that would result in stupid-looking squares of biter bases:
  probability_expression = noise.min(probability_expression, 0.25 + distance_factor * 0.06)
  -- Add randomness to the probability so that there's a little bit of a gradient
  -- between different units:
  probability_expression = noise.random_penalty(probability_expression, 0.11, {
    x = noise.var("x") + new_random_seed() -- Include distance_factor in random seed!
  })
  -- log("Probability expression for " .. params.order .. "#" .. distance_factor .. ":")
  -- log(tostring(expression_to_ascii_math(probability_expression)))
  local richness_expression = tne(1)

  return
  {
    control = control_name,
    order = order,
    force = "EE_arachnid",
    probability_expression = probability_expression,
    richness_expression = richness_expression
  }
end

local function arachnid_spawner_autoplace(distance)
  return arachnid_autoplace{
    distance_factor = distance,
    order = "b[arachnid]-a[spawner]"
  }
end


return
{
  control_name = control_name,
  arachnid_autoplace = arachnid_autoplace,
  arachnid_spawner_autoplace = arachnid_spawner_autoplace
}
