SoulWarQuest = {
	-- Item ids
	-- Goshnar's Hatred
	bagYouDesireItemId = 34109,
	goshnarsHatredSorrowId = 33793,
	condensedRemorseId = 33792,
	-- Goshnar's Spite
	weepingSoulCorpseId = 33876,
	searingFireId = 33877,
	-- Goshnar's Cruelty
	pulsatingEnergyId = 34005,
	greedyMawId = 33890,
	someMortalEssenceId = 33891,
	theBloodOfCloakTerrorIds = { 33854, 34006, 34007 },
	-- Goshnar's Megalomania
	deadAspectOfPowerCorpseId = 33949,
	cleansedSanityItemId = 33950,
	necromanticRemainsItemId = 33984,

	poolDamagePercentages = {
		[33854] = 0.20, -- 20% of maximum health for the largest pool
		[34006] = 0.15, -- 15% for a medium-sized pool
		[34007] = 0.10, -- 10% for the smallest pool
	},

	timeToIncreaseCrueltyDefense = 15, -- In seconds, it will increase every 15 seconds if don't use mortal essence in greedy maw
	useGreedMawCooldown = 30, -- In seconds
	goshnarsCrueltyDefenseChange = 2, -- Defense change, the amount that will decrease or increase defense, the defense cannot decrease more than the monster's original defense amount
	goshnarsCrueltyWaveInterval = 7, -- In seconds

	timeToReturnImmuneMegalomania = 70, -- In seconds

	baseBagYouDesireChance = 1, -- 1% base chance
	bagYouDesireChancePerTaint = 1, -- Increases 1% per taint
	bagYouDesireMonsters = {
		"Bony Sea Devil",
		"Brachiodemon",
		"Branchy Crawler",
		"Capricious Phantom",
		"Cloak Of Terror",
		"Courage Leech",
		"Distorted Phantom",
		"Druid's Apparition",
		"Infernal Demon",
		"Infernal Phantom",
		"Knight's Apparition",
		"Many Faces",
		"Mould Phantom",
		"Paladin's Apparition",
		"Rotten Golem",
		"Sorcerer's Apparition",
		"Turbulent Elemental",
		"Vibrant Phantom.",
	},
	bagYouDesireBosses = {
		"Goshnar's Cruelty",
		"Goshnar's Spite",
		"Goshnar's Malice",
		"Goshnar's Hatred",
		"Goshnar's Greed",
	},

	-- Goshnar's Cruelty pulsating energy monsters
	pulsatingEnergyMonsters = {
		"Vibrant Phantom",
		"Cloak of Terror",
		"Courage Leech",
	},

	miniBosses = {
		["Goshnar's Malice"] = true,
		["Goshnar's Hatred"] = true,
		["Goshnar's Spite"] = true,
		["Goshnar's Cruelty"] = true,
		["Goshnar's Greed"] = true,
	},

	finalRewards = {
		{ id = 34082, name = "soulcutter" },
		{ id = 34083, name = "soulshredder" },
		{ id = 34084, name = "soulbiter" },
		{ id = 34085, name = "souleater" },
		{ id = 34086, name = "soulcrusher" },
		{ id = 34087, name = "soulmaimer" },
		{ id = 34088, name = "soulbleeder" },
		{ id = 34089, name = "soulpiercer" },
		{ id = 34090, name = "soultainter" },
		{ id = 34091, name = "soulhexer" },
		{ id = 34092, name = "soulshanks" },
		{ id = 34093, name = "soulstrider" },
		{ id = 34094, name = "soulshell" },
		{ id = 34095, name = "soulmantel" },
		{ id = 34096, name = "soulshroud" },
		{ id = 34097, name = "pair of soulwalkers" },
		{ id = 34098, name = "pair of soulstalkers" },
		{ id = 34099, name = "soulbastion" },
	},

	kvSoulWar = KV.scoped("quest"):scoped("soul-war"),
	-- Global KV for storage burning change form time
	kvBurning = KV.scoped("quest"):scoped("soul-war"):scoped("burning-change-form"),

	rottenWastelandShrines = {
		[33019] = { x = 33926, y = 31091, z = 13 },
		[33021] = { x = 33963, y = 31078, z = 13 },
		[33022] = { x = 33970, y = 30988, z = 13 },
		[33024] = { x = 33970, y = 31012, z = 13 },
	},

	-- Lever room and teleports positions
	goshnarsGreedAccessPosition = { from = { x = 33937, y = 31217, z = 11 }, to = { x = 33782, y = 31665, z = 14 } },
	goshnarsHatredAccessPosition = { from = { x = 33914, y = 31032, z = 12 }, to = { x = 33774, y = 31604, z = 14 } },
	-- Teleports from 1st/2nd/3rd floors
	goshnarsCrueltyTeleportRoomPositions = {
		{ from = Position(33889, 31873, 3), to = Position(33830, 31881, 4), access = "first-floor-access", count = 40 },
		{ from = Position(33829, 31880, 4), to = Position(33856, 31889, 5), access = "second-floor-access", count = 55 },
		{ from = Position(33856, 31884, 5), to = Position(33857, 31865, 6), access = "third-floor-access", count = 70 },
	},

	areaZones = {
		monsters = {
			["zone.claustrophobic-inferno"] = "Brachiodemon",
			["zone.mirrored-nightmare"] = "Many Faces",
			["zone.ebb-and-flow"] = "Bony Sea Devil",
			["zone.furious-crater"] = "Cloak of Terror",
			["zone.rotten-wasteland"] = "Branchy Crawler",
			["boss.goshnar's-malice"] = "Dreadful Harvester",
			["boss.goshnar's-spite"] = "Dreadful Harvester",
			["boss.goshnar's-greed"] = "Dreadful Harvester",
			["boss.goshnar's-hatred"] = "Dreadful Harvester",
			["boss.goshnar's-cruelty"] = "Dreadful Harvester",
			["boss.goshnar's-megalomania-purple"] = "Dreadful Harvester",
		},

		caustrophobicInferno = Zone("zone.claustrophobic-inferno"),
		mirroredNightmare = Zone("zone.mirrored-nightmare"),
		ebbAndFlow = Zone("zone.ebb-and-flow"),
		furiousCrater = Zone("zone.furious-crater"),
		rottenWasteland = Zone("zone.rotten-wasteland"),
	},

	-- Levers configuration
	levers = {
		goshnarsMalicePosition = { x = 33678, y = 31599, z = 14 },
		goshnarsSpitePosition = { x = 33773, y = 31634, z = 14 },
		goshnarsGreedPosition = { x = 33775, y = 31665, z = 14 },
		goshnarsHatredPosition = { x = 33772, y = 31601, z = 14 },
		goshnarsCrueltyPosition = { x = 33853, y = 31854, z = 6 },
		goshnarsMegalomaniaPosition = { x = 33675, y = 31634, z = 14 },

		-- Levers system
		goshnarsSpite = {
			boss = {
				name = "Goshnar's Spite",
				position = Position(33743, 31632, 14),
			},
			requiredLevel = 250,
			playerPositions = {
				{ pos = Position(33774, 31634, 14), teleport = Position(33742, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33775, 31634, 14), teleport = Position(33742, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33776, 31634, 14), teleport = Position(33742, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33777, 31634, 14), teleport = Position(33742, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33778, 31634, 14), teleport = Position(33742, 31639, 14), effect = CONST_ME_TELEPORT },
			},
			specPos = {
				from = Position(33734, 31624, 14),
				to = Position(33751, 31640, 14),
			},
			exit = Position(33621, 31427, 10),
			timeToFightAgain = 20 * 60 * 60, -- 20 hours
		},
		goshnarsMalice = {
			boss = {
				name = "Goshnar's Malice",
				position = Position(33709, 31599, 14),
			},
			requiredLevel = 250,
			playerPositions = {
				{ pos = Position(33679, 31599, 14), teleport = Position(33710, 31605, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33680, 31599, 14), teleport = Position(33710, 31605, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33681, 31599, 14), teleport = Position(33710, 31605, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33682, 31599, 14), teleport = Position(33710, 31605, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33683, 31599, 14), teleport = Position(33710, 31605, 14), effect = CONST_ME_TELEPORT },
			},
			specPos = {
				from = Position(33699, 31590, 14),
				to = Position(33718, 31607, 14),
			},
			onUseExtra = function(player)
				addEvent(SpawnSoulCage, 23000)
			end,
			exit = Position(33621, 31427, 10),
			timeToFightAgain = 20 * 60 * 60, -- 20 hours
		},
		goshnarsGreed = {
			boss = {
				name = "Goshnar's Greed",
				position = Position(33746, 31666, 14),
			},
			requiredLevel = 250,
			playerPositions = {
				{ pos = Position(33776, 31665, 14), teleport = Position(33747, 31671, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33777, 31665, 14), teleport = Position(33747, 31671, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33778, 31665, 14), teleport = Position(33747, 31671, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33779, 31665, 14), teleport = Position(33747, 31671, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33780, 31665, 14), teleport = Position(33747, 31671, 14), effect = CONST_ME_TELEPORT },
			},
			specPos = {
				from = Position(33737, 31658, 14),
				to = Position(33755, 31673, 14),
			},
			timeToFightAgain = 0, -- TODO: Remove later
			onUseExtra = function()
				CreateGoshnarsGreedMonster("Greedbeast", Position(33744, 31666, 14))
				CreateGoshnarsGreedMonster("Soulsnatcher", Position(33747, 31668, 14))
				CreateGoshnarsGreedMonster("Weak Soul", Position(33750, 31666, 14))
			end,
			exit = Position(33621, 31427, 10),
			timeToFightAgain = 20 * 60 * 60, -- 20 hours
		},
		goshnarsHatred = {
			boss = {
				name = "Goshnar's Hatred",
				position = Position(33744, 31599, 14),
			},
			monsters = {
				{ name = "Ashes of Burning Hatred", pos = { x = 33743, y = 31599, z = 14 } },
			},
			requiredLevel = 250,
			playerPositions = {
				{ pos = Position(33773, 31601, 14), teleport = Position(33743, 31604, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33774, 31601, 14), teleport = Position(33743, 31604, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33775, 31601, 14), teleport = Position(33743, 31604, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33776, 31601, 14), teleport = Position(33743, 31604, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33777, 31601, 14), teleport = Position(33743, 31604, 14), effect = CONST_ME_TELEPORT },
			},
			specPos = {
				from = Position(33735, 31592, 14),
				to = Position(33751, 31606, 14),
			},
			exit = Position(33621, 31427, 10),
			timeToFightAgain = 20 * 60 * 60, -- 20 hours
			onUseExtra = function(player)
				SoulWarQuest.kvBurning:set("time", 180)
				logger.debug("Goshnar's Hatred burning change form time set to: {}", 180)
				player:resetGoshnarSymbolTormentCounter()
			end,
		},
		goshnarsCruelty = {
			boss = {
				name = "Goshnar's Cruelty",
				position = Position(33856, 31866, 7),
			},
			monsters = {
				{ name = "A Greedy Eye", pos = { x = 33856, y = 31858, z = 7 } },
			},
			requiredLevel = 250,
			playerPositions = {
				{ pos = Position(33854, 31854, 6), teleport = Position(33856, 31872, 7), effect = CONST_ME_TELEPORT },
				{ pos = Position(33855, 31854, 6), teleport = Position(33856, 31872, 7), effect = CONST_ME_TELEPORT },
				{ pos = Position(33856, 31854, 6), teleport = Position(33856, 31872, 7), effect = CONST_ME_TELEPORT },
				{ pos = Position(33857, 31854, 6), teleport = Position(33856, 31872, 7), effect = CONST_ME_TELEPORT },
				{ pos = Position(33858, 31854, 6), teleport = Position(33856, 31872, 7), effect = CONST_ME_TELEPORT },
			},
			specPos = {
				from = Position(33847, 31858, 7),
				to = Position(33864, 31874, 7),
			},
			exit = Position(33621, 31427, 10),
			timeToFightAgain = 20 * 60 * 60, -- 20 hours
			onUseExtra = function(player)
				SoulWarQuest.kvSoulWar:remove("greedy-maw-action")
				player:soulWarQuestKV():scoped("furious-crater"):remove("greedy-maw-action")
			end,
		},
		goshnarsMegalomania = {
			boss = {
				name = "Goshnar's Megalomania Purple",
				position = Position(33710, 31634, 14),
			},
			monsters = {
				{ name = "Aspect of Power", pos = { x = 33710, y = 31635, z = 14 } },
			},
			requiredLevel = 250,
			playerPositions = {
				{ pos = Position(33676, 31634, 14), teleport = Position(33710, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33677, 31634, 14), teleport = Position(33710, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33678, 31634, 14), teleport = Position(33710, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33679, 31634, 14), teleport = Position(33710, 31639, 14), effect = CONST_ME_TELEPORT },
				{ pos = Position(33680, 31634, 14), teleport = Position(33710, 31639, 14), effect = CONST_ME_TELEPORT },
			},
			specPos = {
				from = Position(33701, 31626, 14),
				to = Position(33719, 31642, 14),
			},
			exit = Position(33621, 31427, 10),
			timeToFightAgain = 72 * 60 * 60, -- 72 hours
			onUseExtra = function(player)
				player:resetGoshnarSymbolTormentCounter()
				SoulWarQuest.kvSoulWar:remove("cleansed-sanity-action")
				player:soulWarQuestKV():scoped("furious-crater"):remove("cleansed-sanity-action")
			end,
		},
	},

	-- Goshnar's Greed
	apparitionNames = {
		"Druid's Apparition",
		"Knight's Apparition",
		"Paladin's Apparition",
		"Sorcerer's Apparition",
	},

	burningTransformations = {
		{ 180, "Ashes of Burning Hatred" },
		{ 135, "Spark of Burning Hatred" },
		{ 90, "Flame of Burning Hatred" },
		{ 45, "Blaze of Burning Hatred" },
	},

	requiredCountPerApparition = 25,

	-- Ebb and flow
	ebbAndFlow = {
		zone = Zone("ebb-and-flow-zone"),
		-- Positions to teleport into rooms when innundate map is loaded
		centerRoomPositions = {
			{ conor = { x = 33929, y = 31020, z = 9 }, teleportPosition = { x = 33939, y = 31021, z = 8 } },
			{ conor = { x = 33929, y = 31047, z = 9 }, teleportPosition = { x = 33938, y = 31047, z = 8 } },
			{ conor = { x = 33918, y = 31047, z = 9 }, teleportPosition = { x = 33903, y = 31049, z = 8 } },
			{ conor = { x = 33898, y = 31054, z = 9 }, teleportPosition = { x = 33903, y = 31049, z = 8 } },
			{ conor = { x = 33929, y = 31047, z = 9 }, teleportPosition = { x = 33938, y = 31047, z = 8 } },
			{ conor = { x = 33940, y = 31054, z = 9 }, teleportPosition = { x = 33938, y = 31047, z = 8 } },
			{ conor = { x = 33940, y = 31064, z = 9 }, teleportPosition = { x = 33937, y = 31074, z = 8 } },
			{ conor = { x = 33937, y = 31086, z = 9 }, teleportPosition = { x = 33937, y = 31074, z = 8 } },
			{ conor = { x = 33937, y = 31098, z = 9 }, teleportPosition = { x = 33929, y = 31109, z = 8 } },
			{ conor = { x = 33933, y = 31109, z = 9 }, teleportPosition = { x = 33929, y = 31109, z = 8 } },
			{ conor = { x = 33921, y = 31113, z = 9 }, teleportPosition = { x = 33929, y = 31109, z = 8 } },
			{ conor = { x = 33912, y = 31113, z = 9 }, teleportPosition = { x = 33904, y = 31117, z = 8 } },
			{ conor = { x = 33901, y = 31108, z = 9 }, teleportPosition = { x = 33904, y = 31117, z = 8 } },
			{ conor = { x = 33901, y = 31098, z = 9 }, teleportPosition = { x = 33904, y = 31082, z = 8 } },
			{ conor = { x = 33899, y = 31064, z = 9 }, teleportPosition = { x = 33904, y = 31082, z = 8 } },
		},
		mapsPath = {
			empty = "data-otservbr-global/world/quest/soul_war/ebb_and_flow/ebb-flow-empty.otbm",
			inundate = "data-otservbr-global/world/quest/soul_war/ebb_and_flow/ebb-flow-inundate.otbm",
		},

		-- In Minutes
		intervalChangeMap = 2,
		waitPosition = Position(33893, 31020, 8),

		getZone = function()
			return SoulWarQuest.ebbAndFlow.zone
		end,

		reloadZone = function()
			SoulWarQuest.ebbAndFlow.zone:addArea({ x = 33869, y = 30991, z = 8 }, { x = 33964, y = 31147, z = 9 })
		end,

		kv = KV.scoped("quest"):scoped("soul-war"):scoped("ebb-and-flow-maps"),
		isActive = function()
			return SoulWarQuest.ebbAndFlow.kv:get("is-active")
		end,
		isLoadedEmptyMap = function()
			return SoulWarQuest.ebbAndFlow.kv:get("is-loaded-empty-map")
		end,
		setActive = function(value)
			SoulWarQuest.ebbAndFlow.kv:set("is-active", value)
		end,
		setLoadedEmptyMap = function(value)
			SoulWarQuest.ebbAndFlow.kv:set("is-loaded-empty-map", value)
		end,

		updateZonePlayers = function()
			if SoulWarQuest.ebbAndFlow.zone and SoulWarQuest.ebbAndFlow.getZone():countPlayers() > 0 then
				SoulWarQuest.ebbAndFlow.reloadZone()
				local players = SoulWarQuest.ebbAndFlow.getZone():getPlayers()
				for _, player in ipairs(players) do
					logger.debug("Updating player: {}", player:getName())
					player:sendCreatureAppear()
				end
			end
		end,

		-- Add here more positions of the pools that must transform before innundate map is loaded
		poolPositions = {
			{ x = 33906, y = 31026, z = 9 },
			{ x = 33901, y = 31026, z = 9 },
			{ x = 33932, y = 31011, z = 9 },
			{ x = 33941, y = 31033, z = 9 },
			{ x = 33946, y = 31037, z = 9 },
			{ x = 33939, y = 31056, z = 9 },
		},

		boatId = 7272,
		doorId = 33767,
		smallPoolId = 33772,
		MediumPoolId = 33773,
	},

	changeBlueEvent = nil,
	changePurpleEvent = nil,

	changeMegalomaniaBlue = function()
		local boss = Creature("Goshnar's Megalomania")
		if boss then
			boss:teleportTo(SoulWarQuest.levers.goshnarsMegalomania.boss.position)
			boss:say("ENOUGH! I WILL MAKE YOU SUFFER FOR YOUR INSOLENCE! NOW - I - WILL - ANIHILATE - YOU!")
			boss:setType("Goshnar's Megalomania Blue")
			local function changeBack()
				boss:setType("Goshnar's Megalomania Purple")
			end

			changePurpleEvent = addEvent(changeBack, 7000)
		end
	end,

	-- Chance to heal the life of the monster by stepping on the corpse of "weeping soul"
	goshnarsSpiteHealChance = 10,
	-- Percentage that will heal by stepping and the chance is successful
	goshnarsSpiteHealPercentage = 10,

	goshnarSpiteEntrancePosition = { fromPos = Position(33950, 31109, 8), toPos = Position(33780, 31634, 14) },

	waterElementalOutfit = {
		lookType = 286,
		lookHead = 0,
		lookBody = 0,
		lookLegs = 0,
		lookFeet = 0,
		lookAddons = 0,
		lookMount = 0,
	},

	goshnarsSpiteFirePositions = {
		-- North
		{ x = 33743, y = 31628, z = 14 },
		-- East
		{ x = 33736, y = 31632, z = 14 },
		-- West
		{ x = 33750, y = 31632, z = 14 },
		-- South
		{ x = 33742, y = 31637, z = 14 },
	},

	-- Increased defense if the searing fire disappears
	goshnarsSpiteIncreaseDefense = 10,
	-- Count of monsters to kill for enter in the boss room
	hardozousPanthomDeathCount = 20,
	-- Time to fire created again
	timeToCreateSearingFire = 14, -- In seconds
	-- Time to remove the searing fire if player don't step on it
	timeToRemoveSearingFire = 5, -- In seconds
	cooldownToStepOnSearingFire = 56, -- In seconds (14 seconds x 4)

	-- Positions to teleport into rooms when innundate map is loaded
	ebbAndFlowBoatTeleportPositions = {
		-- First boat
		-- Enter on boat
		{ register = { x = 33919, y = 31019, z = 8 }, teleportTo = { x = 33923, y = 31019, z = 8 } },
		{ register = { x = 33919, y = 31020, z = 8 }, teleportTo = { x = 33923, y = 31020, z = 8 } },
		{ register = { x = 33919, y = 31021, z = 8 }, teleportTo = { x = 33923, y = 31021, z = 8 } },
		{ register = { x = 33919, y = 31022, z = 8 }, teleportTo = { x = 33923, y = 31022, z = 8 } },
		-- Back to innitial room
		{ register = { x = 33922, y = 31019, z = 8 }, teleportTo = { x = 33918, y = 31019, z = 8 } },
		{ register = { x = 33922, y = 31020, z = 8 }, teleportTo = { x = 33918, y = 31020, z = 8 } },
		{ register = { x = 33922, y = 31021, z = 8 }, teleportTo = { x = 33918, y = 31021, z = 8 } },
		{ register = { x = 33922, y = 31022, z = 8 }, teleportTo = { x = 33918, y = 31022, z = 8 } },
		-- From boat to room
		{ register = { x = 33926, y = 31019, z = 8 }, teleportTo = { x = 33930, y = 31019, z = 8 } },
		{ register = { x = 33926, y = 31020, z = 8 }, teleportTo = { x = 33930, y = 31020, z = 8 } },
		{ register = { x = 33926, y = 31021, z = 8 }, teleportTo = { x = 33930, y = 31021, z = 8 } },
		{ register = { x = 33926, y = 31022, z = 8 }, teleportTo = { x = 33930, y = 31022, z = 8 } },
		-- From room to boat
		{ register = { x = 33929, y = 31019, z = 8 }, teleportTo = { x = 33925, y = 31019, z = 8 } },
		{ register = { x = 33929, y = 31020, z = 8 }, teleportTo = { x = 33925, y = 31020, z = 8 } },
		{ register = { x = 33929, y = 31021, z = 8 }, teleportTo = { x = 33925, y = 31021, z = 8 } },
		{ register = { x = 33929, y = 31022, z = 8 }, teleportTo = { x = 33925, y = 31022, z = 8 } },

		-- Boat
		-- Enter on boat
		{ register = { x = 33929, y = 31045, z = 8 }, teleportTo = { x = 33925, y = 31045, z = 8 } },
		{ register = { x = 33929, y = 31046, z = 8 }, teleportTo = { x = 33925, y = 31046, z = 8 } },
		{ register = { x = 33929, y = 31047, z = 8 }, teleportTo = { x = 33925, y = 31047, z = 8 } },
		{ register = { x = 33929, y = 31048, z = 8 }, teleportTo = { x = 33925, y = 31048, z = 8 } },
		-- Back to room
		{ register = { x = 33926, y = 31045, z = 8 }, teleportTo = { x = 33930, y = 31045, z = 8 } },
		{ register = { x = 33926, y = 31046, z = 8 }, teleportTo = { x = 33930, y = 31046, z = 8 } },
		{ register = { x = 33926, y = 31047, z = 8 }, teleportTo = { x = 33930, y = 31047, z = 8 } },
		{ register = { x = 33926, y = 31048, z = 8 }, teleportTo = { x = 33930, y = 31048, z = 8 } },
		-- From boat to room
		{ register = { x = 33922, y = 31045, z = 8 }, teleportTo = { x = 33918, y = 31045, z = 8 } },
		{ register = { x = 33922, y = 31046, z = 8 }, teleportTo = { x = 33918, y = 31046, z = 8 } },
		{ register = { x = 33922, y = 31047, z = 8 }, teleportTo = { x = 33918, y = 31047, z = 8 } },
		{ register = { x = 33922, y = 31048, z = 8 }, teleportTo = { x = 33918, y = 31048, z = 8 } },
		-- From room to boat
		{ register = { x = 33919, y = 31045, z = 8 }, teleportTo = { x = 33923, y = 31045, z = 8 } },
		{ register = { x = 33919, y = 31046, z = 8 }, teleportTo = { x = 33923, y = 31046, z = 8 } },
		{ register = { x = 33919, y = 31047, z = 8 }, teleportTo = { x = 33923, y = 31047, z = 8 } },
		{ register = { x = 33919, y = 31048, z = 8 }, teleportTo = { x = 33923, y = 31048, z = 8 } },

		-- Boat
		-- Enter on boat
		{ register = { x = 33896, y = 31055, z = 8 }, teleportTo = { x = 33896, y = 31059, z = 8 } },
		{ register = { x = 33897, y = 31055, z = 8 }, teleportTo = { x = 33897, y = 31059, z = 8 } },
		{ register = { x = 33898, y = 31055, z = 8 }, teleportTo = { x = 33898, y = 31059, z = 8 } },
		{ register = { x = 33899, y = 31055, z = 8 }, teleportTo = { x = 33899, y = 31059, z = 8 } },
		{ register = { x = 33900, y = 31055, z = 8 }, teleportTo = { x = 33900, y = 31059, z = 8 } },
		{ register = { x = 33901, y = 31055, z = 8 }, teleportTo = { x = 33901, y = 31059, z = 8 } },
		-- Back to room
		{ register = { x = 33896, y = 31058, z = 8 }, teleportTo = { x = 33896, y = 31054, z = 8 } },
		{ register = { x = 33897, y = 31058, z = 8 }, teleportTo = { x = 33897, y = 31054, z = 8 } },
		{ register = { x = 33898, y = 31058, z = 8 }, teleportTo = { x = 33898, y = 31054, z = 8 } },
		{ register = { x = 33899, y = 31058, z = 8 }, teleportTo = { x = 33899, y = 31054, z = 8 } },
		{ register = { x = 33900, y = 31058, z = 8 }, teleportTo = { x = 33900, y = 31054, z = 8 } },
		{ register = { x = 33901, y = 31058, z = 8 }, teleportTo = { x = 33901, y = 31054, z = 8 } },
		-- From boat to room
		{ register = { x = 33896, y = 31061, z = 8 }, teleportTo = { x = 33896, y = 31065, z = 8 } },
		{ register = { x = 33897, y = 31061, z = 8 }, teleportTo = { x = 33897, y = 31065, z = 8 } },
		{ register = { x = 33898, y = 31061, z = 8 }, teleportTo = { x = 33898, y = 31065, z = 8 } },
		{ register = { x = 33899, y = 31061, z = 8 }, teleportTo = { x = 33899, y = 31065, z = 8 } },
		{ register = { x = 33900, y = 31061, z = 8 }, teleportTo = { x = 33900, y = 31065, z = 8 } },
		{ register = { x = 33901, y = 31061, z = 8 }, teleportTo = { x = 33901, y = 31065, z = 8 } },
		-- From room to boat
		{ register = { x = 33896, y = 31064, z = 8 }, teleportTo = { x = 33896, y = 31060, z = 8 } },
		{ register = { x = 33897, y = 31064, z = 8 }, teleportTo = { x = 33897, y = 31060, z = 8 } },
		{ register = { x = 33898, y = 31064, z = 8 }, teleportTo = { x = 33898, y = 31060, z = 8 } },
		{ register = { x = 33899, y = 31064, z = 8 }, teleportTo = { x = 33899, y = 31060, z = 8 } },
		{ register = { x = 33900, y = 31064, z = 8 }, teleportTo = { x = 33900, y = 31060, z = 8 } },
		{ register = { x = 33901, y = 31064, z = 8 }, teleportTo = { x = 33901, y = 31060, z = 8 } },

		-- Boat
		-- Enter on boat
		{ register = { x = 33899, y = 31099, z = 8 }, teleportTo = { x = 33899, y = 31103, z = 8 } },
		{ register = { x = 33900, y = 31099, z = 8 }, teleportTo = { x = 33900, y = 31103, z = 8 } },
		{ register = { x = 33901, y = 31099, z = 8 }, teleportTo = { x = 33901, y = 31103, z = 8 } },
		{ register = { x = 33902, y = 31099, z = 8 }, teleportTo = { x = 33902, y = 31103, z = 8 } },
		{ register = { x = 33903, y = 31099, z = 8 }, teleportTo = { x = 33903, y = 31103, z = 8 } },
		{ register = { x = 33904, y = 31099, z = 8 }, teleportTo = { x = 33904, y = 31103, z = 8 } },
		{ register = { x = 33905, y = 31099, z = 8 }, teleportTo = { x = 33905, y = 31103, z = 8 } },
		-- Back from boat to room
		{ register = { x = 33899, y = 31102, z = 8 }, teleportTo = { x = 33899, y = 31098, z = 8 } },
		{ register = { x = 33900, y = 31102, z = 8 }, teleportTo = { x = 33900, y = 31098, z = 8 } },
		{ register = { x = 33901, y = 31102, z = 8 }, teleportTo = { x = 33901, y = 31098, z = 8 } },
		{ register = { x = 33902, y = 31102, z = 8 }, teleportTo = { x = 33902, y = 31098, z = 8 } },
		{ register = { x = 33903, y = 31102, z = 8 }, teleportTo = { x = 33903, y = 31098, z = 8 } },
		{ register = { x = 33904, y = 31102, z = 8 }, teleportTo = { x = 33904, y = 31098, z = 8 } },
		{ register = { x = 33905, y = 31102, z = 8 }, teleportTo = { x = 33905, y = 31098, z = 8 } },
		-- From boat to room
		{ register = { x = 33899, y = 31105, z = 8 }, teleportTo = { x = 33899, y = 31109, z = 8 } },
		{ register = { x = 33900, y = 31105, z = 8 }, teleportTo = { x = 33900, y = 31109, z = 8 } },
		{ register = { x = 33901, y = 31105, z = 8 }, teleportTo = { x = 33901, y = 31109, z = 8 } },
		{ register = { x = 33902, y = 31105, z = 8 }, teleportTo = { x = 33902, y = 31109, z = 8 } },
		{ register = { x = 33903, y = 31105, z = 8 }, teleportTo = { x = 33903, y = 31109, z = 8 } },
		{ register = { x = 33904, y = 31105, z = 8 }, teleportTo = { x = 33904, y = 31109, z = 8 } },
		{ register = { x = 33905, y = 31105, z = 8 }, teleportTo = { x = 33905, y = 31109, z = 8 } },
		-- From room to boat
		{ register = { x = 33899, y = 31108, z = 8 }, teleportTo = { x = 33899, y = 31104, z = 8 } },
		{ register = { x = 33900, y = 31108, z = 8 }, teleportTo = { x = 33900, y = 31104, z = 8 } },
		{ register = { x = 33901, y = 31108, z = 8 }, teleportTo = { x = 33901, y = 31104, z = 8 } },
		{ register = { x = 33902, y = 31108, z = 8 }, teleportTo = { x = 33902, y = 31104, z = 8 } },
		{ register = { x = 33903, y = 31108, z = 8 }, teleportTo = { x = 33903, y = 31104, z = 8 } },
		{ register = { x = 33904, y = 31108, z = 8 }, teleportTo = { x = 33904, y = 31104, z = 8 } },
		{ register = { x = 33905, y = 31108, z = 8 }, teleportTo = { x = 33905, y = 31104, z = 8 } },

		-- Boat
		-- Enter on boat
		{ register = { x = 33913, y = 31112, z = 8 }, teleportTo = { x = 33917, y = 31112, z = 8 } },
		{ register = { x = 33913, y = 31113, z = 8 }, teleportTo = { x = 33917, y = 31113, z = 8 } },
		{ register = { x = 33913, y = 31114, z = 8 }, teleportTo = { x = 33917, y = 31114, z = 8 } },
		{ register = { x = 33913, y = 31115, z = 8 }, teleportTo = { x = 33917, y = 31115, z = 8 } },
		{ register = { x = 33913, y = 31116, z = 8 }, teleportTo = { x = 33917, y = 31116, z = 8 } },
		-- Back to room
		{ register = { x = 33916, y = 31112, z = 8 }, teleportTo = { x = 33912, y = 31112, z = 8 } },
		{ register = { x = 33916, y = 31113, z = 8 }, teleportTo = { x = 33912, y = 31113, z = 8 } },
		{ register = { x = 33916, y = 31114, z = 8 }, teleportTo = { x = 33912, y = 31114, z = 8 } },
		{ register = { x = 33916, y = 31115, z = 8 }, teleportTo = { x = 33912, y = 31115, z = 8 } },
		{ register = { x = 33916, y = 31116, z = 8 }, teleportTo = { x = 33912, y = 31116, z = 8 } },
		-- From boat to room
		{ register = { x = 33918, y = 31112, z = 8 }, teleportTo = { x = 33922, y = 31112, z = 8 } },
		{ register = { x = 33918, y = 31113, z = 8 }, teleportTo = { x = 33922, y = 31113, z = 8 } },
		{ register = { x = 33918, y = 31114, z = 8 }, teleportTo = { x = 33922, y = 31114, z = 8 } },
		{ register = { x = 33918, y = 31115, z = 8 }, teleportTo = { x = 33922, y = 31115, z = 8 } },
		{ register = { x = 33918, y = 31116, z = 8 }, teleportTo = { x = 33922, y = 31116, z = 8 } },
		-- From room to boat
		{ register = { x = 33921, y = 31112, z = 8 }, teleportTo = { x = 33917, y = 31112, z = 8 } },
		{ register = { x = 33921, y = 31113, z = 8 }, teleportTo = { x = 33917, y = 31113, z = 8 } },
		{ register = { x = 33921, y = 31114, z = 8 }, teleportTo = { x = 33917, y = 31114, z = 8 } },
		{ register = { x = 33921, y = 31115, z = 8 }, teleportTo = { x = 33917, y = 31115, z = 8 } },
		{ register = { x = 33921, y = 31116, z = 8 }, teleportTo = { x = 33917, y = 31116, z = 8 } },

		-- Boat
		-- Enter on boat
		{ register = { x = 33936, y = 31087, z = 8 }, teleportTo = { x = 33936, y = 31091, z = 8 } },
		{ register = { x = 33937, y = 31087, z = 8 }, teleportTo = { x = 33937, y = 31091, z = 8 } },
		{ register = { x = 33938, y = 31087, z = 8 }, teleportTo = { x = 33938, y = 31091, z = 8 } },
		{ register = { x = 33939, y = 31087, z = 8 }, teleportTo = { x = 33939, y = 31091, z = 8 } },
		{ register = { x = 33940, y = 31087, z = 8 }, teleportTo = { x = 33940, y = 31091, z = 8 } },
		{ register = { x = 33941, y = 31087, z = 8 }, teleportTo = { x = 33941, y = 31091, z = 8 } },
		-- Back to room
		{ register = { x = 33936, y = 31090, z = 8 }, teleportTo = { x = 33936, y = 31086, z = 8 } },
		{ register = { x = 33937, y = 31090, z = 8 }, teleportTo = { x = 33937, y = 31086, z = 8 } },
		{ register = { x = 33938, y = 31090, z = 8 }, teleportTo = { x = 33938, y = 31086, z = 8 } },
		{ register = { x = 33939, y = 31090, z = 8 }, teleportTo = { x = 33939, y = 31086, z = 8 } },
		{ register = { x = 33940, y = 31090, z = 8 }, teleportTo = { x = 33940, y = 31086, z = 8 } },
		{ register = { x = 33941, y = 31090, z = 8 }, teleportTo = { x = 33941, y = 31086, z = 8 } },
		-- From boat to room
		{ register = { x = 33936, y = 31095, z = 8 }, teleportTo = { x = 33934, y = 31099, z = 8 } },
		{ register = { x = 33937, y = 31095, z = 8 }, teleportTo = { x = 33935, y = 31099, z = 8 } },
		{ register = { x = 33938, y = 31095, z = 8 }, teleportTo = { x = 33936, y = 31099, z = 8 } },
		{ register = { x = 33939, y = 31095, z = 8 }, teleportTo = { x = 33937, y = 31099, z = 8 } },
		{ register = { x = 33940, y = 31095, z = 8 }, teleportTo = { x = 33938, y = 31099, z = 8 } },
		{ register = { x = 33941, y = 31095, z = 8 }, teleportTo = { x = 33939, y = 31099, z = 8 } },
		-- From room to boat
		{ register = { x = 33934, y = 31098, z = 8 }, teleportTo = { x = 33936, y = 31094, z = 8 } },
		{ register = { x = 33935, y = 31098, z = 8 }, teleportTo = { x = 33937, y = 31094, z = 8 } },
		{ register = { x = 33936, y = 31098, z = 8 }, teleportTo = { x = 33938, y = 31094, z = 8 } },
		{ register = { x = 33937, y = 31098, z = 8 }, teleportTo = { x = 33939, y = 31094, z = 8 } },
		{ register = { x = 33938, y = 31098, z = 8 }, teleportTo = { x = 33940, y = 31094, z = 8 } },
		{ register = { x = 33939, y = 31098, z = 8 }, teleportTo = { x = 33941, y = 31094, z = 8 } },
		{ register = { x = 33940, y = 31098, z = 8 }, teleportTo = { x = 33942, y = 31094, z = 8 } },

		-- Boat
		-- Enter on boat
		{ register = { x = 33939, y = 31064, z = 8 }, teleportTo = { x = 33939, y = 31060, z = 8 } },
		{ register = { x = 33940, y = 31064, z = 8 }, teleportTo = { x = 33940, y = 31060, z = 8 } },
		{ register = { x = 33941, y = 31064, z = 8 }, teleportTo = { x = 33941, y = 31060, z = 8 } },
		{ register = { x = 33942, y = 31064, z = 8 }, teleportTo = { x = 33942, y = 31060, z = 8 } },
		{ register = { x = 33943, y = 31064, z = 8 }, teleportTo = { x = 33943, y = 31060, z = 8 } },
		{ register = { x = 33944, y = 31064, z = 8 }, teleportTo = { x = 33944, y = 31060, z = 8 } },
		-- Back to room
		{ register = { x = 33939, y = 31061, z = 8 }, teleportTo = { x = 33939, y = 31065, z = 8 } },
		{ register = { x = 33940, y = 31061, z = 8 }, teleportTo = { x = 33940, y = 31065, z = 8 } },
		{ register = { x = 33941, y = 31061, z = 8 }, teleportTo = { x = 33941, y = 31065, z = 8 } },
		{ register = { x = 33942, y = 31061, z = 8 }, teleportTo = { x = 33942, y = 31065, z = 8 } },
		{ register = { x = 33943, y = 31061, z = 8 }, teleportTo = { x = 33943, y = 31065, z = 8 } },
		{ register = { x = 33944, y = 31061, z = 8 }, teleportTo = { x = 33944, y = 31065, z = 8 } },
		-- From boat to room
		{ register = { x = 33939, y = 31058, z = 8 }, teleportTo = { x = 33939, y = 31054, z = 8 } },
		{ register = { x = 33940, y = 31058, z = 8 }, teleportTo = { x = 33940, y = 31054, z = 8 } },
		{ register = { x = 33941, y = 31058, z = 8 }, teleportTo = { x = 33941, y = 31054, z = 8 } },
		{ register = { x = 33942, y = 31058, z = 8 }, teleportTo = { x = 33942, y = 31054, z = 8 } },
		{ register = { x = 33943, y = 31058, z = 8 }, teleportTo = { x = 33943, y = 31054, z = 8 } },
		{ register = { x = 33944, y = 31058, z = 8 }, teleportTo = { x = 33944, y = 31054, z = 8 } },
		-- From room to boat
		{ register = { x = 33939, y = 31055, z = 8 }, teleportTo = { x = 33939, y = 31059, z = 8 } },
		{ register = { x = 33940, y = 31055, z = 8 }, teleportTo = { x = 33940, y = 31059, z = 8 } },
		{ register = { x = 33941, y = 31055, z = 8 }, teleportTo = { x = 33941, y = 31059, z = 8 } },
		{ register = { x = 33942, y = 31055, z = 8 }, teleportTo = { x = 33942, y = 31059, z = 8 } },
		{ register = { x = 33943, y = 31055, z = 8 }, teleportTo = { x = 33943, y = 31059, z = 8 } },
		{ register = { x = 33944, y = 31055, z = 8 }, teleportTo = { x = 33944, y = 31059, z = 8 } },

		-- Boat
		-- Enter on boat
		{ register = { x = 33934, y = 31108, z = 8 }, teleportTo = { x = 33938, y = 31108, z = 8 } },
		{ register = { x = 33934, y = 31109, z = 8 }, teleportTo = { x = 33938, y = 31109, z = 8 } },
		{ register = { x = 33934, y = 31110, z = 8 }, teleportTo = { x = 33938, y = 31110, z = 8 } },
		{ register = { x = 33934, y = 31111, z = 8 }, teleportTo = { x = 33938, y = 31111, z = 8 } },
		{ register = { x = 33934, y = 31112, z = 8 }, teleportTo = { x = 33938, y = 31112, z = 8 } },
		-- Back to room
		{ register = { x = 33937, y = 31108, z = 8 }, teleportTo = { x = 33933, y = 31108, z = 8 } },
		{ register = { x = 33937, y = 31109, z = 8 }, teleportTo = { x = 33933, y = 31109, z = 8 } },
		{ register = { x = 33937, y = 31110, z = 8 }, teleportTo = { x = 33933, y = 31110, z = 8 } },
		{ register = { x = 33937, y = 31111, z = 8 }, teleportTo = { x = 33933, y = 31111, z = 8 } },
		{ register = { x = 33937, y = 31112, z = 8 }, teleportTo = { x = 33933, y = 31112, z = 8 } },
		-- From boat to room
		{ register = { x = 33942, y = 31108, z = 8 }, teleportTo = { x = 33946, y = 31108, z = 8 } },
		{ register = { x = 33942, y = 31109, z = 8 }, teleportTo = { x = 33946, y = 31109, z = 8 } },
		{ register = { x = 33942, y = 31110, z = 8 }, teleportTo = { x = 33946, y = 31110, z = 8 } },
		{ register = { x = 33942, y = 31111, z = 8 }, teleportTo = { x = 33946, y = 31111, z = 8 } },
		{ register = { x = 33942, y = 31112, z = 8 }, teleportTo = { x = 33946, y = 31112, z = 8 } },
		-- From room to boat
		{ register = { x = 33945, y = 31108, z = 8 }, teleportTo = { x = 33941, y = 31108, z = 8 } },
		{ register = { x = 33945, y = 31109, z = 8 }, teleportTo = { x = 33941, y = 31109, z = 8 } },
		{ register = { x = 33945, y = 31110, z = 8 }, teleportTo = { x = 33941, y = 31110, z = 8 } },
		{ register = { x = 33945, y = 31111, z = 8 }, teleportTo = { x = 33941, y = 31111, z = 8 } },
		{ register = { x = 33945, y = 31112, z = 8 }, teleportTo = { x = 33941, y = 31112, z = 8 } },
	},
}

-- Initialize ebb and flow zone area
SoulWarQuest.ebbAndFlow.zone:addArea({ x = 33869, y = 30991, z = 8 }, { x = 33964, y = 31147, z = 9 })

-- Initialize bosses access for taint check
SoulWarQuest.areaZones.caustrophobicInferno:addArea({ x = 33982, y = 30981, z = 9 }, { x = 34051, y = 31110, z = 11 })

SoulWarQuest.areaZones.ebbAndFlow:addArea({ x = 33873, y = 30994, z = 8 }, { x = 33968, y = 31150, z = 9 })

SoulWarQuest.areaZones.furiousCrater:addArea({ x = 33814, y = 31819, z = 3 }, { x = 33907, y = 31920, z = 7 })

SoulWarQuest.areaZones.rottenWasteland:addArea({ x = 33980, y = 30986, z = 11 }, { x = 33901, y = 31105, z = 12 })

SoulWarQuest.areaZones.mirroredNightmare:addArea({ x = 33877, y = 31164, z = 9 }, { x = 33991, y = 31241, z = 13 })

SoulCagePosition = Position(33709, 31596, 14)
TaintDurationSeconds = 14 * 24 * 60 * 60 -- 14 days
GreedbeastKills = 0

SoulWarReflectDamageMap = {
	[COMBAT_PHYSICALDAMAGE] = 10,
	[COMBAT_FIREDAMAGE] = 10,
	[COMBAT_EARTHDAMAGE] = 10,
	[COMBAT_ENERGYDAMAGE] = 10,
	[COMBAT_ICEDAMAGE] = 10,
	[COMBAT_HOLYDAMAGE] = 10,
	[COMBAT_DEATHDAMAGE] = 10,
}

local soulWarTaints = {
	"taints-teleport", -- Taint 1
	"taints-spawn", -- Taint 2
	"taints-damage", -- Taint 3
	"taints-heal", -- Taint 4
	"taints-loss", -- Taint 5
}

GreedMonsters = {
	["Greedbeast"] = Position(33744, 31666, 14),
	["Soulsnatcher"] = Position(33747, 31668, 14),
	["Weak Soul"] = Position(33750, 31666, 14),
	["Strong Soul"] = Position(33750, 31666, 14),
	["Powerful Soul"] = Position(33750, 31666, 14),
}

function CreateGoshnarsGreedMonster(name, position)
	local function sendEffect()
		position:sendMagicEffect(CONST_ME_TELEPORT)
	end

	local function spawnMonster()
		Game.createMonster(name, position, true, false)
		logger.debug("Spawning {} in position {}", name, position:toString())
	end

	for i = 7, 9 do
		addEvent(sendEffect, i * 1000)
	end

	addEvent(spawnMonster, 10000)
end

function RemoveSoulCageAndBuffMalice()
	local tile = Tile(SoulCagePosition)
	local creatures = tile:getCreatures() or {}
	local soulCage
	for i, creature in ipairs(creatures) do
		if creature:getName() == "Soul Cage" then
			soulCage = creature
			logger.debug("Removing Soul Cage, the players not be able to kill him")
			break
		end
	end

	local rangeX = 20
	local rangeY = 20
	local spectators = Game.getSpectators(Position(33709, 31599, 14), false, false, rangeX, rangeX, rangeY, rangeY)
	if soulCage then
		local malice
		for i = 1, #spectators do
			logger.debug("Specs found {}", i)
			if spectators[i]:isMonster() then
				logger.debug("Malice Spectators {}", spectators[i]:getName())
				if spectators[i]:getName() == "Goshnar's Malice" then
					logger.debug("Found malice")
					malice = Monster(spectators[i])
					break
				end
			end
		end

		soulCage:remove()
		addEvent(SpawnSoulCage, 23000)

		if malice then
			logger.debug("Found malice, try adding reflect and defense")
			for elementType, reflectPercent in pairs(SoulWarReflectDamageMap) do
				malice:addReflectElement(elementType, reflectPercent)
			end
			malice:addDefense(10)
		end
	end
end

function SpawnSoulCage()
	local tile = Tile(SoulCagePosition)
	local creatures = tile:getCreatures() or {}
	local soulCage
	for i, creature in ipairs(creatures) do
		if creature:getName() == "Soul Cage" then
			soulCage = true
			break
		end
	end

	if not soulCage then
		Game.createMonster("Soul Cage", SoulCagePosition, true, true)
		logger.debug("Spawning Soul Cage in position {}", SoulCagePosition:toString())
		addEvent(RemoveSoulCageAndBuffMalice, 40000)
	end
end

local function shuffle(list)
	for i = #list, 2, -1 do
		local j = math.random(i)
		list[i], list[j] = list[j], list[i]
	end
end

local function createConnectedGroup(startPos, groupPositions, groupSize)
	local group = { startPos }
	local lastPos = startPos
	local directions = {
		{ x = 1, y = 0 },
		{ x = -1, y = 0 }, -- Right and left
		{ x = 0, y = 1 },
		{ x = 0, y = -1 }, -- Up and down
		{ x = 1, y = 1 },
		{ x = -1, y = -1 }, -- Diagonals
		{ x = -1, y = 1 },
		{ x = 1, y = -1 },
	}

	for i = 2, groupSize do
		shuffle(directions)
		local nextPos = nil
		for _, dir in ipairs(directions) do
			local potentialNextPos = Position(lastPos.x + dir.x, lastPos.y + dir.y, lastPos.z)
			if table.contains(groupPositions, potentialNextPos) then
				nextPos = potentialNextPos
				break
			end
		end

		if nextPos then
			table.insert(group, nextPos)
			table.remove(groupPositions, table.find(groupPositions, nextPos))
			lastPos = nextPos
		else
			break
		end
	end

	return group
end

local function generatePositionsInRange(center, range)
	local positions = {}
	for x = center.x - range, center.x + range do
		for y = center.y - range, center.y + range do
			table.insert(positions, Position(x, y, center.z))
		end
	end
	return positions
end

local toRevertPositions = {}

local tileItemIds = {
	32906,
	33066,
	33067,
	33068,
	33069,
	33070,
}

local function revertTilesAndApplyDamage(zonePositions)
	for _, pos in ipairs(zonePositions) do
		local tile = Tile(pos)
		if tile and tile:getGround() then
			if tile:getGround():getId() ~= 409 then
				local creature = tile:getTopCreature()
				if creature then
					local player = creature:getPlayer()
					if player then
						player:addHealth(-8000, COMBAT_DEATHDAMAGE)
					end
				end
			end

			local itemFound = false
			for i = 1, #tileItemIds do
				local item = tile:getItemById(tileItemIds[i])
				if item then
					itemFound = true
					break
				end
			end

			if tile:getGround():getId() == 410 and not itemFound and not tile:getItemByTopOrder(1) and not tile:getItemByTopOrder(3) then
				pos:sendMagicEffect(CONST_ME_REDSMOKE)
			end
		end
	end

	for posString, itemId in pairs(toRevertPositions) do
		local pos = posString:toPosition()
		local tile = Tile(pos)
		if tile and tile:getGround() and tile:getGround():getId() == 409 then
			tile:getGround():transform(itemId)
			toRevertPositions[pos:toString()] = nil
		end
	end
end

function Monster:createSoulWarWhiteTiles(centerRoomPosition, zonePositions, executeInterval)
	local groupPositions = generatePositionsInRange(centerRoomPosition, 7)
	local totalTiles = 11
	local groupSize = 3
	local groupsCreated = 0

	-- Run only for megalomania boss
	if executeInterval then
		-- Remove remains
		for _, pos in ipairs(zonePositions) do
			local tile = Tile(pos)
			if tile and tile:getGround() then
				local remains = tile:getItemById(33984)
				if remains then
					remains:remove()
				end
			end
		end
	end

	while #groupPositions > 0 and groupsCreated * groupSize < totalTiles do
		local randomIndex = math.random(#groupPositions)
		local startPos = groupPositions[randomIndex]
		table.remove(groupPositions, randomIndex)

		local group = createConnectedGroup(startPos, groupPositions, groupSize)
		for _, pos in ipairs(group) do
			local tile = Tile(pos)
			if tile then
				toRevertPositions[pos:toString()] = tile:getGround():getId()
				tile:getGround():transform(409)
			end
		end

		groupsCreated = groupsCreated + 1
	end

	addEvent(revertTilesAndApplyDamage, executeInterval or 3000, zonePositions)
end

function Monster:generateBagYouDesireLoot(player)
	local playerTaintLevel = player:getTaintLevel()
	if not playerTaintLevel then
		return {}
	end

	local monsterName = self:getName()
	local isMonsterValid = false
	for _, monster in ipairs(SoulWarQuest.bagYouDesireMonsters) do
		if monsterName == monster then
			isMonsterValid = true
			break
		end
	end

	if not isMonsterValid then
		return {}
	end

	-- Calculates the chances based on the number of taints
	local totalChance = SoulWarQuest.baseBagYouDesireChance + (playerTaintLevel * SoulWarQuest.bagYouDesireChancePerTaint)
	logger.debug("Player {} killed {} and has {} taints, loot chance {}", player:getName(), monsterName, playerTaintLevel, totalChance)
	-- Generate loot
	local loot = {}
	if math.random(1, 100) <= totalChance then
		local itemType = ItemType(SoulWarQuest.bagYouDesireItemId)
		if itemType then
			loot[itemType:getId()] = { count = 1 }
			logger.debug("Player {} killed {} and got a bag you desire with drop chance {}", player:getName(), monsterName, totalChance)
		end
	end

	return loot
end

local intervalBetweenExecutions = 10000

local accumulatedTime = 0
local desiredInterval = 40000
local bossSayInterval = 38000

function Monster:onThinkMegalomaniaWhiteTiles(interval, zonePositions, revertTime)
	self:onThinkGoshnarTormentCounter(interval, 36, intervalBetweenExecutions, SoulWarQuest.levers.goshnarsMegalomania.boss.position)

	accumulatedTime = accumulatedTime + interval

	if accumulatedTime == bossSayInterval then
		self:say("FEEL THE POWER OF MY WRATH!!")
	end
	-- Execute only after 40 seconds
	if accumulatedTime >= desiredInterval then
		self:createSoulWarWhiteTiles(SoulWarQuest.levers.goshnarsMegalomania.boss.position, zonePositions, revertTime)
		accumulatedTime = 0
	end
end

TaintTeleportCooldown = {}

function Player:getTaintNameByNumber(taintNumber)
	local haveTaintName = nil
	local soulWarQuest = self:soulWarQuestKV()
	local taintName = soulWarTaints[taintNumber]
	if taintName and soulWarQuest:get(taintName) then
		haveTaintName = taintName
	end

	return haveTaintName
end

function Player:addNextTaint()
	local soulWarQuest = self:soulWarQuestKV()
	for _, taint in ipairs(soulWarTaints) do
		if not soulWarQuest:get(taint) then
			soulWarQuest:set(taint, true)
			self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You have gained the " .. taint .. ".")
			break
		end
	end
end

function Player:getTaintLevel()
	local taintLevel = nil
	local soulWarQuest = self:soulWarQuestKV()
	for i, taint in ipairs(soulWarTaints) do
		if soulWarQuest:get(taint) then
			taintLevel = i
		end
	end

	return taintLevel
end

function Player:resetTaints()
	local soulWarQuest = self:soulWarQuestKV()
	local firstTaintTime = soulWarQuest:get("firstTaintTime")
	if firstTaintTime and os.time() >= (firstTaintTime + TaintDurationSeconds) then
		-- Reset all taints
		for _, taint in ipairs(soulWarTaints) do
			if soulWarQuest:get(taint) then
				soulWarQuest:remove(taint)
			end
		end

		soulWarQuest:remove("firstTaintTime")
		self:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Your goshnar's taints have been reset. You didn't finish the quest in 14 days")
	end
end

function Monster:tryTeleportToPlayer(sayMessage)
	local range = 30
	local spectators = Game.getSpectators(self:getPosition(), false, false, range, range, range, range)
	local maxDistance = 0
	local farthestPlayer = nil
	for i, spectator in ipairs(spectators) do
		if spectator:isPlayer() then
			local player = spectator:getPlayer()
			if player:getTaintNameByNumber(1) ~= nil then
				local distance = self:getPosition():getDistance(player:getPosition())
				if distance > maxDistance then
					maxDistance = distance
					farthestPlayer = player
					logger.debug("Found player {} to teleport", player:getName())
				end
			end
		end
	end

	if farthestPlayer and math.random(100) <= 10 then
		local playerPosition = farthestPlayer:getPosition()
		if TaintTeleportCooldown[farthestPlayer:getId()] then
			logger.debug("Cooldown is active to player {}", farthestPlayer:getName())
			return
		end

		if not TaintTeleportCooldown[farthestPlayer:getId()] then
			TaintTeleportCooldown[farthestPlayer:getId()] = true

			logger.debug("Scheduling player {} to teleport", farthestPlayer:getName())
			self:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
			farthestPlayer:getPosition():sendMagicEffect(CONST_ME_MORTAREA)
			addEvent(function(playerId, monsterId)
				local monsterEvent = Monster(monsterId)
				local playerEvent = Player(playerId)
				if monsterEvent and playerEvent then
					local destinationTile = Tile(playerPosition)
					if destinationTile and not (destinationTile:hasProperty(CONST_PROP_BLOCKPROJECTILE) or destinationTile:hasProperty(CONST_PROP_MOVEABLE)) then
						monsterEvent:say(sayMessage)
						monsterEvent:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
						monsterEvent:teleportTo(playerPosition, true)
						monsterEvent:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
					end
				end
			end, 2000, farthestPlayer:getId(), self:getId())

			addEvent(function(playerId)
				local playerEvent = Player(playerId)
				if not playerEvent then
					return
				end

				logger.debug("Cleaning player cooldown")
				TaintTeleportCooldown[playerEvent:getId()] = nil
			end, 10000, farthestPlayer:getId())
		end
	end
end

function Monster:getSoulWarKV()
	return SoulWarQuest.kvSoulWar:scoped("monster"):scoped(self:getName())
end

function Monster:getHatredDamageMultiplier()
	return self:getSoulWarKV():get("burning-hatred-empowered") or 0
end

function Monster:increaseHatredDamageMultiplier(multiplierCount)
	local attackMultiplier = self:getHatredDamageMultiplier()
	self:getSoulWarKV():set("burning-hatred-empowered", attackMultiplier + multiplierCount or 10)
end

function Monster:resetHatredDamageMultiplier()
	self:getSoulWarKV():remove("burning-hatred-empowered")
end

function Position:increaseNecromaticMegalomaniaStrength()
	local tile = Tile(self)
	if tile then
		local item = tile:getItemById(SoulWarQuest.necromanticRemainsId)
		if item then
			local boss = Creature("Goshnar's Megalomania")
			if boss then
				boss:increaseHatredDamageMultiplier(5)
				item:remove()
				logger.debug("Necromantic remains strength increased")
			end
		end
	end
end

local lastExecutionTime = 0

-- Damage 24 to 36 have a special damage
local damageTable = {
	1400,
	1600,
	1800,
	2200,
	2400,
	2600,
	3000,
	3400,
	3800,
	4200,
	4800,
	5200,
	5600,
}

function Monster:onThinkGoshnarTormentCounter(interval, maxLimit, intervalBetweenExecutions, bossPosition)
	local interval = os.time() * 1000
	if interval - lastExecutionTime < intervalBetweenExecutions then
		return
	end

	lastExecutionTime = interval
	logger.debug("Icon time count {}", interval)
	local spectators = Game.getSpectators(bossPosition, false, true, 15, 15, 15, 15)
	for i = 1, #spectators do
		local player = spectators[i]
		local tormentCounter = player:getGoshnarSymbolTormentCounter()
		if tormentCounter <= maxLimit then
			player:increaseGoshnarSymbolTormentCounter(maxLimit)
			logger.debug("Player {} has {} damage counter", player:getName(), tormentCounter)

			if tormentCounter > 0 then
				local damage = tormentCounter * 35
				if tormentCounter >= 24 then
					damage = damageTable[tormentCounter - 23]
				end

				logger.debug("Final damage {}", damage)
				player:addHealth(-damage, COMBAT_DEATHDAMAGE)
				player:getPosition():sendMagicEffect(CONST_ME_PINK_ENERGY_SPARK)
			end
		end

		if tormentCounter == 5 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The dread starts to torment you! Don't let dread level reach critical value!")
		elseif tormentCounter == 15 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The dread's torment becomes unbearable!")
		elseif tormentCounter == 24 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The Dread's torment begins to tear you apart!")
		elseif tormentCounter == 30 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The dread's torment is killing you!")
		elseif tormentCounter == 36 then
			player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The dread's torment is now lethal!")
		end
	end
end

function Monster:increaseAspectOfPowerDeathCount()
	local bossKV = self:getSoulWarKV()
	local aspectDeathCount = bossKV:get("aspect-of-power-death-count") or 0
	local newCount = aspectDeathCount + 1
	logger.debug("Aspect of Power death count {}", newCount)
	bossKV:set("aspect-of-power-death-count", newCount)
	if newCount == 4 then
		self:setType("Goshnar's Megalomania Green")
		self:say("THE DEATH OF ASPECTS DIMINISHES GOSHNAR'S POWER AND HE TURNS VULNERABLE!")
		bossKV:set("aspect-of-power-death-count", 0)
		logger.debug("Aspect of Power defeated all and Megalomania is now vulnerable, reseting death count.")
		SoulWarQuest.changePurpleEvent = addEvent(function()
			local boss = Creature("Goshnar's Megalomania")
			if boss and boss:getTypeName() == "Goshnar's Megalomania Green" then
				boss:setType("Goshnar's Megalomania Purple")
				boss:say("GOSHNAR REGAINED ENOUGH POWER TO TURN INVULNERABLE AGAIN!")
				logger.debug("Megalomania is now immune again")
			end
		end, SoulWarQuest.timeToReturnImmuneMegalomania * 1000)
	end
end

function Monster:goshnarsDefenseIncrease(kvName)
	local currentTime = os.time()
	-- Gets the time when the "Greedy Maw" item was last used.
	local lastItemUseTime = SoulWarQuest.kvSoulWar:get(kvName) or 0
	-- Checks if more than config time have passed since the item was last used.
	if currentTime >= lastItemUseTime + SoulWarQuest.timeToIncreaseCrueltyDefense then
		logger.debug("{} old defense {}", self:getName(), self:getDefense())
		self:addDefense(SoulWarQuest.goshnarsCrueltyDefenseChange)
		logger.debug("{} new defense {}", self:getName(), self:getDefense())

		--- Updates the KV to reflect the timing of the increase to maintain control.
		SoulWarQuest.kvSoulWar:set(kvName, currentTime)
	else
		-- If config time have not passed, logs the increase has been skipped.
		logger.debug("{} skips increase cooldown due to recent item use.", self:getName())
	end
end

function Player:getSoulWarZoneMonster()
	local zoneMonsterName = nil
	for zoneName, monsterName in pairs(SoulWarQuest.areaZones.monsters) do
		local zone = Zone.getByName(zoneName)
		if zone and zone:isInZone(self:getPosition()) then
			zoneMonsterName = monsterName
			break
		end
	end

	return zoneMonsterName
end

function Player:isInBoatSpot()
	-- Get ebb and flow zone and check if player is in zone
	local zone = SoulWarQuest.ebbAndFlow.getZone()
	local tile = Tile(self:getPosition())
	local groundId
	if tile and tile:getGround() then
		groundId = tile:getGround():getId()
	end
	if zone and zone:isInZone(self:getPosition()) and tile and groundId == SoulWarQuest.ebbAndFlow.boatId then
		logger.debug("Player {} is in boat spot", self:getName())
		return true
	end

	logger.debug("Player {} is not in boat spot", self:getName())
	return false
end

function Player:soulWarQuestKV()
	return self:kv():scoped("quest"):scoped("soul-war")
end

function Player:getGoshnarSymbolTormentCounter()
	local soulWarKV = self:soulWarQuestKV()
	return soulWarKV:get("goshnars-hatred-torment-count") or 0
end

function Player:increaseGoshnarSymbolTormentCounter(maxLimit)
	local soulWarKV = self:soulWarQuestKV()
	local tormentCount = self:getGoshnarSymbolTormentCounter()
	if tormentCount == maxLimit then
		self:setIcon("goshnars-hatred-damage", CreatureIconCategory_Quests, CreatureIconQuests_RedCross, tormentCount)
		return
	end

	self:setIcon("goshnars-hatred-damage", CreatureIconCategory_Quests, CreatureIconQuests_RedCross, tormentCount + 1)
	soulWarKV:set("goshnars-hatred-torment-count", tormentCount + 1)
end

function Player:removeGoshnarSymbolTormentCounter(count)
	local soulWarKV = self:soulWarQuestKV()
	local tormentCount = self:getGoshnarSymbolTormentCounter()
	if tormentCount > count then
		self:setIcon("goshnars-hatred-damage", CreatureIconCategory_Quests, CreatureIconQuests_RedCross, tormentCount - count)
		soulWarKV:set("goshnars-hatred-torment-count", tormentCount - count)
	else
		self:resetGoshnarSymbolTormentCounter()
	end
end

function Player:resetGoshnarSymbolTormentCounter()
	local soulWarKV = self:soulWarQuestKV()
	soulWarKV:remove("goshnars-hatred-torment-count")
	self:removeIcon("goshnars-hatred-damage")
end

function Player:furiousCraterKV()
	return self:soulWarQuestKV():scoped("furius-crater")
end

function Player:pulsatingEnergyKV()
	return self:furiousCraterKV():scoped("pulsating-energy")
end

function Zone:getRandomPlayer()
	local players = self:getPlayers()
	if #players == 0 then
		return nil
	end

	local randomIndex = math.random(#players)
	return players[randomIndex]
end

local function delayedCastSpell(cid, var, combat, targetId)
	local creature = Creature(cid)
	if not creature then
		return
	end

	local target = Player(targetId)
	if target then
		combat:execute(creature, positionToVariant(target:getPosition()))
	end
end

function Creature:applyZoneEffect(var, combat, zoneName)
	local outfitConfig = {
		outfit = { lookType = 242, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0, lookAddons = 0 },
		time = 7000,
	}

	local zone = Zone.getByName(zoneName)
	if not zone then
		logger.error("Could not find zone '" .. zoneName .. "', you need use the 'BossLever' system")
		return false
	end

	local target = zone:getRandomPlayer()
	if not target then
		return true
	end

	local condition = Condition(CONDITION_OUTFIT)
	condition:setTicks(outfitConfig.time)
	condition:setOutfit(outfitConfig.outfit)
	target:addCondition(condition)
	target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)

	addEvent(delayedCastSpell, SoulWarQuest.goshnarsCrueltyWaveInterval * 1000, self:getId(), var, combat, target:getId())

	return true
end

function string.toPosition(str)
	local patterns = {
		-- table format
		"{%s*x%s*=%s*(%d+)%s*,%s*y%s*=%s*(%d+)%s*,%s*z%s*=%s*(%d+)%s*}",
		-- Position format
		"Position%s*%((%d+)%s*,%s*(%d+)%s*,%s*(%d+)%s*%)",
		-- x, y, z format
		"(%d+)%s*,%s*(%d+)%s*,%s*(%d+)",
	}

	for _, pattern in ipairs(patterns) do
		local x, y, z = string.match(str, pattern)
		if x and y and z then
			return Position(tonumber(x), tonumber(y), tonumber(z))
		end
	end
end