// https://bohumirzamecnik.cz/blog/2016/how-to-make-stl-with-svg-logo-and-text-in-openscad/

module logo_inti(h=1,size=1) {
    linear_extrude(height=h) {
        scale(size/4.6)
            translate([-28.35,19.45,0])
                import("logo_inti/logo_inti.dxf");
    }
}

module logo_inti_con_marco(size=10, color_logo=[1,1,1], color_marco=[1,1,1]*.1) {
    color(color_logo)
        logo_inti(size=size*.9, h=size*.12);
    color(color_marco)
        translate([-size/2, -size*(1+.4)/1.5, 0])
            cube([size, size*(1+.4), size*.1]);
}

logo_inti_con_marco(size=100);
