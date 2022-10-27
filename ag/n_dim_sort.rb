#多次元配列のsort(nonzero?)
a = [["abcdef", 2, 1], ["zefrg", 2, 2], ["zc3ffjdf", 8, 1], ["cdgrg", 1, 10] ,["abcdef", 100, 3]]


puts a.sort{|a,b| (a[0] <=> b[0]).nonzero? || b[1] <=> a[1]}