Config = {}
Config.Locale = 'en'

Config.PoliceNumberRequired = 2
Config.TimerBeforeNewRob = 1800 -- seconds


-- Change secondsRemaining if you want another timer

  Stores = {
    -- City Locations
	["pac_standard"] = {
		position = { ['x'] = 253.79, ['y'] = 228.34, ['z'] = 101.8756 },
		reward = math.random(275000,350000),
		nameofstore = "Pacific Standard Bank",
		-- secondsRemaining = math.random(300,600),
		secondsRemaining = 300,
		lastrobbed = 0
  },
  ["fleeca"] = {
    position = { ['x'] = 146.9768, ['y'] = -1045.4152, ['z'] = 29.3681 },
    reward = math.random(100000,145000),
    nameofstore = "Fleeca Downtown Bank",
     -- secondsRemaining = math.random(200,400),
     secondsRemaining = 300,
    lastrobbed = 0
  },
  ["fleeca2"] = {
    position = { ['x'] = -1211.3, ['y'] = -336.22, ['z'] = 37.79 },
    reward = math.random(100000,145000),
    nameofstore = "Fleeca Uptown Bank",
    -- secondsRemaining = math.random(300,500),
    secondsRemaining = 300,
    lastrobbed = 0
  },
      -- East & West Coast Highways / Medium Locations
   ["blaine"] = {
    position = { ['x'] = -104.02, ['y'] = 6475.51, ['z'] = 31.70 },
	reward = math.random(125000,175000),
    nameofstore = "Blaine County Savings",
   -- secondsRemaining = math.random(300,500),
   secondsRemaining = 300,
    lastrobbed = 0
  },

    -- Sandy Shores / Far Locations
   ["vangelico"] = {
    position = { ['x'] = -621.99, ['y'] = -230.72, ['z'] = 38.50 },
    reward = math.random(145000,210000),
    nameofstore = "Vangelico",
   -- secondsRemaining = math.random(250,550),
   secondsRemaining = 300,
    lastrobbed = 0
  },
}

