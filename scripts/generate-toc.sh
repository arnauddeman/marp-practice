#!  /bin/bash
SCRIPT_DIR=`dirname $0`
TOC_TAG="avenirs-toc"
PRES_DIR=$SCRIPT_DIR/../docs
BUILD_DIR=./docs
TARGET_FILE=$SCRIPT_DIR/../README.md
TMP_FILE=$SCRIPT_DIR/../toc.txt
SLOT='<!-- {{TOC}} -->'
template='
<div class="presentation"><a href="__HREF__" target="_blank"><span class="pres-date">__DATE__</span> - __TITLE__</a></div>
'
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
[ -f $TARGET_FILE ] ||  err "File not found: $TARGET_FILE"
[ -r $TARGET_FILE ] ||  err "File not readable: $TARGET_FILE"
[ -w $TARGET_FILE ] ||  err "File not writable: $TARGET_FILE"

echo -ne "">$TMP_FILE || err "Unable to reset tmp file: $TMP_FILE"

toc=""
for f in $PRES_DIR/*.md
do 
    log "file: $f"
    bname=`basename $f .md`
    href=$BUILD_DIR/$bname.html
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
        entry=`echo $template  | sed s#__HREF__#"$href"# | sed s#__DATE__#"$date"# | sed s#__TITLE__#"$title"#`
        log "entry $entry"
        echo "$entry" >> $TMP_FILE || err "Unable to write into $TMP_FILE"
        toc="$toc$entry\n"
    else
        log "Ignored file (invalid file name): $f"
    fi
done

sed -i -e "/TOC/r $TMP_FILE" $TARGET_FILE
echo "----"
ls -R 
echo "----"
echo "tmp file $TMP_FILE:"
cat $TMP_FILE
echo "----"
echo "----"
echo "Target file $TARGET_FILE:"
cat $TARGET_FILE
echo "----"

log "done";