# Depth First Search(連結判定)
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

list = [
    [1, 3],
    [0, 2 ,4],
    [1],
    [0, 4],
    [1, 3]
]

# 1. with Stack
result = Array.new(list.size, false) # 到達したかどうかの判定
result[0] = true # 開始地点は無条件でtrue

stack = [] #stackの初期化
stack << 0 #初期nodeをstackに追加

#　深さ優先探索
while stack.size >= 1
    v = stack.pop # stackの先頭を取り出す
    list[v].each do |nex| #　取り出されたnodeの隣接リストを探索
        if result[nex] == false
            result[nex] = true
            stack << nex
        end
    end
    puts result.join(" ")
end

puts result.all?{|x| x == true} ? "connected" : "not connected" #判定(全てtrueであればconnected)