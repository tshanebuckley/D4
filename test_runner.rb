require 'simplecov'
require 'minitest/autorun'
require_relative 'runner'

class RunnerTest < Minitest::Test
  def test_sum
    arr = ['h', 'e', 'l', 'l', 'o']
	assert_equal('hello', arr.sum)
  end
  def test_permutations
    s = 'cat'
	arr = ["cat", "cta", "act", "atc", "tca", "tac"]
	assert_equal(arr, s.permutations)
  end
  def test_find_largest
    words = ['cat', 'at', 'ta', 'tac', 'a', 't']
    dict = {'cat' => '', 'at' => '', 'a' => ''}
	arr = ['cat']
	assert_equal(arr, find_largest(words, dict))
  end
end