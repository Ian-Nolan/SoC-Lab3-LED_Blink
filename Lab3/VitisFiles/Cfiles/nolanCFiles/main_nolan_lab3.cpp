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


/**
 * check individual led
 * @param led_p pointer to led instance
 */
void led_blink_check(GpoCore *led_p) {

   led_p->write_led0(2000);
   led_p->write_led1(1000);
   led_p->write_led2(500);
   led_p->write_led3(250);

}


// instantiate switch, led
// GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));
// GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));
GpoCore blink_led_lab3(get_slot_addr(BRIDGE_BASE, S4_LAB3_LED));

int main() {

   while (1) {
      led_blink_check(&blink_led_lab3);
      //debug("main - switch value / up time : ", sw.read(), now_ms());
   } //while
} //main

