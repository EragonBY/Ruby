#!/usr/bin/ruby

require 'io/console'

states = [["/_\\  o o  /_\\",
           " |___|_|___| ",
           "  /\\/   \\/\\  "],
          
          ["\\_/  0 0  \\_/",
           " |___|_|___| ",
           "  \\/\\   /\\/  "]]

Signal.trap("INT") do
  states[0][0].gsub! 'o', '^'
  states[1][0].gsub! '0', '^'
end
csize = states.flatten.inject(0){ |max, string| (string.length > max) ?  string.length : max }
limit = csize
winsize = IO.console.winsize[1]

loop do
  (winsize-1).times do |i|
    system "clear"
    limit-=1 if i>=(winsize-csize)
     
    puts "\n\n\n",
       states[i % 2][0][limit,csize] + (" "*(i-csize+limit)) + states[i % 2][0][0,limit],
       states[i % 2][1][limit,csize] + (" "*(i-csize+limit)) + states[i % 2][1][0,limit],
       states[i % 2][2][limit,csize] + (" "*(i-csize+limit)) + states[i % 2][2][0,limit]

    sleep 0.07
  end
  limit=csize
end
