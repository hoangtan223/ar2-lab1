# In Dota game, ten players (p1, p2, …, p10) are sorted by their experiences
# in descending order. Write an algorithm to group these players into two teams
# (five members for each team) t1 and t2 such that the difference of total
# experiences of two teams is minimal. Explain if your solution is optimal.

def minimum(players_exp)
  players_arrranges = players_exp.permutation.to_a
  h = {}
  pos = 0

  players_arrranges.each do |arrange|
    team_1_exp = 0
    team_2_exp = 0
    for i in 0..4
      team_1_exp += arrange[i]
    end
    for i in 5..9
      team_2_exp += arrange[i]
    end

    h[pos] = (team_1_exp - team_2_exp).abs
    pos += 1
  end

  result_pos = h.key(h.values.sort[0])
  players_arrranges[result_pos]
end

a1 = [500, 450, 300, 200, 100, 75, 50, 30, 20, 10]
a2 = [50, 49, 48, 20, 10, 5, 4, 3, 2, 1]
a3 = [150, 149, 148, 107, 106, 105, 104, 103, 102, 1]

result_a = minimum(a3)
print result_a[0, 5]
print result_a[5, 9]
puts (result_a[0, 5].sum - result_a[5, 9].sum).abs