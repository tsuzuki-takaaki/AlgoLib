#s = gets.chomp
s = "aabbbaaa"
def run_length(str)
    ans = []
    len = str.length
    cnt = 1
    len.times do |i|
        if str[i] != str[i+1] # 最後の文字に関してstr[i+1]はnilになるからそこも気にしなくてOK
            ans << [str[i], cnt]
            cnt = 1
        else
            cnt += 1
        end
    end
    return ans
end

puts run_length(s).map{|x| x.join(" ")}