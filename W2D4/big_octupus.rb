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

# Find the longest fish in O(n log n) time.
# Note Merge Sort is O(n log n) -- let us sort the array and return last element

# STACK TRACE TOO DEEP -- need to modify
def dominant_octopus(fish_arr)
  merge_sort(fish_arr).last
end

def merge_sort(array, &prc)
  prc ||= Proc.new { |x, y| x <=> y }

  mid = array.length / 2
  left = merge_sort(array.take(mid), &prc)
  right = merge_sort(array.drop(mid), &prc)

  merge(left, right, &prc)
end

def merge(left, right, &prc)
  merged = []

  until left.empty? || right.empty?
    case prc.call(left.first, right.first)
    when 0, -1
      merged << left.shift
    when 1
      merged << right.shift
    end
  end

    merged + left + right
end



fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
# p dominant_octopus(fish)
# # => "fiiiissshhhhhh"
