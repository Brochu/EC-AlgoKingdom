package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

@(private="file")
ivec :: struct {
    x: int,
    y: int,
};

d3run :: proc (p1, p2, p3: ^strings.Builder) {
    when EXAMPLE {
        P1_IN :: "../data/day03.ex.p1.txt"
        P2_IN :: "../data/day03.ex.p2.txt"
        P3_IN :: "../data/day03.ex.p3.txt"
    } else {
        P1_IN :: "../data/day03.p1.txt"
        P2_IN :: "../data/day03.p2.txt"
        P3_IN :: "../data/day03.p3.txt"
    }

    solve_p1(strings.trim(#load(P1_IN, string), "\n"), p1);
    solve_p2(strings.trim(#load(P2_IN, string), "\n"), p2);
    solve_p3(strings.trim(#load(P3_IN, string), "\n"), p3);
}

@(private="file")
solve_p1 :: proc(input: string, out: ^strings.Builder) {
    //fmt.printfln("%v", input);
    lines := strings.split(input, "\n");
    width, height := len(lines[0]), len(lines);
    grid := strings.join(lines, "");
    fmt.printfln("(%v x %v)", width, height);

    spots := make(map[ivec]u8);
    defer delete(spots);

    for y in 0..<height do for x in 0..<width {
        idx := (y * width) + x;
        if grid[idx] == '#' {
            spots[{x, y}] = 1;
        }
    }

    count := len(spots);
    for {
        updates := make([dynamic]ivec, 0, width*height);
        for t, val in spots {
            up, down, left, right := ivec {t.x, t.y-1}, ivec {t.x, t.y+1}, ivec{t.x-1, t.y}, ivec{t.x+1, t.y};
            /*
            fmt.printfln("[CHECK] %v = %v", t, val);
            fmt.printfln("%v = %v", up, spots[up]);
            fmt.printfln("%v = %v", down, spots[down]);
            fmt.printfln("%v = %v", left, spots[left]);
            fmt.printfln("%v = %v", right, spots[right]);
            fmt.println("==============");
            */
            if spots[up] == val && spots[down] == val && spots[left] == val && spots[right] == val {
                append(&updates, t);
            }
        }
        if len(updates) == 0 do break;
        count += len(updates);

        for u in updates {
            spots[u] += 1;
        }
    }
    strings.write_int(out, count);
}

@(private="file")
solve_p2 :: proc(input: string, out: ^strings.Builder) {
    //fmt.printfln("%v", input);
    lines := strings.split(input, "\n");
    width, height := len(lines[0]), len(lines);
    grid := strings.join(lines, "");
    fmt.printfln("(%v x %v)", width, height);

    spots := make(map[ivec]u8);
    defer delete(spots);

    for y in 0..<height do for x in 0..<width {
        idx := (y * width) + x;
        if grid[idx] == '#' {
            spots[{x, y}] = 1;
        }
    }

    count := len(spots);
    for {
        updates := make([dynamic]ivec, 0, width*height);
        for t, val in spots {
            up, down, left, right := ivec {t.x, t.y-1}, ivec {t.x, t.y+1}, ivec{t.x-1, t.y}, ivec{t.x+1, t.y};
            /*
            fmt.printfln("[CHECK] %v = %v", t, val);
            fmt.printfln("%v = %v", up, spots[up]);
            fmt.printfln("%v = %v", down, spots[down]);
            fmt.printfln("%v = %v", left, spots[left]);
            fmt.printfln("%v = %v", right, spots[right]);
            fmt.println("==============");
            */
            if spots[up] == val && spots[down] == val && spots[left] == val && spots[right] == val {
                append(&updates, t);
            }
        }
        if len(updates) == 0 do break;
        count += len(updates);

        for u in updates {
            spots[u] += 1;
        }
    }
    strings.write_int(out, count);
}

@(private="file")
solve_p3 :: proc(input: string, out: ^strings.Builder) {
    //fmt.printfln("%v", input);
    lines := strings.split(input, "\n");
    width, height := len(lines[0]), len(lines);
    grid := strings.join(lines, "");
    fmt.printfln("(%v x %v)", width, height);

    spots := make(map[ivec]u8);
    defer delete(spots);

    for y in 0..<height do for x in 0..<width {
        idx := (y * width) + x;
        if grid[idx] == '#' {
            spots[{x, y}] = 1;
        }
    }

    count := len(spots);
    for {
        updates := make([dynamic]ivec, 0, width*height);
        for t, val in spots {
            up, down, left, right := ivec {t.x, t.y-1}, ivec {t.x, t.y+1}, ivec{t.x-1, t.y}, ivec{t.x+1, t.y};
            ul, ur, dl, dr := ivec {t.x-1, t.y-1}, ivec {t.x+1, t.y-1}, ivec{t.x-1, t.y+1}, ivec{t.x+1, t.y+1};
            /*
            fmt.printfln("[CHECK] %v = %v", t, val);
            fmt.printfln("%v = %v", up, spots[up]);
            fmt.printfln("%v = %v", down, spots[down]);
            fmt.printfln("%v = %v", left, spots[left]);
            fmt.printfln("%v = %v", right, spots[right]);
            fmt.println("==============");
            */
            if spots[up] == val && spots[down] == val && spots[left] == val && spots[right] == val &&
            spots[ul] == val && spots[ur] == val && spots[dl] == val && spots[dr] == val {
                append(&updates, t);
            }
        }
        if len(updates) == 0 do break;
        count += len(updates);

        for u in updates {
            spots[u] += 1;
        }
    }
    strings.write_int(out, count);
}
