require 'simplecov'
require 'minitest/autorun'
require_relative 'graph'

class GraphTest < Minitest::Test
  def test_initialize
	g = Graph.new('test_graph.txt')
	n = Minitest::Mock.new('graph')
	def n.nodes; 'CAKTEB'; end
	s = ''
	g.nodes.each_value { |x| s += x.letter }
	assert_equal(n.nodes, s)
  end
  def test_nil_argument
    g = Graph.new(nil)
	refute_nil(g.nodes)
  end
  def test_empty_file
    g = Graph.new('empty.txt')
	refute_nil(g.nodes)
  end
  def test_find_heads
    g = Graph.new('test_graph.txt')
	n = Minitest::Mock.new('graph')
	def n.find_heads; -1; end
	assert_equal(n.find_heads, g.find_heads[0])
  end
  def test_find_tails
    g = Graph.new('test_graph.txt')
	n = Minitest::Mock.new('graph')
	def n.find_tails; 'TEB'; end
	s = ''
	g.find_tails.each { |x| s += x.letter }
	assert_equal(n.find_tails, s)
  end
  def test_find_paths
    g = Graph.new('test_graph.txt')
	n = Minitest::Mock.new('graph')
	def n.find_paths; 'TATCATEKECKEAKECAKEBABCAB'; end
	s = ''
	g.find_paths.each { |x| s += x }
	assert_equal(n.find_paths, s)
  end
  def test_to_a
    s = '1,2,3'
	a = [1,2,3]
	assert_equal(a, s.to_a)
  end
end