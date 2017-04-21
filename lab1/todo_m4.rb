class Formatter
  def display(title, items)
    puts "Plain text"
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
  def initialize(formatter)
    @title = "Todo"
    @items = ["Decide supervisor and driver roles", "Implement Milestone 1"]
    @formatter = formatter
  end

  def display
    @formatter.display(@title,@items)
  end
end
