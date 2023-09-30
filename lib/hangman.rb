
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
blanked_word = display_secret_word(key_word)



if blanked_word != key_word
        puts blanked_word
        puts "Guess a letter."
        answer = gets.chomp
        answer.downcase

        array_key_word = key_word.split("")
        array_blanked_key_word = blanked_word.split("")
        indx_data = {}

        array_key_word.each_with_index do |letter, indx|
            indx_data = {}
            if  answer == letter
                indx_data[indx] = letter
            end
        end

        indx_data.each do |key, value|
            array_blanked_key_word[key] = value
            blanked_word = array_blanked_key_word.join("")
            puts blanked_word
        end
end

puts "Hangman Game"
