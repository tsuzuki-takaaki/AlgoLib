# 正方形をなすベクトル
# 2点の座標が与えられた時のもう２つの座標

# ex: O(xi, yi), P(xj, yj) => Q(qx, qy), R(rx, ry)を求める (反時計回り)

# dx, dy = xj - xi, yj - yi

# Q(qx, qy) = xj - dy, yj + dx
# R(rx, ry) = qx - dx, qy - dy



# ex: (1, 2), (4, 5)
o = [1, 2]
p = [4, 5]

dx, dy = p[0] - o[0], p[1] - o[1]

qx, qy = p[0] - dy, p[1] + dx
rx, ry = qx - dx, qy - dy

puts [qx, qy, rx, ry].join(" ")
