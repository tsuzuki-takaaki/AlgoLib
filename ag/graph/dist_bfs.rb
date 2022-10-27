# 最短経路のbfs (node0から到達できる場合はその最短距離, 到達できない場合は-1)

# 隣接リスト
list = [
    [1, 3],
    [3],
    [],
    [2]
]

d = Array.new(list.size, -1)
d[0] = 0
queue = []
queue << 0

while queue.size >= 1
    v = queue.shift
    list[v].each do |i|
        if d[i] == -1    #初めて到達した時(これが最短経路)
            d[i] = d[v] + 1   # ここがポイント(基準nodeに1加えたもの)
            queue << i
        end
    end
end

(list.size).times do |j|
    puts [j, d[j]].join(" ")
end


# ==> Atcoder ABC 007