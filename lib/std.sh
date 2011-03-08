# std lib
# =============================
#
#    by: ben, untar.org
#    in: bash, utils
#
set -u ; set -e

die (){ echo >&2 "$@"; exit 1; }

usage(){ die "Usage - $1"; }


