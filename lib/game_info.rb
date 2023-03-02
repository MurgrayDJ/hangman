class GameInfo
  attr_accessor :letters_guessed
  attr_accessor :errors
  attr_accessor :word_to_guess
  attr_accessor :guess_so_far
  attr_accessor :valid_letters

  def initialize(word_to_guess)
    @letters_guessed = ""
    @errors = 0
    @word_to_guess = word_to_guess
    @valid_letters = ("a".."z").to_a
    @guess_so_far = Array.new(word_to_guess.length - 1) {"_"}
  end
end