CREATE TABLE User (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL
);

/* A plantable vegetable */
/* Depth values are stores in mm, temperature values stored in centigrade, harvest time stored in days */
CREATE TABLE PlantType (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	plantDepthMin INTEGER NOT NULL,
	plantDepthMax INTEGER NOT NULL,
	germinationTemperatureMin REAL NOT NULL,
	germinationTemperatureMax INTEGER NOT NULL,
	germinationDaysMin INTEGER NOT NULL,
	germinationDaysMax INTEGER NOT NULL,
	growTemperatureMin INTEGER NOT NULL,
	growTemperatureMax INTEGER NOT NULL,
	harvestDaysMin INTEGER NOT NULL,
	harvestDaysMax INTEGER NOT NULL,
	harvestInstructions TEXT NOT NULL,
	UNIQUE(name)
);

/*  */
CREATE TABLE Material (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	type TEXT NOT NULL,
	name TEXT NOT NULL,
	description TEXT NOT NULL,
	UNIQUE(type, name)
);

/* List of required materials for planting */
/* This is just for the user to know what they need */
CREATE TABLE PlantType_Material (
	plantType INTEGER NOT NULL,
	material INTEGER NOT NULL,
	FOREIGN KEY (plantType) REFERENCES PlantType(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (material) REFERENCES Material(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* A user's project */
CREATE TABLE Project (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	user INTEGER NOT NULL,
	name TEXT NOT NULL,
	created DATETIME NOT NULL,
	description TEXT NOT NULL,
	FOREIGN KEY (user) REFERENCES User(id) ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE (user, name)
);

/* A plant being grown as part of this project */
/* Tray -OR- Pot defined, but should not be in both at the same time */
CREATE TABLE Plant (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	plantType INTEGER NOT NULL,
	tray INTEGER DEFAULT NULL,
	pot INTEGER DEFAULT NULL,
	FOREIGN KEY (plantType) REFERENCES PlantType(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (tray) REFERENCES Tray(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (pot) REFERENCES Pot(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* A tray containing seedlings */
CREATE TABLE Tray (
	id INTEGER NOT NULL,
	project INTEGER NOT NULL,
	plantType INTEGER NOT NULL,
	FOREIGN KEY (project) REFERENCES Project(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (plantType) REFERENCES PlantType(id) ON UPDATE CASCADE ON DELETE CASCADE
);

/* A pot containing a single plant */
/* Has a type (material) */
/* Has a soil type (material) */
CREATE TABLE Pot (
	id INTEGER NOT NULL,
	project INTEGER NOT NULL,
	soil INTEGER NOT NULL,
	type INTEGER NOT NULL,
	FOREIGN KEY (project) REFERENCES Project(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (soil) REFERENCES Material(id) ON UPDATE CASCADE,
	FOREIGN KEY (type) REFERENCES Material(id) ON UPDATE CASCADE
);

/* An ailment that can fall upon a plant */
CREATE TABLE Sickness (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	name TEXT NOT NULL,
	symptoms TEXT NOT NULL,
	solution TEXT NOT NULL,
	imagePath TEXT DEFAULT NULL
);

/* Reference guide for gardening */
CREATE TABLE Instruction (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	chapter INTEGER NOT NULL,
	sequence INTEGER NOT NULL,
	description TEXT NOT NULL,
	imagePath DEFAULT NULL,
	UNIQUE (chapter, sequence)
);

/* Tracks steps that have been marked as completed in a project */
CREATE TABLE Project_InstructionCompleted (
	project INTEGER NOT NULL,
	instruction INTEGER NOT NULL,
	dateCompleted DATETIME NOT NULL,
	FOREIGN KEY (project) REFERENCES Project(id) ON UPDATE CASCADE ON DELETE CASCADE,
	FOREIGN KEY (instruction) REFERENCES Instruction(id) ON UPDATE CASCADE ON DELETE CASCADE,
	UNIQUE (project, instruction)
);

/* A reminder for the user */
CREATE TABLE Reminder (
	id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	interval INTEGER NOT NULL,
	description TEXT NOT NULL
);

/* Indicates a user does not want to receive the specified notification */
CREATE TABLE User_IgnoreReminder (
	user INTEGER NOT NULL,
	reminder INTEGER NOT NULL
);