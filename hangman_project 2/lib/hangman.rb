class Hangman
  attr_reader :guess_word, :remaining_incorrect_guesses, :attempted_chars
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

 def already_attempted?(char)
  @attempted_chars.include?(char)
 end

 def get_matching_indices (char)
  indices =[]
  @secret_word.each_char.with_index {|letter, i| indices << i if letter == char}
  indices
  
 end
 def fill_indices(char,array)
  array.each{|index| @guess_word[index]= char}
 end

 def try_guess(char)
  
    if !self.already_attempted?(char)
      @attempted_chars << char
      array = self.get_matching_indices (char)
      @remaining_incorrect_guesses -= 1 if array.length ==0
      self.fill_indices(char,array)
      return true
    else
      puts "that has already been attempted"
      return false
    end
 
  end

  def ask_user_for_guess
    print "Enter a char: "
    char = gets.chomp
    self.try_guess(char)

  end

  def win?
    return false if @guess_word != @secret_word.split("")
    puts "YOU WIN"
    return true
  end

  def lose?
    return false if @remaining_incorrect_guesses != 0
    puts "YOU LOSE"
    return true
  end

  def game_over?
    if self.win? || self.lose?
      puts "The word was" + " " + @secret_word
      return true
    else
      return false
    end
  end
end
