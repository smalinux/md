all:
	echo "hi"

push:
	git add .
	git commit -m "generated files on `date +'%Y-%m-%d'`";
	git push --force-with-lease

