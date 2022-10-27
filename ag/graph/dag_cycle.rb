# 有向グラフのサイクル判定 => トポロジカルソートを使って判定できる

# DFS
# 配列finishedを(帰りがけ順)にtrueしていく => 既にtrueになっているところがあったらサイクルしてる
# 具体値で考えた方がわかりやすい(nodeが４つのグラフとか)

def dfs(v, list, result, finished)
    result[v] = true
    list[v].each do |nex|
        if result[nex]
            if !finished[nex]
                puts "Yes"
                exit
            end
        else
            dfs(nex, list, result, finished)
        end
    end
    finished[v] = true
end

n, m = gets.split.map(&:to_i)
list = Array.new(n){Array.new}
m.times do |i|
    a ,b = gets.split.map(&:to_i)
    list[a] << b
end
list.map{|x| x.sort!}
result = Array.new(n, false)
finished = Array.new(n, false)
n.times do |j|
    dfs(j, list, result, finished) if !result[j]
end
puts "No"

# BFS
n, m = gets.split.map(&:to_i)
order = []
deg = Array.new(n, 0) # 出次数を記録する配列 出次数が0のnodeをシンクという
list = Array.new(n){Array.new}
m.times do |i|
    a, b = gets.split.map(&:to_i)
    list[b] << a                 # 終点のnodeのarrayに始点nodeを追加
    deg[a] += 1
end
list.map{|x| x.sort!}
queue = []
n.times do |j|
    queue << j if deg[j] == 0
end
while queue.size >= 1
    v = queue.shift
    order << v
    list[v].each do |nex|          # vを終点とする始点を探索
        deg[nex] -= 1
        queue << nex if deg[nex] == 0
    end
end
puts order.size == n ? "No" : "Yes"