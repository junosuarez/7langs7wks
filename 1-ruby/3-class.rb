class Element
  attr_accessor :element, :textContent, :attributes, :children

  def initialize(element, attributes = {}, textContent = '', children = [])
    @element = element
    @textContent = textContent
    @attributes = attributes
    @children = children
  end

  def toHtml
    html = "<#{element}"
    attributes.each do |attr, val|
      html = html + " #{attr}=\"#{val}\""
    end
    if !textContent.empty? || !children.empty?
      html = html + ">"
      html = html + textContent
      html = html + children.map {|c| c.to_s}.join
      html = html + "</#{element}>"
    else
      html + "/>"
    end
  end

  # override .to_s
  def to_s
    toHtml
  end
end

puts Element.new('a', {:href=>"http://jden.us"}, '', [Element.new('blink', {}, 'visit my internet homepage!')])
