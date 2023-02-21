class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { Array.new }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, index|
      if index == 6 || index == 13
        next 
      else
        @cups[index] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    if start_pos.between?(0, 12) && start_pos != 6 && !@cups[start_pos].empty?
      return true
    elsif !start_pos.between?(0, 12) || start_pos == 6
      raise "Invalid starting cup"
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
    end
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].length
    i = 1
    @cups[start_pos] = []
    while num_stones > 0
      if (current_player_name == @name1 && (start_pos + i) % 14 != 13) || (current_player_name == @name2 && (start_pos + i) % 14 != 6)
        @cups[(start_pos + i) % 14] << :stone
        num_stones -= 1
      end
      i += 1
    end
    render
    return next_turn((start_pos + i - 1) % 14)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return "prompt".to_sym
    elsif @cups[ending_cup_idx].length == 1
      return "switch".to_sym
    else
      return ending_cup_idx
    end
    # helper method to determine what #make_move returns
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    if @cups[0..5].all? {|cup| cup.length == 0}
      return true
    elsif @cups[7..12].all? {|cup| cup.length == 0}
      return true
    else
      return false
    end
  end

  def winner
    if @cups[6].length == @cups[13].length
      return "draw".to_sym
    elsif @cups[6].length > @cups[13].length
      return @name1
    else
      return @name2
    end
  end
end