--להציג את כל  החיילים והמשימות אליהם הם משוייכים לפי מחלקה ומפקד
CREATE OR REPLACE VIEW SoldierMissionView AS
SELECT 
    S.SoldierID,
    S.Name AS SoldierName,
    S.BornDate,
    S.Profile,
    S.Rank,
    D.Name AS DepartmentName,
    M.Name AS MissionName,
    M.Location,
    C.ComID,
    C.Rank AS CommanderRank
FROM 
    Soldier S
JOIN 
    Department D ON S.DepartmentID = D.DepartmentID
JOIN 
    Mission M ON D.DepartmentID = M.DepartmentID
JOIN 
    CommanderT C ON M.ComID = C.ComID;
    
--מציג את  כל הפרטים על המשימות והפרטים של התאגד עליהם
CREATE OR REPLACE VIEW CommanderMissionView AS
SELECT 
    M.MissionID,
    M.Name AS MissionName,
    M.Location,
    M.DepartmentID,
    C.ComID,
    C.Rank AS CommanderRank,
    C.NumOfUnitCom
FROM 
    Mission M
JOIN 
    CommanderT C ON M.ComID = C.ComID;

    
--הצגת חיילים ומשימותהם
SELECT 
    SoldierID,
    SoldierName,
    MissionName,
    Location
FROM 
    SoldierMissionView;
    
--הצגת חיילים לפי מיקום הממשימה
SELECT 
    SoldierID,
    SoldierName,
    MissionName,
    Location
FROM 
    SoldierMissionView
WHERE 
    Location = 'gaza';
    
    
--מציג משימות ומפקדי תאגד שלהם
SELECT 
    MissionID,
    MissionName,
    Location,
    CommanderRank
FROM 
    CommanderMissionView;
    
-- תאגד מציג משימות לפי דרגת מפקד 
SELECT 
    MissionID,
    MissionName,
    Location,
    CommanderRank
FROM 
    CommanderMissionView
WHERE 
    CommanderRank = 'ravseren';
    
    
    
select * from SoldierMissionView;
select * from CommanderMissionView;
