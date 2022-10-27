# 周期性を求める => arrにおいて既にtrueになっているところに到達したらそれが周期
#     |¯¯¯¯|
# ____|____|_________  こんな感じではみ出してるところがあるからそこに注意

### tenkei90 58
n, k = gets.split.map(&:to_i)
arr = Array.new(10**5, -1)
mod = 10**5
arr[n] = 0
cnt = 0
k.times do |i|
    cnt += 1
    n = (n + n.to_s.chars.map(&:to_i).sum) % mod
    if arr[n] != -1
        break
    else
        arr[n] = cnt
    end
end
c = cnt - arr[n]
if c == 0
    c = k
end
t = (k - cnt) % c
t.times do |j|
    n = (n + n.to_s.chars.map(&:to_i).sum) % mod
end
puts n