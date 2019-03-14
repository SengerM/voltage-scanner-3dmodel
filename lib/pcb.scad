include <../macros.scad>

module pin(x=0,y=0,oriented_down=true) {
    if (oriented_down == false) {
        color([.5,.5,.5])
        translate([x,y,0])
        cylinder(h=10, r=.5);
    } else {
        color([.5,.5,.5])
        translate([x,y,0])
        rotate(a=180, v=[1,0,0])
        cylinder(h=10, r=.5);
    }
}

module star_connection(radius=10, channels=10) {
    pin(oriented_down=false);
    for (i = [0:channels-1]) {
        pin(x=radius*cos(360*i/channels), y=radius*sin(360*i/channels), oriented_down=false);
    }
}

module relay() {
    translate([-1.3, -2.19, 0])
        cube([28, 12, 12]);
    for (i = [0:5]) {
        pin(5.08*i,0);
        pin(5.08*i,7.62);
    }
    
}

module M2C() {
    name = "M2C";
    translate([10,20,BOARD_WIDTH])
        text(name);
    translate([40,20,0])
        rotate(180,[0,1,0])
            text(name);
    color(PCB_COLOR)
    cube([M2C_X_LEN, M2C_Y_LEN, BOARD_WIDTH]);
    translate([65.290, 10.682, BOARD_WIDTH])
    relay();
    translate([65.290, 28.462, BOARD_WIDTH])
    relay();
    translate([65.290, 46.242, BOARD_WIDTH])
    relay();
    translate([65.290, 64.022, BOARD_WIDTH])
    relay();
    pin(19.82,8.39,false);
    pin(22.36,8.39,false);
    pin(24.9,8.39,false);
    pin(27.44,8.39,false);
    pin(43.95,8.392,false);
    pin(46.49,8.392,false);
}

module DMMPCB() {
    name = "DMMPCB";
    translate([10,0,BOARD_WIDTH])
        text(name, size=5);
    translate([40,0,0])
        rotate(180,[0,1,0])
            text(name, size=5);
    color(PCB_COLOR)
    cube([DMMPCB_X_LEN, DMMPCB_Y_LEN, BOARD_WIDTH]);
    translate([38.62, 8.142, BOARD_WIDTH])
    relay();
    translate([38.62, 24.652, BOARD_WIDTH])
    relay();
    pin(5.85, 17.28, false);
    pin(5.85, 19.82, false);
    pin(5.85, 22.36, false);
    pin(5.85, 24.90, false);
    pin(79.5, 31.88, false);
    pin(82.0, 31.88, false);
}

module 180919PCB() {
    name = "180919PCB";
    translate([10,0,BOARD_WIDTH])
        text(name, size=5);
    translate([40,0,0])
        rotate(180,[0,1,0])
            text(name, size=5);
    color(PCB_COLOR)
    cube([180919PCB_X_LEN, 180919PCB_Y_LEN, BOARD_WIDTH]);
    translate([25.92, 17.032, BOARD_WIDTH])
    relay();
    pin(7.12, 29.98, false);
    pin(9.66, 29.98, false);
    pin(78.24, 29.982, false);
    pin(78.24, 27.442, false);
    pin(78.24, 24.902, false);
    pin(78.24, 22.362, false);
    pin(78.24, 13.472, false);
    pin(78.24, 10.932, false);
    pin(78.24, 8.392, false);
}

module STAR_CONN_PCB() {
    name = "STAR_CONN_PCB";
    translate([10,3,BOARD_WIDTH])
        text(name, size=5);
    translate([60,3,0])
        rotate(180,[0,1,0])
            text(name, size=5);
    color(PCB_COLOR)
    cube([STAR_CONN_PCB_X_LEN, STAR_CONN_PCB_Y_LEN, BOARD_WIDTH]);
    translate([22.27,22.57,-1])
        star_connection(channels=10, radius=15);
    translate([72.43,22.57,-1])
        star_connection(channels=10, radius=15);
    translate([122.6,22.57,-1])
        star_connection(channels=10, radius=15);
    translate([172.7,22.57,-1])
        star_connection(channels=10, radius=15);
}

180919PCB();
translate([0, 180919PCB_Y_LEN + 10, 0]) 
    DMMPCB();
translate([0, 180919PCB_Y_LEN + 10 + DMMPCB_Y_LEN + 10, 0]) 
    M2C();
translate([0, 180919PCB_Y_LEN + 10 + DMMPCB_Y_LEN + 10 + M2C_Y_LEN + 10, 0])
    STAR_CONN_PCB();
