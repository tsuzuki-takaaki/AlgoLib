# Depth First Search(連結判定)

# 単純な隣接リストの作り方 Array.new(n){Array.new} or Array.new(n){[]} でループ回す

#　隣接リスト
# list = [
#     [1],
#     [0, 2, 4],
#     [1, 3],
#     [2],
#     [1, 6],
#     [6, 8],
#     [4, 5, 7],
#     [6, 9],
#     [5],
#     [7]
# ]

# 有向グラフの場合はlistの片方に追加、無向グラフの場合は両方に追加
list = [
    [1, 3],
    [0, 2 ,4],
    [1],
    [0, 4],
    [1, 3]
]

result = Array.new(list.size, false)

# 2. with Recursion(再帰で実装)
def dfs(v, list, result) # 引数として基準node(stack実装でいう[z]), 隣接リスト, resultを渡す
    result[v] = true # ここ割とポイント
    list[v].each do |nex|
        if result[nex] == false
            dfs(nex, list, result)
        end
    end
end


dfs(0, list, result) # 第1引数には始点のnodeを渡す
puts result.all?{|x| x == true} ? "connected" : "not connected" #判定(全てtrueであればconnected)