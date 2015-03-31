# require 'dispel'
#
# def draw(str)
#   str
# end
#
# Dispel::Screen.open do |screen|
#   string = "Hello world"
#   screen.draw draw(string)
#
#   Dispel::Keyboard.output do |key|
#     case key
#     when :up then string = "Goodbye world!"
#     end
#     screen.draw draw(string)
#   end
# end
