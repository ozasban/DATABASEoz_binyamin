CREATE OR REPLACE PROCEDURE RemoveExpiredExplosives IS
BEGIN
    -- מחיקת תחמושת שפג תוקפה
    DELETE FROM Explosives
    WHERE LastDateToUse < SYSDATE;
    
    -- פלט מספר השורות שנמחקו
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' explosives removed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END RemoveExpiredExplosives;
/
