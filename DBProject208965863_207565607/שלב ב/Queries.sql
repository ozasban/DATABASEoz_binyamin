-- Basic queries
SELECT s.Name AS SoldierName, TO_CHAR(s.BornDate, 'DD/MM/YYYY') AS BornDate, d.Name AS DepartmentName
FROM Soldier s
JOIN Department d ON s.DepartmentID = d.DepartmentID
ORDER BY s.Name;

-- שאילתה 2: שליפת שמות החיילים וכלי הנשק שהם משתמשים בהם
SELECT s.Name AS SoldierName, w.Name AS WeaponName
FROM Soldier s
JOIN UsesExplosive ue ON s.DepartmentID = ue.DepartmentID
JOIN Weapon w ON ue.WeaponID = w.WeaponID
ORDER BY s.Name, w.Name;

-- שאילתה 3: שליפת המשקל המקסימלי של פצצות במחלקות השונות
SELECT d.Name AS DepartmentName, db.MaxWeight
FROM Department d
JOIN Depbombs db ON d.DepartmentID = db.DepartmentID
ORDER BY d.Name;

-- שאילתה 4: שליפת מספר החיילים בכל מחלקה
SELECT d.Name AS DepartmentName, COUNT(s.SoldierID) AS NumberOfSoldiers
FROM Department d
LEFT JOIN Soldier s ON d.DepartmentID = s.DepartmentID
GROUP BY d.Name
ORDER BY d.Name;


-- delete 
DELETE FROM fighter
WHERE SoldierID IN
 (SELECT SoldierID FROM Soldier WHERE EXTRACT(YEAR FROM BornDate) < 1982)
 
 
 -- שאילתת מחיקה 2: מחיקת כלי נשק שלא בשימוש
DELETE FROM Weapon
WHERE WeaponID NOT IN (SELECT WeaponID FROM UsesExplosive)
  AND WeaponID NOT IN (SELECT WeaponID FROM UsesRobots);
  
  
--updats
-- שאילתת עדכון 1: עדכון דירוג לחיילים במחלקת 1
UPDATE Soldier
SET Rank = 8
WHERE DepartmentID = (SELECT DepartmentID
 FROM Department WHERE DepartmentID = 1);
 
 -- שאילתת עדכון 2: עדכון תאריך תפוגה לכלי נשק שתאריך התפוגה שלו חלף
UPDATE Explosives
SET LastDateToUse = SYSDATE + INTERVAL '1' YEAR
WHERE LastDateToUse < SYSDATE;
