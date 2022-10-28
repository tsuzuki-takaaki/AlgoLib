# 木の最大独立集合(最大安定集合) ※サイクルを持たない
# 頂点からなる集合のうち、どの2頂点も辺で結ばれていないようなものを安定集合とよび、最大サイズの安定集合を求める問題
# 葉の方から見ていく
# 頂点 v の子頂点がどれか一つでも選ばれているならば、v は選べない (安定集合の定義から隣り合う頂点は選べないため)
# 頂点 v の子頂点がいずれも選ばれていないなら、貪欲に v を選ぶべき


# 安定集合の最大を求める関数
def bfs(chil, par, chn)
    q = []
    deg = Array.new(@n, 0) # deg[i] => 頂点iの子頂点数

    @n.times do |k|
        deg[k] = chil[k].length
        q << k if deg[k] == 0 # 子頂点の数が０の場合,qに入る
    end

    while q.size >= 1
        v = q.shift
        flag = false
        chil[v].each do |child|
            flag = true if chn[child] # もし子頂点が既に選ばれている場合、その頂点は候補から消えるためflagをtrueにする
        end
        chn[v] = !flag

        p = par[v] # 親頂点の子頂点の数をデクリメント
        deg[p] -= 1
        q << p if deg[p] == 0
    end
end

@n = gets.to_i
list = Array.new(@n){Array.new}

(@n-1).times do |i|
    a, b = gets.split.map(&:to_i)
    list[a] << b
    list[b] << a
end

chil = Array.new(@n){Array.new} # 子頂点を格納する二次元配列
par = Array.new(@n, -1) # 親頂点を格納する配列
result = Array.new(@n, false) # 探索済かどうかを持つ配列

# node0を根とみなして考える
queue = []
queue << 0
result[0] = true
par[0] = 0  # node0の親頂点は0

while queue.size >= 1
    v = queue.shift
    list[v].each do |nex|
        if !result[nex]
            result[nex] = true
            chil[v] << nex
            par[nex] = v
            queue << nex
        end
    end
end
# この時点で親node、子nodeが求まる => 安定集合の最大を求める(bfs)
# puts chil.map{|x| x.join(" ")}
# puts par.join(" ")

chn = Array.new(@n, false) # node[i]が最大安定集合の要素として選ばれているかいないかの判定
bfs(chil, par, chn)

ans = 0
@n.times do |j|
    ans += 1 if chn[j]
end
puts ans