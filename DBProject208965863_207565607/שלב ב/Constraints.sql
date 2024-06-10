-- ����� 1: ����� ������ ����� �� ���� ��� �� ���� ��� 2005
ALTER TABLE Soldier
ADD CONSTRAINT chk_Soldier_BornDate CHECK
 (BornDate <= TO_DATE('01-JAN-2005', 'DD-MON-YYYY'));
 
INSERT INTO Soldier (SoldierID, Name, BornDate, Profile, Rank, DepartmentID)
VALUES (1, 'John Doe', TO_DATE('02-JAN-2006', 'DD-MON-YYYY'), 72, 3, 1);



-- ����� 2: ����� ����� ������� ������ ��� ����� 100
ALTER TABLE Depbombs
ADD CONSTRAINT chk_Depbombs_MaxWeight CHECK (MaxWeight >= 100);


-- ������ ������ ���� �� ���� ������� ���� �-100
INSERT INTO Depbombs (DepartmentID, MaxWeight)
VALUES (1, 50);

-- ����� 3: ����� ����� Role ����� fighter �� ���� ���
ALTER TABLE fighter
MODIFY Role CHAR(30) NOT NULL;

-- ������ ������ ���� �-fighter �� ��� Role ���
INSERT INTO fighter (SoldierID, Role)
VALUES (1, '');  -- ����� ���� �� Role

