# 二部グラフのグラフ彩色(0 or 1)
n = gets.to_i # n頂点
list = Array.new(n){Array.new}
(n-1).times do |i|
    a, b = gets.split.map(&:to_i)
    a -= 1
    b -= 1
    list[a] << b
    list[b] << a
end
col = Array.new(n, -1)
def dfs(v, col, list, c) #cは頂点の色
    col[v] = c
    list[v].each do |nex|
        dfs(nex, col, list, 1-c) if col[nex] == -1
    end
end
dfs(0, col, list, 0) #　最初の頂点の色は1でも0でもOK
puts col.join(" ")