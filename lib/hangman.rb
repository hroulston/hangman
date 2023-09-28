#Consider doing a for each method on the file and pulling the method
#out and calling it within for each method.
contents = File.open('google-10000-english-no-swears.txt')
def word_count_six_to_eleven(words)
    selected_words = []
    array_words = words.split("/n")
    array_words.each do |word|
        if word.length >= 5 && word.length <= 12
            selected_words.push(word)
        end
    end
    selected_words
end   

puts "Hangman Game"
puts "#{word_count_six_to_eleven(contents)}"
