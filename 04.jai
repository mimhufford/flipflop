day4 :: (input: string) -> string, string, string
{
    p1, p2, p3 : s64;

    points : [..] struct { x: s16; y: s16; };
    x, y : s16;

    while input {
        tx := read_s16(*input); advance(*input);
        ty := read_s16(*input);
        array_add(*points, .{tx, ty});

        dx, dy := abs(tx - x), abs(ty - y);
        p1 += dx + dy;
        p2 += max(dx, dy);
        x, y = tx, ty;
    }

    quick_sort(points, a => a.x + a.y);
    x, y = 0, 0;

    for points {
        dx, dy := abs(it.x - x), abs(it.y - y);
        p3 += max(dx, dy);
        x, y = it.x, it.y;
    }

    return tprint("%", p1), tprint("%", p2), tprint("%", p3);
}