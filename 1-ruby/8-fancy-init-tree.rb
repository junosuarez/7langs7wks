class FancyInitTree
  attr_accessor :node, :children

  def initialize(node, children = [])
    if node.length == 1 && node.each.class == Enumerator # there's probably a more idiomatic way
      from_hash node
    else
      @node = node
      @children = children
    end
      
  end

  def from_hash(hash) 
    head = hash.keys[0]
    tail = hash.values[0]
    # puts "h #{head} t #{tail}"
    @node = head
    @children = tail.keys.map do |k|
      kp = {}
      kp[k] = tail[k]
      FancyInitTree.new(kp)
      # cs
    end
    # puts "cs #{children}"
  end

  def visit(&block)
    block.call self
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def to_s
    node
  end

end

tree = FancyInitTree.new({'grandma'=>{' dad'=>{'  me'=>{},'  sibling'=>{}}, ' aunt'=>{}}})

tree.visit_all {|s| puts s }

# at the end of all of this, it feels
# really hacky and frustrating. there's gotta be a more idiomatic
# way of recursing over ruby collections

# a sticky point was having {}.map convert each item to an array structure,
# resulting in the garbage in lines 19-22