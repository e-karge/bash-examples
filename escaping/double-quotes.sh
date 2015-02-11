#!/bin/bash

#!/bin/bash

print-first() {
  printf '%s\n' "$1"
}

quote-line() {
  printf "«%s»\n" "$1"
}

VAR1="the first parameter"
VAR2="the second parameter"

print-first "$VAR1" "$VAR2"

quote-line "backslash escapes \""
quote-line "backslash escapes \\"
quote-line "backslash escapes \$"
quote-line "wrapped \
text"
quote-line "backslash is literal otherwise \!"

quote-line "quoted
newline"
