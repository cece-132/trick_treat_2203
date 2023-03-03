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
    present = @candies.map do |candi|
      candi.type == candy_type
    end
    evaluator(present)
  end

  def evaluator(array)
    if array.include?(true)
      return true
    else
      return false
    end
  end
end