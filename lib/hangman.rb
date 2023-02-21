
dictionary = []

def create_dictionary(dictionary)
  all_words = File.readlines('google-10000-english-no-swears.txt')
  all_words.each do |word|
    if word.length > 5 && word.length < 12
      dictionary << word
    end
  end
end

create_dictionary(dictionary)

puts dictionary