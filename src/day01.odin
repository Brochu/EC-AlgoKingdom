package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

d1run :: proc (p1, p2, p3: ^strings.Builder) {
    p1_input := strings.trim(#load(P1_IN, string), "\r\n");
    p2_input := strings.trim(#load(P2_IN, string), "\r\n");
    p3_input := strings.trim(#load(P3_IN, string), "\r\n");

    pot_count := 0;
    for r in p1_input {
        if r == 'A' {
        }
        else if r == 'B' {
            pot_count += 1;
        }
        else if r == 'C' {
            pot_count += 3;
        }
    }
    strings.write_int(p1, pot_count);

    pot_count = 0;
    for i in 0..<len(p2_input)/2 {
        group := p2_input[i*2:(i*2) + 2];
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
    strings.write_int(p2, pot_count);

    pot_count = 0;
    for i in 0..<len(p3_input)/3 {
        group := p3_input[i*3:(i*3) + 3];

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
    strings.write_int(p3, pot_count);

    /*
    rl.InitWindow(800, 600, strings.to_cstring(&title));
    rl.SetTargetFPS(60);
    for !rl.WindowShouldClose() {
        rl.BeginDrawing();
        rl.ClearBackground(rl.BLACK);

        rl.EndDrawing();
    }
    rl.CloseWindow();
    */
}

when EXAMPLE {
@(private="file")
    P1_IN :: "../data/day01.ex.p1.txt"
@(private="file")
    P2_IN :: "../data/day01.ex.p2.txt"
@(private="file")
    P3_IN :: "../data/day01.ex.p3.txt"
} else {
@(private="file")
    P1_IN :: "../data/day01.p1.txt"
@(private="file")
    P2_IN :: "../data/day01.p2.txt"
@(private="file")
    P3_IN :: "../data/day01.p3.txt"
}
