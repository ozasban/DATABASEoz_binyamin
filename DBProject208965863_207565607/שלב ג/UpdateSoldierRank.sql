CREATE OR REPLACE PROCEDURE UpdateSoldierRank(curID IN NUMBER, newRank IN NUMBER) IS
BEGIN
    -- עדכון דרגת החייל
    UPDATE Soldier
    SET Rank = newRank
    WHERE SoldierID = curID;
    
    -- בדיקת האם העדכון הצליח
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Soldier not found or rank not updated');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateSoldierRank;
/
