# Setup the build paths
PICOC_PATH=./
TCC_PATH=../tinycc
SOURCE=$PICOC_PATH/src
OUTPUT=$PICOC_PATH/build

# Setup the build options
INCLUDE="-I.
  -I$TCC_PATH/include
"

LIBRARY_PATHS="-L.
  -L$OUTPUT
  -L$TCC_PATH
  -L/usr/local/lib
"

LIBRARY="
  $LIBRARY_PATHS
"

OPTIONS="-Wall -pedantic -g -DUNIX_HOST -DVER=\"2.1\" -DPERSOPORT $INCLUDE"

# Build the project files
# COMPILER=gcc
COMPILER=$TCC_PATH/tcc
$COMPILER -v

$COMPILER $OPTIONS -c $SOURCE/picoc.c -o $OUTPUT/picoc.o
$COMPILER $OPTIONS -c $SOURCE/table.c -o $OUTPUT/table.o
$COMPILER $OPTIONS -c $SOURCE/lex.c -o $OUTPUT/lex.o
$COMPILER $OPTIONS -c $SOURCE/parse.c -o $OUTPUT/parse.o
$COMPILER $OPTIONS -c $SOURCE/expression.c -o $OUTPUT/expression.o
$COMPILER $OPTIONS -c $SOURCE/heap.c -o $OUTPUT/heap.o
$COMPILER $OPTIONS -c $SOURCE/type.c -o $OUTPUT/type.o
$COMPILER $OPTIONS -c $SOURCE/variable.c -o $OUTPUT/variable.o
$COMPILER $OPTIONS -c $SOURCE/clibrary.c -o $OUTPUT/clibrary.o
$COMPILER $OPTIONS -c $SOURCE/platform.c -o $OUTPUT/platform.o
$COMPILER $OPTIONS -c $SOURCE/include.c -o $OUTPUT/include.o
$COMPILER $OPTIONS -c $SOURCE/debug.c -o $OUTPUT/debug.o
$COMPILER $OPTIONS -c $SOURCE/platform/platform_unix.c -o $OUTPUT/platform/platform_unix.o
$COMPILER $OPTIONS -c $SOURCE/platform/library_unix.c -o $OUTPUT/platform/library_unix.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/stdio.c -o $OUTPUT/cstdlib/stdio.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/math.c -o $OUTPUT/cstdlib/math.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/string.c -o $OUTPUT/cstdlib/string.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/stdlib.c -o $OUTPUT/cstdlib/stdlib.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/time.c -o $OUTPUT/cstdlib/time.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/errno.c -o $OUTPUT/cstdlib/errno.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/ctype.c -o $OUTPUT/cstdlib/ctype.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/stdbool.c -o $OUTPUT/cstdlib/stdbool.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/main.c -o $OUTPUT/cstdlib2/main.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/types.c -o $OUTPUT/cstdlib2/types.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/stat.c -o $OUTPUT/cstdlib2/stat.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/dirent.c -o $OUTPUT/cstdlib2/dirent.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/popen.c -o $OUTPUT/cstdlib2/popen.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/tools_h.c -o $OUTPUT/cstdlib2/tools_h.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/various.c -o $OUTPUT/cstdlib2/various.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/regex.c -o $OUTPUT/cstdlib2/regex.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib2/socket.c -o $OUTPUT/cstdlib2/socket.o
$COMPILER $OPTIONS -c $SOURCE/cstdlib/unistd.c -o $OUTPUT/cstdlib/unistd.o

# Build the app
OPTIONS="$OPTIONS $LIBRARY"

$COMPILER $OPTIONS -o picoc \
  $OUTPUT/picoc.o $OUTPUT/table.o $OUTPUT/lex.o $OUTPUT/parse.o \
  $OUTPUT/expression.o $OUTPUT/heap.o $OUTPUT/type.o $OUTPUT/variable.o \
  $OUTPUT/clibrary.o $OUTPUT/platform.o $OUTPUT/include.o $OUTPUT/debug.o \
  $OUTPUT/platform/platform_unix.o $OUTPUT/platform/library_unix.o \
  $OUTPUT/cstdlib/stdio.o $OUTPUT/cstdlib/math.o $OUTPUT/cstdlib/string.o \
  $OUTPUT/cstdlib/stdlib.o $OUTPUT/cstdlib/time.o $OUTPUT/cstdlib/errno.o \
  $OUTPUT/cstdlib/ctype.o $OUTPUT/cstdlib/stdbool.o $OUTPUT/cstdlib2/main.o \
  $OUTPUT/cstdlib2/types.o $OUTPUT/cstdlib2/stat.o $OUTPUT/cstdlib2/dirent.o \
  $OUTPUT/cstdlib2/popen.o $OUTPUT/cstdlib2/tools_h.o $OUTPUT/cstdlib2/various.o \
  $OUTPUT/cstdlib2/regex.o $OUTPUT/cstdlib2/socket.o $OUTPUT/cstdlib/unistd.o \
  -lm -lreadline
