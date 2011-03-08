# sys cmds
# =======
#
#    by: ben, untar.org
#    in: bash, utils
#
set -u ; set -e

std=$CMDS_HOME/lib/std.sh
if [ -f $std ] ; then
    . $std
else
    echo "Couldn't load std libs $std"
    exit 1
fi




findi_doc='find alias'
findi (){
    [ $# = 2 ] || { usage "findi <dir> <pat>"; }
    dir="$1";  pat="$2"
    find "$dir" -iname "*$pat*"
}

grepi_doc='grep alias'
grepi (){
    [ $# = 2 ] || { usage "grepi <pat> <dir> "; }
    dir="$1"
    pat="$2"
    grep -lir "$pat" "$dir"
}


cleantrash_doc='rm all in ~/trash'
cleantrash () {
    rm -rf $HOME/trash/*
}

f_doc='a find alias'
f () { 
   [ $# = 0 ] || { usage "f(ind) [dir] <pat> "; }
   [ $# -gt 2 ] || { usage "f(ind) [dir] <pat> "; }
    mydir="$1"; 
    search="$2" || search="."
    find "$mydir" -iname "$search" ; 
}

mk_doc='a make alias'
mk () {
   [ $# = 1 ] || { usage "m(kdir) <dir> "; }
    mkdir "$1" && cd "$1"
}

foldersizes_doc='get folder size'
foldersizes () {
   [ $# = 1 ] || { usage "foldersizes <dir> "; }
    for file in "$1"/*; do if [ -d $file ]; then du -sh $file; fi; done ;
}

findmacexecutables_doc='find mac exec'
findmacexecutables () {
   [ $# = 1 ] || { usage "findmacexecutables <dir> "; }
    for file in "$1/"*; do if [ "`file $file | grep Mach`" ]; then echo $file ; fi ; done ;
}

xtar_doc='Extract a tar'
xtar () { 
   [ $# = 1 ] || { usage "xtar <dir> "; }
    FILE="$1"; 
    NAME=$(echo "$FILE" | sed 's/\.[a-z]*\.[a-z]*$//');
    tar xfvz $FILE; 
    cd $NAME/; 
}

maketar_doc='Create a tar'
maketar () {
   [ $# = 1 ] || { usage "maketar<dir> "; }
    DIR="$1"
    tar cfvz $DIR.tar.gz $DIR
}

renameext_doc='Rename file extension'
renameext () {
   [ $# = 2 ] || { usage "renameext <file> "; }
	old=$1;  new=$2
	for f in *.$old; do mv "$f" "`basename "$f" .$old`.$new"; done;
}

lsl_doc='ls alias'
lsl(){
   [ $# = 1 ] || { usage "lsl <dir> "; }
    ls -l  "$1" | awk '{ print $8 }'
}
