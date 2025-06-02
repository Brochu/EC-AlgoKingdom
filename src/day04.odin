package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

d4run :: proc (p1, p2, p3: ^strings.Builder) {
    when EXAMPLE {
        P1_IN :: "../data/day04.ex.p1.txt"
        P2_IN :: "../data/day04.ex.p2.txt"
        P3_IN :: "../data/day04.ex.p3.txt"
    } else {
        P1_IN :: "../data/day04.p1.txt"
        P2_IN :: "../data/day04.p2.txt"
        P3_IN :: "../data/day04.p3.txt"
    }

    solve_p1(strings.trim(#load(P1_IN, string), "\n"), p1);
    solve_p2(strings.trim(#load(P2_IN, string), "\n"), p2);
    solve_p3(strings.trim(#load(P3_IN, string), "\n"), p3);
}

@(private="file")
solve_p1 :: proc(input: string, out: ^strings.Builder) {
    nails := slice.mapper(strings.split(input, "\n"), proc(str: string) -> int {
        val, _ := strconv.parse_int(str);
        return val;
    });
    fmt.printfln("%v", nails);

    min_nail := slice.reduce(nails, max(int), proc(acc, n: int) -> int {
        return min(acc, n);
    });
    fmt.printfln("%v", min_nail);

    sum := 0;
    for n in nails {
        sum += n - min_nail;
    }
    strings.write_int(out, sum);
}

@(private="file")
solve_p2 :: proc(input: string, out: ^strings.Builder) {
    nails := slice.mapper(strings.split(input, "\n"), proc(str: string) -> int {
        val, _ := strconv.parse_int(str);
        return val;
    });
    fmt.printfln("%v", nails);

    min_nail := slice.reduce(nails, max(int), proc(acc, n: int) -> int {
        return min(acc, n);
    });
    fmt.printfln("%v", min_nail);

    sum := 0;
    for n in nails {
        sum += n - min_nail;
    }
    strings.write_int(out, sum);
}

@(private="file")
solve_p3 :: proc(input: string, out: ^strings.Builder) {
}
