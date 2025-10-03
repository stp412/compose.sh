# compose.sh
bash script for using lilypad with a terminal editor, like nvim, in a window manager, like bspwm

### dependencies
- inotify-tools
- mupdf

das it i think


### installation
move script to a scripts folder and set an alias in your shell. something like:
```
alias compose='$HOME/scripts/compose.sh nvim $1'
```

### usage
`compose.sh *editor* *file.ly*`
opens your editor of choice (maybe, idk lol. it works with nvim) 
with the name of the file you put. should end with .ly. lilypond
will generate a new pdf everytime you save, kill mupdf then open
a new mupdf with the current pdf. mupdf closes on exiting editor.

### known issues
- spews scrap onto editor
