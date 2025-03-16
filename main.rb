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

HANGMAN_PICS.each { |pic| puts pic}

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

unless File.exist?("valid_words.txt")
  get_valid_words_from_file()
end

#select random word from valid words

line_count = 0
valid_words = []

File.foreach("valid_words.txt") do |word| 
  valid_words << word
  line_count += 1 
end

secret_word = valid_words[rand(line_count)]

puts "Secret word is: #{secret_word}"

