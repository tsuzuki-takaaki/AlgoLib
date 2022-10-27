#cf1 #アルファベットのn文字後ろの文字(zまで行ったら周回する) => ABC232B
# 基本的にaからの距離を基準に考えればいい
s = "z"
n = 12
i = (s.ord - "a".ord + n) % 26 + "a".ord
puts i.chr


# cf2 ABC227A