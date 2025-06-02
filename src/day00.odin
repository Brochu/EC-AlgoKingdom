package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"

d0run :: proc (p1, p2, p3: ^strings.Builder) {
    when EXAMPLE {
        P1_IN :: ""
        P2_IN :: ""
        P3_IN :: ""
    } else {
        P1_IN :: ""
        P2_IN :: ""
        P3_IN :: ""
    }

    solve_p1(P1_IN, p1);
    solve_p2(P2_IN, p2);
    solve_p3(P3_IN, p3);
}

@(private="file")
solve_p1 :: proc(input: string, out: ^strings.Builder) {
    strings.write_string(out, "Upcoming...");
}

@(private="file")
solve_p2 :: proc(input: string, out: ^strings.Builder) {
    strings.write_string(out, "Upcoming...");
}

@(private="file")
solve_p3 :: proc(input: string, out: ^strings.Builder) {
    strings.write_string(out, "Upcoming...");
}
