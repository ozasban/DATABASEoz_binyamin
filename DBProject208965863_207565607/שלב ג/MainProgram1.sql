DECLARE
    v_soldierID NUMBER := 1;  -- ��� ����� �� SoldierID ��� �����
    v_newRank NUMBER := 6;    -- ���� ���� ������
    v_age NUMBER;
BEGIN
    -- ����� ����
    v_age := CalculateAge(v_soldierID);
    DBMS_OUTPUT.PUT_LINE('Soldier age: ' || v_age);
    
    -- ����� �����
    UpdateSoldierRank(v_soldierID, v_newRank);
    DBMS_OUTPUT.PUT_LINE('Rank updated.');
END;
/
