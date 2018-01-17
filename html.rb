class Elem

  def initialize(bal, content = [], type = "double",  opt = {})
    @tag = bal
    @content = content
    @tag_type = type
    @opt = opt
  end

  def add_content(*e)
    if @content.class != Array
      @content = [@content]
    end
    e.each { |x| @content.push(x) }
  end

  def to_s

    b = "<#{@tag}"

    @opt.each do |k,v|
      b += " #{k}='#{v}' "
    end

    if @tag_type == "simple"
      b += "/>"
    else
      b += ">"
    end

    if !@content.empty? && @content.class == Array
      @content.each {|f|
        if !f.empty?
          b += "\n" + f.to_s
        end
      }
      b += "\n"
    else
      b += @content.to_s
    end

    if @tag_type == "double"
      b += "</#{@tag}>"
    end

    return b
  end

  def empty?
    return false
  end

  attr_reader :content
  attr_reader :opt
  attr_reader :tag
  attr_reader :tag_type

end

class Text
  def initialize(str)
    @t = str
  end

  def to_s
    return @t
  end
  def empty?
    return false
  end
end

class Html < Elem
  def initialize(content)
    super("Html" , content)
  end
end

class Body < Elem
  def initialize (content)
    super("Body", content)
  end
end

class Head < Elem
  def initialize (content)
    super("Head", content)
  end
end

class Title < Elem
  def initialize (content)
    super("Title", content)
  end
end
class Meta < Elem
  def initialize (options)
    super("Meta", "", "simple", options)
  end
end
class Img < Elem
  def initialize (content, options)
    super("Img", content, "simple",options)
  end
end
class H1 < Elem
  def initialize (content)
    super("H1", content)
  end
end
class H2 < Elem
  def initialize (content)
    super("H2", content)
  end
end
class Table < Elem
  def initialize (content)
    super("Table", content)
  end
end

class Th < Elem
  def initialize (content)
    super("Th", content)
  end
end

class Td < Elem
  def initialize (content)
    super("Td", content)
  end
end
class Tr < Elem
  def initialize (content)
    super("Tr", content)
  end
end
class Ul < Elem
  def initialize (content)
    super("Ul", content)
  end
end
class Ol < Elem
  def initialize (content)
    super("Ol", content)
  end
end
class Li < Elem
  def initialize (content)
    super("Li", content)
  end
end
class P < Elem
  def initialize (content)
    super("P", content)
  end
end
class Div < Elem
  def initialize (content)
    super("Div", content)
  end
end
class Span < Elem
  def initialize (content)
    super("Span", content)
  end
end
class Hr < Elem
  def initialize (content)
    super("Hr", content)
  end
end
class Br < Elem
  def initialize (content)
    super("Br", content)
  end
end

if $PROGRAM_NAME == __FILE__

  # puts Html.new([Head.new([Title.new("Hello ground!")]),Body.new([H1.new("Oh no, not again!"),Img.new([],{"src"=>"http://i.imgur.com/pfp3T.jpg"})])])

  # puts Html.new([Head.new([Title.new("Sup biatch")]), Body.new("")])
  str = Html.new([Head.new([Meta.new({"charset"=>"UTF-8"}), Title.new("My awesome Shit")]), Body.new([H1.new("Dog"), Img.new([],{"src"=>"http://i.imgur.com/6aWyOoC.jpg"}),Div.new(P.new("balalsdaldaldasjld"))])])
  File.open("myawesomehtml.html", 'w') { |file| file.write(str) }
  `open myawesomehtml.html`
end
