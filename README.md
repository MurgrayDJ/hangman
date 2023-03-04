# hangman
A simple command line Hangman game

![hangman_screenshot](https://user-images.githubusercontent.com/36339824/222865920-8aadf2f2-183f-4617-ab26-0b3a7b695ac7.png)

## How to Play
This is displayed when a game is started:
> You have to correctly guess all of the letters in the word.
> 
> If you make 7 mistakes, you lose!
> 
> Type save at any time to save the game and exit.
> 
> Type 'exit' at any time to leave without saving.
> 
> Type 'help' at any time to repeat this message.

## Features
- Displays progress through word, errors so far, and guesses made so far at the start of each round
- Validates all input except for user entering their name at beginning
- Allows user to save games and reopen them later

## Future Improvements
- Prevent user from saving games that are finished
- Add a hangman drawing after each round
- Split functions between multiple classes 
- Make number of errors based on number of letters in word
