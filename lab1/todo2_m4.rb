class Formatter
  def display(todo)
    raise "must be implemented"
  end
end

class HtmlFormatter < Formatter
  def display(todo)
    "<html>
    <head>
    <title>#{toto.title}</title>
    </head>
    <body>
    <ul>
    <li>#{todo.items[0]}</li>
    <li>#{todo.items[1]}</li>
    </ul>
    </body>
    </html>"
  end
end

class PlainTextFormatter < Formatter
  def display(todo)
    # ...
    "#{todo.title}
    #{todo.items[0]}
    #{todo.items[1]}
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
    @formatter.display(self)
  end
end
