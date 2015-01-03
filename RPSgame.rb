#1. Choice between Rock Paper Scissors 
#2. paper > rock / scissor > paper rock > scissor
#3. Play again 



CHOICES = {'p' => 'Paper', 'r' => 'Rock', 's' => 'Scissors'}

puts "Lets play ROCK, PAPER, SCISSORS to the death. Or loser buys beer? How does that sound?"

def display_winning_message(winning_choice)
  case winning_choice
  when 'r'
    puts "Paper covers Rock"
  when 's'
    puts "Rock breaks Scissor"
  when 'p'
    puts "Scissors cut the paper"
  end
end

loop do 
  
  begin
    puts "Test your might:  r , p , s:"
    player1_choice = gets.chomp.downcase
  end until CHOICES.keys.include?(player1_choice)

  computer_choice = CHOICES.keys.sample


  #Tried to implement feature that prompted player to selected correct instrument. It prompts player even if they select correct item so I commented it out :/

  #if player1_choice != 'p' 
    #puts "Please choose ROCK (r) PAPER (p) or SCISSORS (s)!"
  #end

  if player1_choice == computer_choice
    puts "Its a Draw"
  elsif (player1_choice == 'p' && computer_choice == 's') || (player1_choice == 's' && computer_choice == 'r') || (player1_choice == 'r' && computer_choice == 'p')
    display_winning_message(player1_choice)
    puts "You lOSE!"
  else
    display_winning_message(computer_choice)
      puts "YOU WIN!"
  end

  puts "Play again (y/n)"
  break if gets.chomp.downcase != 'y'



end

puts "BYE!"


