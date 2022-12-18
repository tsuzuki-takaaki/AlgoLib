# 二部グラフかどうかの判定

# BFS
n, m = gets.split.map(&:to_i)
list = Array.new(n) {Array.new}
m.times do |i|
    a, b = gets.split.map(&:to_i)
    list[a] << b
    list[b] << a
end
col = Array.new(n, -1)
def dfs(v, list, col)
    list[v].each do |nex|
        if col[nex] == -1
            col[nex] = 1 - col[v]
            dfs(nex, list, col)
        else
            if col[nex] == col[v]
                puts "No"
                exit
            end
        end
    end
end
n.times do |j|               # 連結じゃなくてもそれぞれの連結成分が二部グラフなのであれば、全体として二部グラフ
    if col[j] == -1
        col[j] = 1
        dfs(j, list, col)
    end
end
puts "Yes"