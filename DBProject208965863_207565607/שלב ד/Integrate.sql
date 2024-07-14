CREATE TABLE Mission
(
  MissionID INT NOT NULL,
  Name VARCHAR2(30) NOT NULL,
  Location VARCHAR2(30) NOT NULL,
  DepartmentID INT NOT NULL,
  ComID INT NOT NULL,
  PRIMARY KEY (MissionID),
  FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID),
  FOREIGN KEY (ComID) REFERENCES CommanderT(ComID)
);

INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (1, 'mission1', 'jenin', 1, 854567801);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (2, 'mission2', 'halhul', 2, 597170275);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (3, 'mission3', 'ramalla', 3, 284456997);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (4, 'mission4', 'gaza', 4, 382340873);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (5, 'mission5', 'jenin', 5, 456542193);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (6, 'mission6', 'halhul', 6, 239021751);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (7, 'mission7', 'ramalla', 7, 784035019);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (8, 'mission8', 'gaza', 8, 458692899);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (9, 'mission9', 'jenin', 9, 513254138);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (10, 'mission10', 'halhul', 10, 733741583);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (11, 'mission11', 'ramalla', 31, 676175225);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (12, 'mission12', 'gaza', 32, 292483544);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (13, 'mission13', 'jenin', 33, 376752575);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (14, 'mission14', 'halhul', 34, 383487578);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (15, 'mission15', 'ramalla', 35, 661373728);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (16, 'mission16', 'gaza', 36, 611570580);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (17, 'mission17', 'jenin', 37, 646340985);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (18, 'mission18', 'halhul', 38, 477760344);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (19, 'mission19', 'ramalla', 39, 933504468);
INSERT INTO Mission (MissionID, Name, Location, DepartmentID, ComID) VALUES (20, 'mission20', 'gaza', 40, 854567801);
