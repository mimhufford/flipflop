day5 :: (input: string) -> string, string, string
{
    p1, p3 : s64;
    p2 : [..]u8;

    pairs := NewArray(input.count, s64);
    for * pairs it.* = -1;

    for char, index: input {
        if pairs[index] >= 0 continue;
        array_add(*p2, char);
        other_index := find_index_from_left(input, char, index + 1);
        pairs[index] = other_index;
        pairs[other_index] = index;
    }

    index := 0;
    while index < pairs.count {
        cost := abs(index - pairs[index]);
        p1 += cost;
        p3 += ifx is_upper(input[index]) then -cost else cost;
        array_ordered_remove_by_value(*p2, input[index]);
        index = pairs[index] + 1;
    }

    return tprint("%", p1), p2.(string), tprint("%", p3);
}