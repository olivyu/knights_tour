module KnightsTour
  class GameBoard
  
    attr_accessor :spots
    
    def initialize
      @spots = []
      for y in (0...8)
        for x in (0...8)
          @spots << [x,y]
        end
      end
    end
  end
  
  class Node
    attr_accessor :position, :possibilities, :previous #has pointer to previous

    def initialize(position, previous)
      @position = position
      @possibilities = all_possible_moves(position)
      @previous = previous
    end
    
    def all_possible_moves(pos) #defines all the possible moves for knight
      moves = [[pos[0]+1,pos[1]+2], [pos[0]+1,pos[1]-2],
               [pos[0]-1,pos[1]+2], [pos[0]-1,pos[1]-2],
               [pos[0]+2,pos[1]+1], [pos[0]+2,pos[1]-1],
               [pos[0]-2,pos[1]+1], [pos[0]-2,pos[1]-1]]
      result = []
      for move in moves #determines whether knight is capable of moving there
        result<<move if GameBoard.new.spots.include?(move)
      end
      result
    end

  end
  
  
  class Knight
    
    def knight_moves(pos1,pos2) 
      ans = compute(pos1,pos2)
      ans = output(ans)<<pos2
      puts "You made it in #{ans.count} steps!"
      puts ans.to_s
      puts ""
    end
    
    def compute(pos1,pos2) 
      #basically outputs the last node before it hits pos2
      current = Node.new(pos1,nil) # a Node
      queue = [] # a queue of Nodes to evaluate
      while !current.possibilities.include?(pos2)
        for possible_move in current.possibilities
          queue<<Node.new(possible_move,current)
        end
        current = queue[0]
        queue = queue[1..-1]
      end
      return current
    end
    
    def output(node) #determines the history of the node from compute
      history = []
      while node != nil
        history.insert(0,node.position)
        node = node.previous
      end
      return history
    end
    
  end
end
    
      
      
    
    
=begin
  
    Recursive steps (not effective at determining quickest way)
  
    def quickest_way(pos1,pos2)
      current_moves = all_possible_moves(pos1)
      target = current_moves.pop
      queue = [target]
      while !queue.empty?
          return if queue[-1] == pos2
          target = current_moves.pop
          queue<<target if !queue.include?(target)
          if current_moves.empty?
            current_moves = all_possible_moves(queue[0])
            queue = queue[1..-1]
          end
      end
    end
    
    def aux(pos1,pos2,moves)
      possible_moves = all_possible_moves(pos1)
      if possible_moves.include?(pos2)
        moves<<pos2
        return moves
      else
        for each_possible_move in possible_moves
          if !moves.include?(each_possible_move)
            return aux(each_possible_move,pos2,moves<<each_possible_move)
          end
        end
      end
    end
    
    def step(pos1,pos2,queue)
      for each_possible_move in all_possible_moves(pos1)
        if check(each_possible_move,pos2)
          queue<<each_possible_move
          queue<<pos2
          return queue
        end
      end
      for each_possible_move in all_possible_moves(pos1)
        if !queue.include?(each_possible_move)
          return step(each_possible_move,pos2,queue<<each_possible_move)
        end
      end
    end
    
    
    def check(pos1,pos2)
      possible_moves = all_possible_moves(pos1)
      return true if possible_moves.include?(pos2)
      return false
    end
        
=end 
    
