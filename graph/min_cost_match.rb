# 最小コスト弾性マッチング(それ以前のやつとマッチングしない => 図に表したときに交差する線が存在しない)

n, m = gets.split.map(&:to_i)
cos = n.times.map{gets.split.map(&:to_i)}
dp = Array.new(n+1){Array.new(m+1, 0)}
(n+1).times do |i|
  next if i == 0
  (m+1).times do |j|
    next if j == 0
    c = cos[i-1][j-1]
    if i == 1
      dp[i][j] = dp[i][j-1]+c
    elsif j == 1
      dp[i][j] = dp[i-1][j]+c
    else
      dp[i][j] = [dp[i][j-1], dp[i-1][j], dp[i-1][j-1]].min + c
    end
  end
end
puts dp[n][m]