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
  puts "New game started!"
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
    valid_responses.each do |valid_response|
      if response.downcase == valid_response.downcase
        return response
      elsif response.downcase == "exit"
        puts "Thank you for playing!"
        exit!
      elsif response.downcase == "help"
        print_actions(get_file_contents)
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

welcome_player

