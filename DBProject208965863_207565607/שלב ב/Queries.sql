-- Basic queries
SELECT s.Name AS SoldierName, TO_CHAR(s.BornDate, 'DD/MM/YYYY') AS BornDate, d.Name AS DepartmentName
FROM Soldier s
JOIN Department d ON s.DepartmentID = d.DepartmentID
ORDER BY s.Name;

-- ������ 2: ����� ���� ������� ���� ���� ��� ������� ���
SELECT s.Name AS SoldierName, w.Name AS WeaponName
FROM Soldier s
JOIN UsesExplosive ue ON s.DepartmentID = ue.DepartmentID
JOIN Weapon w ON ue.WeaponID = w.WeaponID
ORDER BY s.Name, w.Name;

-- ������ 3: ����� ����� �������� �� ����� ������� ������
SELECT d.Name AS DepartmentName, db.MaxWeight
FROM Department d
JOIN Depbombs db ON d.DepartmentID = db.DepartmentID
ORDER BY d.Name;

-- ������ 4: ����� ���� ������� ��� �����
SELECT d.Name AS DepartmentName, COUNT(s.SoldierID) AS NumberOfSoldiers
FROM Department d
LEFT JOIN Soldier s ON d.DepartmentID = s.DepartmentID
GROUP BY d.Name
ORDER BY d.Name;


-- delete 
DELETE FROM fighter
WHERE SoldierID IN
 (SELECT SoldierID FROM Soldier WHERE EXTRACT(YEAR FROM BornDate) < 1982)
 
 
 -- ������ ����� 2: ����� ��� ��� ��� ������
DELETE FROM Weapon
WHERE WeaponID NOT IN (SELECT WeaponID FROM UsesExplosive)
  AND WeaponID NOT IN (SELECT WeaponID FROM UsesRobots);
  
  
--updats
-- ������ ����� 1: ����� ����� ������� ������ 1
UPDATE Soldier
SET Rank = 8
WHERE DepartmentID = (SELECT DepartmentID
 FROM Department WHERE DepartmentID = 1);
 
 -- ������ ����� 2: ����� ����� ����� ���� ��� ������ ������ ��� ���
UPDATE Explosives
SET LastDateToUse = SYSDATE + INTERVAL '1' YEAR
WHERE LastDateToUse < SYSDATE;
