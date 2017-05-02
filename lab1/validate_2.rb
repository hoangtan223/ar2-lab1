# Let suppose there are 4 type of notes in an ATM machine. Let says 2$, 5$, 20$, 50$.
# There are unlimited amount of notes.

# Given a number, validate if the amount can be withdrawn from the machine.
# Given a number that could be withdrawn, find the combination that have least amount of notes.

def combination(amount, position = 0, count = 0, resultArray = nil)
  note_types = [50, 20, 5, 2]

  if resultArray == nil
    resultArray = Array.new
  end

  puts "amount #{amount} position #{position} count #{count}"

  if amount < 2
    resultArray << count
    return resultArray
  end

  if amount >= note_types[position]
    count += 1
    combination(amount-note_types[position], position, count, resultArray)
  else
    resultArray << count
    position += 1
    combination(amount, position, 0, resultArray)
  end

  resultArray
end

print combination(122)
puts
print combination(5425)