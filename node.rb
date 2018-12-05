# Nodes for graph
class Node
  attr_accessor :id, :letter, :children, :parents
  def initialize(identity, let, child)
    @id = identity # numeral id for hash
    @letter = let # letter as per requirement for word generation
    @children = child # children, signify nodes accesible to this node
    @parents = [] # parents, signify nodes that can access this node
  end

  def head?
    return true if @parents.empty? == true
    return false if @parents.empty? != true
  end

  def tail?
    return true if @children.empty? == true
    return false if @children.empty? != true
  end

  def add_parent(parent)
    @parents.push(parent)
  end
end
