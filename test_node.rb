require 'simplecov'
require 'minitest/autorun'
require_relative 'node'

class NodeTest < Minitest::Test
  def test_initizialize
    n = Node.new(0,'A',[1,2])
    assert_equal(true,(n.is_a? Node))
  end
  def test_id
    n = Node.new(0,'',[])
	assert_equal(0, n.id)
  end
  def test_letter
    n = Node.new(0,'',[])
	assert_equal('', n.letter)
  end
  def test_children
    n = Node.new(0,'',[])
	assert_equal([], n.children)
  end
  def test_initial_parents
    n = Node.new(0,'',[])
	assert_equal([], n.parents)
  end
  def test_add_parents
    n = Node.new(0,'',[])
    h = Minitest::Mock.new('parent')
	n.add_parent(h)
	refute(n.parents.empty?)
  end
  def test_is_not_head
    n = Node.new(0,'',[])
	h = Minitest::Mock.new('parent')
	n.add_parent(h)
	assert_equal(n.parents.empty?, n.head?)
  end
  def test_is_head
    n = Node.new(0,'',[])
	assert_equal(n.parents.empty?, n.head?)
  end
  def test_is_not_tail
    n = Node.new(0,'',[1])
	assert_equal(n.children.empty?, n.tail?)
  end
  def test_is_tail
    n = Node.new(0,'',[])
	assert_equal(n.children.empty?, n.tail?)
  end
end
