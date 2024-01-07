
_main:

;smart_parking.c,19 :: 		void main()
;smart_parking.c,22 :: 		char str1[] = "Welcome";
	MOVLW       ?ICSmain_str1_L0+0
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(?ICSmain_str1_L0+0)
	MOVWF       TBLPTRH 
	MOVLW       higher_addr(?ICSmain_str1_L0+0)
	MOVWF       TBLPTRU 
	MOVLW       main_str1_L0+0
	MOVWF       FSR1 
	MOVLW       hi_addr(main_str1_L0+0)
	MOVWF       FSR1H 
	MOVLW       44
	MOVWF       R0 
	MOVLW       1
	MOVWF       R1 
	CALL        ___CC2DW+0, 0
;smart_parking.c,28 :: 		char *nums[] = {"0","1","2","3"};
	MOVLW       ?lstr1_smart_parking+0
	MOVWF       main_nums_L0+0 
	MOVLW       hi_addr(?lstr1_smart_parking+0)
	MOVWF       main_nums_L0+1 
	MOVLW       ?lstr2_smart_parking+0
	MOVWF       main_nums_L0+2 
	MOVLW       hi_addr(?lstr2_smart_parking+0)
	MOVWF       main_nums_L0+3 
	MOVLW       ?lstr3_smart_parking+0
	MOVWF       main_nums_L0+4 
	MOVLW       hi_addr(?lstr3_smart_parking+0)
	MOVWF       main_nums_L0+5 
	MOVLW       ?lstr4_smart_parking+0
	MOVWF       main_nums_L0+6 
	MOVLW       hi_addr(?lstr4_smart_parking+0)
	MOVWF       main_nums_L0+7 
;smart_parking.c,29 :: 		char counter_string[] = "Counter : ";
	MOVLW       67
	MOVWF       main_counter_string_L0+0 
	MOVLW       111
	MOVWF       main_counter_string_L0+1 
	MOVLW       117
	MOVWF       main_counter_string_L0+2 
	MOVLW       110
	MOVWF       main_counter_string_L0+3 
	MOVLW       116
	MOVWF       main_counter_string_L0+4 
	MOVLW       101
	MOVWF       main_counter_string_L0+5 
	MOVLW       114
	MOVWF       main_counter_string_L0+6 
	MOVLW       32
	MOVWF       main_counter_string_L0+7 
	MOVLW       58
	MOVWF       main_counter_string_L0+8 
	MOVLW       32
	MOVWF       main_counter_string_L0+9 
	CLRF        main_counter_string_L0+10 
	MOVLW       1
	MOVWF       main_flag_welcome_L0+0 
	MOVLW       0
	MOVWF       main_flag_welcome_L0+1 
;smart_parking.c,34 :: 		trisd = 0b00001111;   //parking
	MOVLW       15
	MOVWF       TRISD+0 
;smart_parking.c,35 :: 		trisa = 0b00000000;   //leds for park
	CLRF        TRISA+0 
;smart_parking.c,36 :: 		anseld = 0b00110000;  //motor
	MOVLW       48
	MOVWF       ANSELD+0 
;smart_parking.c,37 :: 		trisb = 0b00000000;   //leds
	CLRF        TRISB+0 
;smart_parking.c,38 :: 		anselb = 0b00000000;
	CLRF        ANSELB+0 
;smart_parking.c,39 :: 		trisc = 0b00000100;  //smart light
	MOVLW       4
	MOVWF       TRISC+0 
;smart_parking.c,40 :: 		anselc = 0b00000000;
	CLRF        ANSELC+0 
;smart_parking.c,41 :: 		TRISE = 0b0001;      //Alarm system
	MOVLW       1
	MOVWF       TRISE+0 
;smart_parking.c,42 :: 		ANSELE= 0b0000;
	CLRF        ANSELE+0 
;smart_parking.c,44 :: 		Lcd_Init();                        // Initialize LCD
	CALL        _Lcd_Init+0, 0
;smart_parking.c,46 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,47 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,49 :: 		while (1)
L_main0:
;smart_parking.c,52 :: 		if(flag_welcome==1)
	MOVLW       0
	XORWF       main_flag_welcome_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main118
	MOVLW       1
	XORWF       main_flag_welcome_L0+0, 0 
L__main118:
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
;smart_parking.c,54 :: 		Lcd_Out(1,1,str1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_str1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_str1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,55 :: 		Lcd_Out(2,1,str2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_str2_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_str2_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,56 :: 		flag_welcome=0;
	CLRF        main_flag_welcome_L0+0 
	CLRF        main_flag_welcome_L0+1 
;smart_parking.c,57 :: 		delay_ms(2000);
	MOVLW       21
	MOVWF       R11, 0
	MOVLW       75
	MOVWF       R12, 0
	MOVLW       190
	MOVWF       R13, 0
L_main3:
	DECFSZ      R13, 1, 1
	BRA         L_main3
	DECFSZ      R12, 1, 1
	BRA         L_main3
	DECFSZ      R11, 1, 1
	BRA         L_main3
	NOP
;smart_parking.c,58 :: 		}
L_main2:
;smart_parking.c,61 :: 		if (Button(&PORTD, 0, 100, 1))             // Detect logical one
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       100
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main4
;smart_parking.c,62 :: 		b1 = 1;
	MOVLW       1
	MOVWF       main_b1_L0+0 
	MOVLW       0
	MOVWF       main_b1_L0+1 
	GOTO        L_main5
L_main4:
;smart_parking.c,64 :: 		b1 = 0;
	CLRF        main_b1_L0+0 
	CLRF        main_b1_L0+1 
L_main5:
;smart_parking.c,65 :: 		if (Button(&PORTD, 1, 100, 1))             // Detect logical one
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       100
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main6
;smart_parking.c,66 :: 		b2 = 1;
	MOVLW       1
	MOVWF       main_b2_L0+0 
	MOVLW       0
	MOVWF       main_b2_L0+1 
	GOTO        L_main7
L_main6:
;smart_parking.c,68 :: 		b2=0;
	CLRF        main_b2_L0+0 
	CLRF        main_b2_L0+1 
L_main7:
;smart_parking.c,69 :: 		if (Button(&PORTD, 2, 100, 1))             // Detect logical one
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       100
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main8
;smart_parking.c,70 :: 		b3 = 1;
	MOVLW       1
	MOVWF       main_b3_L0+0 
	MOVLW       0
	MOVWF       main_b3_L0+1 
	GOTO        L_main9
L_main8:
;smart_parking.c,72 :: 		b3=0;
	CLRF        main_b3_L0+0 
	CLRF        main_b3_L0+1 
L_main9:
;smart_parking.c,73 :: 		if (Button(&PORTD, 3, 1, 1))             // Detect logical one
	MOVLW       PORTD+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTD+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main10
;smart_parking.c,74 :: 		b4 = 1;
	MOVLW       1
	MOVWF       main_b4_L0+0 
	MOVLW       0
	MOVWF       main_b4_L0+1 
	GOTO        L_main11
L_main10:
;smart_parking.c,76 :: 		b4=0;
	CLRF        main_b4_L0+0 
	CLRF        main_b4_L0+1 
L_main11:
;smart_parking.c,78 :: 		if (Button(&PORTC, 2, 1, 1))             // Detect logical one
	MOVLW       PORTC+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTC+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main12
;smart_parking.c,79 :: 		st_sensor = 1;
	MOVLW       1
	MOVWF       main_st_sensor_L0+0 
	MOVLW       0
	MOVWF       main_st_sensor_L0+1 
	GOTO        L_main13
L_main12:
;smart_parking.c,81 :: 		st_sensor = 0;
	CLRF        main_st_sensor_L0+0 
	CLRF        main_st_sensor_L0+1 
L_main13:
;smart_parking.c,82 :: 		if(st_sensor==1)
	MOVLW       0
	XORWF       main_st_sensor_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main119
	MOVLW       1
	XORWF       main_st_sensor_L0+0, 0 
L__main119:
	BTFSS       STATUS+0, 2 
	GOTO        L_main14
;smart_parking.c,83 :: 		portc = 0b00000010;
	MOVLW       2
	MOVWF       PORTC+0 
	GOTO        L_main15
L_main14:
;smart_parking.c,85 :: 		portc = 0b00000001;
	MOVLW       1
	MOVWF       PORTC+0 
L_main15:
;smart_parking.c,87 :: 		if (Button(&PORTE, 0, 1, 1)) {               // Detect logical one
	MOVLW       PORTE+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTE+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	MOVLW       1
	MOVWF       FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main16
;smart_parking.c,88 :: 		portE= 0b0110;
	MOVLW       6
	MOVWF       PORTE+0 
;smart_parking.c,89 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main17:
	DECFSZ      R13, 1, 1
	BRA         L_main17
	DECFSZ      R12, 1, 1
	BRA         L_main17
	DECFSZ      R11, 1, 1
	BRA         L_main17
;smart_parking.c,90 :: 		portE=0b0010;
	MOVLW       2
	MOVWF       PORTE+0 
;smart_parking.c,91 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main18:
	DECFSZ      R13, 1, 1
	BRA         L_main18
	DECFSZ      R12, 1, 1
	BRA         L_main18
	DECFSZ      R11, 1, 1
	BRA         L_main18
;smart_parking.c,92 :: 		portE= 0b0110;
	MOVLW       6
	MOVWF       PORTE+0 
;smart_parking.c,93 :: 		}else{
	GOTO        L_main19
L_main16:
;smart_parking.c,94 :: 		portE=0b0000 ;
	CLRF        PORTE+0 
;smart_parking.c,95 :: 		}
L_main19:
;smart_parking.c,98 :: 		if(b1==1)
	MOVLW       0
	XORWF       main_b1_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main120
	MOVLW       1
	XORWF       main_b1_L0+0, 0 
L__main120:
	BTFSS       STATUS+0, 2 
	GOTO        L_main20
;smart_parking.c,100 :: 		c1[0]='1';
	MOVLW       49
	MOVWF       main_c1_L0+0 
;smart_parking.c,101 :: 		if(b2==1)
	MOVLW       0
	XORWF       main_b2_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main121
	MOVLW       1
	XORWF       main_b2_L0+0, 0 
L__main121:
	BTFSS       STATUS+0, 2 
	GOTO        L_main21
;smart_parking.c,103 :: 		c2[0]='1';
	MOVLW       49
	MOVWF       main_c2_L0+0 
;smart_parking.c,104 :: 		if(b3==1)
	MOVLW       0
	XORWF       main_b3_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main122
	MOVLW       1
	XORWF       main_b3_L0+0, 0 
L__main122:
	BTFSS       STATUS+0, 2 
	GOTO        L_main22
;smart_parking.c,106 :: 		c3[0]='1';
	MOVLW       49
	MOVWF       main_c3_L0+0 
;smart_parking.c,107 :: 		porta=0b00000111;
	MOVLW       7
	MOVWF       PORTA+0 
;smart_parking.c,109 :: 		}
	GOTO        L_main23
L_main22:
;smart_parking.c,112 :: 		c3[0]='0';
	MOVLW       48
	MOVWF       main_c3_L0+0 
;smart_parking.c,113 :: 		porta=0b00000011;
	MOVLW       3
	MOVWF       PORTA+0 
;smart_parking.c,114 :: 		if(b4==1)
	MOVLW       0
	XORWF       main_b4_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main123
	MOVLW       1
	XORWF       main_b4_L0+0, 0 
L__main123:
	BTFSS       STATUS+0, 2 
	GOTO        L_main24
;smart_parking.c,116 :: 		portD = 0b00010000;
	MOVLW       16
	MOVWF       PORTD+0 
;smart_parking.c,117 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main25:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main124
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main124:
	BTFSS       STATUS+0, 0 
	GOTO        L_main26
;smart_parking.c,119 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main28:
	DECFSZ      R13, 1, 1
	BRA         L_main28
	DECFSZ      R12, 1, 1
	BRA         L_main28
	DECFSZ      R11, 1, 1
	BRA         L_main28
	NOP
	NOP
;smart_parking.c,120 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,121 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,122 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,123 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,124 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main29:
	DECFSZ      R13, 1, 1
	BRA         L_main29
	DECFSZ      R12, 1, 1
	BRA         L_main29
	DECFSZ      R11, 1, 1
	BRA         L_main29
	NOP
	NOP
;smart_parking.c,117 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,125 :: 		}
	GOTO        L_main25
L_main26:
;smart_parking.c,127 :: 		portD = 0b00100000;
	MOVLW       32
	MOVWF       PORTD+0 
;smart_parking.c,128 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main30:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main125
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main125:
	BTFSS       STATUS+0, 0 
	GOTO        L_main31
;smart_parking.c,130 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main33:
	DECFSZ      R13, 1, 1
	BRA         L_main33
	DECFSZ      R12, 1, 1
	BRA         L_main33
	DECFSZ      R11, 1, 1
	BRA         L_main33
	NOP
	NOP
;smart_parking.c,131 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,132 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,133 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,134 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,135 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main34:
	DECFSZ      R13, 1, 1
	BRA         L_main34
	DECFSZ      R12, 1, 1
	BRA         L_main34
	DECFSZ      R11, 1, 1
	BRA         L_main34
	NOP
	NOP
;smart_parking.c,128 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,136 :: 		}
	GOTO        L_main30
L_main31:
;smart_parking.c,137 :: 		portd = 0;
	CLRF        PORTD+0 
;smart_parking.c,138 :: 		}
L_main24:
;smart_parking.c,139 :: 		}
L_main23:
;smart_parking.c,140 :: 		}
	GOTO        L_main35
L_main21:
;smart_parking.c,143 :: 		c2[0]='0';
	MOVLW       48
	MOVWF       main_c2_L0+0 
;smart_parking.c,144 :: 		if(b3==1)
	MOVLW       0
	XORWF       main_b3_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main126
	MOVLW       1
	XORWF       main_b3_L0+0, 0 
L__main126:
	BTFSS       STATUS+0, 2 
	GOTO        L_main36
;smart_parking.c,146 :: 		c3[0]='1';
	MOVLW       49
	MOVWF       main_c3_L0+0 
;smart_parking.c,147 :: 		porta=0b00000101;
	MOVLW       5
	MOVWF       PORTA+0 
;smart_parking.c,148 :: 		if(b4==1)
	MOVLW       0
	XORWF       main_b4_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main127
	MOVLW       1
	XORWF       main_b4_L0+0, 0 
L__main127:
	BTFSS       STATUS+0, 2 
	GOTO        L_main37
;smart_parking.c,150 :: 		portD = 0b00010000;
	MOVLW       16
	MOVWF       PORTD+0 
;smart_parking.c,151 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main38:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main128
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main128:
	BTFSS       STATUS+0, 0 
	GOTO        L_main39
;smart_parking.c,153 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main41:
	DECFSZ      R13, 1, 1
	BRA         L_main41
	DECFSZ      R12, 1, 1
	BRA         L_main41
	DECFSZ      R11, 1, 1
	BRA         L_main41
	NOP
	NOP
;smart_parking.c,154 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,155 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,156 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,157 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,158 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main42:
	DECFSZ      R13, 1, 1
	BRA         L_main42
	DECFSZ      R12, 1, 1
	BRA         L_main42
	DECFSZ      R11, 1, 1
	BRA         L_main42
	NOP
	NOP
;smart_parking.c,151 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,159 :: 		}
	GOTO        L_main38
L_main39:
;smart_parking.c,160 :: 		portD = 0b00100000;
	MOVLW       32
	MOVWF       PORTD+0 
;smart_parking.c,161 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main43:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main129
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main129:
	BTFSS       STATUS+0, 0 
	GOTO        L_main44
;smart_parking.c,163 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main46:
	DECFSZ      R13, 1, 1
	BRA         L_main46
	DECFSZ      R12, 1, 1
	BRA         L_main46
	DECFSZ      R11, 1, 1
	BRA         L_main46
	NOP
	NOP
;smart_parking.c,164 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,165 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,166 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,167 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,168 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main47:
	DECFSZ      R13, 1, 1
	BRA         L_main47
	DECFSZ      R12, 1, 1
	BRA         L_main47
	DECFSZ      R11, 1, 1
	BRA         L_main47
	NOP
	NOP
;smart_parking.c,161 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,169 :: 		}
	GOTO        L_main43
L_main44:
;smart_parking.c,170 :: 		portd = 0;
	CLRF        PORTD+0 
;smart_parking.c,171 :: 		}
L_main37:
;smart_parking.c,172 :: 		}
	GOTO        L_main48
L_main36:
;smart_parking.c,175 :: 		c3[0]='0';
	MOVLW       48
	MOVWF       main_c3_L0+0 
;smart_parking.c,176 :: 		porta=0b00000001;
	MOVLW       1
	MOVWF       PORTA+0 
;smart_parking.c,177 :: 		if(b4==1)
	MOVLW       0
	XORWF       main_b4_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main130
	MOVLW       1
	XORWF       main_b4_L0+0, 0 
L__main130:
	BTFSS       STATUS+0, 2 
	GOTO        L_main49
;smart_parking.c,179 :: 		portD = 0b00010000;
	MOVLW       16
	MOVWF       PORTD+0 
;smart_parking.c,180 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main50:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main131
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main131:
	BTFSS       STATUS+0, 0 
	GOTO        L_main51
;smart_parking.c,182 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main53:
	DECFSZ      R13, 1, 1
	BRA         L_main53
	DECFSZ      R12, 1, 1
	BRA         L_main53
	DECFSZ      R11, 1, 1
	BRA         L_main53
	NOP
	NOP
;smart_parking.c,183 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,184 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,185 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,186 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,187 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main54:
	DECFSZ      R13, 1, 1
	BRA         L_main54
	DECFSZ      R12, 1, 1
	BRA         L_main54
	DECFSZ      R11, 1, 1
	BRA         L_main54
	NOP
	NOP
;smart_parking.c,180 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,188 :: 		}
	GOTO        L_main50
L_main51:
;smart_parking.c,189 :: 		portD = 0b00100000;
	MOVLW       32
	MOVWF       PORTD+0 
;smart_parking.c,190 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main55:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main132
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main132:
	BTFSS       STATUS+0, 0 
	GOTO        L_main56
;smart_parking.c,192 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main58:
	DECFSZ      R13, 1, 1
	BRA         L_main58
	DECFSZ      R12, 1, 1
	BRA         L_main58
	DECFSZ      R11, 1, 1
	BRA         L_main58
	NOP
	NOP
;smart_parking.c,193 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,194 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,195 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,196 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,197 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main59:
	DECFSZ      R13, 1, 1
	BRA         L_main59
	DECFSZ      R12, 1, 1
	BRA         L_main59
	DECFSZ      R11, 1, 1
	BRA         L_main59
	NOP
	NOP
;smart_parking.c,190 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,198 :: 		}
	GOTO        L_main55
L_main56:
;smart_parking.c,199 :: 		portd = 0;
	CLRF        PORTD+0 
;smart_parking.c,200 :: 		}
L_main49:
;smart_parking.c,201 :: 		}
L_main48:
;smart_parking.c,202 :: 		}
L_main35:
;smart_parking.c,203 :: 		}
	GOTO        L_main60
L_main20:
;smart_parking.c,206 :: 		c1[0]='0';
	MOVLW       48
	MOVWF       main_c1_L0+0 
;smart_parking.c,207 :: 		if(b2==1)
	MOVLW       0
	XORWF       main_b2_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main133
	MOVLW       1
	XORWF       main_b2_L0+0, 0 
L__main133:
	BTFSS       STATUS+0, 2 
	GOTO        L_main61
;smart_parking.c,209 :: 		c2[0]='1';
	MOVLW       49
	MOVWF       main_c2_L0+0 
;smart_parking.c,210 :: 		if(b3==1)
	MOVLW       0
	XORWF       main_b3_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main134
	MOVLW       1
	XORWF       main_b3_L0+0, 0 
L__main134:
	BTFSS       STATUS+0, 2 
	GOTO        L_main62
;smart_parking.c,212 :: 		c3[0]='1';
	MOVLW       49
	MOVWF       main_c3_L0+0 
;smart_parking.c,213 :: 		porta=0b00000110;
	MOVLW       6
	MOVWF       PORTA+0 
;smart_parking.c,214 :: 		if(b4==1)
	MOVLW       0
	XORWF       main_b4_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main135
	MOVLW       1
	XORWF       main_b4_L0+0, 0 
L__main135:
	BTFSS       STATUS+0, 2 
	GOTO        L_main63
;smart_parking.c,216 :: 		portD = 0b00010000;
	MOVLW       16
	MOVWF       PORTD+0 
;smart_parking.c,217 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main64:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main136
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main136:
	BTFSS       STATUS+0, 0 
	GOTO        L_main65
;smart_parking.c,219 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main67:
	DECFSZ      R13, 1, 1
	BRA         L_main67
	DECFSZ      R12, 1, 1
	BRA         L_main67
	DECFSZ      R11, 1, 1
	BRA         L_main67
	NOP
	NOP
;smart_parking.c,220 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,221 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,222 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,223 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,224 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main68:
	DECFSZ      R13, 1, 1
	BRA         L_main68
	DECFSZ      R12, 1, 1
	BRA         L_main68
	DECFSZ      R11, 1, 1
	BRA         L_main68
	NOP
	NOP
;smart_parking.c,217 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,225 :: 		}
	GOTO        L_main64
L_main65:
;smart_parking.c,226 :: 		portD = 0b00100000;
	MOVLW       32
	MOVWF       PORTD+0 
;smart_parking.c,227 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main69:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main137
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main137:
	BTFSS       STATUS+0, 0 
	GOTO        L_main70
;smart_parking.c,229 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main72:
	DECFSZ      R13, 1, 1
	BRA         L_main72
	DECFSZ      R12, 1, 1
	BRA         L_main72
	DECFSZ      R11, 1, 1
	BRA         L_main72
	NOP
	NOP
;smart_parking.c,230 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,231 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,232 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,233 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,234 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main73:
	DECFSZ      R13, 1, 1
	BRA         L_main73
	DECFSZ      R12, 1, 1
	BRA         L_main73
	DECFSZ      R11, 1, 1
	BRA         L_main73
	NOP
	NOP
;smart_parking.c,227 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,235 :: 		}
	GOTO        L_main69
L_main70:
;smart_parking.c,236 :: 		portd = 0;
	CLRF        PORTD+0 
;smart_parking.c,237 :: 		}
L_main63:
;smart_parking.c,238 :: 		}
	GOTO        L_main74
L_main62:
;smart_parking.c,241 :: 		c3[0]='0';
	MOVLW       48
	MOVWF       main_c3_L0+0 
;smart_parking.c,242 :: 		porta=0b00000010;
	MOVLW       2
	MOVWF       PORTA+0 
;smart_parking.c,243 :: 		if(b4==1)
	MOVLW       0
	XORWF       main_b4_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main138
	MOVLW       1
	XORWF       main_b4_L0+0, 0 
L__main138:
	BTFSS       STATUS+0, 2 
	GOTO        L_main75
;smart_parking.c,245 :: 		portD = 0b00010000;
	MOVLW       16
	MOVWF       PORTD+0 
;smart_parking.c,246 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main76:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main139
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main139:
	BTFSS       STATUS+0, 0 
	GOTO        L_main77
;smart_parking.c,248 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main79:
	DECFSZ      R13, 1, 1
	BRA         L_main79
	DECFSZ      R12, 1, 1
	BRA         L_main79
	DECFSZ      R11, 1, 1
	BRA         L_main79
	NOP
	NOP
;smart_parking.c,249 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,250 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,251 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,252 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,253 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main80:
	DECFSZ      R13, 1, 1
	BRA         L_main80
	DECFSZ      R12, 1, 1
	BRA         L_main80
	DECFSZ      R11, 1, 1
	BRA         L_main80
	NOP
	NOP
;smart_parking.c,246 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,254 :: 		}
	GOTO        L_main76
L_main77:
;smart_parking.c,255 :: 		portD = 0b00100000;
	MOVLW       32
	MOVWF       PORTD+0 
;smart_parking.c,256 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main81:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main140
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main140:
	BTFSS       STATUS+0, 0 
	GOTO        L_main82
;smart_parking.c,258 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main84:
	DECFSZ      R13, 1, 1
	BRA         L_main84
	DECFSZ      R12, 1, 1
	BRA         L_main84
	DECFSZ      R11, 1, 1
	BRA         L_main84
	NOP
	NOP
;smart_parking.c,259 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,260 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,261 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,262 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,263 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main85:
	DECFSZ      R13, 1, 1
	BRA         L_main85
	DECFSZ      R12, 1, 1
	BRA         L_main85
	DECFSZ      R11, 1, 1
	BRA         L_main85
	NOP
	NOP
;smart_parking.c,256 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,264 :: 		}
	GOTO        L_main81
L_main82:
;smart_parking.c,265 :: 		portd = 0;
	CLRF        PORTD+0 
;smart_parking.c,266 :: 		}
L_main75:
;smart_parking.c,267 :: 		}
L_main74:
;smart_parking.c,268 :: 		}
	GOTO        L_main86
L_main61:
;smart_parking.c,271 :: 		c2[0]='0';
	MOVLW       48
	MOVWF       main_c2_L0+0 
;smart_parking.c,272 :: 		if(b3==1)
	MOVLW       0
	XORWF       main_b3_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main141
	MOVLW       1
	XORWF       main_b3_L0+0, 0 
L__main141:
	BTFSS       STATUS+0, 2 
	GOTO        L_main87
;smart_parking.c,274 :: 		c3[0]='1';
	MOVLW       49
	MOVWF       main_c3_L0+0 
;smart_parking.c,275 :: 		porta=0b00000100;
	MOVLW       4
	MOVWF       PORTA+0 
;smart_parking.c,276 :: 		if(b4==1)
	MOVLW       0
	XORWF       main_b4_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main142
	MOVLW       1
	XORWF       main_b4_L0+0, 0 
L__main142:
	BTFSS       STATUS+0, 2 
	GOTO        L_main88
;smart_parking.c,278 :: 		portD = 0b00010000;
	MOVLW       16
	MOVWF       PORTD+0 
;smart_parking.c,279 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main89:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main143
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main143:
	BTFSS       STATUS+0, 0 
	GOTO        L_main90
;smart_parking.c,281 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main92:
	DECFSZ      R13, 1, 1
	BRA         L_main92
	DECFSZ      R12, 1, 1
	BRA         L_main92
	DECFSZ      R11, 1, 1
	BRA         L_main92
	NOP
	NOP
;smart_parking.c,282 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,283 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,284 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,285 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,286 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main93:
	DECFSZ      R13, 1, 1
	BRA         L_main93
	DECFSZ      R12, 1, 1
	BRA         L_main93
	DECFSZ      R11, 1, 1
	BRA         L_main93
	NOP
	NOP
;smart_parking.c,279 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,287 :: 		}
	GOTO        L_main89
L_main90:
;smart_parking.c,288 :: 		portD = 0b00100000;
	MOVLW       32
	MOVWF       PORTD+0 
;smart_parking.c,289 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main94:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main144
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main144:
	BTFSS       STATUS+0, 0 
	GOTO        L_main95
;smart_parking.c,291 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main97:
	DECFSZ      R13, 1, 1
	BRA         L_main97
	DECFSZ      R12, 1, 1
	BRA         L_main97
	DECFSZ      R11, 1, 1
	BRA         L_main97
	NOP
	NOP
;smart_parking.c,292 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,293 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,294 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,295 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,296 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main98:
	DECFSZ      R13, 1, 1
	BRA         L_main98
	DECFSZ      R12, 1, 1
	BRA         L_main98
	DECFSZ      R11, 1, 1
	BRA         L_main98
	NOP
	NOP
;smart_parking.c,289 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,297 :: 		}
	GOTO        L_main94
L_main95:
;smart_parking.c,298 :: 		portd = 0;
	CLRF        PORTD+0 
;smart_parking.c,299 :: 		}
L_main88:
;smart_parking.c,300 :: 		}
	GOTO        L_main99
L_main87:
;smart_parking.c,303 :: 		c3[0]='0';
	MOVLW       48
	MOVWF       main_c3_L0+0 
;smart_parking.c,304 :: 		porta=0b00000000;
	CLRF        PORTA+0 
;smart_parking.c,305 :: 		if(b4==1)
	MOVLW       0
	XORWF       main_b4_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main145
	MOVLW       1
	XORWF       main_b4_L0+0, 0 
L__main145:
	BTFSS       STATUS+0, 2 
	GOTO        L_main100
;smart_parking.c,307 :: 		portD = 0b00010000;
	MOVLW       16
	MOVWF       PORTD+0 
;smart_parking.c,308 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main101:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main146
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main146:
	BTFSS       STATUS+0, 0 
	GOTO        L_main102
;smart_parking.c,310 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main104:
	DECFSZ      R13, 1, 1
	BRA         L_main104
	DECFSZ      R12, 1, 1
	BRA         L_main104
	DECFSZ      R11, 1, 1
	BRA         L_main104
	NOP
	NOP
;smart_parking.c,311 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,312 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,313 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,314 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,315 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main105:
	DECFSZ      R13, 1, 1
	BRA         L_main105
	DECFSZ      R12, 1, 1
	BRA         L_main105
	DECFSZ      R11, 1, 1
	BRA         L_main105
	NOP
	NOP
;smart_parking.c,308 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,316 :: 		}
	GOTO        L_main101
L_main102:
;smart_parking.c,317 :: 		portD = 0b00100000;
	MOVLW       32
	MOVWF       PORTD+0 
;smart_parking.c,318 :: 		for(i=3;i>=0;i--)
	MOVLW       3
	MOVWF       main_i_L0+0 
	MOVLW       0
	MOVWF       main_i_L0+1 
L_main106:
	MOVLW       128
	XORWF       main_i_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main147
	MOVLW       0
	SUBWF       main_i_L0+0, 0 
L__main147:
	BTFSS       STATUS+0, 0 
	GOTO        L_main107
;smart_parking.c,320 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main109:
	DECFSZ      R13, 1, 1
	BRA         L_main109
	DECFSZ      R12, 1, 1
	BRA         L_main109
	DECFSZ      R11, 1, 1
	BRA         L_main109
	NOP
	NOP
;smart_parking.c,321 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,322 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,323 :: 		Lcd_Out(1,1,counter_string);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_counter_string_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_counter_string_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,324 :: 		Lcd_Out(2,1,nums[i]);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVF        main_i_L0+0, 0 
	MOVWF       R0 
	MOVF        main_i_L0+1, 0 
	MOVWF       R1 
	RLCF        R0, 1 
	BCF         R0, 0 
	RLCF        R1, 1 
	MOVLW       main_nums_L0+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(main_nums_L0+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,325 :: 		delay_ms(250);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       138
	MOVWF       R12, 0
	MOVLW       85
	MOVWF       R13, 0
L_main110:
	DECFSZ      R13, 1, 1
	BRA         L_main110
	DECFSZ      R12, 1, 1
	BRA         L_main110
	DECFSZ      R11, 1, 1
	BRA         L_main110
	NOP
	NOP
;smart_parking.c,318 :: 		for(i=3;i>=0;i--)
	MOVLW       1
	SUBWF       main_i_L0+0, 1 
	MOVLW       0
	SUBWFB      main_i_L0+1, 1 
;smart_parking.c,326 :: 		}
	GOTO        L_main106
L_main107:
;smart_parking.c,327 :: 		portd = 0;
	CLRF        PORTD+0 
;smart_parking.c,328 :: 		}
L_main100:
;smart_parking.c,329 :: 		}
L_main99:
;smart_parking.c,330 :: 		}
L_main86:
;smart_parking.c,331 :: 		}
L_main60:
;smart_parking.c,333 :: 		if(b1==1 && b2==1 && b3==1){
	MOVLW       0
	XORWF       main_b1_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main148
	MOVLW       1
	XORWF       main_b1_L0+0, 0 
L__main148:
	BTFSS       STATUS+0, 2 
	GOTO        L_main113
	MOVLW       0
	XORWF       main_b2_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main149
	MOVLW       1
	XORWF       main_b2_L0+0, 0 
L__main149:
	BTFSS       STATUS+0, 2 
	GOTO        L_main113
	MOVLW       0
	XORWF       main_b3_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main150
	MOVLW       1
	XORWF       main_b3_L0+0, 0 
L__main150:
	BTFSS       STATUS+0, 2 
	GOTO        L_main113
L__main116:
;smart_parking.c,334 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,335 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,336 :: 		Lcd_Out(2,1,"Parking Is Full");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr5_smart_parking+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr5_smart_parking+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,337 :: 		}
	GOTO        L_main114
L_main113:
;smart_parking.c,339 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,340 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;smart_parking.c,341 :: 		Lcd_Out(1,1,str);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_str_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_str_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,342 :: 		Lcd_Out(2,3,c1);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_c1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_c1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,343 :: 		Lcd_Out(2,9,c2);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_c2_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_c2_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,344 :: 		Lcd_Out(2,15,c3);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       15
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       main_c3_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(main_c3_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;smart_parking.c,345 :: 		}
L_main114:
;smart_parking.c,346 :: 		delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_main115:
	DECFSZ      R13, 1, 1
	BRA         L_main115
	DECFSZ      R12, 1, 1
	BRA         L_main115
	DECFSZ      R11, 1, 1
	BRA         L_main115
;smart_parking.c,347 :: 		}
	GOTO        L_main0
;smart_parking.c,348 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
