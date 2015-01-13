#=======================
#BLACK JACK Game in Ruby
#=======================

def calculate_total(cards)
  arr = cards.map{|e| e[1] }

  total = 0 
  arr.each do |value|
    if value == "Ace"
      total == 11
    elsif value.to_i == 0 # Jack Queen or King
      total += 10
    else
      total += value.to_i
    end
  end

arr.select{|e| e == "Ace"}.count.times do
  if total > 21
    total -= 10 
  end
end
#if arr.include?("Ace") && total > 21
  #total -= 10 
  total
end

##GAME BEGINS##
puts "Welcom to BlackJack"

suits = ['Heart', 'Diamond', 'Spade', 'Club']
cards = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King','Ace']

deck = suits.product(cards)
deck.shuffle!

#Deal cards

player_cards = []
dealer_cards = []

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

dealer_total = calculate_total(dealer_cards)
player_total = calculate_total(player_cards)

#Display hands

puts "players cards are: #{player_cards[0]} and #{player_cards[1]}, for a total of #{player_total}" 
puts "dealers cards are: #{dealer_cards[0]} and #{dealer_cards[1]}, for a total of #{dealer_total}" 
puts "========================================="

#Player input#

if player_total == 21
  puts "==BLACKJACK YOU WIN==="
  exit
end
while player_total < 21
  puts "1) Hit OR 2) Stay"
  hit_or_stay = gets.chomp

  if !['1','2'].include?(hit_or_stay)
    puts "Error: Choose 1 or 2"
    next
  end

  if hit_or_stay == "2"
    puts "You stayed"
    break
  end

  new_card = deck.pop
  puts "Card dealt to player: #{new_card}"
  player_cards << new_card
  player_total = calculate_total(player_cards)
  puts "Player total is: #{player_total}"

  if player_total == 21
    puts "BLACKJACK!"
    exit 
  end
end

if dealer_total == 21
  puts "sorry, Dealer hit BLACKJACK!"
  exit
end

while dealer_total < 17
  new_card = deck.pop
  puts "New card dealt to dealer"
  dealer_cards << new_card
  dealer_total = calculate_total(dealer_cards)
  puts "Dealers total: #{dealer_total}"

  if dealer_total == 21
    puts "You lose. Dealer hit BLACKJACK."
    exit
  elsif dealer_total > 21
    puts " Dealer BUSTED, you win."
    exit
  end
      
end

puts "Dealers hand: "
dealer_cards.each do |cards|
  puts "=> #{cards}"
end

puts "=============="
puts "Your cards:"
mycards.each do |cards|
  puts "=> #{cards}"
end
puts "==============="

if dealer_total > player_total
  puts "Dealer wins."
elsif dealer_total < player_total
  puts "YOU WIN!"
else
  puts "Its a tie"
end
exit
    




