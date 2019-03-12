import pynvim
import re

def splitCamel(text):
    words = []
    while text != "":
        match = re.search("(^[^A-Z]*)(([A-Z]|$).*$)", text)
        words.append(match.group(1))
        text = match.group(2).lower()
    return words

def joinCamel(words):
    if len(words) < 2:
        return words[0] if len(words)==1 else ""
    else:
        return words[0] + "".join(map(lambda x: x.title(), words[1:]))

def splitSnake(text):
    return text.split("_")

def joinSnake(words):
    return "_".join(words)

@pynvim.plugin
class Case(object):
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.function("_case_splitCamel", sync=True)
    def splitCamel(self, args):
        text = "".join(args)
        return splitCamel(text)

    @pynvim.function("_case_joinCamel", sync=True)
    def joinCamel(self, args):
        words = args[0]
        return joinCamel(words)

    @pynvim.function("_case_splitSnake", sync=True)
    def splitSnake(self, args):
        text = "".join(args)
        return splitSnake(text)

    @pynvim.function("_case_joinSnake", sync=True)
    def joinSnake(self, args):
        words = args[0]
        return joinSnake(words)

    @pynvim.function("_case_snakeToCamel")
    def snakeToCamel(self, args):
        selectType = args[0]
        start = self.nvim.call("getpos", "'[")
        end = self.nvim.call("getpos", "']")
        if start[1] == end[1]:
            line = self.nvim.current.buffer[start[1]-1]
            self.nvim.current.buffer[start[1]-1] = line[:start[2]-1] + joinCamel(splitSnake(line[start[2]-1:end[2]])) + line[end[2]:]
        else:
            lines = self.nvim.current.buffer.range(start[1], end[1])
            lines[0] = lines[0][:start[2]] + joinCamel(splitSnake(lines[0][start[2]:]))
            for i in range(1, len(lines)-1):
                lines[i] = joinCamel(splitSnake(lines[i]))
            lines[-1] = joinCamel(splitSnake(lines[-1][:end[2]])) + lines[-1][end[2]:]

