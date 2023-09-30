
# Takes file and sorts out words that are 5-12 characters long
# Chooses a random word from the array of selected words
def secret_word
    contents = File.open('google-10000-english-no-swears.txt', 'r')
    content_array = contents.readlines.map(&:chomp)
    selected_words = []
        content_array.each do |word|
            if word.length >= 5 && word.length <= 12
                selected_words.push(word)
            end
        contents.close
        end
    selected_words.sample
end 

# Takes random word and blanks out letters
# Displays _ _ _ _ to the user
def display_secret_word(key)
    blanked_key_word = Array.new(key.length, "_")
    puts blanked_key_word.join(" ")
end

# Figuring out logic to get letter from user and check if 
# that letter is in the secret word, then display letter
# position to the user.
key_word = secret_word()
puts blanked_word = display_secret_word(key_word)



def guess_check(key, blank)
    puts "Guess a letter"
    answer = gets.chomp

    array_key_word = key.split("")
    # array_blanked_key_word = blank.split("")

    array_key_word.each_with_index do |letter, indx|
        indx_data = {}
        if answer.downcase == letter
            indx_data[indx] = letter
        end
        indx_data
    end
end
puts guess_check(key_word, blanked_word)
puts "Hangman Game"
