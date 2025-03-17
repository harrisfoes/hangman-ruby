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
tries = 0

secret_word = get_secret_word(valid_words)

puts "Secret word is: #{secret_word}"


until tries > HANGMAN_PICS.length do
  #display secret word
  puts HANGMAN_PICS[tries]
  puts "Pick a letter: "
  letter = gets.chomp
  p "You entered #{letter}"
  tries +=1
end

