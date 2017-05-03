class Formatter
  def display(title, items)
    raise "must be implemented"
  end
end

class HtmlFormatter < Formatter
  def display(title, items)
    "<html>
    <head>
    <title>#{title}</title>
    </head>
    <body>
    <ul>
    <li>#{items[0]}</li>
    <li>#{items[1]}</li>
    </ul>
    </body>
    </html>"
  end
end

class PlainTextFormatter < Formatter
  def display(title, items)
    # ...
    "#{title}
    #{items[0]}
    #{items[1]}
    "
  end
end


class Todo
  attr_accessor :title, :items, :block

  def initialize(formatter, &block)
    @title = "Todo"
    @items = ["Decide supervisor and driver roles", "Implement Milestone 1"]
    @formatter = formatter
    @block = block
  end

  def display
    if @block
      @block.call(self)
    else
      @formatter.display(@title,@items)
    end

  end
end

class TestBlock
  attr_accessor :attr

  def initialize

  end
end
