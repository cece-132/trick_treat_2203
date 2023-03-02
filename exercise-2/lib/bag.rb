require 'pry'
class Bag
  attr_reader :candies
  def initialize
    @candies = []
  end

  def empty?
    @candies.empty?
  end

  def count
    @candies.count
  end

  def add_candy(candy)
    @candies << candy
  end

  def contains?(candy_type)
    @candies.any? do |candy|
      candy.type == candy_type
    end
  end

  def grab(candy_type)
    @candies.find do |candy|
      @candies.delete(candy) if candy.type == candy_type
    end
  end

  def take(amount_removed)
   removed = @candies[0..amount_removed]
    binding.pry
  end
end