class Game

    def initialize
        @key = secret_word
        @blanked_key = Array.new(@key.length, "_")
        @guesses = 12
        @guessed = []
    end

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

   
    # Figuring out logic to get letter from user and check if 
    # that letter is in the secret word, then display letter
    # position to the user.

    def user_guess
        puts "Guess a letter."
        guess = gets.chomp
        guess.downcase
     end

     #don't forget to write method to check validity of the guess
    def gameplay
        until over? do
            guess_feedback
            guess = user_guess
            @key.each_with_index do |letter, indx|
                if guess == letter
                    @blanked_key[indx] = guess
                    puts @blanked_key
                    puts "Good guess!"
                elsif guess != letter
                    @guessed << guess
                    @guesses -= 1
                    puts "Try again."
                    
                end
        end
    end

    def guess_feedback
        puts "Wrong letters guessed: #{@guessed}"
        puts "You have #{@guesses} guesses left."
        puts @blanked_key.join(" ")
    end

    def over? (user_guess)
        @blanked_key = @key
    end

    def end_game
        if over?
            puts "You guessed the word!"
            puts @key
        elsif @guesses.zero?
            puts "Out of guesses, game over :( "
            puts @key
    end


    puts "Hangman Game"

end