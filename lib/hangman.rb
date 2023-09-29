
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

# display
key_word = secret_word()
blanked_key_word = Array.new(key_word.length, "_")
puts blanked_key_word.join(" ")

puts "Hangman Game"
