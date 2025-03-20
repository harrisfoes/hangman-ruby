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

def get_secret_word(valid_words)
  line_count = 0
  File.foreach("valid_words.txt") do |word| 
    valid_words << word
    line_count += 1 
  end

  valid_words[rand(line_count)]
end

unless File.exist?("valid_words.txt")
  get_valid_words_from_file()
end


#select random word from valid words
valid_words = []
tries = 1

secret_word = get_secret_word(valid_words).chomp

available_letters = {}
ATOZ.chars.each {| letter | available_letters[letter] = false}

#compare secret word with available letters
def display_letters(secret_word, available_letters)
  secret_word.chars.map {|letter| available_letters[letter] ?  "#{letter} " : "_ "}.join
end

def show_avail_letters(available_letters)
  letters = available_letters.map { |letter, already_guessed | "#{letter.upcase} " unless already_guessed }.join
end

def get_valid_character
  loop do
    puts "Pick a letter: "
    input = gets.chomp.strip.downcase

    return input if input.match(/^[a-z]$/i)

    puts "Invalid input! Please enter a single letter (A-Z)."
  end
end

game_won = false

until tries >= HANGMAN_PICS.length or game_won do

  puts HANGMAN_PICS[tries]
  puts "Guess the word:"
  puts display_letters(secret_word, available_letters)
  puts "Available letters: #{show_avail_letters(available_letters)}"

  #TODO: input validation 
  letter = get_valid_character()

  p "You entered #{letter}" 
  available_letters[letter] = true

  tries += 1 unless secret_word.include?(letter)

  game_won = secret_word.chars.all? {|letter| available_letters[letter] }

end

if game_won
  puts "You won!"
elsif
  puts "You lost!"
end

puts "The secret word is #{secret_word}"
