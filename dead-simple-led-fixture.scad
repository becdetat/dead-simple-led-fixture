$fs= 1;

ledCount = 6;
ledSpacing = 20;
endSpacing = 10;
fullHeight = 15;
ledDiameter = 3;
screwDiameter= 3;
wallThickness = 3;
wireHoleDiameter = 3;

fullWidth = 20;
fullLength = 
    (ledCount+1) * ledSpacing
    + endSpacing * 2;
   
translate ([-fullHeight/2,-(fullLength/2),0]) {
    difference() {
        shell();
        leds();
        screws();
        wireHole();
    }
}

module shell() {
    color("blue") {
        difference() {
            cube ([fullWidth,fullLength,fullHeight]);
            translate([
                wallThickness,
                wallThickness,
                wallThickness
            ]) {
                difference() {
                    cube([
                        fullWidth - wallThickness*2,
                        fullLength - wallThickness*2,
                        fullHeight
                    ]);
                }
            }
        }
    }
}

module leds() {
    color("white") {
        for (i = [0:ledCount-1]) {
            translate([
                fullWidth/2,
                endSpacing + (i+1)*ledSpacing,
                -5]
            ) {
                cylinder(
                    h=fullHeight+10, 
                    r=ledDiameter/2);
            }
        }
    }
}

module screws() {
    color("red") {
        translate([
            fullWidth/2,
            endSpacing,
            -5
        ]) {
            cylinder(
                h = fullHeight + 10,
                r = screwDiameter/2);
        }
        
        translate([
            fullWidth/2,
            endSpacing + (ledCount + 1)*ledSpacing,
            -5
        ]) {
            cylinder(
                h = fullHeight + 10,
                r = screwDiameter/2);
        }
    }
}

module wireHole() {
    translate([
        fullWidth / 3,
        wallThickness * 1.25,
        fullHeight * 0.75
    ]) {
        rotate([90,0,0]) {
            color("green") {
                cylinder(
                    h = wallThickness * 1.5,
                    r = wireHoleDiameter / 2
                );
            }
        }
    }
}