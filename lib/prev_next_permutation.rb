# 与えられた順列の、辞書順におけるの1つ前の順列を返す(cf: https://atcoder.jp/contests/abc276/editorial/5161)
# 与えられた純烈の、辞書順における1つ後ろの順列を返す

class Array

    def prev_permutation
        index = nil
        length = self.size
        (length-1).times do |i|
            index = i if self[i] > self[i+1]      # 1番後ろのa[i] > a[i+1]になっているiを特定
        end
        return -1 if index.nil?  # a[i] > a[i+1]になっているところがどこにもなかった場合は既に先頭の順列であるため-1を返す
        arr = self[index+1..]
        max_element = arr.select{|x| x < self[index]}.max # indexより先の要素のうちindexよりも小さいが最も大きいものを特定する
        idx = self.index(max_element)
        self[index], self[idx] = self[idx], self[index] # スワッピング
        self[index+1..] = self[index+1..].sort.reverse # そこより先を降順にする
        return self
    end

    def next_permutation
        index = nil
        length = self.size
        (length-1).times do |j|
            index = j if self[j] < self[j+1]
        end
        return -1 if index.nil?
        arr = self[index+1..]
        min_element = arr.select{|y| y > self[index]}.min
        idx = self.index(min_element)
        self[index], self[idx] = self[idx], self[index]
        self[index+1..] = self[index+1..].sort
        return self
    end

end