prompt
prompt Creating function CALCULATEAGE
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION BISHAPIR.CalculateAge(curid IN NUMBER) RETURN NUMBER IS
    bornDate Soldier.BornDate%TYPE;
    age NUMBER;
BEGIN
    -- ????? ????? ????? ?? ?????
    SELECT BornDate INTO bornDate FROM Soldier WHERE SoldierID = curid;
    -- ????? ????
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

prompt
prompt Creating function CHECKWEAPONSTATUS
prompt ===================================
prompt
CREATE OR REPLACE FUNCTION BISHAPIR.CheckWeaponStatus(curWeaponID IN NUMBER) RETURN VARCHAR2 IS
    lastDateToUse Explosives.LastDateToUse%TYPE;
    status VARCHAR2(20);
BEGIN
    -- ????? ?????? ?????? ?????? ???÷
    SELECT LastDateToUse INTO lastDateToUse FROM Explosives WHERE WeaponID = curWeaponID;

    -- ???÷? ???÷?
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

prompt
prompt Creating procedure REMOVEEXPIREDEXPLOSIVES
prompt ==========================================
prompt
CREATE OR REPLACE PROCEDURE BISHAPIR.RemoveExpiredExplosives IS
BEGIN
    -- ???÷? ?????? ??? ??÷??
    DELETE FROM Explosives
    WHERE LastDateToUse < SYSDATE;

    -- ??? ???? ?????? ????÷?
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' explosives removed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END RemoveExpiredExplosives;
/

prompt
prompt Creating procedure UPDATESOLDIERRANK
prompt ====================================
prompt
CREATE OR REPLACE PROCEDURE BISHAPIR.UpdateSoldierRank(curID IN NUMBER, newRank IN NUMBER) IS
BEGIN
    -- ????? ???? ?????
    UPDATE Soldier
    SET Rank = newRank
    WHERE SoldierID = curID;

    -- ???÷? ??? ?????? ?????
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Soldier not found or rank not updated');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateSoldierRank;
/

