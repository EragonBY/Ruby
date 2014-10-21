class Ellipse < Rectangle
  
  def draw(screen)
    d = @points[2] - @points[0]
    center = [@position.x + (@points[0].x + (d.x / 2)), (@position.y + @points[0].y + (d.y / 2))]
    radii = [(d.x / 2), (d.y / 2)]
    screen.draw_ellipse_a(center, radii, [0, 0, 0])
  end
  
end

class Circle < Ellipse
  
  def initialize
    @points = []
    puts 'print coordinates of center and diameter.("x1 y1, d")'
    args = $stdin.readline.strip.split(',')
    p = Point.new(args[0].strip.split(' ')[0].strip.to_f.round, args[0].strip.split(' ')[1].strip.to_f.round)
    d = args[1].strip.to_f.round
    @points = [p, Point.new(p.x + d, p.y), Point.new(p.x + d, p.y + d), Point.new(p.x, p.y + d)]
    puts 'print position.("x1 y1")'
    p = $stdin.readline.strip
    @position = Point.new(p[0].to_f.round, p[1].to_f.round)
  end
  
end

Editor.add_figure_class(Ellipse)
Editor.add_figure_class(Circle)
