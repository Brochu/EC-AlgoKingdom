package main

import "core:fmt"
import "core:mem"
import "core:mem/virtual"
import os "core:os/os2"
import "core:strconv"
import "core:strings"

EXAMPLE :: #config(EXAMPLE, false)

day_proc :: proc(p1, p2, p3: ^strings.Builder)
solutions: []day_proc = {
    d0run,
    d1run, d2run,
    //d1run, d2run, d3run, d4run, d5run,
    //d6run, d7run, d8run, d9run, d10run,
    //d11run, d12run, d13run, d14run, d15run,
    //d16run, d17run, d18run, d19run, d20run,
    //d21run, d22run, d23run, d24run, d25run,
};
title : strings.Builder;

main :: proc() {
    day, valid := which_day();
    if (!valid) {
        fmt.printfln("[EC-Algo] Solution for day %v is not implemented yet", day);
        os.exit(-1);
    }

    arena : virtual.Arena;
    palloc : mem.Allocator;
    assert(virtual.arena_init_growing(&arena) == virtual.Allocator_Error.None);
    palloc, context.allocator = context.allocator, virtual.arena_allocator(&arena);
    defer {
        context.allocator  = palloc;
        virtual.arena_free_all(&arena);
        virtual.arena_destroy(&arena);
    }

    title, _ = strings.builder_make(0, 128);
    defer strings.builder_destroy(&title);
    fmt.sbprintf(&title, "[EC-Algo] - Day %v", day);

    part1, _ := strings.builder_make(0, 256);
    part2, _ := strings.builder_make(0, 256);
    part3, _ := strings.builder_make(0, 256);
    defer strings.builder_destroy(&part1);
    defer strings.builder_destroy(&part2);
    defer strings.builder_destroy(&part3);

    solutions[day](&part1, &part2, &part3);
    fmt.printfln("[EC-Algo] Solving Day %v", day);
    fmt.printfln(" Part1 -> %v", strings.to_string(part1));
    fmt.printfln(" Part2 -> %v", strings.to_string(part2));
    fmt.printfln(" Part3 -> %v", strings.to_string(part3));
}

which_day :: proc() -> (int, bool) {
    fields : os.Process_Info_Fields;
    fields = { .Command_Line, .Command_Args };

    pinfo, _ := os.current_process_info(fields, context.allocator);
    defer os.free_process_info(pinfo, context.allocator);
    /*
    fmt.println("[EC-Algo] Process Info :");
    fmt.printfln(" - pid = %v", pinfo.pid);
    fmt.printfln(" - cmdargs = %v", pinfo.command_args);
    fmt.println("--------------------\n");
    */

    if (len(pinfo.command_args) < 2) {
        fmt.println("[EC-Algo] usage: ec-algo.exe <daynum>");
        os.exit(-1);
    }
    day := strconv.atoi(pinfo.command_args[1]);
    return day, ((day < len(solutions)) ? true : false);
}
