alias ll='ls -larth '
alias grep='grep --color'
alias textedit='open -a TextEdit'
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages
#pysearch(){
#	find ./ -name '*.py' | xargs grep --color $1
#}
#alias pysearch=pysearch
alias rbsearch="find ./ -name '*.rb' | xargs grep -n --color=always " 
alias pysearch="find ./ -name '*.py' | xargs grep -n --color=always " 
alias cppsearch="find ./ -name '*.cpp' | xargs grep -n --color=always " 
alias jssearch="find ./ -name '*.js' | xargs grep -n --color=always " 
alias coffeesearch="find ./ -name '*.coffee' | xargs grep -n --color=always " 
alias htmlsearch="find ./ -name '*.html' | xargs grep -n --color=always 2>/dev/null" 
alias diffmerge="/Applications/DiffMerge.app/Contents/MacOS/diffmerge"
alias refind="find ./ -regex "
export NODE_PATH=/usr/local/lib/node_modules
alias search_leetcode="find ~/code/leetcode -type f -name "
#export VIRTUALENV_PYTHON="/usr/local/bin/python"
alias diffmore="colordiff -y -s -w -B"
# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
# alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
alias vi="set_pythonpath;/Applications/MacVim.app/Contents/MacOS/Vim"

function set_pythonpath(){
    if [ ! -z $VIRTUAL_ENV ]; then
        for d in `ls -1 $VIRTUAL_ENV/lib/`; do
            if [[ $PYTHONPATH != *"$VIRTUAL_ENV/lib/$d/site-packages"* ]]; then
                PYTHONPATH=$VIRTUAL_ENV/lib/$d/site-packages/:$PYTHONPATH;
            fi;
        done;
    fi;
}

function push_cpp(){
    #[ -f *.cpp ] && git add *.cpp || [ -f *.c ] && git add *.c || [ -f *.h ] && git add *.h;
    for d in `find ./ -type d -d 1 | grep -v '.git' | grep -v 'a.o'`;do
        if ls $d/*.cpp >/dev/null 2>&1 ; then git add $d/*.cpp; fi;
        if ls $d/*.py >/dev/null 2>&1 ; then git add $d/*.py; fi;
        if ls $d/*.h >/dev/null 2>&1 ; then git add $d/*.h; fi;
    done;
    git add *.cpp;
    git commit -m "`git status -s`";
    git push;
}
function geeksforgeeks_push(){
    orig_dir=`pwd`;
    cd ~/code/geeksforgeeks;
    push_cpp;
	cd $orig_dir;
}
function random_coding_push(){
    orig_dir=`pwd`;
    cd ~/code/random_coding_puzzles;
    push_cpp;
	cd $orig_dir;
}
function leetcode_push(){
    orig_dir=`pwd`;
    cd ~/code/leetcode;
    push_cpp;
    cd $orig_dir;
}
function lintcode_push(){
    orig_dir=`pwd`;
    cd ~/code/lintcode;
    push_cpp;
    cd $orig_dir;
}
function oj_push(){
    orig_dir=`pwd`;
    cd ~/code/oj;
    push_cpp;
	cd $orig_dir;
}
function acm_cheet_sheet_push(){
    orig_dir=`pwd`;
    cd ~/code/acm_cheet_sheet;
    push_cpp;
	cd $orig_dir;
}
function cc150_push(){
    orig_dir=`pwd`;
    cd ~/code/cc150;
    push_cpp;
	cd $orig_dir;
}
function cpp(){
  if [ -f ./lib.cpp ]; then
    g++ -g $1 lib.cpp -o $2 -std=c++11 -pthread ;
  else
    g++ -g $1 -o $2 -std=c++11 -pthread ;
  fi
}
function findpyclass(){
    vi `pysearch 'class "$1"(' | awk 'BEGIN { FS=":" } ; { print $1 }'`;
}
function remove_words(){
    sed -i '' "s/$1//g" $2; 
}

# New MCL
# Uses mcls alias to get into mcls folder and svn update
# then uses date to create a new MCL file with the correct format.
# My vim skeleton will set up the file content with a nice outline.
newmcl () {
    if [ $1 ] ; then
        cd ~/linkedin/doc/tools/mcl;
        mclname=`date "+%Y-%m-%d-$1.txt"`
        vi $mclname
        [ -f $mclname ] && svn add $mclname
    else
        echo 'Usage: newmcl <mcl-name>'
    fi
}

