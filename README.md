# hangman-ruby


```sh
Download the google-10000-english-no-swears.txt dictionary file from the first20hours GitHub repository google-10000-english.

When a new game is started, your script should load in the dictionary and randomly select a word between 5 and 12 characters long for the secret word.

You don’t need to draw an actual stick figure (though you can if you want to!), but do display some sort of count so the player knows how many more incorrect guesses they have before the game ends. You should also display which correct letters have already been chosen (and their position in the word, e.g. _ r o g r a _ _ i n g) and which incorrect letters have already been chosen.

Every turn, allow the player to make a guess of a letter. It should be case insensitive. Update the display to reflect whether the letter was correct or incorrect. If out of guesses, the player should lose.

Now implement the functionality where, at the start of any turn, instead of making a guess the player should also have the option to save the game. Remember what you learned about serializing objects.

When the program first loads, add in an option that allows you to open one of your saved games, which should jump you exactly back to where you were when you saved. Play on!
```




```ruby
[x] save file
[x] steal / create ascii hangman graphic
[x] read from file, then select a random word that has 5 to 12 characters long
    [x] read from file
    [x] create separate file with 5-12 words
    [x] select random word from valid words
[x] hangman game - guesses and etc
    [x] show the current hangman graphic based on tries allowed
        [x] tries start at zero and increment every try
    [x] show the letters available for selection
    [x] show the secret word
        [x] unguessed letters will be blank
        [x] guessed letters will be shown
    [x] ask for input
        [x] allow only valid letters
        [x] if not a letter - error
    [x] if word not yet guessed and out of tries, end game -- lose
    [x] if word guessed, end game - win

[x] refactor to class before doing file implementation
    why? makes it easier to handle save and load functionality
    [x] create class
    [x] file segment
        [x] on initiate, create word collection
        [x] accessible attributes - tbd

[ ] save file implementation
    [x] put an option where player can quit and save
        [x] when player inputs 'quit' during the word input part, save to a file and quit
    [ ] when game starts and save file exists, ask if they want to continue
        [ ] if continue populate from file and resume operation
        [ ] if they don't want to continue, delete save file:
    misc
        [x] find the relevant variables to store
        [x] find an appropriate structire
        [x] write to save file
        [ ] read to save file
```
