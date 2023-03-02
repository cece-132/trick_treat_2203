require 'pry'
require_relative '../lib/bag'
require_relative '../lib/candy'

RSpec.describe Bag do
  it 'is empty' do
    bag = Bag.new

    expect(bag.empty?).to be true
  end

  it 'can count the candy in an empty bag' do
    bag = Bag.new

    expect(Bag.new.count).to eq(0)
  end

  it 'has no candies when it is empty' do
    bag = Bag.new

    expect(Bag.new.candies).to eq([])
  end

  it 'can put a candy in a bag' do
    bag = Bag.new
    candy = Candy.new('Sour frogs')
    bag.add_candy candy

    expect(bag.candies).to eq([candy])
  end

  it 'is not empty when it has candies' do
    bag = Bag.new
    bag.add_candy Candy.new("Nerds")

    expect(bag.empty?).to be false
  end

  it 'can count candies' do
    bag = Bag.new
    bag.add_candy Candy.new("Caramelized Almonds")

    expect(bag.count).to eq(1)
  end

  # NOTE:
  # You usually don't want to chain a bunch of
  # different methods together like this:
  #   type = bag.candies.first.type
  # We'll talk about it more in a few weeks.
  # However. it's important to understand how these methods work.
  it 'contains candies and candies have a type' do
    bag = Bag.new
    bag.add_candy Candy.new("Hershey's Kisses")
    type = bag.candies.first.type

    expect(type).to eq("Hershey's Kisses")
  end

  it 'can be asked if it has a particular kind of candy' do
    bag = Bag.new
    bag.add_candy Candy.new("Lindt chocolate")

    expect(bag.contains?('Lindt chocolate')).to be true
    expect(bag.contains?('Nerds')).to be false
  end

  it 'can get a particular type of candy' do
    bag = Bag.new
    bag.candies << Candy.new('Jawbreaker')
    bag.candies << Candy.new('Jawbreaker')
    bag.candies << Candy.new('Jolly Ranchers')

    candy = bag.grab "Jawbreaker"
    expect(candy.type).to eq('Jawbreaker')
  end

  it 'removes candy from the bag when you grab it' do
    bag = Bag.new
    bag.candies << Candy.new('Reeses Pieces')
    bag.candies << Candy.new('Junior Mints')
    bag.candies << Candy.new('Reeses Pieces')

    expect(bag.count).to eq(3)

    bag.grab('Junior Mints')

    expect(bag.count).to eq(2)
  end

  it 'can take a number of candies from the bag' do
    bag = Bag.new
    bag.candies << Candy.new('Swedish Fish')
    bag.candies << Candy.new('Milky Way')
    bag.candies << Candy.new('Cotton Candy')

    expect(bag.count).to eq(3)

    taken = bag.take(2)

    expect(taken.size).to eq(2)
    expect(bag.count).to eq(1)
  end

  it 'can take one candy' do
    bag = Bag.new
    bag.candies << Candy.new('Lifesavers')

    candy = bag.take(1)
    expect(candy.first.type).to eq('Lifesavers')
  end
end
