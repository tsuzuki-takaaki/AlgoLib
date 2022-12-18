# LIS(最長増加部分列) ※別に連続はしなくてもいい
# cf https://atcoder.jp/contests/joisc2007/tasks/joisc2007_buildi

n = gets.to_i
a = n.times.map{gets.to_i}
dp = Array.new(n, 10**12)
n.times do |i|
    idx = dp.bsearch_index{|x| x >= a[i]} # >= じゃないと完全性を満たさない(>はアウト)
    dp[idx] = a[i]
end
# 0indexだからこれでオッケー
puts dp.bsearch_index{|y| y >= 10 ** 12} || n