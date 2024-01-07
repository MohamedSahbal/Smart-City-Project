#include <string.h>
sbit LCD_RS at RB4_bit;
    sbit LCD_EN at RB5_bit;
    sbit LCD_D4 at RB0_bit;
    sbit LCD_D5 at RB1_bit;
    sbit LCD_D6 at RB2_bit;
    sbit LCD_D7 at RB3_bit;

    sbit LCD_RS_Direction at TRISB4_bit;
    sbit LCD_EN_Direction at TRISB5_bit;
    sbit LCD_D4_Direction at TRISB0_bit;
    sbit LCD_D5_Direction at TRISB1_bit;
    sbit LCD_D6_Direction at TRISB2_bit;
    sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections



    void main()
    {
        //variables and array declaraction
     char str1[] = "Welcome";
        char str2[] = "To The Parking";
        char str[]="slt1 slt2 slt3";
        char c1[] = "1";
        char c2[] = "1";
        char c3[] = "1";
        char *nums[] = {"0","1","2","3"};
        char counter_string[] = "Counter : ";
        int i,flag_welcome = 1;
        int b1, b2, b3,b4,st_sensor;
    
    //ports status
        trisd = 0b00001111;   //parking
        trisa = 0b00000000;   //leds for park
        anseld = 0b00110000;  //motor
        trisb = 0b00000000;   //leds
        anselb = 0b00000000;
        trisc = 0b00000100;  //smart light
        anselc = 0b00000000;
        TRISE = 0b0001;      //Alarm system
        ANSELE= 0b0000;

        Lcd_Init();                        // Initialize LCD

        Lcd_Cmd(_LCD_CLEAR);               // Clear display
        Lcd_Cmd(_LCD_CURSOR_OFF);
        
        while (1)
        {
        //welcome
        if(flag_welcome==1)
        {
        Lcd_Out(1,1,str1);
        Lcd_Out(2,1,str2);
        flag_welcome=0;
        delay_ms(2000);
        }
        //button for park
            // Read button states
            if (Button(&PORTD, 0, 100, 1))             // Detect logical one
                b1 = 1;
            else
                b1 = 0;
            if (Button(&PORTD, 1, 100, 1))             // Detect logical one
                b2 = 1;
            else
                b2=0;
            if (Button(&PORTD, 2, 100, 1))             // Detect logical one
                b3 = 1;
            else
                b3=0;
            if (Button(&PORTD, 3, 1, 1))             // Detect logical one
                b4 = 1;
            else
                b4=0;
                // light System
            if (Button(&PORTC, 2, 1, 1))             // Detect logical one
                st_sensor = 1;
            else
                st_sensor = 0;
            if(st_sensor==1)
            portc = 0b00000010;
            else
            portc = 0b00000001;
            //Security Alarm System
            if (Button(&PORTE, 0, 1, 1)) {               // Detect logical one
            portE= 0b0110;
            delay_ms(200);
            portE=0b0010;
            delay_ms(200);
            portE= 0b0110;
            }else{
            portE=0b0000 ;
            }

            //Smart Parking code
            if(b1==1)
            {
                c1[0]='1';
                if(b2==1)
                {
                    c2[0]='1';
                    if(b3==1)
                    {
                        c3[0]='1';
                        porta=0b00000111;

                    }
                    else
                    {
                        c3[0]='0';
                        porta=0b00000011;
                        if(b4==1)
                        {
                          portD = 0b00010000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }

                          portD = 0b00100000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portd = 0;
                        }
                    }
                }
                else
                {
                    c2[0]='0';
                    if(b3==1)
                    {
                        c3[0]='1';
                        porta=0b00000101;
                        if(b4==1)
                        {
                          portD = 0b00010000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portD = 0b00100000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portd = 0;
                        }
                    }
                    else
                    {
                        c3[0]='0';
                        porta=0b00000001;
                        if(b4==1)
                        {
                          portD = 0b00010000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portD = 0b00100000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portd = 0;
                        }
                    }
                }
            }
            else
            {
                c1[0]='0';
                if(b2==1)
                {
                    c2[0]='1';
                    if(b3==1)
                    {
                        c3[0]='1';
                        porta=0b00000110;
                        if(b4==1)
                        {
                          portD = 0b00010000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portD = 0b00100000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portd = 0;
                        }
                    }
                    else
                    {
                        c3[0]='0';
                        porta=0b00000010;
                        if(b4==1)
                        {
                          portD = 0b00010000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portD = 0b00100000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portd = 0;
                        }
                    }
                }
                else
                {
                    c2[0]='0';
                    if(b3==1)
                    {
                        c3[0]='1';
                        porta=0b00000100;
                        if(b4==1)
                        {
                          portD = 0b00010000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portD = 0b00100000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portd = 0;
                        }
                    }
                    else
                    {
                        c3[0]='0';
                        porta=0b00000000;
                        if(b4==1)
                        {
                          portD = 0b00010000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portD = 0b00100000;
                          for(i=3;i>=0;i--)
                          {
                          delay_ms(250);
                          Lcd_Cmd(_LCD_CLEAR);               // Clear display
                          Lcd_Cmd(_LCD_CURSOR_OFF);
                          Lcd_Out(1,1,counter_string);
                          Lcd_Out(2,1,nums[i]);
                          delay_ms(250);
                          }
                          portd = 0;
                        }
                    }
                }
            }

            if(b1==1 && b2==1 && b3==1){
            Lcd_Cmd(_LCD_CLEAR);               // Clear display
            Lcd_Cmd(_LCD_CURSOR_OFF);
            Lcd_Out(2,1,"Parking Is Full");
            }
            else{
        Lcd_Cmd(_LCD_CLEAR);               // Clear display
        Lcd_Cmd(_LCD_CURSOR_OFF);
        Lcd_Out(1,1,str);
        Lcd_Out(2,3,c1);
        Lcd_Out(2,9,c2);
        Lcd_Out(2,15,c3);
            }
            delay_ms(200);
        }
    }