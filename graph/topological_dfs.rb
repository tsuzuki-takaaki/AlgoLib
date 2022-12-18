# topological sort DFS
# トポロジカルソート => 依存関係を含めて全てのnodeを線形で表したいとき
# DAG（閉路のない有向グラフ）の辺が左から右に向くように，頂点を左から右に一列に並べる方法(DAG: directed acyclic graph) => 有向サイクルを含まない
# グラフ G は閉路の無い有向グラフ DAG である <=> グラフ G はトポロジカルソートできる

# 頂点vからたどれる頂点すべてを調べたうえでorderにvが挿入されます。そのため全ての頂点vについて、頂点vからたどれる頂点は必ずorder内でvより手前に来ます。

# 先頭(左)に来るのは入次数が0のnode(並べ方は１通りとは限らない)

# DFS
def dfs(v, list, result, order)
    result[v] = true
    list[v].each do |nex|
        dfs(nex, list, result, order) if !result[nex]
    end
    order << v
end

n, m = gets.split.map(&:to_i)
list = Array.new(n){Array.new}
m.times do |i|
    a ,b = gets.split.map(&:to_i)
    list[a] << b
end
list.map{|x| x.sort!}
result = Array.new(n, false)
order = []
n.times do |j|
    dfs(j, list, result, order) if !result[j]
end
puts order.reverse