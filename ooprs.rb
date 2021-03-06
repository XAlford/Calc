# RPS is a 2 player game. Each player picks ONE of THREE instruments, "ROCK", "PAPER", & "SCISSORS". The two instruments are compared and it is either determined a tie or a winner.
class Hand
  include Comparable
  attr_reader :value

  def initialize(v)
    @value = v
end

def <=>(another_hand)
  if @value == another_hand.value
    0
  elsif (@value =='p' && another_hand.value == 'r') || (@value == 'r' && another_hand.value == 's') || (@value == 's' && another_hand.value == 'p')
    1
  else
    -1
  end
end

class Player 
  attr_accessor :choice
  attr_reader :name
  
  def initialize(n)
    @name = n
  end

  def to_s
    "#{name} currently has a choice of #{self.hand.value}!"
  end
end
    
class Human < Player
  def pick_hand
    begin
      puts "Pick: (p, r, s):"
      c = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(c)

    self.hand = Hand.new(c)
  end
end

class Computer < Player 
  def pick_hand
    self.hand = Hand.new(Game::CHOICES.keys.sample)
end

class Game
  CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

  attr_reader :player, :computer 

  def initialize
    @player = Human.new("Bob")
    @computer = Computer.new("T2000")
  end

  def compare_hands
    if player.hand == computer.hand 
      puts "It's a tie"
    elsif player.hand > computer.hand
      puts "#{player.name} won!"
    else 
      puts "#{computer.name} won!"
    end
  end

  def play
    player.pick_hand
    computer.pick_hand
    compare_hands

    puts player 
    puts computer
  end
end
end
game = Game.new.play
end






