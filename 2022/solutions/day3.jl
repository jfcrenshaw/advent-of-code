
# first, read in the data
data = readlines("../inputs/day3.txt")

# define a function that splits a rucksack
function split_rucksack(rucksack)
    len = trunc(Int, length(rucksack) / 2)
    rucksack[1:len], rucksack[len+1:end]
end

# define a function that returns the priority of a character
function priority(char)
    Int(lowercase(char)) - 96 + 26 * isuppercase(char)
end

# define a function that gets the shared priority
function shared_priority(items...)
    shared_item = only(intersect(items...))
    priority(shared_item)
end

# loop through all the rucksacks
total_priority = 0
badge_priority = 0
for i in 1:3:length(data)
    # add the priority from each of the three rucksacks
    global total_priority += (
        shared_priority(split_rucksack(data[i+0])...) +
        shared_priority(split_rucksack(data[i+1])...) +
        shared_priority(split_rucksack(data[i+2])...)
    )

    # add the priority of the group badge_priority
    global badge_priority += shared_priority(
        data[i+0],
        data[i+1],
        data[i+2],
    )
end

println("The total priority is ", total_priority)
println("The badge priority is ", badge_priority)
