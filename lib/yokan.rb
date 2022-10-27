# 最小値の最大化 or 最大値の最小化は二分探索で解けることが多いの例
# これは最小値の最大化

n, l = gets.split.map(&:to_i)
k = gets.to_i
a = gets.split.map(&:to_i)

# 最大値候補がk+1個作ることができるか
def judge(mid, n, l, a, k)
    cnt, pre = 0, 0
    n.times do |i|
        if a[i] - pre >= mid # 満たさない場合は切れ込みを入れない(満たして初めて切れ込みを入れる（貪欲法)
            cnt += 1
            pre = a[i]
        end
    end
    cnt += 1 if l - pre >= mid
    return cnt >= k+1
end

# leftは達成可能　rightは達成不可能
# 最大値の探索
left, right = -1, l+1 #　最終的に距離１まで端点を寄せるから初期値は割となんでもオッケーでよりバグが出ないようにする設定
while right - left > 1
    mid = left+((right-left)/2)
    if judge(mid, n, l, a, k) # 可能であれば左端点をmidまで寄せてまた二分探索
        left = mid
    else
        right = mid # 不可能であれば右端点をmidまで寄せてまた二分探索
    end
end
puts left