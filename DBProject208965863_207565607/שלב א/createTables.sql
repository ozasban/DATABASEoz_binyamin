CREATE TABLE Department
(
  DepartmentID INT NOT NULL,
  Name CHAR(30) NOT NULL,
  PRIMARY KEY (DepartmentID),
  UNIQUE (Name)
);

CREATE TABLE Depbombs
(
  MaxWeight INT NOT NULL,
  DepartmentID INT NOT NULL,
  PRIMARY KEY (DepartmentID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE DepTunnels
(
  MaxDepth INT NOT NULL,
  DepartmentID INT NOT NULL,
  PRIMARY KEY (DepartmentID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Weapon
(
  WeaponID INT NOT NULL,
  MinRankToUse INT NOT NULL,
  Name CHAR(30) NOT NULL,
  PRIMARY KEY (WeaponID),
  UNIQUE (Name)
);

CREATE TABLE Explosives
(
  LastDateToUse DATE NOT NULL,
  WeaponID INT NOT NULL,
  PRIMARY KEY (WeaponID),
  FOREIGN KEY (WeaponID) REFERENCES Weapon(WeaponID)
);

CREATE TABLE Robots
(
  MaxHoursBattary INT NOT NULL,
  WeaponID INT NOT NULL,
  PRIMARY KEY (WeaponID),
  FOREIGN KEY (WeaponID) REFERENCES Weapon(WeaponID)
);

CREATE TABLE UsesExplosive
(
  DepartmentID INT NOT NULL,
  WeaponID INT NOT NULL,
  PRIMARY KEY (DepartmentID, WeaponID),
  FOREIGN KEY (DepartmentID) REFERENCES Depbombs(DepartmentID),
  FOREIGN KEY (WeaponID) REFERENCES Explosives(WeaponID)
);

CREATE TABLE UsesRobots
(
  DepartmentID INT NOT NULL,
  WeaponID INT NOT NULL,
  PRIMARY KEY (DepartmentID, WeaponID),
  FOREIGN KEY (DepartmentID) REFERENCES DepTunnels(DepartmentID),
  FOREIGN KEY (WeaponID) REFERENCES Robots(WeaponID)
);

CREATE TABLE Soldier
(
  SoldierID INT NOT NULL,
  Name CHAR(30) NOT NULL,
  BornDate DATE NOT NULL,
  Profile INT NOT NULL,
  Rank INT NOT NULL,
  DepartmentID INT NOT NULL,
  PRIMARY KEY (SoldierID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE commander
(
  NumberOfSoldiers INT NOT NULL,
  SoldierID INT NOT NULL,
  PRIMARY KEY (SoldierID),
  FOREIGN KEY (SoldierID) REFERENCES Soldier(SoldierID)
);

CREATE TABLE fighter
(
  Role CHAR(30) NOT NULL,
  SoldierID INT NOT NULL,
  PRIMARY KEY (SoldierID),
  FOREIGN KEY (SoldierID) REFERENCES Soldier(SoldierID)
);