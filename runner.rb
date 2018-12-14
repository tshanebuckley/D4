require_relative 'graph.rb'
require_relative 'node.rb'
# adds sum method and in_groups to Array class
class Array
  def sum
    sum = ''
    each { |x| sum += x }
    sum
  end

  def in_groups(number)
    group_size = size / number
    leftovers = size % number
    groups = []
    start = 0
    number.times do |index|
      length = group_size + (leftovers > 0 && leftovers > index ? 1 : 0)
      groups << slice(start, length)
      start += length
    end
    groups
  end
end
# adds get_permutations method to String class
class String
  def permutations
    array = chars.to_a.permutation.map
    array = array.each(&:sum)
    array
  end
end

def get_words(name)
  hash = {}
  f = File.open(name, 'r')
  f.each_line do |line|
    line = line.delete("\n")
    line = line.delete("\r")
    # puts(n.id.to_s + ' ' + n.letter.to_s + ' children: ' + n.children.to_s)
    # puts("Line: " + line)
    hash[line] = ''
  end
  hash
end

def find_largest(word_list, dictionary)
  largest = 0
  word = []
  word_list.each do |x|
    if x.size > largest && dictionary[x.downcase] == ''
      word.clear
      largest = x.size
    end
    word.push(x) if x.size == largest && dictionary[x.downcase] == ''
  end
  word.uniq
end
