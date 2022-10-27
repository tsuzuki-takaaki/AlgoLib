# マンハッタン距離の差分の総和の最小値(=> x, yはそれぞれ独立で、各々中央値を取るのが最適)
# 証明 => https://qiita.com/nomikura/items/ce0bfc9fd9c8f985409b

n = gets.to_i
x, y = [], []
xy = []
n.times do |i|
    a, b = gets.split.map(&:to_i)
    x << a
    y << b
    xy << [a, b]
end
x.sort!; y.sort!
t_x, t_y = 0, 0

# 2で割るところは0indexで考えないといけないため注意
if n.odd?
    t_x, t_y = x[(n/2)], y[(n/2)]
else
    t_x, t_y = (x[(n/2)] + x[(n/2-1)])/2, (y[(n/2)] + y[(n/2-1)])/2
end
ans = 0
n.times do |i|
    n_x, n_y = xy[i]
    ans += (n_x-t_x).abs + (n_y-t_y).abs
end
puts ans