# imos法(cf https://atcoder.jp/contests/typical90/tasks/typical90_ab)
# 座標をGridに対応させるためpos(出口+１)ではなくpos(出口)に-1すれば整合性がつく

n = gets.to_i
a = 1002
arr = Array.new(a){Array.new(a, 0)}
ans = Array.new(n, 0)
n.times do |i|
    lx, ly, rx, ry = gets.split.map(&:to_i)
    arr[lx][ly] += 1
    arr[lx][ry] -= 1            #　対角の正負を一致させればimosを実現できる
    arr[rx][ly] -= 1
    arr[rx][ry] += 1
end
# 横で累積和
a.times do |p|
    a.times do |q|
        arr[p][q] += arr[p][q-1]
    end
end
# 縦で累積和
a.times do |r|
    a.times do |s|
        arr[s][r] += arr[s-1][r]
        ans[arr[s][r]-1] += 1 if arr[s][r] != 0 #　重なり判定
    end
end

puts ans