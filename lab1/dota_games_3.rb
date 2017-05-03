# In Dota game, ten players (p1, p2, …, p10) are sorted by their experiences
# in descending order. Write an algorithm to group these players into two teams
# (five members for each team) t1 and t2 such that the difference of total
# experiences of two teams is minimal. Explain if your solution is optimal.

# O(N)
def minimum(players_exp)
  team_1 = Array.new
  team_2 = Array.new

  result = {}

  for i in 0..4
    if i%2 == 0
      team_1 << players_exp[i]
      team_1 << players_exp[9-i]
    else
      team_2 << players_exp[i]
      team_2 << players_exp[9-i]
    end
  end

  result["team_1"] = team_1
  result["team_2"] = team_2

  result
end

a1 = [500, 450, 300, 200, 100, 75, 50, 30, 20, 10]
a2 = [50, 49, 48, 20, 10, 5, 4, 3, 2, 1]
a3 = [150, 149, 148, 107, 106, 105, 104, 103, 102, 1]

result = minimum(a3)
print result["team_1"]
puts
print result["team_2"]
puts (result["team_1"].sum - result["team_2"].sum).abs