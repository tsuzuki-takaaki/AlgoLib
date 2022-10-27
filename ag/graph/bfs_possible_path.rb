# 通れないところなどがある場合のbfs

grid = h.times.map{gets.chomp.chars} # 通れないところとか示す図の入力
dist = Array.new(h) {Array.new(w, -1)}
dist[s-1][t-1] = 0
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]
queue = []
queue << [s-1, t-1]
while queue.size >= 1
    v = queue.shift
    4.times do |i|
        nx, ny = v[0] + dx[i], v[1] + dy[i]
        next if !(nx.between?(0, h-1) && ny.between?(0, w-1))
        if grid[nx][ny] == "." && dist[nx][ny] == -1
            dist[nx][ny] = dist[v[0]][v[1]] + 1
            queue << [nx, ny]
        end
    end
end

puts dist.map{|x| x.join(" ")}