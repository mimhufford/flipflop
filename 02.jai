day2 :: (input: string) -> string, string, string
{
    p1, p2, p3: s64;

    height_1 := 0;
    height_c := 0;
    height_f := 0;
    ups, downs := 0;
    
    fib :: (n: s64) -> s64 {
        seq :: s64.[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233, 377, 610, 987, 1597, 2584, 4181, 6765];
        if n < seq.count return seq[n];
        return fib(n-2) + fib(n-1);
    } 

    for input {
        if it == "^" {
            height_f -= fib(downs);
            ups += 1;
            downs = 0;
            height_1 += 1;
            height_c += ups;
        }

        if it == "v" {
            height_f += fib(ups);
            downs += 1;
            ups = 0;
            height_1 -= 1;
            height_c -= downs;
        }

        if it_index == input.count-1 {
            height_f += fib(ups);
            height_f -= fib(downs);
        }

        p1 = max(p1, height_1);
        p2 = max(p2, height_c);
        p3 = max(p3, height_f);
    }

    return tprint("%", p1), tprint("%", p2), tprint("%", p3);
}