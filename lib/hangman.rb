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
        puts @blanked_key.join(" ")
        puts "Guess a letter."
        guess = gets.chomp
        guess.downcase
     end

     #don't forget to write method to check validity of the guess
    def gameplay
        until over? do
            guess_feedback
            guess = user_guess
            if @key.include?(guess)
                enter_guess(guess)
            else
                @guessed << guess
                @guesses -= 1
                puts "Try again."
            end
            end_game
        end
    end

    def enter_guess(guess)
        @key.split('').each_with_index do |letter, indx|
            if guess == letter
                @blanked_key[indx] = guess
                puts @blanked_key.join(" ")
                puts "Good guess!" 
            end
        end
    end

    def valid_guess?(guess)
        guess.match(/[a-z]/) && guess.length == 1
    end

    def guess_feedback
        puts "Wrong letters guessed: #{@guessed}"
        puts "You have #{@guesses} guesses left."
    end

    def over?
        @key == @blanked_key || @guesses == 0
    end

    def end_game
        if @key == @blanked_key
            puts "You guessed the word!"
            puts @key
        elsif @guesses.zero?
            puts "Out of guesses, game over :( "
            puts @key
        end
    end
end

puts "Hangman Game"
puts "Let's play Hangman! Would you like to:"
puts "1) Start a new game"
puts "2) Quit Game?"
answer = gets.chomp
game = answer = "1" ? Game.new : "Goodbye!"
game.gameplay
    
    
