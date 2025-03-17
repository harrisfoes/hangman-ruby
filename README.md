# hangman-ruby


## Download the google-10000-english-no-swears.txt dictionary file from the first20hours GitHub repository google-10000-english.

## When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.

## You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses they have before the game ends. You should also display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.

## Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.

## Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects.

## When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!





[x] save file
[x] steal / create ascii hangman graphic
[x] read from file, then select a random word that has 5 to 12 characters long
    [x] read from file
    [x] create separate file with 5-12 words
    [x] select random word from valid words
[ ] hangman game - guesses and etc
    [ ] show the current hangman graphic based on tries allowed
        [ ] tries start at zero and increment every try
    [ ] show the letters available for selection
    [ ] show the secret word
        [ ] unguessed letters will be blank
        [ ] guessed letters will be shown
    [ ] ask for input
        [ ] allow only valid letters
    [ ] if word not yet guessed and out of tries, end game -- lose
    [ ] if word guessed, end game - win

[ ] save file implementation
    [ ] put an option where player can quit and save
    [ ] when game starts and save file exists, ask if they want to continue
    [ ] if they don't want to continue, delete save file:
    [ ] find the relevant variables to store
    [ ] find an appropriate structire
    [ ] write to save file
    [ ] read to save file

