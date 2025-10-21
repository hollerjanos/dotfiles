let headerFiles = split(system('find include src -name "*.hpp"'), "\n")

e src/main.cpp

for headerFile in headerFiles
    if headerFile != ''
        execute "tabnew " . headerFile

        let sourceFile = "src/" . fnamemodify(headerFile, ":t:r") . ".cpp"

        if filereadable(sourceFile)
            execute "vsplit " . sourceFile
        endif
    endif
endfor

execute "tabfirst"

