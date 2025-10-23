" Finds all the files inside the project what ends with ".hpp" extension.
let headerFiles = split(system('find include src -name "*.hpp"'), "\n")

" Opens the main.cpp file.
e src/main.cpp

" Loop through all the header files.
for headerFile in headerFiles
    if headerFile != ''
        " Opens the header file into a new buffer if it exists.
        execute "tabnew " . headerFile

        " Changes "include" to "src" inside the path.
        let sourceFile = substitute(headerFile, '^include/', 'src/', '')

        " Removes the file's extension & replaces it with ".cpp".
        let sourceFile = fnamemodify(sourceFile, ':r') . '.cpp'

        " Opens the source file via vsplit if it exists.
        if filereadable(sourceFile)
            execute "vsplit " . sourceFile
        endif
    endif
endfor

" Changes the current buffer for the first one.
execute "tabfirst"

