CREATE OR REPLACE FUNCTION CalculateAge(curid IN NUMBER) RETURN NUMBER IS
    bornDate Soldier.BornDate%TYPE;
    age NUMBER;
BEGIN
    -- שליפת תאריך הלידה של החייל
    SELECT BornDate INTO bornDate FROM Soldier WHERE SoldierID = curid;
    -- חישוב הגיל
    age := FLOOR(MONTHS_BETWEEN(SYSDATE, bornDate) / 12);
    
    RETURN age;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Soldier not found');
        RETURN NULL;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
        RETURN NULL;
END CalculateAge;
/
