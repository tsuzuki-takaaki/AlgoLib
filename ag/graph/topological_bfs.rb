# topological sort BFS

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
puts order.reverse.join(" ")