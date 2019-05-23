include <macros.scad>;

use <lib/pcb.scad>;
use <lib/arduino.scad>; // https://github.com/kellyegan/OpenSCAD-Arduino-Mounting-Library
use <lib/gabiart.scad>
use <lib/connectors.scad>
use <lib/LED_Module.scad>
use <lib/probattery.scad>
use <lib/interlock.scad>
use <lib/logo.scad>

BANANA_NORMALIZED_DISTANCE = 23-4;
CHANNEL_BINDING_POST_HEIGHT = 40;


translate([-2,400,20])
    rotate(180,[0,0,1])
        interlock();

translate([10,210,0])
    rotate(90, [0,0,-1])
        battery(AH=4.3);

for (i = [0:9]) {
    translate([328-3,30+i*30,76])
        rotate(90,[0,1,0])
            led();
    translate([328+2,30+i*30,CHANNEL_BINDING_POST_HEIGHT+BANANA_NORMALIZED_DISTANCE])
        rotate(90,[0,1,0])
            BUP_3770(color=[.8,0,0]);
    translate([328+2,30+i*30,CHANNEL_BINDING_POST_HEIGHT])
        rotate(90,[0,1,0])
            BUP_3770(color=[1,1,1]*0.15);
    translate([328+2,30+i*30,15])
        rotate(90,[0,1,0])
            BUP_3770(color=[0,.6,0]);
}

translate([328+2,390,CHANNEL_BINDING_POST_HEIGHT+BANANA_NORMALIZED_DISTANCE])
    rotate(90,[0,1,0])
        BUP_3770(color=[.8,0,0]);
translate([328+2,390,CHANNEL_BINDING_POST_HEIGHT])
    rotate(90,[0,1,0])
        BUP_3770(color=[1,1,1]*0.15);
translate([328+2,390,15])
    rotate(90,[0,1,0])
        BUP_3770(color=[0,.6,0]);

translate([100,10,30]) {
    for (i = [0:4]) {
        translate([0, M2C_Y_LEN*i*1.01, 0])
            M2C();
//        translate([0, M2C_Y_LEN*i*1.01 + M2C_Y_LEN, 30])
//            rotate(a=180, v=[1,0,0])
//                M2C();
    }
}

translate([260,80,20])
    rotate(90, [0,0,1])
        rotate(90, [1,0,0])
            STAR_CONN_PCB();

translate([230,330,30]) {
    translate([180919PCB_X_LEN,0,30])
        rotate(180, [0,1,0])
            180919PCB();

    translate([0,0,0])
        DMMPCB();
}

translate([0,60,10])
    rotate(90,[0,0,-1])
    arduino();

translate([328+2,350,50])
    rotate(90, [0,1,0])
        rotate(90, [0,0,1])
            logo_inti_con_marco(size=25);

color([1,1,1,.6])
    serie507(3002);