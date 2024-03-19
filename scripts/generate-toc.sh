#!  /bin/bash
SCRIPT_DIR=`dirname $0`
TOC_TAG="avenirs-toc"
PRES_DIR=$SCRIPT_DIR/../docs
LOG_FLAG=0

[ "$1" == "-v" -o "$1" = "--verbose" ] && LOG_FLAG=1


log() {
    [ "$LOG_FLAG" = "1" ] && echo "$*"
}

function err(){
 >&2 echo "ERROR - $*";
  exit 1
}

log "PRES_DIR $PRES_DIR"

[ -d $PRES_DIR ] ||  err "Directory not found: $PRES_DIR"
[ -r $PRES_DIR ] ||  err "Directory not readable: $PRES_DIR"


for f in $PRES_DIR/*.md
do 
    log "file: $f"
    bname=`basename $f .md`
    log "bname $bname"
    valid="${bname//[^-]}"

    if [ -n "$valid" ]
    then
        date=`echo $bname | cut -f 1-3 -d "-"`
        def_title=`echo $bname | cut -f 4- -d "-" | sed 's/_/ /g'`
        log "Date: $date"
        log "Default title: $def_title"
        title=`cat $f | grep "$TOC_TAG"`
        [ -z "$title" ] && title=$def_title || title=`echo $title | cut -f 2 -d ":" | sed 's/^[ \t]*//' `

        log "Title: \"$title\""
        log 
    else
        log "Ignored file (invalid file name): $f"
    fi
done

log "done";