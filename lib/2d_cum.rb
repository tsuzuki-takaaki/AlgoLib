# 二次元の累積和
# cf https://qiita.com/drken/items/56a6b68edef8fc605821#4-%E4%BA%8C%E6%AC%A1%E5%85%83%E7%B4%AF%E7%A9%8D%E5%92%8C
# cf https://qiita.com/convexineq/items/afc84dfb9ee4ec4a67d5
# cf https://atcoder.jp/contests/joisc2007/tasks/joisc2007_mall

# 累積和を使った面積計算(cumは累積和をもつ二次元のgrid, is => iのstart, ie => iのend, jも同様)
def calc_cum(cum, is, ie, js, je) # 順番気をつける
    if is == 0 && js == 0
        return cum[ie][je]
    elsif is == 0
        return cum[ie][je] - cum[ie][js-1]
    elsif js == 0
        return cum[ie][je] - cum[is-1][je]
    else
        return cum[ie][je] - cum[is-1][je] - cum[ie][js-1] + cum[is-1][js-1]
    end
end


grid = [
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1],
    [1, 1, 1, 1, 1]
]
h, w = 4, 5
grid_dash = Array.new(h){Array.new(w, 0)}
# 横に累積和
h.times do |i|
    w.times do |j|
        grid_dash[i][j] += grid[i][j] if j == 0
        grid_dash[i][j] += grid_dash[i][j-1] + grid[i][j] if j != 0
    end
end
# 縦に累積和
w.times do |k|
    h.times do |l|
        grid_dash[l][k] += grid_dash[l-1][k] if l != 0
    end
end
puts grid.map{|x| x.join(" ")} # 異なるオブジェクト
puts "#"
puts grid_dash.map{|x| x.join(" ")}