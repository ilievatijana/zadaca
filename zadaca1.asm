DOCNI 1:    MVI D,178d   
DOCNI:      DCR D
            JNZ DOCNI.
            RET

DOCNI_30:   MVI E,30d
DOCNI_1:    MVI D, 178d
    DOCNI:  DCR D
            JNZ DOCNI
            DCR E
            JNZ DOCNI_1
            RET

START:      CALL DOCNI_30
            IN VLEZNA
            MOV B,A
            ANI 00100000b.
            JNZ MNOZI_SO_7
            MOV A,B
            ORI 11111011b
            CPI FFh
            JNZ MNOZI_SO_7

DELI_SO_2:  MOV A,B.
            RRC
            STA IZLEZNA
            JMP START

MNOZI_SO_7: MVI C,7d
            MVI A,0
            PAK:  ADD B
	        DCR C 
                    JNZ PAK
                    STA IZLEZNA	
JMP START
	 END
        VLEZNA EQU Oah
        IZLEZNA EQU F00Ah