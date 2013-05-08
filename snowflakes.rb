class Snowflake
  attr_accessor :startx, :starty
  
  def initialize(app, startx, starty)
    @app = app
    @startx = startx
    @starty = starty
  end
  
  def flake
    @app.oval(startx, starty, 10, 10).style(:fill => "rgb(240, 248, 255)", :stroke => "rgb(240, 248, 255)")
  end
  
  def fall
    @shape = self.flake
    
    @app.animate(24) do |i|
      @shape.top += rand(3)
    end
  
    @move_right = @app.animate(24) do |i|
      @move_left.stop
      @shape.left += 5
      if @shape.left > (self.startx + rand(200))
        @move_right.stop
        @move_left.start
      end
    
      if @shape.top > 400
        @shape.top = 0
      end
    end
  
    @move_left = @app.animate(24) do |i|
      @shape.left -= 5
      if @shape.left < (self.startx - rand(200))
        @move_left.stop
        @move_right.start
      end
    end
    
  end
 
end
 
Shoes.app :height => 400, :width => 800 do
  background black
  3.times do  
    20.times do
      f = Snowflake.new(self, rand(800), 0)
      f.fall
    end
  end
    
end
