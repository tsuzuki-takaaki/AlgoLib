# Breadth First Search(連結判定)
# with Queue

list = [
    [1, 3],
    [0, 2 ,4],
    [1],
    [0, 4],
    [1, 3]
]

result = Array.new(list.size, false)
result[0] = true

queue = []
queue << 0

while queue.size >= 1
    v = queue.shift
    list[v].each do |nex|
        if result[nex] == false
            result[nex] = true
            queue << nex
        end 
    end
    puts result.join(" ")
end

puts result.all?{|x| x == true} ? "connected" : "not connected"