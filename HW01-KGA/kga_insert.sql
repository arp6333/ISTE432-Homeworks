INSERT INTO User VALUES
	(1, 'Robert Tables'),
	(2, 'Ellie Parobek'),
	(3, 'Larry Romero');

INSERT INTO PlantType VALUES
	(1, "Broccoli", 6, 13, 10, 29, 7, 10, 18, 24, 78, 98, "Start Harvesting when the flower heads form, but before the plants start to yellow.  
		You can cut the main head of the broccoli when its 3-4 inches long in diameter and 4 inches high.  Finally cut the main stem 6 inches 
		below the head or 1/2 inches above where the roots begin to split.  Dry and Refrigerate or Freeze.  Fresh for up to two weeks."),
	(2, "Bean", 25, 25, 18, 29, 4, 10, 21, 27, 45, 60, "Snap beans.  harvesting daily when beans are pencil size in diameter encourages 
		continual production.  Refrigerate for 1-1.5 weeks.  Do not wash until ready to eat them.\nDry Beans: should remain on bush until leaves 
		have withered and fallen."),
	(3, "Onion", 6, 13, 18, 29, 4, 12, 13, 24, 80, 120, "When onions start to mature, the tops become yellow and begin to fall over.  Loosen 
		the soil to encourage drying, and after a few days turn them up and let them cure on dry ground.  When tops are brown, pull the onions.  
		Be sure to harvest in late summer, before cool weather.");
	
INSERT INTO Material VALUES 
	(1, 'soil', "Black Gold Potting Soil", ""),
	(2, 'soil', "Organic Seed Starting Potting Soil", ""),
	(3, 'tray', "Tray", "A container for your seedlings"),
	(4, 'tray', "Tray Cover", "A cover for your seedling container"),
	(5, 'pot', "GoPro5 Gallon", "I imagine this is 5 gallons..."),
	(6, 'pot', "Plant Warrior", "It kills the plants");

INSERT INTO PlantType_Material VALUES
	(1, 1),
	(1, 3),
	(1, 4),
	(1, 5),
	(2, 1),
	(2, 3),
	(2, 4),
	(2, 5),
	(3, 1),
	(3, 3),
	(3, 4),
	(3, 5);

INSERT INTO Project VALUES 
	(1, 2, "A depressing garden", "2019-01-24", "No signs of life..."),
	(2, 3, "A slightly more lively garden", "2019-01-25", ""),
	(3, 1, "Robert's Garden", "2019-01-21", "");

INSERT INTO Plant VALUES 
	(1, 1, 1, NULL),
	(2, 1, 1, NULL),
	(3, 2, 2, NULL),
	(4, 1, NULL, 1),
	(5, 2, NULL, 2),
	(6, 2, NULL, 3);
	
INSERT INTO Tray VALUES
	(1, 1, 1),
	(2, 1, 2),
	(3, 2, 3);

INSERT INTO Pot VALUES
	(1, 1, 2, 5),
	(2, 2, 1, 6),
	(3, 2, 1, 6);

INSERT INTO Sickness VALUES 
	(1, "Damping-Off", "A plant disease occuring in excessively damp conditions, in particular the collapse and death of a young seedling as a result of a fungal infection",
		"Watering seedlings with an antifungal solution can help protect seedlings.  You can also simmer mashed up garlic, and pour it over the seedlings once the water has cooled", "damping.gif"),
	(2, "Too Little Water", "Leaves are turning brown around the edges, curling up or turning translucent they may be suffering from dehydration.  Stick a finger 1 inch into soil.  If it feels dry, the plant requires watering", 
		"Stick finter 1 inch into the plant's soil.  If it feels dry, your plant requires watering pick up smaller plants, before and after watering, and take not of their weight", "dehydration.gif"),
	(3, "Lack of Sunshine", "Plants deprived of light have tiny leaves and yellow color because they don't form chlorophyll.  When plants lack sunlight, leaves begin to change colors from green to brown and yellow.  Leaves will start to blister leaving tan, brown, or warty growths forming where the blisters were.", 
		"Check the area the plants are in.  Make sure they have access to direct sunlight.  if you cannot get quality sunlight, consider making or buying a grow light for the plants.", NULL);
	
INSERT INTO Instruction VALUES
	(1, 1, 1, "Place your seed tray into the bottom tray.", NULL),
	(2, 1, 2, "Make your labels.  Get creative.", NULL),
	(3, 1, 3, "Fill the container about 3/4 of the way with your organic seed soil (or within .5 inches from the top).  Wet the soil so it's moist like firm mud.  Be careful to avoid overfilling it.", NULL);
	
INSERT INTO Project_InstructionCompleted VALUES
	(1, 1, "2018-01-24"),
	(1, 2, "2018-01-24"),
	(1, 3, "2018-01-24");
	
INSERT INTO Reminder VALUES 
	(1, 86400, "Have you watered your plants today?"),
	(2, 86400, "Have you checked your plants leaves today?"),
	(3, 86400, "Are any of your plants ready to harvest?");

INSERT INTO User_IgnoreReminder VALUES
	(3, 1),
	(3, 2),
	(3, 3);