all: README.md

README.md: guessinggame.sh
	echo "# Welcome to the guessing game!" > README.md
	echo "the last time makefile was run: $$(date)" >> README.md
	echo "the number of code lines in guessgnggame.sh: $$(wc -l guessinggame.sh | egrep -o "[0-9]+")" >> README.md

clean:
	rm README.md
