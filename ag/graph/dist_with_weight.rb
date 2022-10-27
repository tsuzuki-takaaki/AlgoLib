# 重み付き最短経路 (h, wの地図, [s,t]を始点として, [e,f]を終点とする)(ダイクストラ？)
# 一つのnodeが４方向を保つため3次元配列で表される

h, w = gets.split.map(&:to_i)
s, t = gets.split.map(&:to_i)
e, f = gets.split.map(&:to_i)
grid = h.times.map{gets.chomp}
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]
dist = Array.new(h){Array.new(w){Array.new(4, 10**12)}}
queue = []
4.times do |i|
    dist[s-1][t-1][i] = 0
    queue << [s-1, t-1, i]
end
while queue.size >= 1
    v = queue.shift
    4.times do |j|
        nx, ny = v[0] + dx[j], v[1] + dy[j]
        cost = dist[v[0]][v[1]][v[2]] + (v[2] == j ? 0 : 1)
        if nx.between?(0, h-1) && ny.between?(0, w-1) && grid[nx][ny] == "." && dist[nx][ny][j] > cost
            dist[nx][ny][j] = cost
            queue << [nx, ny, j]
        end
    end
end
ans = []
4.times do |k|
    ans << dist[e-1][f-1][k]
end
puts ans.min

# sample tenkei43
# 4 6
# 2 1
# 1 5
# ...#..
# .#.##.
# .#....
# ...##.
