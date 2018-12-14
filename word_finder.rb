require_relative 'graph.rb'
require_relative 'node.rb'
require_relative 'runner.rb'
# require 'flamegraph'
require 'parallel'
# initialize DAG
text = ARGV[0].to_s
g = Graph.new(text)
# find all paths
paths = g.find_paths
# paths.each { |x| puts(x) }
# find all permutations
# perms = []
# puts(paths.size)
paths = paths.in_groups(4)
# puts(paths.size)
perms = Parallel.map(paths, in_processes: 4) do |x|
  # puts(x)
  x.map(&:permutations)
end
perms = perms.flatten
# perms.each { |x| puts(x) }
# paths.each { |x| print(x); puts }
# paths.each { |x| x.permutations.each { |i| perms.push(i) } }
# perms.each {|x| puts(x)}
words = get_words 'wordlist.txt'
# puts(words.to_s)
# find largest word
largest_word = find_largest(perms, words)
puts(largest_word.to_s)

# endTime = Time.now
# puts()
# puts "Time elapsed #{(endTime - startTime)} seconds"
