def add_bindings(config):
	config.bind("<Alt-q>", "tab-close")
	#     _ _            _   _               _
	#  __| (_)_ _ ___ __| |_(_)___ _ _  __ _| |___
	# / _` | | '_/ -_) _|  _| / _ \ ' \/ _` | (_-<
	# \__,_|_|_| \___\__|\__|_\___/_||_\__,_|_/__/
	#

	config.bind('<Alt-w>', 'scroll up', mode='insert')
	config.bind('<Alt-s>', 'scroll down', mode='insert')
	config.bind('<Alt-a>', 'scroll left', mode='insert')
	config.bind('<Alt-d>', 'scroll right', mode='insert')

	config.bind('<Alt-w>', 'completion-item-focus --history prev', mode='command')
	config.bind('<Alt-s>', 'completion-item-focus --history next', mode='command')
	config.bind('<Alt-e>', ' selection-follow', mode='command')

	STEP = 120  # pixels per tick
	config.bind("<w>", f"scroll-px 0 -{STEP}")
	config.bind("<s>", f"scroll-px 0 {STEP}")
	config.bind("<a>", f"scroll-px -{STEP} 0")
	config.bind("<d>", f"scroll-px {STEP} 0")

	config.bind('<Alt-w>', 'scroll up')
	config.bind('<Alt-s>', 'scroll down')
	config.bind('<Alt-a>', 'scroll left')
	config.bind('<Alt-d>', 'scroll right')

	config.bind('<Alt-z>', 'back')
	config.bind('<Alt-SHIFT-z>', 'forward')

	config.bind("<Alt-x>", "fake-key <Backspace>", mode='insert')
	config.bind("<Alt-x>", "fake-key <Backspace>")

	config.bind("<Alt-Space>", "spawn --detach xdotool click 1")

	config.bind("<Tab>", "tab-next")
	config.bind("<Shift-Tab>", "tab-prev")

	config.bind("<Alt-r>", "reload")

	for i in range(1, 10):
		config.bind(f"<Alt-{i}>", f"tab-focus {i}")

	config.bind('<SHIFT-w>', 'mode-enter insert')
	config.bind('<SHIFT-s>', 'mode-enter insert')
	config.bind("<Alt-z>", "mode-leave", mode='insert')

	config.bind("f", "hint all", mode="normal")
	config.bind("f", "mode-leave", mode="hint")

	config.unbind('i')
	config.unbind('l')
	config.unbind('k')
	config.unbind('j')
	config.unbind('h')
	config.unbind('gf')
	config.unbind("r")
	config.unbind('<Escape>')
	config.unbind('/')
	config.bind('<Menu>', 'nop', mode='insert')

	config.bind('F', 'hint all tab')

	config.bind('qz', 'zoom-in')
	config.bind('qZ', 'zoom-out')


