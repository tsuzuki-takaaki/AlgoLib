# Counter Clock Wise
def ccw(p0x, p0y, p1x, p1y, p2x, p2y)
    dx1 = p1x - p0x
    dy1 = p1y - p0y
    dx2 = p2x - p0x
    dy2 = p2y - p0y
    
end


# 座標(a, b)を反時計回りにd度回転させた座標
def rotate(a, b, d)
    s = a * Math.cos(Math::PI * d / 180) - b * Math.sin(Math::PI * d / 180)
    t = a * Math.sin(Math::PI * d / 180) + b * Math.cos(Math::PI * d / 180)
    return [s, t]
end