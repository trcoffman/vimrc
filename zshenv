function list_sources() {
    find $1 -type d -exec find {} -maxdepth 1 -type f \( \
        -name "*.h" \
        -o -name "*.cpp" \
        -o -name "*.hpp" \
        -o -name "*.m" \
        -o -name "*.mm" \
        -o -name "*.irpc" \
        -o -name "*.proto" \
        -o -name "*.c" \
        -o -name "*.ifrpc" \
        -o -name "*.coil" \
        -o -name "*.rc" \
        -o -name "*.idl" \
        -o -name "*.xib" \
        -o -name "*.manifest" \
        -o -name "*.ico" \
        -o -name "*.bmp" \
    \) \; -exec echo \; | cat -s
}


function run-clang-format() {
    find $1 -type f \( -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" \) -exec clang-format -i {} \;
}

