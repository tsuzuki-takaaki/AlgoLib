# グラフの同型判定 ABC232C

n, m = gets.split.map(&:to_i) # n頂点m辺

ab = m.times.map{gets.split.map(&:to_i)}
cd = m.times.map{gets.split.map(&:to_i)}

x = Array.new(n) {Array.new(n, 0)}
y = Array.new(n) {Array.new(n, 0)}

# 連結関係を二次元配列でもつ(2頂点が連結なら1)
ab.each do |i|
  x[i[0]-1][i[1]-1] = 1
  x[i[1]-1][i[0]-1] = 1
end
cd.each do |j|
  y[j[0]-1][j[1]-1] = 1
  y[j[1]-1][j[0]-1] = 1
end

# yの連結関係性を用いて順列全探索をする => 新しくできた二次元配列がxに一致する場合は同型
(1..n).to_a.permutation(n).each do |p|
  z = Array.new(n) {Array.new(n, 0)}
  (0..(n-1)).each do |h|
    (0..(n-1)).each do |w|
      pos_c = p[h] - 1
      pos_d = p[w] - 1
      z[h][w] = y[pos_c][pos_d]
    end
  end
  if x == z
    puts "Yes"
    exit
  end
end
puts "No"