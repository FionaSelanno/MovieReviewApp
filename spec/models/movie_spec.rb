require 'rails_helper'

describe "A movie" do
  it "is a flop if the total_gross is less then 50000000.00" do
    movie = Movie.new(total_gross: "40000000.00")

    expect(movie.flop?).to eq(true)
  end

  it "is not a flop if the total_gross is bigger then 50000000.00" do
    movie = Movie.new(total_gross: "60000000.00")

    expect(movie.flop?).to eq(false)
  end
end
