# timestamp

# output -> node nodeを最初に発見した時刻 そのnodeの隣接リストを探索し終わった時刻

list = [
    [1, 2],
    [2, 3],
    [4],
    [5],
    [5],
    [],
]

# list = [
#     [1],
#     [3],
#     [],
#     [2],
# ]

n = list.size
result = Array.new(n, false) # 到達したかどうかの配列

@ans = Array.new(n) {Array.new(2, 0)} # 最終的な出力
@cnt = 1 # timestamp

def dfs(v, list, result)
    result[v] = true
    @ans[v][0] = @cnt
    @cnt += 1                           # インクリメントのタイミングがポイント

    list[v].each do |nex|
        if result[nex] == false
            dfs(nex, list, result)
        end
    end

    @ans[v][1] = @cnt
    @cnt += 1
end

# 連結していない場合のためのループ
n.times do |j|
    if result[j] == false
        dfs(j, list, result)
    end
end

# 結果の出力
n.times do |i|
    s, t = @ans[i]
    puts [i, s, t].join(" ")
end