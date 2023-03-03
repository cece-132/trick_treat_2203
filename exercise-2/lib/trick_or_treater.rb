require 'pry'
class TrickOrTreater
  attr_reader :dressed_up_as, :bag,
              :sugar_level
  def initialize(costume)
    @dressed_up_as = costume.style
    @bag = Bag.new
    @sugar_level = 0
  end

  def has_candy?
    !@bag.candies.empty?
  end

  def candy_count
    @bag.candies.count
  end

  def eat
    eaten = @bag.candies.pop
    @sugar_level += eaten.sugar
  end

end