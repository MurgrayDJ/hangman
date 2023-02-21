#Author: Murgray D. John
#Date created: 2/21/2023
#Purpose: To play a simple game of hangman against a computer


def create_dictionary
  dictionary = []
  all_words = File.readlines('google-10000-english-no-swears.txt')
  all_words.each do |word|
    if word.length > 5 && word.length < 12
      dictionary << word
    end
  end
  dictionary
end

def new_game
  dictionary = create_dictionary
  word_to_guess = dictionary.sample
  puts word_to_guess
end

new_game

