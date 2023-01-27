# 尺取法(半開区間で考えれるかが問題)

# https://onlinejudge.u-aizu.ac.jp/problems/DSL_3_C

# n, q = gets.split.map(&:to_i)
# a = gets.split.map(&:to_i)
# x = gets.split.map(&:to_i)
n, q = 6, 5
a = [1, 2, 3, 4, 5, 6]
x = 12
sum, cnt, r = 0, 0, 0
# 半開区間[i, r)で考える start -> [0, 0)
n.times do |i|
  while (r < n) && sum + a[r] <= x
    sum += a[r]
    r += 1 # 条件を満たした時rをrightとする半開区間にかわる ex.. [0, 0) => [0, 1) これはsum + a[r] <= xを満たした時だからa[0]しか含まれない
  end
  cnt += r-i
  if r == i
    r += 1
  else
    sum -= a[i]
  end
end
puts cnt

# 二分探索(nlogn) => ABC130D
