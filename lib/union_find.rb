class Node # parent, rankプロパティを持つオブジェクト(rankは木の高さ(初期値はとりあえず0にしてあるけど1でもいい ))
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

uf = UnionFind.new(4) # node数ではなく最終node
puts uf.parents
uf.unite(1, 3)
puts uf.parents