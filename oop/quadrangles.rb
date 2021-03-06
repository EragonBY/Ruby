class Quadrangle < Polygon
  
  def initialize
    @points = []
    puts 'print coordinates.("x1 y1, x2 y2")'
    $stdin.readline.strip.split(',').take(4).map do |point|
      p = point.strip.split(' ')
      @points << Point.new(p[0].to_f.round, p[1].to_f.round)
    end
    puts 'print position.("x1 y1")'
    p = $stdin.readline.strip
    @position = Point.new(p[0].to_f.round, p[1].to_f.round)
  end
  
end

class Rectangle < Quadrangle
  
  def initialize
    @points = []
    puts 'print coordinates of corners.("x1 y1, x2 y2")'
    pts = $stdin.readline.strip.split(',').take(2).map do |point|
      Point.new point.strip.split(' ')[0].to_f.round, point.strip.split(' ')[1].to_f.round
    end
    @points = [pts[0], Point.new(pts[1].x, pts[0].y), pts[1], Point.new(pts[0].x, pts[1].y)]
    puts 'print position.("x1 y1")'
    p = $stdin.readline.strip
    @position = Point.new(p[0].to_f.round, p[1].to_f.round)
  end
  
end

class Square < Rectangle
  
  def initialize
    @points = []
    puts 'print coordinates of corner and length of an edge.("x1 y1, d")'
    args = $stdin.readline.strip.split(',')
    p = Point.new(args[0].strip.split(' ')[0].strip.to_f.round, args[0].strip.split(' ')[1].strip.to_f.round)
    d = args[1].strip.to_f.round
    @points = [p, Point.new(p.x + d, p.y), Point.new(p.x + d, p.y + d), Point.new(p.x, p.y + d)]
    puts 'print position.("x1 y1")'
    p = $stdin.readline.strip
    @position = Point.new(p[0].to_f.round, p[1].to_f.round)
  end
  
end

Editor.add_figure_class(Quadrangle)
Editor.add_figure_class(Rectangle)
Editor.add_figure_class(Square)
