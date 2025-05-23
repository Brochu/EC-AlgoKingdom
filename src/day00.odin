package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

d0run :: proc (p1, p2, p3: ^strings.Builder) {
    fmt.println(P1_IN);

    strings.write_string(p1, "Upcoming...");
    strings.write_string(p2, "Upcoming...");
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
    P1_IN :: ""
@(private="file")
    P2_IN :: ""
@(private="file")
    P3_IN :: ""
} else {
@(private="file")
    P1_IN :: ""
@(private="file")
    P2_IN :: ""
@(private="file")
    P3_IN :: ""
}
