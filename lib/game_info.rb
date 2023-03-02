class GameInfo
  attr_accessor :guesses
  attr_accessor :errors
  attr_accessor :word_to_guess
  attr_accessor :guess_so_far

  def initialize(word_to_guess)
    @guesses = ""
    @errors = 0
    @word_to_guess = word_to_guess
    @guess_so_far = Array.new(word_to_guess.length - 1) {"_"}
  end
end