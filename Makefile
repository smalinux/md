all:
	echo "hi"

push:
	echo "compile_commands*" > .gitignore
	git add .
	git commit -m "generated files on `date +'%Y-%m-%d'`";
	git push --force-with-lease

