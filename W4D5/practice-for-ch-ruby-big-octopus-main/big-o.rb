require "byebug"

## Sluggish Octopus

def sluggish_eat_largest_fish(arr)
    result = nil
    arr.each_with_index do |ele1, idx1|
        arr.each_with_index do |ele2, idx2|
            if (ele1.length <=> ele2.length) < 0
                break
            end
            result = ele1
        end
    end
    return result
end

# arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
# 'fiiiissshhhhhh']
# p sluggish_eat_largest_fish(arr)

## Dominant Octopus
def dominant_eat_largest_fish(arr)
    arr.sort! {|ele1, ele2| ele1.length <=> ele2.length }
    arr[-1]
end

# arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
# 'fiiiissshhhhhh']
# p dominant_eat_largest_fish(arr)

## Clever Octopus
def clever_eat_largest_fish(arr)
    result = arr[0]
    arr.each do |ele|
        if result.length < ele.length
            result = ele
        end
    end
    return result
end 

# arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 
# 'fiiiissshhhhhh']
# p clever_eat_largest_fish(arr)

## Slow Dance
def slow_dance(str, arr)
    arr.find_index(str)
end

# tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", 
#                "left",  "left-up"]

# p slow_dance("up", tiles_array)
# p slow_dance("right-down", tiles_array)

## Fast Dance!
def fast_dance(str, hash)
    hash[str]
end

# tiles_hash = {"up" => 0, "right-up" => 1, "right" => 2, "right-down" => 3,
#             "down" => 4, "left-down" => 5, "left" => 6,  "left-up" => 7}
# p fast_dance("up", tiles_hash)
# p fast_dance("down", tiles_hash)