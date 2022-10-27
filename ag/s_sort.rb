# selection_sort
a = [18, 88, 10, 1, 19, 2, 3, 3, 2, 2, 108]

def selection_sort(a)
    i = 0
    while i < a.size - 1
        k = i+1
        min_i = i
        while k < a.size
            if a[k] < a[min_i]
                min_i = k
            end
            k += 1
        end
        a[i], a[min_i] = a[min_i], a[i]
        i += 1
    end
    return a
end

puts selection_sort(a)