#!/bin/bash

printf "%s\n" "`
    echo \"a \`
        echo \\\"quoting \\\`
             echo \\\\\"nightmare\\\\\"
        \\\`\\\"
    \`\"
`"

printf "%s\n" "$(
    echo "quoting $(
        echo "like a $(
             echo "dream"
        )"
    )"
)"
