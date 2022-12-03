
# first, read in the data
data = readlines("../inputs/day2.txt")

# define the game options
options = Dict(
    # us
    "X" => 1,
    "Y" => 2,
    "Z" => 3,

    # them
    "A" => 1,
    "B" => 2,
    "C" => 3,
)

# arrays that define the score
choice_arr = [1, 2, 3]
result_arr = [0, 3, 6]

# first, use strategy 1
# loop through the rounds and tally the scores
score1 = 0 # score using strategy 1
score2 = 0 # score using strategy 2
for round in data
    # get the integers corresponding to our choices
    us = options[split(round)[2]]
    them = options[split(round)[1]]

    # add scores according to two strategies
    global score1 += choice_arr[us] + circshift(result_arr, them + 1)[us]
    global score2 += circshift(choice_arr, 2 - us)[them] + result_arr[us]
end

println("Our score using strategy 1 is ", score1)
println("Our score using strategy 2 is ", score2)