# backtrack(再帰) tenkei72
# ex 同じところを元の位置まで戻ってくる最大の距離

@h, @w = gets.split.map(&:to_i)
@grid = @h.times.map{gets.chomp}

if @h == 1 || @w == 1
    puts -1
    exit
end

@dx = [1, 0, -1, 0]; @dy = [0, 1, 0, -1]
@ans = []

def dfs(x, y, t_x, t_y, cnt, result)
    result[x][y] = true
    cnt += 1
    4.times do |k|
        n_x, n_y = x + @dx[k], y + @dy[k]
        @ans << cnt if n_x == t_x && n_y == t_y
        if n_x.between?(0, @h-1) && n_y.between?(0, @w-1) && @grid[n_x][n_y] == "." && !result[n_x][n_y]
            dfs(n_x, n_y, t_x, t_y, cnt, result)
        end
    end
end

@h.times do |i|
    @w.times do |j|
        result = Array.new(@h) {Array.new(@w, false)}
        # スタート位置をt_x, t_yとして渡すのがポイント
        dfs(i, j, i, j, 0, result) if @grid[i][j] != "#"
    end
end

# @ansの最大値が2の場合は１つ進んでそのまま帰ってきてるから不適
puts @ans.size >= 1 ? @ans.max == 2 ? -1 : @ans.max : -1