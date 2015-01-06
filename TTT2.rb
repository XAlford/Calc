#Come up with the requirements/specifications, wich will determine the scope.
#Application logic: sequence of steps 
#Translation of those steps into code
#Run code to verify

#####DONT GO CRAZY WITH SUDO CODE########

#draw a board 

#assign player1 to 'X'
#assign computer to '0'


#loop until a winner or until all squares are taken
  #player 1 picks an empty square 
  #check for winner 
  #computer picks an empty square 
  #check for winner 

  #if there is a winner
  #  show winner
  #or else 
   # its a tie

def initialize_board
  b = {}
  (1..9).each {|position| b[position] = ' '}
  b
end


def draw_board(b)
  system 'clear'
  puts ""
  puts "EXTREME TICTACTOE!!!"
  puts "" 
  puts " #{b[1]}|#{b[2]} |#{b[3]} "
  puts "--+--+--"
  puts " #{b[4]}|#{b[5]} |#{b[6]} "
  puts "--+--+--"
  puts " #{b[7]}|#{b[8]} |#{b[9]}"
end

def empty_positions(b)
  b.select {|k, v| v == ' ' }.keys
end

def player_picks_square(b) 
  puts ""
  puts "Pick a square (1 - 9):"
  position = gets.chomp.to_i
  b[position] = 'X'
end

def computer_picks_square(b)
 position = empty_positions(b).sample
 b[position] = '0'
end

def check_winner(b)
  winnin_lines = [[1,4,7],[2,5,8],[3,6,9],[1,2,3],[4,5,6],[7,8,9],[1,5,9],[3,5,7]]
  winnin_lines.each do |line|
    if b[line[0]] == 'X' and  b[line[1]] == 'X' and  b[line[2]] == 'X'
      return 'Player'
    elsif b[line[0]] == '0' and  b[line[1]] == '0' and b[line[2]] == '0'
      return 'Computer'
    else
      return nil
    end
  end
end   



board = initialize_board
draw_board(board)




begin 
  player_picks_square(board)
  computer_picks_square(board)
  draw_board(board)
  winner = check_winner(board)
end until winner || empty_positions(board).empty?

if winner
  puts '#{winner} won!'
else
  puts "Its a freaking tie"
end






