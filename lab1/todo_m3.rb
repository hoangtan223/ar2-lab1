class Todo
  def initialize
    @title = "Todo"
    @items = ["Decide supervisor and driver roles", "Implement Milestone 1"]
  end
end


class HtmlTodo < Todo
  # ...
  def display
    "<html>
    <head>
    <title>#{@title}</title>
    </head>
    <body>
    <ul>
    <li>#{@items[0]}</li>
    <li>#{@items[1]}</li>
    </ul>
    <body?
    </html>"
  end
end
class PlainTodo < Todo
  # ...
  def display
    "#{@title}
    #{@items[0]}
    #{@items[1]}
    "
  end
end
