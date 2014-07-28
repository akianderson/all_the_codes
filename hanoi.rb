class Hanoi
  attr_accessor :first_pile, :second_pile, :third_pile

  def initialize
    @first_pile = [9,8,7].shuffle
    @second_pile = [5,4,6].shuffle
    @third_pile = [1,3,2].shuffle
  end

  def play
    until stacked?
      puts "Please select a pile to pop a number off [first, second or third]: "
      from = get_valid_input
      puts "Please select a pile to put the number on [first, second or third]:"
      to = get_valid_input
      puts "You're trying to move to and from the same pile!" if from == to

      number = self.instance_variable_get(:"@#{from}_pile").pop
      self.instance_variable_get(:"@#{to}_pile").push(number)

      display
    end
    puts "Winning! Yay!!!! =^_^="
  end

  def stacked?
    sorted_stack = [1,2,3,4,5,6,7,8,9]
    self.first_pile == sorted_stack || self.second_pile == sorted_stack || self.third_pile == sorted_stack
  end

  def display
    largest = [@first_pile.size, @second_pile.size, @third_pile.size].sort!.last
    largest.downto(0) do |i|
      puts "#{@first_pile[i] || " "} #{@second_pile[i] || " "} #{@third_pile[i] || " "}\n"
    end
  end

  def get_valid_input
    input = gets.chop!

    until ['first', 'second', 'third', 'exit'].include? input
      puts "Please enter a valid option [first, second or third]: "
      input = gets.chop!
      input
    end
    abort('Exiting...') if input == 'exit'

    input
  end
end
