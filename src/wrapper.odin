package ncodin

import st "core:strings"

init :: proc() -> ^Window {
	return initscr()
}

end :: proc() {
	endwin()
}
