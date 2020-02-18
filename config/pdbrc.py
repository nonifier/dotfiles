import pygments
from pygments import formatters
import readline
import pdb

class Config(pdb.DefaultConfig):
    highlight = True
    use_pygments = True
    #stdin_paste = 'epaste'
    #filename_color = pdb.Color.lightgray

    def __init__(self):
        self.use_terminal256formatter = False
        self.formatter = formatters.TerminalTrueColorFormatter(style="monokai")

        return 

        #try:
        #    from pygments.formatters import terminal
        #except ImportError:
        #    pass
        #else:
        #    self.colorscheme = terminal.TERMINAL_COLORS.copy()
        #    self.colorscheme.update({
        #        terminal.Keyword:            ('darkred',     'red'),
        #        terminal.Number:             ('darkyellow',  'yellow'),
        #        terminal.String:             ('brown',       'green'),
        #        terminal.Name.Function:      ('darkgreen',   'blue'),
        #        })

    def setup(self, pdb):
        # make 'l' an alias to 'longlist'
        Pdb = pdb.__class__
        #Pdb.do_l = Pdb.do_longlist
        Pdb.do_st = Pdb.do_sticky

