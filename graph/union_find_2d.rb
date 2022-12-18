# 二次元平面でのunion find(Tenkei90 => 12)

# 基本的に二次元をハッシュ化して一次元にすればOK
class Node # parent, rankプロパティを持つオブジェクト(rankは木の高さ(初期値はとりあえず0にしてあるけど1でもいい))
    attr_accessor :parent, :rank
    def initialize(n)
        @parent = n
        @rank = 0
    end
end
  
class UnionFind
    def initialize(n)
        @nodes = (0..n).to_a.map { |i| Node.new(i) }
    end
    
    # どの素集合に属するか
    def find(x)
        return x if @nodes[x].parent == x
        return @nodes[x].parent = find(@nodes[x].parent)
    end
  
    # 連結
    def unite(a, b)
        par_a = find(a)
        par_b = find(b)
        return if par_a == par_b
        if @nodes[par_a].rank < @nodes[par_b].rank
            @nodes[par_a].parent = par_b
        else
            @nodes[par_b].parent = par_a
            @nodes[par_a].rank += 1 if @nodes[par_a].rank == @nodes[par_b].rank # uniteする木同士の高さが同じだと高さは1大きくなる
        end
    end
  
    # 同じ素集合に属するかの判定
    def same(a, b)
        return find(a) == find(b)
    end

    # 各々の素集合を返す(root)
    def parents
        l = @nodes.length
        # 再帰で探索しないと探索しきれてないnodeが出てくる
        l.times do |j|
            find(j)
        end
        return @nodes.map(&:parent)
    end
end

h, w = gets.split.map(&:to_i)
uf = UnionFind.new(h*w)
result = Array.new(h*w)
q = gets.to_i
dx = [-1, 0, 1, 0]
dy = [0, 1, 0, -1]
q.times do |i|
    arr = gets.split.map(&:to_i)
    if arr[0] == 1
        _, x, y = arr
        x -= 1
        y -= 1
        node = w*x+y # ここでハッシュ化してる
        result[node] = true
        4.times do |k|
            px, py = x + dx[k], y + dy[k]
            next if px < 0 || px >= h || py < 0 || py >= w
            node_b = w*px+py
            uf.unite(node, node_b) if result[node_b]
        end
    else
        _, xa, ya, xb, yb = arr
        xa -= 1
        ya -= 1
        xb -= 1
        yb -= 1
        n_a, n_b = w*xa+ya, w*xb+yb
        if result[n_a] && result[n_b] && uf.same(n_a, n_b)
            puts "Yes"
        else
            puts "No"
        end
    end
end