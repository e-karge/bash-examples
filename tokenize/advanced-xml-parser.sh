#!/bin/bash

initParser () {
    unset ENTITY _TAG _TEXT
}

parseNext () {
    if [ ${_TEXT+set} ]; then
        ENTITY="$_TEXT"
        unset _TEXT TAGNAME ATTRIBUTES OPENING CLOSING
    elif [ ${_TAG+set} ]; then
        ENTITY="<$_TAG>"
        if [ "/" == "${_TAG::1}" ]; then
            unset XML_PATH[${#XML_PATH[@]}-1];
        elif [ "/" != "${_TAG: -1}" ]; then
            XML_PATH[${#XML_PATH[@]}]=${_TAG%% *};
        fi
        parseTag
        unset _TAG
    else
        local IFS="<"
        read -rd ">" _TEXT _TAG && parseNext
    fi
}

parseTag() {
    if [ "/" == "${ENTITY:1:1}" ]; then
        OPENING=false;
        CLOSING=true;
    elif [ "/" == "${ENTITY: -2:1}" ]; then
        OPENING=true;
        CLOSING=true;
    else
        OPENING=true
        CLOSING=false
    fi

    TAGNAME="${ENTITY:1:-1}"
    TAGNAME="${TAGNAME%% *}"
    TAGNAME="${TAGNAME//'/'}"

    declare -gA ATTRIBUTES
    local VALUE NAME IFS==
    set -- $ENTITY
    while (( $# > 1 )); do
        NAME=${1##* }
        VALUE="${2% *}"
        VALUE="${VALUE%[\'\"]*}"
        VALUE="${VALUE#*[\'\"]}"
        ATTRIBUTES[$NAME]="$VALUE"
        shift
    done
}

printPath() {
    local IFS="/"
    printf '»» %s ««\n' "${XML_PATH[*]}"
}

printEntity() {
    printf '«%s»\n' "$ENTITY${TAGNAME:+:${OPENING//true/opening}:${CLOSING//true/closing}:[${!ATTRIBUTES[@]}]}"
}

initParser
while parseNext; do
  printEntity
  printPath
done <simple.xml
