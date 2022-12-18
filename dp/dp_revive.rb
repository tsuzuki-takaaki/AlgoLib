# dpの遷移を復元(ABC271D)
n, s = gets.split.map(&:to_i)
ab = n.times.map{gets.split.map(&:to_i)}
dp = Array.new(n+1){Array.new(s+1, false)}
dp[0][0] = true
(n+1).times do |i|
    next if i == 0
    a, b = ab[i-1]
    (s+1).times do |j|
        if a <= j
            dp[i][j] = true if dp[i-1][j-a]
        end
        if b <= j
            dp[i][j] = true if dp[i-1][j-b]
        end
    end
end
if dp[n][s] == false
    puts "No"
    exit
end

# 復元部分(右下から辿ってくる１つ前の行の答えをpreで更新)
ans = []
pre = s
n.times do |k|
    a_dash, b_dash = ab[n-1-k]
    if dp[n-1-k][pre-a_dash]
        cnd = ab[n-1-k].index(a_dash) == 0 ? "H" : "T"
        pre -= a_dash
    else
        cnd = ab[n-1-k].index(b_dash) == 0 ? "H" : "T"
        pre -= b_dash
    end
    ans << cnd
end
puts "Yes"
puts ans.reverse.join