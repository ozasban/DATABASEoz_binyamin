-- ������ 1: ����� ������ ��� ����� ������ ����
SELECT s.Name AS SoldierName, s.BornDate, s.Rank
FROM Soldier s
WHERE s.Rank = &rank
  AND s.BornDate BETWEEN TO_DATE(&startDate, 'DD/MM/YYYY') AND TO_DATE(&endDate, 'DD/MM/YYYY');
  
  -- ������ 2: ����� ��� ��� ��� ������� ����� ������ ������ ����� ������
SELECT w.Name AS WeaponName, w.MinRankToUse, e.LastDateToUse
FROM Weapon w
JOIN Explosives e ON w.WeaponID = e.WeaponID
WHERE w.MinRankToUse <= &minRank
  AND e.LastDateToUse <= TO_DATE('&lastUseDate', 'DD/MM/YYYY');
  
  --������ 3: ����� ������ ��� ���� ���� 
SELECT d.Name AS DepartmentName, db.MaxWeight
FROM Department d
JOIN Depbombs db ON d.DepartmentID = db.DepartmentID
WHERE db.MaxWeight >= &maxWeight;

-- ������ 4: ����� ������� ��� ���� ���� �����
SELECT r.WeaponID, r.MaxHoursBattary
FROM Robots r
WHERE r.MaxHoursBattary >= &minHoursBattery


