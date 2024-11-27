package ncodin

import "core:c"
import "core:encoding/ansi"
import "core:log"
import sc "core:strconv"
import st "core:strings"
import "core:sys/linux"


foreign import lib "system:ncurses"

foreign lib {
	initscr :: proc() -> ^Window ---
	endwin :: proc() -> c.int ---


	// Color
	COLOR_PAIRS: c.int
	COLORS: c.int

	start_color :: proc() ---

	has_colors :: proc() -> c.bool ---
	can_change_color :: proc() -> c.bool ---

	init_pair :: proc(pair, f, b: c.short) -> c.int ---
	init_color :: proc(color, r, g, b: c.short) -> c.int ---
	init_extended_pair :: proc(pair, f, b: c.int) -> c.int ---
	init_extended_color :: proc(color, r, g, b: c.int) -> c.int ---

	color_content :: proc(color: c.short, r, g, b: ^c.short) -> c.int ---
	pair_content :: proc(pair: c.short, f, b: ^c.short) -> c.int ---
	extended_color_content :: proc(color: c.int, r, g, b: ^c.int) -> c.int ---
	extended_pair_content :: proc(pair: c.int, f, b: ^c.int) -> c.int ---
	reset_color_pairs :: proc() ---

	COLOR_PAIR :: proc(n: c.int) -> c.int ---
	PAIR_NUMBER :: proc(attr: c.int) ---

	// TODO!
	attr_get :: proc(attrs: ^attr_t, pair: ^c.short, opts: rawptr) -> c.int ---
	// TODO!
	wattr_get :: proc(win: ^Window, attrs: ^attr_t, pair: ^c.short, opts: rawptr) -> c.int ---
	// TODO!
	attr_set :: proc(attrs: attr_t, pair: c.short, opts: rawptr) -> c.int ---
	// TODO!
	attron :: proc(attrs: c.int) -> c.int ---
	// TODO!
	attroff :: proc(attrs: c.int) -> c.int ---
	// TODO!
	attrset :: proc(attrs: c.int) -> c.int ---


	printw :: proc(format: cstring, #c_vararg args: ..any) -> c.int ---
	wprintw :: proc(win: ^Window, format: ^cstring, #c_vararg args: ..any) -> c.int ---
	mvprintw :: proc(y, x: c.int, format: ^cstring, #c_vararg args: ..any) -> c.int ---
	mvwprintw :: proc(win: ^Window, y, x: c.int, format: ^cstring, #c_vararg args: ..any) -> c.int ---
	vw_printw :: proc(win: ^Window, format: ^cstring, vl: c.va_list) -> c.int ---


	scanw :: proc(format: cstring, #c_vararg args: ..any) -> c.int ---
	wscanw :: proc(win: ^Window, format: cstring, #c_vararg args: ..any) -> c.int ---
	mvscanw :: proc(y, x: c.int, format: cstring, #c_vararg args: ..any) -> c.int ---
	mvwscanw :: proc(win: ^Window, y, x: c.int, format: cstring, #c_vararg args: ..any) -> c.int ---
	vw_scanw :: proc(win: ^Window, format: cstring, vl: c.va_list) -> c.int ---


	move :: proc(y, x: c.int) -> c.int ---


	getch :: proc() -> c.int ---
	wgetch :: proc(win: ^Window) -> c.int ---
	mvgetch :: proc(y, x: c.int) -> c.int ---
	mvwgetch :: proc(win: ^Window, y, x: c.int) -> c.int ---
	ungetch :: proc(ch: c.int) -> c.int ---
	// Extension
	has_key :: proc(ch: c.int) -> c.int ---


	addstr :: proc(str: cstring) -> c.int ---
	addch :: proc(ch: c.char) -> c.int ---


	getstr :: proc(str: ^cstring) -> c.int ---
	getnstr :: proc(str: ^cstring, n: c.int) -> c.int ---
	wgetstr :: proc(win: ^Window, str: ^cstring) -> c.int ---
	wgetnstr :: proc(win: ^Window, str: ^cstring, n: c.int) -> c.int ---

	mvgetstr :: proc(y, x: c.int, str: ^cstring) -> c.int ---
	mvwgetstr :: proc(win: ^Window, y, x: c.int, str: ^cstring) -> c.int ---
	mvgetnstr :: proc(y, x: c.int, str: ^cstring, n: c.int) -> c.int ---
	mvwgetnstr :: proc(win: ^Window, y, x: c.int, str: ^cstring, n: c.int) -> c.int ---


	refresh :: proc() -> c.int ---
	napms :: proc(ms: c.int) -> c.int ---
}

main :: proc() {
	context.logger = log.create_console_logger()
	init()
	defer end()
	{

		refresh()
		getch()
	}

}
