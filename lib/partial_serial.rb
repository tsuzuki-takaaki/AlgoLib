# 部分列をいくつ含むか(ex: https://atcoder.jp/contests/joi2009ho/tasks/joi2009ho_a)
# => 単純にシミュレーションするだけ

n = gets.to_i
l = gets.to_i
str = gets.chomp
la = str[-1]
str += la　# 最後は必ず異なるようにする
flg = false # 一個前がIならtrue
arr = []　# 前後が異なる部分列の数を格納
cnt = 0
(l+1).times do |i|
    if str[i] == "I"
        if flg # Iが連続して終了する場合
            arr << cnt
            cnt = 1
        else
            cnt += 1
        end
        flg = true
    else
        if flg
            cnt += 1
        else # Oが連続して終了する場合
            arr << cnt
            cnt = 0
        end
        flg = false
    end
end
ans = 0
n_dash = n + 1
arr.each do |a|
    if a.odd? # 奇数の場合はIで終わる
        b = a / 2 + 1
    else　# 偶数の場合はOで終わる
        b = a / 2
    end
    ans += b - n_dash + 1 if b >= n+1
end
puts ans