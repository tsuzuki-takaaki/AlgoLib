#merge_sort
a = [18, 88, 10, 1, 19, 2, 3, 3, 2, 2, 108]

def merge_sort(a)
    return a if a.size == 1

    mid = a.size / 2

    a_dash = merge_sort(a[...mid])
    b_dash = merge_sort(a[mid..])

    c1, c2 = 0, 0
    ans = []
    while c1 < a_dash.size  || c2 < b_dash.size
        if c1 == a_dash.size
            ans << b_dash[c2]
            c2 += 1
        elsif c2 == b_dash.size
            ans << a_dash[c1]
            c1 += 1
        else
            if a_dash[c1] < b_dash[c2]
                ans << a_dash[c1]
                c1 += 1
            else
                ans << b_dash[c2]
                c2 += 1
            end
        end
    end
    ans
end

puts merge_sort(a)