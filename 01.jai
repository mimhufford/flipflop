day1 :: (input: string) -> string, string, string
{
    p1, p2, p3: s64;

    while input {
        line := read_word(*input);
        score := 0;
        banena := false;

        for 0..line.count-2 {
            if line[it] == "b" && line[it+1] == "a" { score += 1; }
            if line[it] == "n" && line[it+1] == "a" { score += 1; }
            if line[it] == "n" && line[it+1] == "e" { score += 1; banena = true; }
        }

        p1 += score;
        p2 += ifx score % 2 == 0 then score;
        p3 += ifx !banena then score;
    }

    return tprint("%", p1), tprint("%", p2), tprint("%", p3);
}