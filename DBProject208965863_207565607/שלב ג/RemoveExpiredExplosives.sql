CREATE OR REPLACE PROCEDURE RemoveExpiredExplosives IS
BEGIN
    -- ����� ������ ��� �����
    DELETE FROM Explosives
    WHERE LastDateToUse < SYSDATE;
    
    -- ��� ���� ������ ������
    DBMS_OUTPUT.PUT_LINE(SQL%ROWCOUNT || ' explosives removed.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END RemoveExpiredExplosives;
/
