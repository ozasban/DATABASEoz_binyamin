CREATE OR REPLACE PROCEDURE UpdateSoldierRank(curID IN NUMBER, newRank IN NUMBER) IS
BEGIN
    -- ����� ���� �����
    UPDATE Soldier
    SET Rank = newRank
    WHERE SoldierID = curID;
    
    -- ����� ��� ������ �����
    IF SQL%ROWCOUNT = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Soldier not found or rank not updated');
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateSoldierRank;
/
