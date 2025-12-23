day7 :: (input: string) -> string, string, string
{
    p1, p2, p3 : s64;

    while input {
        r := read_s64(*input) - 1;
        c := read_s64(*input) - 1;

        choose :: (n: s64, k: s64) -> s64 {
            result := 1;
            for 1..k result = result * (n - k + it) / it;
            return result;
        }

        p1 += choose(r + c, c);
        p2 += choose(r + c + r, r) * choose(c + r, r);

        partial := 1;
        for dim: 0..r-1 partial *= choose(c * (dim+2), c);
        p3 += partial;
    }

    return tprint("%", p1), tprint("%", p2), tprint("%", p3);
}