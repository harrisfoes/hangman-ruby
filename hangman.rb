require 'json'

class Hangman

  attr_accessor :tries, :secret_word, :available_letters, :is_game_won, :game_state;

  START = 1
  WON = 2
  QUIT = 3
  ATOZ = "abcdefghijklmnopqrstuvwxyz".freeze
  HANGMAN_PICS = ['
     +---+
         |
         |
         |
        ===', '
     +---+
     O   |
         |
         |
        ===', '
     +---+
     O   |
     |   |
         |
        ===','
     +---+
     O   |
    /|   |
         |
        ===','
     +---+
     O   |
    /|\  |
         |
        ===', '
     +---+
     O   |
    /|\  |
    /    |
        ===', '
     +---+
     O   |
    /|\  |
    / \  |
        ===']


  def initialize()

    @tries = 1
    @secret_word = get_secret_word().chomp
    @available_letters = {}
    ATOZ.chars.each {|letter| available_letters[letter] = false}
    @game_state = START
    @is_game_won = false
    
    #make a file of all valid words
    unless File.exist?("valid_words.txt")
      get_valid_words_from_file()
    end

  end


  #words section
  def get_valid_words_from_file()

    valid_words = []

    File.foreach("words.txt") do |line|
      if line.chomp.length.between?(5,12)
        valid_words << line.chomp
      end
    end

    File.open("valid_words.txt", "w") do |file|
      valid_words.each {|word| file.puts word}
    end

  end

  def get_secret_word()
    valid_words = []
    line_count = 0

    File.foreach("valid_words.txt") do |word| 
      valid_words << word
      line_count += 1 
    end

    valid_words[rand(line_count)]
  end

  #game section
  def show_avail_letters()
    letters = @available_letters.map { |letter, already_guessed| "#{letter.upcase} " unless already_guessed }.join
  end

  def display_letters()
    secret_word.chars.map {|letter| @available_letters[letter] ? "#{letter} " : "_ "}.join
  end

  def get_valid_character
    loop do
      puts "Pick a letter: "
      input = gets.chomp.strip.downcase

      if input == "quit"
        @game_state = QUIT
        return #exit the method entirely when quit is selected
      end

      return input if input.match(/^[a-z]$/i)

      puts "Invalid input! Please enter a single letter (A-Z)."
    end
  end

  def declare_result()
    if @is_game_won
      puts "You won!"
    elsif
      puts "You lost!"
    end

    puts "The secret word is #{@secret_word}"
  end

  def game_loop()
    if File.exist?("game_save.json")

      puts "You have an unfinished game, would you like to continue?"
      response = gets[0].downcase.chomp

      if response == "y"
        file_content = File.read("game_save.json")
        data = JSON.parse(file_content)

        @tries = data['tries']
        @available_letters = data['available_letters']
        @secret_word = data['secret_word']
        @is_game_won = false

      else
        File.delete("game_save.json")
        puts "Starting a new game..."
      end

    end

    until @tries >= HANGMAN_PICS.length or @is_game_won do
        puts HANGMAN_PICS[@tries]
        puts "Guess the word:"
        puts display_letters()
        puts "Available letters: #{show_avail_letters()}"
        puts "If you want to quit, just say so"

        letter = get_valid_character()
        
        if @game_state == QUIT
            puts "quitting game"

            data = {
              tries: @tries,
              available_letters: @available_letters,
              secret_word: @secret_word,
            }

            File.open("game_save.json", "w") { |f| f.write(data.to_json) }
            puts "game saved"
            return
        end
        
        p "You entered #{letter}" 
        @available_letters[letter] = true

        @tries += 1 unless @secret_word.include?(letter)

        @is_game_won = @secret_word.chars.all? {|letter| @available_letters[letter] }
    end

    declare_result()
    
    #game is done, if save file exists delete it
    if File.exist?("game_save.json")
      File.delete("game_save.json")
    end

  end

end

