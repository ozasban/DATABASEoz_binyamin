INSERT INTO Department (DepartmentID, Name) VALUES (1, 'Gray langur');
INSERT INTO Department (DepartmentID, Name) VALUES (2, 'Civet cat');
INSERT INTO Department (DepartmentID, Name) VALUES (3, 'Tree porcupine');
INSERT INTO Department (DepartmentID, Name) VALUES (4, 'Cockatoo, slender-billed');
INSERT INTO Department (DepartmentID, Name) VALUES (5, 'Black bear');
INSERT INTO Department (DepartmentID, Name) VALUES (6, 'Red-tailed wambenger');
INSERT INTO Department (DepartmentID, Name) VALUES (7, 'Meerkat, red');
INSERT INTO Department (DepartmentID, Name) VALUES (8, 'Lilac-breasted roller');
INSERT INTO Department (DepartmentID, Name) VALUES (9, 'Kingfisher, pied');
INSERT INTO Department (DepartmentID, Name) VALUES (10, 'Rattlesnake, dusky');

insert into BISHAPIR.DEPBOMBS (MAXWEIGHT, DEPARTMENTID)
values (724, 1);

insert into BISHAPIR.DEPBOMBS (MAXWEIGHT, DEPARTMENTID)
values (512, 2);

insert into BISHAPIR.DEPBOMBS (MAXWEIGHT, DEPARTMENTID)
values (526, 3);

insert into BISHAPIR.DEPBOMBS (MAXWEIGHT, DEPARTMENTID)
values (500, 4);

insert into BISHAPIR.DEPBOMBS (MAXWEIGHT, DEPARTMENTID)
values (648, 5);

insert into BISHAPIR.DEPTUNNELS (MAXDEPTH, DEPARTMENTID)
values (21, 6);

insert into BISHAPIR.DEPTUNNELS (MAXDEPTH, DEPARTMENTID)
values (14, 7);

insert into BISHAPIR.DEPTUNNELS (MAXDEPTH, DEPARTMENTID)
values (12, 8);

insert into BISHAPIR.DEPTUNNELS (MAXDEPTH, DEPARTMENTID)
values (13, 9);

insert into BISHAPIR.DEPTUNNELS (MAXDEPTH, DEPARTMENTID)
values (15, 10);


insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (1, 2, 'weapon1');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (2, 6, 'weapon2');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (3, 4, 'weapon3');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (4, 6, 'weapon4');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (5, 4, 'weapon5');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (6, 9, 'weapon6');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (7, 6, 'weapon7');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (8, 5, 'weapon8');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (9, 4, 'weapon9');

insert into BISHAPIR.WEAPON (WEAPONID, MINRANKTOUSE, NAME)
values (10, 4, 'weapon10');

insert into BISHAPIR.ROBOTS (MAXHOURSBATTARY, WEAPONID)
values (8, 6);

insert into BISHAPIR.ROBOTS (MAXHOURSBATTARY, WEAPONID)
values (6, 7);

insert into BISHAPIR.ROBOTS (MAXHOURSBATTARY, WEAPONID)
values (9, 8);

insert into BISHAPIR.ROBOTS (MAXHOURSBATTARY, WEAPONID)
values (6, 9);

insert into BISHAPIR.ROBOTS (MAXHOURSBATTARY, WEAPONID)
values (6, 10);


DECLARE
  v_start_date DATE := TO_DATE('01-JAN-2030', 'DD-MON-YYYY');
  v_end_date DATE := TO_DATE('01-JAN-2035', 'DD-MON-YYYY');
  v_random_date DATE;
  v_weapon_id INT;
BEGIN
  FOR i IN 1..5 LOOP
    v_random_date := v_start_date + TRUNC(DBMS_RANDOM.VALUE(0, v_end_date - v_start_date));
    v_weapon_id := i;

    INSERT INTO Explosives (LastDateToUse, WeaponID)
    VALUES (v_random_date, v_weapon_id);
  END LOOP;

  COMMIT;
END;
/

insert into BISHAPIR.USESROBOTS (DEPARTMENTID, WEAPONID)
values (6, 6);

insert into BISHAPIR.USESROBOTS (DEPARTMENTID, WEAPONID)
values (7, 7);

insert into BISHAPIR.USESROBOTS (DEPARTMENTID, WEAPONID)
values (8, 8);

insert into BISHAPIR.USESROBOTS (DEPARTMENTID, WEAPONID)
values (9, 9);

insert into BISHAPIR.USESROBOTS (DEPARTMENTID, WEAPONID)
values (10, 10);

insert into BISHAPIR.USESEXPLOSIVE (DEPARTMENTID, WEAPONID)
values (1, 1);

insert into BISHAPIR.USESEXPLOSIVE (DEPARTMENTID, WEAPONID)
values (2, 2);

insert into BISHAPIR.USESEXPLOSIVE (DEPARTMENTID, WEAPONID)
values (3, 3);

insert into BISHAPIR.USESEXPLOSIVE (DEPARTMENTID, WEAPONID)
values (4, 4);

insert into BISHAPIR.USESEXPLOSIVE (DEPARTMENTID, WEAPONID)
values (5, 5);


DECLARE
  v_start_date DATE := TO_DATE('01-JAN-1980', 'DD-MON-YYYY');
  v_end_date DATE := TO_DATE('01-JAN-2005', 'DD-MON-YYYY');
  v_random_date DATE;
  v_soldier_id INT;
  v_name CHAR(30);
  v_profile INT;
  v_rank INT;
  v_department_id INT := 50; -- starting department id
  v_profiles DBMS_SQL.VARCHAR2_TABLE;
BEGIN
  -- Define possible profile values
  v_profiles(1) := 72;
  v_profiles(2) := 84;
  v_profiles(3) := 97;

  FOR i IN 1..10 LOOP
    v_random_date := v_start_date + TRUNC(DBMS_RANDOM.VALUE(0, v_end_date - v_start_date));
    v_soldier_id := i;
    v_name := 'Soldier ' || TO_CHAR(i); -- Generate a name for the soldier
    v_profile := v_profiles(TRUNC(DBMS_RANDOM.VALUE(1, 4)));
    v_rank := TRUNC(DBMS_RANDOM.VALUE(1, 9));

    -- Assign department_id, decreasing every 9 soldiers
    IF MOD(i - 1, 9) = 0 THEN
      v_department_id := v_department_id - 1;
    END IF;

    INSERT INTO Soldier (SoldierID, Name, BornDate, Profile, Rank, DepartmentID)
    VALUES (v_soldier_id, v_name, v_random_date, v_profile, v_rank, v_department_id);
  END LOOP;

  COMMIT;
END;
/

insert into BISHAPIR.FIGHTER (ROLE, SOLDIERID)
values ('simple', 1);

insert into BISHAPIR.FIGHTER (ROLE, SOLDIERID)
values ('paramedic', 2);

insert into BISHAPIR.FIGHTER (ROLE, SOLDIERID)
values ('sniper', 3);

insert into BISHAPIR.FIGHTER (ROLE, SOLDIERID)
values ('simple', 4);

insert into BISHAPIR.FIGHTER (ROLE, SOLDIERID)
values ('simple', 5);



insert into BISHAPIR.COMMANDER (NUMBEROFSOLDIERS, SOLDIERID)
values (1, 6);

insert into BISHAPIR.COMMANDER (NUMBEROFSOLDIERS, SOLDIERID)
values (1, 7);

insert into BISHAPIR.COMMANDER (NUMBEROFSOLDIERS, SOLDIERID)
values (1, 8);

insert into BISHAPIR.COMMANDER (NUMBEROFSOLDIERS, SOLDIERID)
values (1, 9);

insert into BISHAPIR.COMMANDER (NUMBEROFSOLDIERS, SOLDIERID)
values (1, 10);