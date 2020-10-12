all: README.md

README.md: guessinggame.sh
	echo "# Welcome to the guessing game!\n" > README.md
	echo "the last time makefile was run: $$(date)\n" >> README.md
	echo "the number of code lines in guessgnggame.sh: $$(wc -l guessinggame.sh | egrep -o "[0-9]+")\n" >> README.md

clean:
	rm README.md
