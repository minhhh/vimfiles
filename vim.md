# SHORTCUTS

### Open save files

    :wq<Return>         - Quit vi, writing out modified file to file named in original invocation
    :q<Return>          - Quit (or exit) vi
    :q!<Return>         - Quit vi even though latest changes have not been saved for this vi call
    :e filename         - Open a new file. You can use the Tab key
    :w or <F2>          - Save file. Custom mapping
    :w newfile<Return>  - Write current contents to a new file named newfile
    :Explore            - Open file explorer
    :r filename<Return> - Read file named filename and insert after current line

### Basic Moving around

    0                                - To line beginning
    -                                - Custom map To line End
    e                                - Move forward a word
    b                                - Move backward a word
    :0<Return> or 1G or gg           - Move cursor to first line in file
    :n<Return> or nG                 - Move cursor to line n
    :$<Return> or G                  - Move cursor to last line in file
    %%^f%% or Shift Down or PageDown - Move forward one screen
    %%^b%% or Shift Up or PageUp     - Move backward one screen
    A                                - Move to the end of the line and append text
    I                                - Move to the beginning of the line and append text
    o                                - In visual mode, go to the other end of the marked area

### Advanced Moving around

    %      - Jump to matching parenthesis/bracket/brace, or language block if language module loaded
    {      - Move to the last blank line
    }      - Move to the next blank line
    t<c>   - Move till and including character
    f<c>   - Move Till character
    ''     - Move to last cursor position
    go     - Preview a file. Works with quickfix and NERDTree

### Switch between modes

    C-U or Esc - Switch to normal mode
    i          - Insert text before cursor, until <Esc> hit
    a          - Append text after the cursor
    s          - Delete character under cursor and switch to insert mode

### Basic Editing text

    x          - Delete single character under cursor
    C-w or db  - Delete word backward
    de         - Delete word forward
    diw        - Delete word under cursor
    D          - delete the remainder of the line, starting with current cursor position
    C          - delete the remainder of the line, starting with current cursor position and go to insert mode
    d0         - deletes from current cursor position to the beginning of the line.
    dd         - delete entire current line
    S          - delete entire current line and go to insert mode
    Ndd or dNd - delete N lines, beginning with the current line;
    o          - open and put text in a new line below current line, until <Esc> hit
    O          - open and put text in a new line above current line, until <Esc> hit
    J          - Join lines

### Advanced Editing text

    C-a-l - Remove trailing spaces (Custom mapping)
    C-a-b - Replace tabs by spaces (Custom mapping)
    v=    - Format the code block
    S'    - In visual mode, surround the selected text with quotes.
    gq    - Wrap a visual selection

From plugin commentary

    \\\ - Comment line

Sort a list of lines

    :sort - Select several lines in visual mode then run this
    :!sort - Sort with external command

    C-a C-x    - Increase/Decrease number under cursor

### Undo/Redo changes

    .   - Repeat the last command that modified the file.
    u   - Undo
    C-r - Redo.

### Copy and paste

    yy  - copy (yank, cut) the current line into the buffer
    p   - put (paste) the line(s) in the buffer into the text after the current line
    P   - Put characters before the cursor. Put lines above the current line.
    "ay - Yank using a register
    "ap - Paste using a register

### Select
    v  - Start highlighting characters. Use the normal movement keys and commands to select text for highlighting.
    gv - recontentselect last visual block
    V  - Start highlighting lines.
    ~  - change the case of characters.
    >  - Shift the selected block to the right one shift width
    <  - Shift the selected block to the left one shift width
    << - Shifts the current line to the left by one shift width.
    >> - Shifts the current line to the right by one shift width.

### Quick select

    viw - Select inside word
    vi" - Select inside "
    vi' - Select inside '
    vi( - Select inside (
    vi{ - Select inside {
    vip - Select paragraph
    vaw - Select around word
    va" - Select around "
    va' - Select around '
    va( - Select around (
    va{ - Select around {
    vt( - Select TILL (
    vf( - select including (
    viB - Select inside block
    vaB - Select around block
    >iB - Indent inside block
    >aB - Indent around block

### Quick Indent


### Align with Vim easy align
Supposed you map the trigger key to `<Enter>`

    <Enter><space>    Alignment around 1st whitespaces                            : '<,'>EasyAlign\
    <Enter>2<space>   Alignment around 2nd whitespaces                            : '<,'>EasyAlign2\
    <Enter>-<space>   Alignment around the last whitespaces                       : '<,'>EasyAlign-\
    <Enter>-2<space>  Alignment around the 2nd to last whitespaces                : '<,'>EasyAlign-2\
    <Enter>:          Alignment around 1st colon (key: value)                     :'<,'>EasyAlign:
    <Enter><Right>:   Alignment around 1st colon (key : value)                    :'<,'>EasyAlign:s0l1
    <Enter>=          Alignment around 1st operators with =                       : '<,'>EasyAlign=
    <Enter>2=         Alignment around 2nd operators with =: '<,'>EasyAlign2=
    <Enter>3=         Alignment around 3rd operators with =                       : '<,'>EasyAlign3=
    <Enter>*=         Alignment around all operators with =                       : '<,'>EasyAlign*=
    <Enter>**=        Left-right alternating alignment around all = operators     : '<,'>EasyAlign**=
    <Enter><Enter>=   Right alignment around 1st equals signs                     : '<,'>EasyAlign!=
    <Enter><Enter>**= Right-left alternating alignment around all = operators     : '<,'>EasyAlign!**=

### Search and replace

    /string        - search forward for occurrence of string in text
    n              - move to next occurrence of search string
    N              - move to next occurrence of search string in opposite direction
    :%s/foo/bar/gi - The same as above, but ignore the case of the pattern you want to substitute. This replaces foo, FOO, Foo, and so on.
    :%s/foo/bar/gc - Confirm every substitution.
    *              - Search for word under cursor bounded
    g*             - Search for word under cursor bounded

### Search for selected text
Select text in visual mode, then copy it with %%y%%.
Then switch to search, and paste the copied word with %%C-R 0%%

    C - r - Quickly replace selected words (Custom mapping)

Using custom command `Qargs`, we can replace accross files like so

    First run your search command , such as using :ack
    :Qargs
    :argdo %s/findme/replaceme/gc | update

### Search for text in all files
Use `:vimgrep /search_pattern/gj ./**/*.*%%`

Then navigate your search result with these command

    :cw       - Open the quickfix window
    :cn       - Go to next result
    :cp       - Go to the previous result
    C-W Enter - Open the search in new window

Another faster way is to use `ack`. First install `ack` using your favorite package manager

    # on Mac
    brew install ack

Then run `ack` on command line like this

    ack -Q --smart-case SEARCHTERM

### Macros

    q followed by a character a-Z - Start a marcro
    q                             - Stop recording
    @@                            - Repeat last marcro
    @ followed by a character a-Z - Play a macro

### Windows

    C-w s   - Split windows
    C-w v   - Split windows vertically
    C-w C-w - jump from one window to another
    C-w c   - Close window
    C-w -   - maximise currencontentt window ^W make all windows equal size

### Tabs

    :tabnew - New tab
    :tabp   - Previous tab
    :tabn   - Next tab tab

### Execute external command

    :! - Execute a shell. If a is specified, the program which is executed using ! uses the specified line(s) as standard input, and will replace those lines with the standard output of the program executed. "!!" executes a program using the current line as input. For example, "!4jsort" will take five lines from the current cursor position and execute sort. After typing the command, there will be a single exclamation point where you can type the command in.
    :r !ls - Print the current directory content
    :r !command - Add the output of the external command
    :{range}!command - Replace the selection with the output of the external command.
    :%!tidy -qicbn -asxhtml - Tidy up the whole file HTML (provided that tidy is already installed)

### Marks

    ' followed by a character a-Z - Go to the line beginning of a mark
    `.                            - Last modified position
    m followed by a character a-Z - Set a mark


### Using help

    :set all - See all settings


# TIPS
https://twitter.com/vimtips

http://www.moolenaar.net/habits.html

