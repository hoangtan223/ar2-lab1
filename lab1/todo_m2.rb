class Todo
  def initialize
    @title = "Todo"
    @items = ["Decide supervisor and driver roles", "Implement Milestone 1"]
  end

  def display(format = :plain)
    if format == :html
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
    elsif format == :plain
      "#{@title}
       #{@items[0]}
       #{@items[1]}
      "
    end
  end
end
