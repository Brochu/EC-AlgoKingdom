package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

@(private="file")
separators :: " .,";

@(private="file")
Phantom :: struct {};

d2run :: proc (p1, p2, p3: ^strings.Builder) {
    p1_input := strings.trim(#load(P1_IN, string), "\r\n");
    p2_input := strings.trim(#load(P2_IN, string), "\r\n");
    p3_input := strings.trim(#load(P3_IN, string), "\r\n");

    lines := strings.split(p1_input, "\r\n\r\n");
    words, text := strings.split(lines[0][6:], ","), lines[1];

    p1_count := 0;
    start, end := 0, 1;
    for start < len(text) {
        end = strings.index_any(text[start:], separators);
        if end == -1 {
            end = len(text)-start;
        }

        section := text[start:start+end];
        //fmt.printfln("    [EC] current: '%v'", section);
        for i in 0..<len(section)-1 do for w in words {
            if i+len(w) > len(section) do continue;
            check := section[i:i+len(w)];
            if strings.compare(check, w) == 0 {
                p1_count += 1;
            }
        }

        start = start+end+1
    }

    strings.write_int(p1, p1_count);
    fmt.println("    -------------------------");

    lines = strings.split(p2_input, "\r\n\r\n");
    words, text = strings.split(lines[0][6:], ","), lines[1];

    p2_count := 0
    found := make(map[int]Phantom);
    for i in 0..<len(text) do for w in words {
        if i+len(w) > len(text) do continue;
        check := text[i:i+len(w)];
        if strings.compare(check, w) == 0 {
            p2_count += 1;
            for j in 0..<len(w) {
                found[i + j] = {};
            }
        }
    }

    strings.write_int(p2, len(found));
    fmt.println("    -------------------------");

    strings.write_string(p3, "Upcoming...");

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
    P1_IN :: "../data/day02.ex.p1.txt"
@(private="file")
    P2_IN :: "../data/day02.ex.p2.txt"
@(private="file")
    P3_IN :: "../data/day02.ex.p3.txt"
} else {
@(private="file")
    P1_IN :: "../data/day02.p1.txt"
@(private="file")
    P2_IN :: "../data/day02.p2.txt"
@(private="file")
    P3_IN :: "../data/day02.p3.txt"
}
