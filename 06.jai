day6 :: (input: string) -> string, string, string
{
    p1, p2, p3 : s64;

    while input {
        dx := (read_s64(*input) + 1000) % 1000;
        advance(*input);
        dy := (read_s64(*input) + 1000) % 1000;

        count :: (dx: s64, dy: s64, snaps: s64, frequency: s64) -> s64 {
            result := 0;
            for 1..snaps {
                x := (dx * it * frequency) % 1000;
                y := (dy * it * frequency) % 1000;
                result += ifx x >= 250 && x < 750 && y >= 250 && y < 750 then 1;
            }
            return result;
        }

        p1 += count(dx, dy, 1, 100);
        p2 += count(dx, dy, 1000, 3600);
        p3 += count(dx, dy, 1000, 31556926);
    }

    return tprint("%", p1), tprint("%", p2), tprint("%", p3);
}