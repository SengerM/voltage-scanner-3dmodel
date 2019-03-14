module interlock() {
    cover_offset = 3;
    rotate(90,[0,-1,0])
        color([1,1,1]*.1)
            polygon(points=[
                            [-1,-1]*cover_offset,
                            [-cover_offset,27+cover_offset],
                            [54/2,27+10+cover_offset],
                            [54+cover_offset,27+cover_offset],
                            [54+cover_offset,-cover_offset],
                            [54/2,-10-cover_offset]
                            ]);
    color([1,1,1]*.8)
        translate([-51,0,0])
            cube([51,28,54]);
}

interlock();