# Find the longest fish in O(n^2) time. Do this by comparing all fish lengths to all other fish lengths
def sluggish_octopus(fish_arr)
  longest_fish = nil

  (0...fish_arr.length).each do |i|
    (0...fish_arr.length).each do |j|
      case fish_arr[i] <=> fish_arr[j]
      when 0, -1
        longest_fish = fish_arr[j]
      when 1
        longest_fish = fish_arr[i]
      end
    end
  end

  longest_fish
end

# fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# # => "fiiiissshhhhhh"
