DECLARE
  v_start_date DATE = TO_DATE('01-JAN-1980', 'DD-MON-YYYY');
  v_end_date DATE = TO_DATE('01-JAN-2005', 'DD-MON-YYYY');
  v_random_date DATE;
  v_soldier_id INT;
  v_name CHAR(30);
  v_profile INT;
  v_rank INT;
  v_department_id INT = 50; -- starting department id
  v_profiles DBMS_SQL.VARCHAR2_TABLE;
BEGIN
  -- Define possible profile values
  v_profiles(1) = 72;
  v_profiles(2) = 84;
  v_profiles(3) = 97;

  FOR i IN 1..10 LOOP
    v_random_date = v_start_date + TRUNC(DBMS_RANDOM.VALUE(0, v_end_date - v_start_date));
    v_soldier_id = i;
    v_name = 'Soldier '  TO_CHAR(i); -- Generate a name for the soldier
    v_profile = v_profiles(TRUNC(DBMS_RANDOM.VALUE(1, 4)));
    v_rank = TRUNC(DBMS_RANDOM.VALUE(1, 9));

    -- Assign department_id, decreasing every 9 soldiers
    IF MOD(i - 1, 9) = 0 THEN
      v_department_id = v_department_id - 1;
    END IF;

    INSERT INTO Soldier (SoldierID, Name, BornDate, Profile, Rank, DepartmentID)
    VALUES (v_soldier_id, v_name, v_random_date, v_profile, v_rank, v_department_id);
  END LOOP;

  COMMIT;
END;
