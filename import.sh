function import() {
    [[ $VERBOSE ]] && echo "[Debug:$LINENO] Importing $1"
    local abs_import_filename=$( [[ ${1:0:1} == "/" ]] && echo "$1" || echo "$(pwd)/$1" )
    [[ $VERBOSE ]] && echo "[Debug:$LINENO] Absolute import file name: $abs_import_filename"
    IMPORT_DIR=$(cd $(dirname "$abs_import_filename") && pwd)

    IMPORT_FILE="$(basename "$abs_import_filename")"

    if [[ ! -f "$IMPORT_DIR/$IMPORT_FILE" ]]; then
        echo "[Error:$LINENO] file \"$IMPORT_DIR/$IMPORT_FILE\" not found"
        exit 1
    fi
    source "$IMPORT_DIR/$IMPORT_FILE"
}
