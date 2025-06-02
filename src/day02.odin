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
    when EXAMPLE {
        P1_IN :: "../data/day02.ex.p1.txt"
        P2_IN :: "../data/day02.ex.p2.txt"
        P3_IN :: "../data/day02.ex.p3.txt"
    } else {
        P1_IN :: "../data/day02.p1.txt"
        P2_IN :: "../data/day02.p2.txt"
        P3_IN :: "../data/day02.p3.txt"
    }

    solve_p1(strings.trim(#load(P1_IN, string), "\r\n"), p1);
    solve_p2(strings.trim(#load(P2_IN, string), "\r\n"), p2);
    solve_p3(strings.trim(#load(P3_IN, string), "\r\n"), p3);
}

@(private="file")
solve_p1 :: proc(input: string, out: ^strings.Builder) {
    lines := strings.split(input, "\r\n\r\n");
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

    strings.write_int(out, p1_count);
}

@(private="file")
solve_p2 :: proc(input: string, out: ^strings.Builder) {
    lines := strings.split(input, "\r\n\r\n");
    words_slice, text := strings.split(lines[0][6:], ","), lines[1];
    text, _ = strings.replace_all(text, "\r\n", "");

    words := slice.to_dynamic(words_slice);
    defer delete(words);
    for w in words_slice {
        rev := strings.reverse(w);
        append(&words, rev);
    }
    //fmt.printfln("words: `%v`", words);
    //fmt.printfln("text: `%v`", text);

    found := make(map[int]Phantom);
    defer delete(found);
    for i in 0..<len(text) do for w in words {
        size := len(w);
        if i+size <= len(text) && strings.compare(text[i:i+size], w) == 0 {
            for j in 0..<size {
                found[i+j] = {};
                //fmt.printfln("added index %v to found", i+j);
            }
        }
    }

    strings.write_int(out, len(found));
}

@(private="file")
solve_p3 :: proc(input: string, out: ^strings.Builder) {
    strings.write_string(out, "Upcoming...");
}
