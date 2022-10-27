n, q = 10, 6
x = [1, 5, 2, 9, 6, 6] # [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

arr = (0..n).to_a
arr2 = (0..n).to_a

x.each do |i|
    posx = arr2[i] #その数字がどこにあるか(左から何番目)
    posother = posx + 1 #その隣の数字の位置(右側)
    #1番右だった時
    if posx == n
        posother = posx - 1
    end
    other = arr[posother] #隣の数字は何か(iの隣の数字)
    arr[posx], arr[posother] = arr[posother], arr[posx]
    arr2[other], arr2[i] = arr2[i], arr2[other]
end

puts arr[1..]