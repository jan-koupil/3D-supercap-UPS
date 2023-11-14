$fn = 30;
eps = 0.05;

length = 177;
width = 94;
thickness = 1.5;
side_width = 8;
inside_height = 32;

screw_height = 21;


strip_width = 2;
full_h = inside_height + thickness;

module box() {
translate([length / 2, width / 2, inside_height]) 
{

    translate([0, 0, thickness / 2]) {
        intersection() {
            cube(size=[length, width, thickness], center=true);
            strips(length, width, thickness, strip_width);
        }

        intersection() {
            cube(size=[length, width, thickness], center=true);

            union() {
                translate([length / 2, width / 2,0])
                    cylinder(r=2 * side_width, h=thickness, center=true);
                translate([length / 2, -width / 2,0])
                    cylinder(r=2 * side_width, h=thickness, center=true);
                translate([-length / 2, width / 2,0])
                    cylinder(r=2 * side_width, h=thickness, center=true);
                translate([-length / 2, -width / 2,0])
                    cylinder(r=2 * side_width, h=thickness, center=true);
            }
        }

        difference() {
            cube(size=[length, width, thickness], center=true);
            cube(size=[length - 2 * side_width, width - 2 * side_width, thickness + eps], center=true);
        }
        cube(size=[side_width, width, thickness], center=true);
    }

    translate([0, 0, -inside_height / 2])
        difference() {
            cube(size=[length, width, inside_height], center=true);
            cube(size=[length - 2 * thickness, width - 2 * thickness, inside_height + eps], center=true);
        }
}
}


    // spojky kisny

difference() {
    union() {
        box();
        translate([4.5, 4.5, 0])
            leg (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);        

        translate([4.5, 89.5, 0]) rotate([0,0,-90])
            leg (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);

        translate([172.5, 4.5, 0]) rotate([0,0,90])
            leg (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);

        translate([172.5, 89.5, 0]) rotate([0,0,180])
            leg (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);
    }

    translate([4.5, 4.5, 0])
            leg_cutoff (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);
    translate([4.5, 89.5, 0]) rotate([0,0,-90])
        leg_cutoff (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);
    translate([172.5, 4.5, 0]) rotate([0,0,90])
        leg_cutoff (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);
    translate([172.5, 89.5, 0]) rotate([0,0,180])
        leg_cutoff (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);

    color("blue") {
        translate([9.75,width - thickness -eps, -eps])
            cube([13.5, thickness + 2 * eps, 15.5 + eps], center = false);

        translate([27.75,width - thickness -eps, -eps])
            cube([13.5, thickness + 2 * eps, 15.5 + eps], center = false);

        translate([45,width - thickness -eps, -eps])
            cube([16.5, thickness + 2 * eps, 14 + eps], center = false);
    }
}

    // translate([4.5, 4.5, 0])
    //     leg(3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);
    // translate([4.5, 4.5, 0])
    //     leg_cutoff (3 + eps, 1.2, screw_height, 3 + thickness, inside_height - screw_height + thickness);


module strips(length, width, thickness, strip_width) {
    ext_len = length + width;
    strip_dist = strip_width * sqrt(2) * 2;
    strip_cnt_raw = ceil(ext_len / strip_dist);
    cycles = ((strip_cnt_raw % 2 == 0) ? strip_cnt_raw : strip_cnt_raw + 1) / 2;

    for (i=[0:cycles]) {
        translate([i * strip_dist, 0, 0])
            rotate([0,0,45])
                cube(size=[sqrt(2) * width + strip_width, strip_width, thickness], center=true);

        translate([-i * strip_dist, 0, 0])
            rotate([0,0,45])
                cube(size=[sqrt(2) * width + strip_width, strip_width, thickness], center=true);
    }
}

module leg(rOut, rIn, h, rTop, hTop, center = false) {

    cylinder(r=rOut, h = h, center=center);
    translate([0,0,h-2 * thickness])
        cylinder(r=rTop, h = hTop + 2 * thickness, center = center);


    translate([-rOut / 2, -rOut / 2, h/2 ])
        cube(size=[rOut, rOut, h], center=true);
    translate([-rTop / 2, 0, hTop / 2  + h ])
        cube(size=[rTop, rTop * 2, hTop], center=true);
    translate([0, -rTop / 2, hTop / 2  + h])
        cube(size=[rTop * 2, rTop, hTop], center=true);

}

module leg_cutoff(rOut, rIn, h, rTop, hTop, center = false) {
    
    translate([0,0,-eps / 2])
        cylinder(r=rIn, h = h + hTop + 2 * eps, center=center);
    
    color("green") {  
        translate([-rTop / 2 - eps, -(thickness + eps) / 2, hTop / 2  + h + eps/2])
            cube(size=[rTop, rTop * 2 - thickness + 2 * eps, hTop + eps], center=true);

        translate([-(thickness + eps) / 2, -rTop / 2 - eps, hTop / 2  + h + eps/2])
            cube(size=[rTop * 2 - thickness + 2 * eps, rTop, hTop + eps], center=true);

        translate([0, 0,h - eps])
            cylinder(r=rTop - thickness, h = hTop + 2*eps, center = center);
    }

    translate([0,0,h - 2])
        cylinder(r1=0, r2=rOut, h=2, center=center);
}


