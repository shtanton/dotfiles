from denite.source.directory_rec import Source as Rec

class Source(Rec):
    def __init__(self, vim):
        super().__init__(vim)
        self.name = "directory"
        self.kind = "my_directory"

    def on_init(self, context):
        if not self.vars["command"]:
            self.vars["command"] = ["fd", "-i", "-L", "-c", "never", "-t", "d", ""]
        super().on_init(context)

    def gather_candidates(self, context):
        candidates = super().gather_candidates(context)
        rootCandidate = {
            "word": "",
            "action__path": context["__directory"],
            "abbr": "/",
        }
        return [rootCandidate] + candidates
