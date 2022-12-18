# 最長共通部分列(連続) (左斜め上から以外は無理)

s = gets.chomp
t = gets.chomp
l_s, l_t = s.length, t.length
dp = Array.new(l_s+1){Array.new(l_t+1, 0)}
ans = 0
(l_s+1).times do |i|
  next if i == 0
  (l_t+1).times do |j|
    next if j == 0
    if s[i-1] == t[j-1]
      dp[i][j] = dp[i-1][j-1]+1
      ans = [dp[i][j], ans].max
    end
  end
end
puts ans
