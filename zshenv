function list_sources() {
    find $1 -type d -exec find {} -maxdepth 1 -type f \( -name "*.h" -o -name "*.cpp" \) \; -exec echo \; | cat -s
}

function run-clang-format() {
    find $1 -type f \( -name "*.h" -o -name "*.hpp" -o -name "*.cpp" -o -name "*.m" -o -name "*.mm" \) -exec clang-format -i {} \;
}

