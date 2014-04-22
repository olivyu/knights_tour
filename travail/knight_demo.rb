require_relative 'KnightsTour.rb'

my_board = KnightsTour::GameBoard.new
my_knight = KnightsTour::Knight.new

my_knight.knight_moves([2,1],[6,7])
my_knight.knight_moves([2,2],[6,6])
my_knight.knight_moves([0,0],[7,7])
my_knight.knight_moves([0,0],[3,3])