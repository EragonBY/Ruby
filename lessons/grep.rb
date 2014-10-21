#!/usr/bin/ruby

def grep (*arg)

 case arg[0]
    when "-A"
      puts "option = -A"
    when "-R"
      puts "option = -R"
    when "-Z"
      puts "option = -Z"
    when "-G"
      puts "option = -G"
    else
      puts "no one option"
  end

end
puts ARGV.eql?
grep(ARGV[0])
