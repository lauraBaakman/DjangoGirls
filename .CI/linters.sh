#!/bin/sh

GLOBALPASS=true

RED='\033[1;31m'
GREEN='\033[0;32m'
NC='\033[0m'

ROOT=".."

function print_local_results {
	if $1; then
		printf "${GREEN}$2 linters succeed.${NC}\n"
	else
		printf "${RED}$2 linters failed.\n${NC}"	
	fi	
}

function lint_python {
	LOCALPASS=false
	if 
		find . -name "*.py" -exec pyflakes {} \; | grep ":"; 
	then 
		LOCALPASS=false
		GLOBALPASS=false;  
	fi

	if 
		find . -name "*.py" -exec pep8 {} \; | grep ":"; 
	then 
		LOCALPASS=false
		GLOBALPASS=false;  
	fi	

	print_local_results $LOCALPASS "Python"
}


function lint_html {
	echo "HTML";
}

function lint_js {
	echo "Javascript";
}

function lint_css {
	echo "CSS";
}



cd $ROOT
lint_python
# lint_html
# lint_js
# lint_css

if $GLOBALPASS ; then
	echo "succes"; 
else
	echo "failure";
fi