import pynvim

class Window(object):
    def __init__(self, small, big):
        self.small = small
        self.big = big

class Windows(object):
    def __init__(self):
        self.windows = []

    def append(self, small, big):
        self.windows.append(Window(small, big))

    def pop(self, window):
        found = False
        windowIndex = -1
        while not found and windowIndex < len(self.windows)-1:
            windowIndex += 1
            if self.windows[windowIndex].big == window:
                found = True
        if not found:
            return None
        else:
            return self.windows.pop(windowIndex).small

@pynvim.plugin
class Focus(object):
    def __init__(self, nvim):
        self.nvim = nvim
        self.windows = Windows()

    @pynvim.function("_focus_focus", sync=True)
    def focus(self, args):
        current = self.nvim.current.window
        buffer = current.buffer
        self.nvim.command("tabnew")
        window = self.nvim.current.window
        self.nvim.api.win_set_buf(window, buffer)
        self.windows.append(current, window)

    @pynvim.function("_focus_unfocus", sync=True)
    def unfocus(self, args):
        current = self.nvim.current.window
        orig = self.windows.pop(current)
        if orig==None:
            return "Not in a focused window"
        else:
            self.nvim.command("tabc")
            self.nvim.api.set_current_win(orig)

    @pynvim.function("_focus_toggle", sync=True)
    def toggle(self, args):
        current = self.nvim.current.window
        maybeOrig = self.windows.pop(current)
        if maybeOrig==None:
            self.focus(args)
        else:
            self.nvim.command("tabc")
            self.nvim.api.set_current_win(maybeOrig)
