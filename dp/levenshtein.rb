# レーベンシュタイン距離（文字列をどれだけ編集すれば一致するのか(削除・挿入・置換のいずれか))
# sのi文字目まででtのｊ文字目までを一致させる（足りない場合は挿入,足りすぎてる場合は削除)

s = gets.chomp
t = gets.chomp
l_s, l_t = s.length, t.length
dp = Array.new(l_s+1){Array.new(l_t+1, 10**12)}
dp[0][0] = 0
(l_s+1).times do |i|
    (l_t+1).times do |j|
        t_s, t_t = s[i-1], t[j-1]
        next if i == 0 && j == 0
        if i == 0
            dp[i][j] = dp[i][j-1] + 1
        elsif j == 0
            dp[i][j] = dp[i-1][j] + 1
        else
            if t_s == t_t
                dp[i][j] = [dp[i-1][j-1], dp[i-1][j] + 1, dp[i][j-1] + 1].min
            else
                dp[i][j] = [dp[i-1][j-1] + 1, dp[i-1][j] + 1, dp[i][j-1] + 1].min
            end
        end
    end
end
#puts dp.map{|x| x.join(" ")}
puts dp[l_s][l_t]