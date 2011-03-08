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

del_doc='A trash for the cli, a save rm '
del () {
    [ $# = 1 ] || { usage "del <file>"; }
    file="$1";  trash="$HOME/trash/$(date +"%S%M%H%m%d%y")"
    [ -f "$file" ] || [ -d "$file" ] ||  { die "Error: $file not exist."; }
    [ -d "$trash" ] || mkdir -p "$trash"
    mv "$file" "$trash"/
}

