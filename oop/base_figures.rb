class Point
  
  attr_reader :x, :y
  
  def self.zero
    Point.new 0, 0
  end
  
  def initialize(x, y)
    @x, @y = x, y
  end
  
  def +(other_p)
    Point.new @x + other_p.x, @y + other_p.y
  end
  
  def -(other_p)
    Point.new @x - other_p.x, @y - other_p.y
  end
  
  def to_a
    [@x, @y]
  end
  
end

class PolyLine
  
  def initialize
    @points = []
    puts 'print coordinates, separated by comma.("x1 y1, x2 y2, ...")'
    $stdin.readline.strip.split(',').map do |point|
      p = point.strip.split(' ')
      @points << Point.new(p[0].to_f.round, p[1].to_f.round)
    end
    puts 'print position.("x1 y1")'
    p = $stdin.readline.strip
    @position = Point.new(p[0].to_f.round, p[1].to_f.round)
  end
  
  def move(offset)
    @position = @position + offset 
  end
  
  def draw(surface)
    @points.each_index do |i|
      if (i + 1) < @points.length
	surface.draw_line_a @position + @points[i], @position + @points[i + 1], [0, 0, 0]
      end
    end
  end
  
end

class Line < PolyLine
  
  def initialize
    @points = []
    puts 'print coordinates.("x1 y1, x2 y2")'
    $stdin.readline.strip.split(',').take(2).map do |point|
      p = point.strip.split(' ')
      @points << Point.new(p[0].to_f.round, p[1].to_f.round)
    end
    puts 'print position.("x1 y1")'
    p = $stdin.readline.strip
    @position = Point.new(p[0].to_f.round, p[1].to_f.round)
  end
  
end

class Polygon < PolyLine
  
  def draw(surface)
    @points.each_index do |i|
      if (i + 1) < @points.length
	surface.draw_line_a @position + @points[i], @position + @points[i + 1], [0, 0, 0]
      else
	surface.draw_line_a @position + @points[i], @position + @points[0], [0, 0, 0]
      end
    end
  end
  
end

Editor.add_figure_class(PolyLine)
Editor.add_figure_class(Line)
Editor.add_figure_class(Polygon)
