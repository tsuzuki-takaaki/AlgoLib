# 木の高さの最小値(木の直径の半分(切り上げ)) => 木の半径

n = gets.to_i
list = Array.new(n){Array.new}
(n-1).times do |i|
    a, b = gets.split.map(&:to_i)
    list[a] << b
    list[b] << a
end

queue = []
queue << 0
dist = Array.new(n, -1)
dist[0] = 0
while queue.size >= 1
    v = queue.shift
    list[v].each do |nex|
        if dist[nex] == -1
            dist[nex] = dist[v] + 1
            queue << nex
        end
    end
end
ind = dist.index(dist.max)
dist_a = Array.new(n, -1)
dist_a[ind] = 0
q = []
q << ind

while q.size >= 1
    v = q.shift
    list[v].each do |nex|
        if dist_a[nex] == -1
            dist_a[nex] = dist_a[v] + 1
            q << nex
        end
    end
end
puts (dist_a.max + 2 - 1) / 2