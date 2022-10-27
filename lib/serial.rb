# 連続する最長の列の長さ Ex[1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 1]の連続の最長
# cf https://atcoder.jp/contests/abc229/tasks/abc229_d, https://atcoder.jp/contests/joi2007ho/tasks/joi2007ho_b

#　累積和における最初の0は区間が0~7の場合cum[7] - cum[-1]みたいにバクラせないようにするため
# 229
# arr = [0, 0, 1, 1, 1, 0, 1, 0, 1, 0, 1]
#      [|  |  |  |  |  |  |  |  |  |  |  |] 仕切りを入れる
# cum=[0, 0, 0, 1, 2, 3, 3, 4, 4, 5, 5, 6]で考えるとわかりやすい

s = gets.chomp.chars.map{|x| x.tr(".X", "10")}.map(&:to_i)
k = gets.to_i
cum = [0]                       #こいつ肝
l = s.length
l.times do |i|
    cum << cum[i] + s[i]
end
ans = []
l.times do |j|
    t = cum[j]
    ind = cum.bsearch_index{|x| k < x - t}
    if ind.nil?
        ans << l - j
    else
        ans << ind - 1 - j
    end
end
puts ans.max

## 尺取でやった場合
# s = gets.chomp.chars.map{|x| x.tr(".X", "10")}.map(&:to_i)
# k = gets.to_i
# n = s.size
# r, sum = 0, 0
# ans = []
# n.times do |i|
#     while r < n && sum + s[r] <= k
#         sum += s[r]
#         r += 1
#     end
#     ans << r - i
#     sum -= s[i]
# end
# puts ans.max