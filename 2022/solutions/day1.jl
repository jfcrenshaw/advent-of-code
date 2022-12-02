
# first, read in the data
data = readlines("../inputs/day1.txt")

# create an integer vector to hold the total calories carried by each elf
calories = Int[]
# and a variable that will keep a running sum for each elf
running_sum = 0
# loop through every item
for item in data
    # if this isn't a blank line, add the calories to the running sum
    if item != ""
        global running_sum += parse(Int, item)
        # if this is a blank line, append the total, and reset the running sum
    else
        append!(calories, running_sum)
        global running_sum = 0
    end
end

# if the final value wasn't an empty line, we need to append the final running_sum
if running_sum != 0
    append!(calories, running_sum)
end

# sort the elves by the number of calories they are carrying
calories = sort(calories, rev=true)

# the answer to question 1
println("The top elf is carrying ", calories[1], " calories.")

# the answer to question 2
println("The top three elves are carrying a total of ", sum(calories[1:3]), " calories.")