
def word_count_six_to_eleven(words)
end   


contents = File.open('google-10000-english-no-swears.txt', 'r')
content_array = contents.readlines.map(&:chomp)
selected_words = []
content_array.each do |word|
    if word.length >= 5 && word.length <= 12
        selected_words.push(word)
    end
contents.close
puts selected_words
end
puts "Hangman Game"
