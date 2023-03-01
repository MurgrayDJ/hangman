class GameInfo
  attr_accessor :guesses
  attr_accessor :errors
  attr_accessor :word_to_guess

  def initialize(word_to_guess)
    @guesses = ""
    @errors = 0
    @word_to_guess = word_to_guess
  end
end