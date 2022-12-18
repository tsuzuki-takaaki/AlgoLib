#binary_search
a = [10, 99, 100, 1, 4, 17, 22, 200, 1, 2, 5, ].sort

def binary_search(a, t)
    left = 0
    right = a.size - 1
    while left <= right
        mid = (left + right) / 2
        if a[mid] == t
            return "#{mid+1}番目にありました!!"
        elsif a[mid] < t
            left = mid + 1
        else
            right = mid - 1
        end
    end
    return "ここにはないよ!!"
end

puts binary_search(a, 7)

# めぐる式二分探索
# a = [10, 99, 100, 1, 4, 17, 22, 200, 1, 2, 5].sort
# t = 22
# len = a.size
# left = -1
# right = len
# while right - left > 1
#     mid = left + ((right-left)/2)
#     if a[mid] == t
#         puts mid + 1
#         exit
#     elsif a[mid] > t
#         right = mid
#     else
#         left = mid
#     end
# end
# puts "None"

# library
# a = [10, 99, 100, 1, 4, 17, 22, 200, 1, 2, 5].sort
# puts a.join(" ")
# v = 7
# puts a.bsearch_index{|x| x >= v} # => vが入るところはここもしくはここより下 x視点で考えた方ばわかりやすい