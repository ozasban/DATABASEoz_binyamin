-- אילוץ 1: לבדוק שתאריך הלידה של חייל הוא לא אחרי שנת 2005
ALTER TABLE Soldier
ADD CONSTRAINT chk_Soldier_BornDate CHECK
 (BornDate <= TO_DATE('01-JAN-2005', 'DD-MON-YYYY'));
 
INSERT INTO Soldier (SoldierID, Name, BornDate, Profile, Rank, DepartmentID)
VALUES (1, 'John Doe', TO_DATE('02-JAN-2006', 'DD-MON-YYYY'), 72, 3, 1);



-- אילוץ 2: לבדוק שמשקל מקסימלי בפצצות הוא לפחות 100
ALTER TABLE Depbombs
ADD CONSTRAINT chk_Depbombs_MaxWeight CHECK (MaxWeight >= 100);


-- ניסיון להכניס פצצה עם משקל מקסימלי פחות מ-100
INSERT INTO Depbombs (DepartmentID, MaxWeight)
VALUES (1, 50);

-- אילוץ 3: לבדוק שהשדה Role בטבלת fighter לא יהיה ריק
ALTER TABLE fighter
MODIFY Role CHAR(30) NOT NULL;

-- ניסיון להכניס נתון ל-fighter עם שדה Role ריק
INSERT INTO fighter (SoldierID, Role)
VALUES (1, '');  -- ריקון הערך של Role

