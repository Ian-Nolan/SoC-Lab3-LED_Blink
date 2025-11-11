/*****************************************************************//**
 * @file main_vanilla_test.cpp
 *
 * @brief Basic test of 4 basic i/o cores
 *
 * @author p chu
 * @version v1.0: initial release
 *********************************************************************/

//#define _DEBUG
#include "chu_init.h"
#include "gpio_cores.h"


// /**
//  * check individual led
//  * @param led_p pointer to led instance
//  * @param n number of led
//  */
// void led_check(GpoCore *led_p, int n) {     //Chu's work
//    int i;

//    for (i = 0; i < n; i++) {
//       led_p->write(1, i);
//       sleep_ms(200);
//       led_p->write(0, i);
//       sleep_ms(200);
//    }
// }

/**
 * check individual led
 * @param led_p pointer to led instance
 * @param n number of led
 */
void led_check(GpoCore *led_p, int n) {
   int i;

   for (i = 0; i < n; i++) {
      led_p->write(1, i);
      sleep_ms(200);
      led_p->write(0, i);
      sleep_ms(200);
   }
}

/**
 * check individual led
 * @param led_p pointer to led instance
 */
void led_blink_test(GpoCore *led_p) {

   led_p->write_led_test(3000);

}

void led_blink(GpoCore *led_p) {

   led_p->write_led0(1000);
   led_p->write_led1(2000);
   led_p->write_led2(3000);
   led_p->write_led3(4000);
   //led_p->write_led_test(3000);

}


// instantiate switch, led
// GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));
GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));    //Chu's work
GpoCore blink_led_lab3(get_slot_addr(BRIDGE_BASE, S4_LAB3_LED));

int main() {

   while (1) {
      //led_check(&led, 9);
      sleep_ms(1000);
      //led_blink_test(&blink_led_lab3); //Nolan's work
      //sleep_ms(8000);
      led_blink(&blink_led_lab3); //Nolan's work
      //sleep_ms(20000);
   } //while
} //main

