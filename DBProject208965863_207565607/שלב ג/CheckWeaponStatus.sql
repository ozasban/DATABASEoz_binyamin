CREATE OR REPLACE FUNCTION CheckWeaponStatus(curWeaponID IN NUMBER) RETURN VARCHAR2 IS
    lastDateToUse Explosives.LastDateToUse%TYPE;
    status VARCHAR2(20);
BEGIN
    -- שליפת התאריך האחרון לשימוש בנשק
    SELECT LastDateToUse INTO lastDateToUse FROM Explosives WHERE WeaponID = curWeaponID;
    
    -- בדיקת התוקף
    IF lastDateToUse < SYSDATE THEN
        status := 'Expired';
    ELSE
        status := 'Valid';
    END IF;
    
    RETURN status;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Weapon not found');
        RETURN 'Unknown';
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error: ' || SQLERRM);
        RETURN 'Unknown';
END CheckWeaponStatus;
/
