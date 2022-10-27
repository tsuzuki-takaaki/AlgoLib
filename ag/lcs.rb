s = "ABCDCE"
t = "ACCDEX"
# s = gets.chomp.chars    #配列の方が文字列よりも圧倒的に速い
# t = gets.chomp.chars
l_s, l_t = s.length, t.length
dp = Array.new(l_s+1) {Array.new(l_t+1, 0)}
l_s.times do |i|
  l_t.times do |j|
    if s[i] == t[j]
      dp[i+1][j+1] = dp[i][j] + 1
    else
      dp[i+1][j+1] = [dp[i][j+1], dp[i+1][j]].max
    end
  end
end
puts dp.map{|x| x.join(" ")}

# 復元
ans = []
while l_s > 0 && l_t > 0
    if s[l_s-1] == t[l_t-1]
        ans.unshift(s[l_s-1])
        l_s -= 1
        l_t -= 1
    elsif dp[l_s][l_t] == dp[l_s-1][l_t]
        l_s -= 1
    else
        l_t -= 1
    end
end
puts ans.join(" ")