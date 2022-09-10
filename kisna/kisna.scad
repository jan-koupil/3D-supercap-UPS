$fn = 30;

eps = 0.05;
th = 1.5;
l = 145;
w = 94;
rpiTh = 1.5;
legH = 9;
fullH = legH + rpiTh;

//kisna

translate([0,0,-th])
difference() {
    cube(size=[l, w, th + fullH]);
    translate([th, th, th + eps])
        cube(size=[l - 2 * th, w -  2 * th, fullH]);
}


//spojky kisny

translate([4.5, 4.5, 0])
    leg (3 + eps, 1.2, fullH);

translate([4.5, 89.5, 0])
    leg (3 + eps, 1.2, fullH);

translate([140.5, 4.5, 0])
    leg (3 + eps, 1.2, fullH);

translate([140.5, 89.5, 0])
    leg (3 + eps, 1.2, fullH);


//rpi
translate([11, 25, 0])
    leg (3, 2.1/2, legH);

translate([11, 83, 0])
    leg (3, 2.1/2, legH);    

translate([60, 25, 0])
    leg (3, 2.1/2, legH);

translate([60, 83, 0])
    leg (3, 2.1/2, legH);    


//LM2596
translate([68.5, 25, 0])
    leg (3, 2.4/2, legH);

translate([85.1, 56, 0])
    leg (3, 2.4/2, legH);

//UPS
translate([93.5, 17, 0])
    leg (3, 2.4/2, legH);

translate([93.5, 83, 0])
    leg (3, 2.4/2, legH);    

translate([134.5, 17, 0])
    leg (3, 2.4/2, legH);

translate([134.5, 83, 0])
    leg (3, 2.4/2, legH);     


module leg(rOut, rIn, h, center = false) {
    difference() {
        cylinder(r=rOut, h = h, center=center);
        translate([0,0,-eps / 2])
            cylinder(r=rIn, h = h + 2 * eps, center=center);
    }

}