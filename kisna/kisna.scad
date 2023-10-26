$fn = 30;

eps = 0.05;
th = 1.5;
l = 177;
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

    translate([93.25, -eps, th + fullH - 2.25])
        cube(size=[4.5, th + 2 * eps, 2.25 + eps]);
}


//spojky kisny

translate([4.5, 4.5, 0])
    leg (3 + eps, 1.2, fullH);

translate([4.5, 89.5, 0])
    leg (3 + eps, 1.2, fullH);

translate([172.5, 4.5, 0])
    leg (3 + eps, 1.2, fullH);

translate([172.5, 89.5, 0])
    leg (3 + eps, 1.2, fullH);


//rpi
translate([11, 11, 0])
    leg (3, 2.1/2, legH);

translate([11, 69, 0])
    leg (3, 2.1/2, legH);    

translate([60, 11, 0])
    leg (3, 2.1/2, legH);

translate([60, 69, 0])
    leg (3, 2.1/2, legH);    


//Buck
translate([76, 30, 0])
    leg (3, 2.4/2, legH);

translate([76, 83, 0])
    leg (3, 2.4/2, legH);

translate([115, 30, 0])
    leg (3, 2.4/2, legH);

translate([115, 83, 0])
    leg (3, 2.4/2, legH);

//UPS
translate([128, 14, 0])
    leg (3, 2.4/2, legH);

translate([128, 80, 0])
    leg (3, 2.4/2, legH);    

translate([169, 14, 0])
    leg (3, 2.4/2, legH);

translate([169, 80, 0])
    leg (3, 2.4/2, legH);     


module leg(rOut, rIn, h, center = false) {
    difference() {
        cylinder(r=rOut, h = h, center=center);
        translate([0,0,-eps / 2])
            cylinder(r=rIn, h = h + 2 * eps, center=center);
    }

}