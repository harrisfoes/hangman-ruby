class Hangman

  attr_accessor :tries, :valid_words, :secret_word, :available_letters;

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
    

    #make a file of all valid words
    unless File.exist?("valid_words.txt")
      get_valid_words_from_file()
    end

  end

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

end

hm = Hangman.new
p hm.tries
p hm.secret_word
p hm.available_letters
