class Hangman

  attr_accessor :tries, :valid_words, :secret_word, :available_letters, :is_game_won;

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
    until @tries >= HANGMAN_PICS.length or @is_game_won do
        puts HANGMAN_PICS[@tries]
        puts "Guess the word:"
        puts display_letters()
        puts "Available letters: #{show_avail_letters()}"

        #TODO: input validation 
        letter = get_valid_character()

        p "You entered #{letter}" 
        @available_letters[letter] = true

        @tries += 1 unless secret_word.include?(letter)

        @is_game_won = secret_word.chars.all? {|letter| @available_letters[letter] }
    end

    declare_result()

  end

end

