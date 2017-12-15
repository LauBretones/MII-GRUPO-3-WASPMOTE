#include <WaspRFID13.h>  

uint8_t state=1;
ATQ ans;
UIdentifier UID;
UIdentifier myCard1 = {0xC9, 0xA7, 0x35, 0xC1}; 
UIdentifier myCard2 = {0x59, 0x4C, 0x36, 0xC1}; 
UIdentifier myCard3 = {0xE9, 0x8F, 0x36, 0xC1};
UIdentifier myCard4 ;
int hits;



void setup()
{
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);   
  RFID13.ON(SOCKET0);
  USB.print(F("Proyecto 3"));
   
}



void loop()

{

USB.print(F("\r\n ++++++++++++++++++++++++++++++++++++"));
digitalWrite(DIGITAL7, LOW);
digitalWrite(DIGITAL6, LOW);

//////////////////////////
// 1. Inicio
//////////////////////////
  state = RFID13.init(UID, ans);

  if (state == 1)
  {
    USB.print(F("\r\n Tarjeta no encontrada"));
  }  
  else 
  {
    USB.print(F("\r\n UID: "));   
    RFID13.print(UID, 4); 

    if (state == 0)  
    {
/////////////////////////////////////////////////////
// 2. Comparar
/////////////////////////////////////////////////////
      if (RFID13.equalUIDs(myCard1, UID) == 0) 
      { // Si esta habilitada
        USB.print(F("\r\n  Tarjeta identificada (MASTER). Acceso habilitado. "));
        hits++; 

         digitalWrite(DIGITAL7, HIGH);
     
//     state = RFID13.init(UID, ans);  PAra habilitar nuevas tarjetas
//     RFID13.print(UID, 4);
//     if(RFID13.equalUIDs(myCard2, UID)==0)
//         {
//          myCard4==myCard2;
//         }
//         else
//         {
//          myCard4==myCard3;
//         }           
 
      }
      else if (RFID13.equalUIDs(myCard2, UID) == 0) 
      {
        USB.print(F("\r\n  Tarjeta identificada (NORMAL). Acceso habilitado. "));
        hits++; 

         digitalWrite(DIGITAL7, HIGH);

      } 
      else 
      { // No esta habilitada
        USB.print(F("\r\n  ** Tarjeta no válida. Acceso denegado. "));
          digitalWrite(DIGITAL6, HIGH);

  
      {
        }
      }
        delay(1000);
    }
///////////////////////////////////////////////    
/////Final 
///////////////////////////////////////////////
    else 
    { 
      USB.print(F("\r\n  ** Por favor introduzca tarjeta. "));

      digitalWrite(DIGITAL6, HIGH); 
      {      
      }    
    }
  }

  USB.print(F("\r\n  Accesos: ")); 
  USB.println(hits);
  digitalWrite(DIGITAL6, HIGH); 
  delay(100);

}
