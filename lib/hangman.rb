#Author: Murgray D. John
#Date created: 2/21/2023
#Purpose: To play a simple game of hangman against a computer
require_relative 'game_info.rb'

class Hangman

  def initialize
    welcome_player
  end

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

  def game_over?
    puts
    if @@game_file.errors == 7
      print_progress
      puts "It looks like you're out of guesses!"
      puts "The answer was: #{@@game_file.word_to_guess}"
      true
    elsif  @@game_file.guess_so_far.none?("_")
      print_progress
      puts "You guessed the word correctly! Great work!"
      true
    else
      false
    end
  end

  def play_game
    show_rules
    puts "\nLet's get started!"
    while(!game_over?)
      play_round
    end
    puts "Thanks for playing! :D"
  end

  def print_progress
    puts
    print "Word so far: #{@@game_file.guess_so_far.join(' ')} "
    print "Errors: #{@@game_file.errors}/7 "
    print "Letters guessed: #{@@game_file.letters_guessed} "
    puts
  end

  def get_valid_guess
    guess_prompt = "Make a guess: "
    valid_guesses = @@game_file.valid_letters
    valid_guess = get_valid_data(guess_prompt, nil, valid_guesses)
  end

  def update_game_file(valid_guess, is_right, indices)
    @@game_file.letters_guessed << valid_guess
    @@game_file.valid_letters.delete(valid_guess)
    if is_right
      indices.each do |index|
        @@game_file.guess_so_far[index] = valid_guess
      end
    else
      @@game_file.errors += 1
    end
  end

  def find_indices(word_to_guess, valid_guess)
    indices = (0..word_to_guess.size).select { |i| word_to_guess[i] == valid_guess}
  end

  def check_if_right(valid_guess)
    indices = find_indices(@@game_file.word_to_guess, valid_guess)
    if indices.empty?
      puts "Oops maybe next time!"
      update_game_file(valid_guess, false, indices)
    else
      puts "Good guess!"
      update_game_file(valid_guess, true, indices)
    end
  end

  def play_round
    print_progress
    valid_guess = get_valid_guess
    check_if_right(valid_guess)
  end

  def show_rules
    puts "\nHow to play: "
    puts "You have to correctly guess all of the letters in the word."
    puts "If you make 7 mistakes, you lose!"
    puts "Type 'exit' at any time to leave."
    puts "Type 'help' at any time to repeat this message.\n\n"
  end

  def new_game
    dictionary = create_dictionary
    word_to_guess = dictionary.sample
    @@game_file = GameInfo.new(word_to_guess)
    puts "New game started!"
    puts "\nWord to guess: #{word_to_guess}"
    play_game
  end

  def saved_or_new_game(choice)
    puts
    if choice == "1"
      new_game
    else
      puts "This functionality has not been implemented yet!"
    end
  end

  def get_valid_data(prompt, response, valid_responses) 
    if response.nil?
      print prompt
      response = gets.chomp
    else
      response = response.downcase
      valid_responses.each do |valid_response|
        if response == valid_response
          return response
        elsif response == "exit"
          puts "Thank you for playing!"
          exit!
        elsif response == "help"
          show_rules
          break
        end
      end
      response = nil
    end
    response = get_valid_data(prompt, response, valid_responses)  
  end

  def welcome_player
    puts "Hi and welcome to Hangman!"
    print "What's your name?: "
    player_name = gets.chomp
    puts "\nHi #{player_name}!"
    puts "Would you like to: "
    puts "   1. Start a new game"
    puts "            OR"
    puts "   2. Open a saved game"
    action_prompt = "Please enter 1 or 2 for an action: "
    action_choices = %w(1 2)
    choice = get_valid_data(action_prompt, nil, action_choices)
    saved_or_new_game(choice)
  end
end

Hangman.new

