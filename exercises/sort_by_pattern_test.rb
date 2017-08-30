gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class SortByPatternTest < Minitest::Test

  def test_sort_alphabetically
    words = ["broccoli", "Carrots", "FISH", "Bacon", "candy"]
    transformed = []
    words.each {|word| transformed << [word.downcase, word]}
    transformed = transformed.sort
    sorted = []
    transformed.each {|sort_key, word| sorted << word}
    assert_equal ["Bacon", "broccoli", "candy", "Carrots", "FISH"], sorted
  end

  def test_sort_alphabetically_by_last_letter
    things = ["pill", "box", "glass", "water", "sponge"]
    transformed = []
    things.each {|thing| transformed << [thing[-1], thing]}
    transformed = transformed.sort
    sorted = []
    transformed.each {|sort_key, thing| sorted << thing}
    assert_equal ["sponge", "pill", "water", "glass", "box"], sorted
  end

  def test_sort_by_distance
    distances = ["1cm", "9cm", "30cm", "4cm", "2cm"]
    transformed = []
    distances.each {|distance| transformed << [distance.to_i, distance]}
    transformed = transformed.sort
    sorted = []
    transformed.each {|sort_key, distance| sorted << distance}
    assert_equal ["1cm", "2cm", "4cm", "9cm", "30cm"], sorted
  end

  def test_sort_by_length
    words = ["heteromorph", "ancyloceratina", "bioengineering", "mathematical", "bug"]
    transformed = []
    words.each {|word| transformed << [word.length, word]}
    transformed = transformed.sort
    sorted = []
    transformed.each {|sort_key, word| sorted << word}
    assert_equal ["bug", "heteromorph", "mathematical", "ancyloceratina", "bioengineering"], sorted
  end

  def test_sort_by_proximity_to_ten
    prices = [3.02, 9.91, 17.9, 10.01, 11.0]
    transformed = []
    prices.each {|price| transformed << [(10.0 - price).abs, price]}
    transformed = transformed.sort
    sorted = []
    transformed.each {|sort_key, price| sorted << price}
    assert_equal [10.01, 9.91, 11.0, 3.02, 17.9], sorted
  end

  def test_sort_by_number_of_cents
    prices = [3.02, 9.91, 7.9, 10.01, 11.0]
    transformed = []
    prices.each {|price| transformed << [price - price.floor, price]}
    transformed = transformed.sort
    sorted = []
    transformed.each {|sort_key, price| sorted << price}
    assert_equal [11.0, 10.01, 3.02, 7.9, 9.91], sorted
  end
end