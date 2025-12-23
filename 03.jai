day3 :: (input: string) -> string, string, string
{
    counts : Table(u64, u16);

    highest_count : u16;
    highest_colour : u64;
    reds, greens, blues, specials : s64;

    while input {
        r := read_u64(*input); advance(*input);
        g := read_u64(*input); advance(*input);
        b := read_u64(*input);

        id := r * 10000 + g * 100 + b;
        count := find_or_add(*counts, id);
        count.* += 1;
        
        if count.* > highest_count {
            highest_count = count.*;
            highest_colour = id;
        }

        reds     += ifx r > b && r > g && g != b    then 1;
        greens   += ifx g > r && g > b && b != r    then 1;
        blues    += ifx b > g && b > r && r != g    then 1;
        specials += ifx b == r || b == g || g == r  then 1;
    }

    p1 := tprint("%,%,%", highest_colour / 10000, highest_colour / 100 % 100, highest_colour % 100);
    p2 := tprint("%", greens);
    p3 := tprint("%", reds * 5 + greens * 2 + blues * 4 + specials * 10);

    return p1, p2, p3;
}