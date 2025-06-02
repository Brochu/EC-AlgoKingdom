package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"

d1run :: proc (p1, p2, p3: ^strings.Builder) {
    when EXAMPLE {
        P1_IN :: "../data/day01.ex.p1.txt"
        P2_IN :: "../data/day01.ex.p2.txt"
        P3_IN :: "../data/day01.ex.p3.txt"
    } else {
        P1_IN :: "../data/day01.p1.txt"
        P2_IN :: "../data/day01.p2.txt"
        P3_IN :: "../data/day01.p3.txt"
    }

    solve_p1(strings.trim(#load(P1_IN, string), "\r\n"), p1);
    solve_p2(strings.trim(#load(P2_IN, string), "\r\n"), p2);
    solve_p3(strings.trim(#load(P3_IN, string), "\r\n"), p3);
}

@(private="file")
solve_p1 :: proc(input: string, out: ^strings.Builder) {
    pot_count := 0;
    for r in input {
        if r == 'A' {
        }
        else if r == 'B' {
            pot_count += 1;
        }
        else if r == 'C' {
            pot_count += 3;
        }
    }
    strings.write_int(out, pot_count);
}

@(private="file")
solve_p2 :: proc(input: string, out: ^strings.Builder) {
    pot_count := 0;
    for i in 0..<len(input)/2 {
        group := input[i*2:(i*2) + 2];
        first := group[0];
        second := group[1];

        mod := 1;
        if first == 'x' || second == 'x' {
            mod = 0;
        }

        for c in group {
            if c == 'A' {
                pot_count += mod;
            }
            else if c == 'B' {
                pot_count += 1 + mod;
            }
            else if c == 'C' {
                pot_count += 3 + mod;
            }
            else if c == 'D' {
                pot_count += 5 + mod;
            }
        }
    }
    strings.write_int(out, pot_count);
}

@(private="file")
solve_p3 :: proc(input: string, out: ^strings.Builder) {
    pot_count := 0;
    for i in 0..<len(input)/3 {
        group := input[i*3:(i*3) + 3];

        monsters := [4]int { 0, 0, 0, 0 };
        xs := 0;
        for c in group {
            if c == 'x' do xs += 1
            else do monsters[c-'A'] += 1;
        }
        mod := 2 - xs;
        pot_count += monsters[0] * (0 + mod);
        pot_count += monsters[1] * (1 + mod);
        pot_count += monsters[2] * (3 + mod);
        pot_count += monsters[3] * (5 + mod);
    }
    strings.write_int(out, pot_count);
}
