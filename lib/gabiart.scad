// http://www.gabiart.com.ar/pdf/racknet_accesorios.pdf

ESPESOR_CHAPA = 2;
COLOR_GABINETE = [1,1,1];
COLOR_MANIJAS = [1,1,1]*.7;


module caja(A, P, H, espesor_chapa=1) {
    translate([0,0,-espesor_chapa]) {
        cube([P,A,espesor_chapa]);
        translate([0,0,H+espesor_chapa])
            cube([P,A,espesor_chapa]);
        translate([0,-espesor_chapa,espesor_chapa])
            cube([P,espesor_chapa,H]);
        translate([0,A,espesor_chapa])
            cube([P,espesor_chapa,H]);
        translate([-espesor_chapa,0,espesor_chapa])
            cube([espesor_chapa,A,H]);
        translate([P,0,espesor_chapa])
            cube([espesor_chapa,A,H]);
    }
}

module _frente_rack_(H,A) {
    tamanio_soportes = 30;
    diametro_manijas = 7.5;
    
    color(COLOR_GABINETE)
        translate([0,-tamanio_soportes,0])
            cube([ESPESOR_CHAPA,A+2*tamanio_soportes,H]);
    color(COLOR_MANIJAS) {
        translate([0,-tamanio_soportes/2,10])
            cube([30,diametro_manijas,diametro_manijas]);
        translate([0,-tamanio_soportes/2,H-diametro_manijas-10])
            cube([30,diametro_manijas,diametro_manijas]);
        translate([30-diametro_manijas,-tamanio_soportes/2,10])
            cube([diametro_manijas,diametro_manijas,H-2*10]);
        
        translate([0,A+tamanio_soportes/2-diametro_manijas,0]) {
            translate([0,0,10])
                cube([30,diametro_manijas,diametro_manijas]);
            translate([0,0,H-diametro_manijas-10])
                cube([30,diametro_manijas,diametro_manijas]);
            translate([30-diametro_manijas,0,10])
                cube([diametro_manijas,diametro_manijas,H-2*10]);
        }
    }
}

module serie507(codigo) {
    // http://www.gabiart.com.ar/espanol/gabinetes_507.php#
    
    if (codigo == 2001) {
        color(COLOR_GABINETE)
            caja(A=426, P=268, H=88, espesor_chapa=ESPESOR_CHAPA);
        translate([268,0,0])
            _frente_rack_(A=426,H=88);
    }
    if (codigo == 2002) {
        color(COLOR_GABINETE)
            caja(A=426, P=328, H=88, espesor_chapa=ESPESOR_CHAPA);
        translate([328,0,0])
            _frente_rack_(A=426,H=88);
    }
    if (codigo == 3001) {
        color(COLOR_GABINETE)
            caja(A=426, P=268, H=132, espesor_chapa=ESPESOR_CHAPA);
        translate([268,0,0])
            _frente_rack_(A=426,H=132);
    }
    if (codigo == 3002) {
        color(COLOR_GABINETE)
            caja(A=426, P=328, H=132, espesor_chapa=ESPESOR_CHAPA);
        translate([328,0,0])
            _frente_rack_(A=426,H=132);
    }
    if (codigo == 4001) {
        color(COLOR_GABINETE)
            caja(A=426, P=268, H=177, espesor_chapa=ESPESOR_CHAPA);
        translate([268,0,0])
            _frente_rack_(A=426,H=177);
    }
    if (codigo == 4002) {
        color(COLOR_GABINETE)
            caja(A=426, P=328, H=177, espesor_chapa=ESPESOR_CHAPA);
        translate([328,0,0])
            _frente_rack_(A=426,H=177);
    }
    
}

serie507(4002);
