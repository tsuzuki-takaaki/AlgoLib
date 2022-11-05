# 包除原理
# cf https://twitter.com/psxase5/status/1364915044492873729
# cf https://atcoder.jp/contests/math-and-algorithm/tasks/math_and_algorithm_be
# cf http://blog.livedoor.jp/ddrerizayoi/archives/45470195.html


# ex: l以上r以下の数でarrに含まれるいずれの倍数でも割り切れないものの数
l, r = gets.split.map(&:to_i)
m = gets.to_i
arr = gets.split.map(&:to_i)

# a: 1以上r以下の数でarrのいずれかで割り切れるものの個数, b: 1以上l以下の数でarrのいずれかで割り切れるものの個数
a, b = 0, 0

m.times do |c|
    c += 1
    arr.combination(c).each do |comb_1|
    comb_1 = comb_1.inject(&:lcm)
    # 奇数個の組み合わせの場合は足す,偶数は引く
    if c.odd?
        a += r / comb_1
        b += l / comb_1
    else
        a -= r / comb_1
        b -= l / comb_1
    end
  end
end

c = l - b
ans = r - a - c
puts ans == 0 ? ans : ans + 1