function replace() {
    find . -type f  \
         -exec grep -q "$1" {} \; \
         -exec vim -c "%s/$1/$2/gc" -c 'wq' {} \;
}


