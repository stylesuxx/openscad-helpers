module hexagon(side, height) {
    angle = 120;
    base = sqrt(2 * pow(side, 2) * (1 - cos(angle)));

    for(i = [0:angle:360])
        rotate([0, 0, i])
            cube([side, base, height], center = true);
}

module trapezoid(bottom, top, height, depth) {
    delta = (bottom - top) / 2;

    translate([-(depth / 2), -(bottom / 2), -(height / 2)])
        polyhedron(
            points = [
                [0, 0, 0],
                [0, bottom, 0],
                [depth, bottom, 0],
                [depth, 0, 0],

                [0, delta, height],
                [0, delta + top, height],
                [depth, delta, height],
                [depth, delta + top, height],
            ],
            faces = [
                [2, 1, 0],
                [3, 2, 0],
                [4, 0, 1],
                [5, 4, 1],
                [2, 3, 6],
                [6, 7, 2],
                [4, 5, 6],
                [7, 6, 5],
                [4, 3, 0],
                [6, 3, 4],
                [1, 2, 5],
                [7, 5, 2]
            ]
        );
}
