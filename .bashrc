alias ll='ls -larth '
alias grep='grep --color'
alias textedit='open -a TextEdit'
export PYTHONPATH=$PYTHONPATH:/Library/Python/2.7/site-packages
#pysearch(){
#	find ./ -name '*.py' | xargs grep --color $1
#}
#alias pysearch=pysearch
alias pysearch="find ./ -name '*.py' | xargs grep -n --color=always " 
alias jssearch="find ./ -name '*.js' | xargs grep -n --color=always " 
alias coffeesearch="find ./ -name '*.coffee' | xargs grep -n --color=always " 
alias htmlsearch="find ./ -name '*.html' | xargs grep -n --color=always " 
alias refind="find ./ -regex "
export NODE_PATH=/usr/local/lib/node_modules
alias diffmerge="diffmerge 2>/dev/null"
function push_cpp(){
    #[ -f *.cpp ] && git add *.cpp || [ -f *.c ] && git add *.c || [ -f *.h ] && git add *.h;
    git add *.cpp;
    git add *.c;
    git add *.h;
    git commit -m "`git status -s`";
    git push;
}
function geeksforgeeks_push(){
    orig_dir=`pwd`;
    cd ~/code/geeksforgeeks;
    push_cpp;
	cd $orig_dir;
}
function leetcode_push(){
    orig_dir=`pwd`;
    cd ~/code/leetcode;
    push_cpp;
	cd $orig_dir;
}
function cpp(){
  g++ -g $1 -o $2 -std=c++11 -pthread ;
}

