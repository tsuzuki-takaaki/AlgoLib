# メモ化再帰 => 再帰の結果をメモ化して同じ再帰を繰り返さないようにする ex: ABC275D, ARC135A

n = gets.to_i
if n == 0
    puts 1
    exit
end
@memo = {} # memo
@memo[0] = 1

def div(x)
    return @memo[x] if @memo[x] # memoがあればその値を返す
    return (@memo[x] = div(x/2) + div(x/3)) # memoがない場合は再帰してメモ化
end

puts div(n)




# 関数を２つ使う場合
# n = gets.to_i
# if n == 0
#     puts 1
#     exit
# end
# @memo = {} # memo
# @memo[0] = 1

# def div_2(x)
#   l = x/2
#   return @memo[l] if @memo[l] # memoがあればその値を返す
#   return (@memo[l] = div_2(l) + div_3(l)) # memoがない場合は再帰してその値をメモ化
# end

# def div_3(x)
#     l = x / 3
#     return @memo[l] if @memo[l]
#     return (@memo[l] = div_2(l) + div_3(l))
# end

# puts div_2(n) + div_3(n)
