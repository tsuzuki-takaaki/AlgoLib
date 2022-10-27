# エラトステネスの篩
# n以下の素数を(nlogn)で求める
n = gets.to_i
arr = Array.new(n+1, false)
sos = []
(Math.sqrt(n+1).floor).times do |i|
    arr[i] = true if i == 0 || i == 1 
    if !arr[i]
        c = 2
        while i * c <= n
            arr[i*c] = true
            c += 1
        end
    end 
end
n.times do |j|
    sos << j if !arr[j]
end
puts sos.size


# ライブラリ使った場合
require 'prime'
sos_l = Prime.each(n).to_a
puts sos_l.size

# cf
# 調和級数 => logeN