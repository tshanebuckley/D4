require_relative 'node.rb'
# adds to_a method to String class
class String
  def to_a
    split(',').map(&:to_i)
  end
end
# Graph class
class Graph
  attr_accessor :nodes
  def initialize(text)
    @nodes = input(text)
    @nodes.each_value { |i| nodes[i.id].children.each { |x| @nodes[x].add_parent(i) } }
    @nodes[-1] = Node.new(-1, '', find_heads)
    @nodes[-1].children.each { |x| @nodes[x].add_parent(@nodes[-1]) }
  end

  def input(name)
    hash = {}
    if name.nil?
      hash[-2] = Node.new(-2, '', [])
      return hash
    end
    unless File.exist?(name)
      hash[-2] = Node.new(-2, '', [])
      return hash
    end
    f = File.open(name)
    if name.empty?
      hash[-2] = Node.new(-2, '', [])
      return hash
    end
    f.each_line do |line|
      line = line.delete("\n")
      line = line.split(';')
      n = Node.new(line[0].to_i, line[1], line[2].to_a)
      unless n.id.is_a?(Integer) && n.letter.is_a?(String) && n.children.is_a?(Array)
        hash[-2] = Node.new(-2, '', [])
        return hash
      end
      unless n.letter.size == 1
        hash[-2] = Node.new(-2, '', [])
        return hash
      end
      hash[n.id] = n
    end
    f.close
    hash
  end

  def find_tails
    tails = []
    nodes.each_value { |x| tails.push(x) if x.tail? }
    tails
  end

  def find_heads
    heads = []
    @nodes.each_value { |x| heads.push(x.id) if x.head? }
    heads
  end

  def find_paths
    # puts("find paths")
    paths = []
    tails = find_tails
    tails.each do |current|
      current_path = ''
      # puts("Start " + current.id.to_s + ":")
      # puts(current.letter.to_s)
      until current.head?
        # puts("Current: " + current.letter.to_s, + " Num of Parents: " + current.parents.size.to_s)
        current_path = current.letter.to_s + current_path
        paths.push(current_path)
        if current.parents.size > 1
          recur_find_paths(current, current_path, paths)
          break
        else
          current = current.parents[0]
        end
        # nodeStack.each {|x| print(x.letter.to_s) unless x == nil}
        # puts()
      end
    end
    paths
  end

  def recur_find_paths(split, path_string, paths)
    # puts('recursive method')
    split.parents.each do |v|
      current = v
      current_path = path_string
      until current.head?
        # puts("Current: " + current.letter.to_s, + " Num of Parents: " + current.parents.size.to_s)
        current_path = current.letter.to_s + current_path
        paths.push(current_path)
        if current.parents.size > 1
          recur_find_paths(current, current_path, paths)
          break
        else
          current = current.parents[0]
        end
        # nodeStack.each {|x| print(x.letter.to_s) unless x == nil}
        # puts()
      end
    end
  end
end
