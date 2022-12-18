# Counter Clock Wise(反時計回り) cf ABC266C
# 外積 => vec_a = (xa, ya), vec_b = (xb, yb)とするとcross(vec_a　・ vec_b) = xa * yb - xb * ya

# 3点が反時計回りかどうかの判定をする(p0が始点、p1が真ん中,p2が終点)
def ccw(p0x, p0y, p1x, p1y, p2x, p2y)
    dx1 = p0x - p1x
    dy1 = p0y - p1y
    dx2 = p2x - p1x
    dy2 = p2y - p1y
    cross_product = dx1 * dy2 - dx2 * dy1
    return 1 if cross_product < 0 # 反時計回りの場合は１を返す
    return 0 if cross_product == 0 # 同一直線上にある場合は0を返す
    return -1 if cross_product > 0 # 時計回りの場合は-1を返す
end
# puts ccw(1, 2, 4, 5, -5, 8)


# 座標(a, b)を反時計回りにd度回転させた座標
def rotate(a, b, d)
    s = a * Math.cos(Math::PI * d / 180) - b * Math.sin(Math::PI * d / 180)
    t = a * Math.sin(Math::PI * d / 180) + b * Math.cos(Math::PI * d / 180)
    return [s, t]
end