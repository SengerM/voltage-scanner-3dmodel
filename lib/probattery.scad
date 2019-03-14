module battery(V=12, AH=7.5) {
    if ((V==12) && (AH==7.5)) {
        color([1,1,1]*0.2) 
            cube([145,65,95]);
        translate([0,0,95])
            color([1,0,0])
                cube([13,13,2]);
        translate([0,65-13,95])
            color([0,0,0])
                cube([13,13,2]);
        name = "Probattery 12V 7.5AH";
        color([1,1,1]) {
            translate([5,0,75]) {
                translate([0,0,0])
                    rotate(90, [1,0,0])
                        text(name);
                translate([130,65,0])
                    rotate(180,[0,0,1])
                        rotate(90, [1,0,0])
                            text(name);
            }
        }
    }
    if ((V==12) && (AH==4.3)) {
        color([1,1,1]*0.2) 
            cube([135,65,60]);
        translate([0,0,60])
            color([1,0,0])
                cube([13,13,2]);
        translate([0,65-13,60])
            color([0,0,0])
                cube([13,13,2]);
        name = "Probattery 12V 4.3AH";
        color([1,1,1]) {
            translate([2,0,45]) {
                translate([0,0,0])
                    rotate(90, [1,0,0])
                        text(name);
                translate([130,65,0])
                    rotate(180,[0,0,1])
                        rotate(90, [1,0,0])
                            text(name);
            }
        }
    }
}

battery(AH=4.3);