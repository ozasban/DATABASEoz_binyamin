--����� �� ��  ������� �������� ����� �� �������� ��� ����� �����
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
    
--���� ��  �� ������ �� ������� ������� �� ����� �����
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

    
--���� ������ ���������
SELECT 
    SoldierID,
    SoldierName,
    MissionName,
    Location
FROM 
    SoldierMissionView;
    
--���� ������ ��� ����� �������
SELECT 
    SoldierID,
    SoldierName,
    MissionName,
    Location
FROM 
    SoldierMissionView
WHERE 
    Location = 'gaza';
    
    
--���� ������ ������ ���� ����
SELECT 
    MissionID,
    MissionName,
    Location,
    CommanderRank
FROM 
    CommanderMissionView;
    
-- ���� ���� ������ ��� ���� ���� 
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
