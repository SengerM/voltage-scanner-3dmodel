module BUP_3770(color=[1,0,0]) {
    // https://muellerelectric.com/wp-content/uploads/DS-BU-P3770.pdf
    color(color) {
        difference() {
            cylinder(h=20.57, d=11.18);
            cylinder(h=21, d=7);
        }
    }
    color([.8,.7,.1])
        translate([0,0,-20.32])
            cylinder(h=20.32, d=2.79);
}

BUP_3770();