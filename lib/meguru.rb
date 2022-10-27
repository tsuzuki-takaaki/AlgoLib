# めぐる式二分探索

arr = [1, 10, 11, 30, 150, 889, 1000, 1001, 1002, 2001, 80000]
l = arr.size
t = 1001
left, right = -1, l+1
while right - left > 1
    mid = left+((right-left)/2)
    if arr[mid] == t
        puts mid
        exit
    elsif arr[mid] < t
        left = mid
    else
        right = mid
    end
end