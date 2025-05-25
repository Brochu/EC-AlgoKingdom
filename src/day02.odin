package main
import "core:c"
import "core:fmt"
import "core:slice"
import "core:strconv"
import "core:strings"
import rl "vendor:raylib"

separators :: " .,"

d2run :: proc (p1, p2, p3: ^strings.Builder) {
    lines := strings.split(P1_IN, "\n\n");
    words, text := strings.split(lines[0][6:], ","), lines[1];
    fmt.printfln("    [EC] words: %v", words);
    fmt.printfln("    [EC] text: %v", text);

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
    P1_IN :: "WORDS:THE,OWE,MES,ROD,HER\n\nAWAKEN THE POWER ADORNED WITH THE FLAMES BRIGHT IRE"
@(private="file")
    P2_IN :: "WORDS:THE,OWE,MES,ROD,HER,QAQ\n\nAWAKEN THE POWE ADORNED WITH THE FLAMES BRIGHT IRE"
@(private="file")
    P3_IN :: ""
} else {
@(private="file")
    P1_IN :: "WORDS:LOR,LL,SI,OR,DO,UT,LI\n\nLOREM IPSUM DOLOR SIT AMET, CONSECTETUR ADIPISCING ELIT, SED DO EIUSMOD TEMPOR INCIDIDUNT UT LABORE ET DOLORE MAGNA ALIQUA. UT ENIM AD MINIM VENIAM, QUIS NOSTRUD EXERCITATION ULLAMCO LABORIS NISI UT ALIQUIP EX EA COMMODO CONSEQUAT. DUIS AUTE IRURE DOLOR IN REPREHENDERIT IN VOLUPTATE VELIT ESSE CILLUM DOLORE EU FUGIAT NULLA PARIATUR. EXCEPTEUR SINT OCCAECAT CUPIDATAT NON PROIDENT, SUNT IN CULPA QUI OFFICIA DESERUNT MOLLIT ANIM ID EST LABORUM."
@(private="file")
    P2_IN :: ""
@(private="file")
    P3_IN :: ""
}
