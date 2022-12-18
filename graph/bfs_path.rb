# 経路復元(nodexからnodeyまでの単純パスの経路を復元)
# 自分の親nodeを配列として持っておくのがポイント(union findとかと同じ原理(グラフ理論全体を通して言えることかも))

n, x, y = gets.split.map(&:to_i)
x -= 1
y -= 1
list = Array.new(n){Array.new}
(n-1).times do |i|
    p, q = gets.split.map(&:to_i)
    p -= 1
    q -= 1
    list[p] << q
    list[q] << p
end
dist = Array.new(n, -1)
dist[x] = 0
pre = Array.new(n, 0)
queue = []
queue << x
while queue.size >= 1
    v = queue.shift
    list[v].each do |nex|
        if dist[nex] == -1
            dist[nex] = dist[v] + 1
            pre[nex] = v
            queue << nex
        end
    end
end
ans = []
ans << y + 1
s = pre[y]
while true
    ans << s + 1
    break if s == x
    s = pre[s]
end
puts ans.reverse.join(" ")

# sample

# 6 1 2
# 3 1
# 2 5
# 1 2
# 4 1
# 2 6
