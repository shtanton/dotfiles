from denite.kind.directory import Kind as Dir

class Kind(Dir):
    def __init__(self, vim):
        super().__init__(vim)
        self.name = "my_directory"
        self.default_action = "narrow"

    def action_touch(self, context):
        target = context["targets"][0]
        path = target["action__path"]
        self.vim.funcs.inputsave()
        filename = self.vim.funcs.input("Enter new filename: {0}/".format(path))
        self.vim.funcs.inputrestore()
        self.vim.call("denite#util#execute_path", "edit", "{0}/{1}".format(path, filename))
