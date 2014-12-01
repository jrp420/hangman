def draw_man(wrongs)
  if wrongs == 0
      puts "__________________
     |           
     |           
     |
     |
     |
     |
     -----------------"
  elsif wrongs == 1
      puts "__________________
     |           |
     |           @
     |
     |
     |
     |
     -----------------"
  elsif wrongs == 2
      puts "__________________
     |           |
     |           @
     |          /
     |
     |
     |
     -----------------"
  elsif wrongs == 3
     puts "__________________
     |           |
     |           @
     |          /|
     |
     |
     |
     -----------------"
  elsif wrongs == 4
     puts "__________________
     |           |
     |           @
     |          /|\
     |
     |
     |
     -----------------"
  elsif wrongs == 5
      puts "__________________
     |           |
     |           @
     |          /|\
     |           |
     |
     |
     -----------------"
  elsif wrongs == 6
      puts "__________________
     |           |
     |           @
     |          /|\
     |           |
     |          /
     |
     -----------------"
  elsif wrongs == 7
      puts "__________________
     |           |
     |           @
     |          /|\
     |           |
     |          / \
     |
     -----------------"
  end
end


def check_letter(word_played, letter)
  letters = word_played.split("")
  positions = []
  letters.each_with_index do |letter_guess, i|
    if letter == letter_guess
      positions.push(i)
    end
  end
  puts positions
end


def display_result(word_played, letters_array)
  letter_loctn = {}
  letters_array.each do |letter|
    word_played.length.times do |wrd|
      if word_played.slice(wrd).downcase == letter.downcase
        letter_loctn[wrd] = true
      end
    end
  end
  word_array = word_played.split("")
  word_array.length.times do |d|
    if letter_loctn[d] == nil
      word_array[d] = "_"
    end
  end
  puts "Letters guessed:"
  puts letters_array.join(","), "\n"
  puts word_array.join(" ")

end

f = File.new("words.rb" ,"r")
words = f.readlines
word_played = words.sample
f.close

body_parts = 0
letter_guesses = []

draw_man(body_parts)
display_result(word_played, letter_guesses)
puts "Welcome to the Hangman Game. The object of the game is to guess all of the letters in a word. If your guess is wrong, a body part will be added to the hangman. Once the hangman is all drawn, the game is over. Good luck!"
puts "Guess?" 
num_letters = 0

while(true)
  letter = gets.chomp
  guessed = false
  letter_guesses.each do |guess|
     if guess == letter
        puts "You already guessed this letter"
        guessed = true
     end
  end
  if guessed
     next
  end
  letter_guesses.push(letter)
  if check_letter(word_played, letter).empty?
    draw_man(body_parts += 1)
    display_result(word_played, letter_guesses)
    puts "Your guess was incorrect"
  else
    num_letters += check_letter(word_played, letter).length
    draw_man(body_parts)
    display_result(word_played, letter_guesses)
    puts "Your guess was correct"
  end

  if num_letters == word_played.length
    puts "You win!"
    break
  elsif parts == 7
    puts "Game over!"
    break
  end
end

