# Let suppose there are 4 type of notes in an ATM machine. Let says 2$, 5$, 20$, 50$.
# There are unlimited amount of notes.

# Given a number, validate if the amount can be withdrawn from the machine.
# Given a number that could be withdrawn, find the combination that have least amount of notes.

def combination(amount)
  remain = amount
  count50 = 0
  count20 = 0
  count5 = 0
  count2 = 0

  while remain > 0
    if remain >= 50
      count50 += 1
      remain -= 50
    elsif remain >= 20
      count20 += 1
      remain -= 20
    elsif remain >= 5
      count5 += 1
      remain -= 5
    elsif remain >= 2
      count2 += 1
      remain -= 2
    end
  end

  resultArray = [count50, count20, count5, count2]
end