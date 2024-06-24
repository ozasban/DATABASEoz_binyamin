DECLARE
    v_soldierID NUMBER := 1;  -- כאן לשנות את SoldierID לפי הצורך
    v_newRank NUMBER := 6;    -- דרגה חדשה לדוגמה
    v_age NUMBER;
BEGIN
    -- חישוב הגיל
    v_age := CalculateAge(v_soldierID);
    DBMS_OUTPUT.PUT_LINE('Soldier age: ' || v_age);
    
    -- עדכון הדרגה
    UpdateSoldierRank(v_soldierID, v_newRank);
    DBMS_OUTPUT.PUT_LINE('Rank updated.');
END;
/
