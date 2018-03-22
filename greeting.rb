greet = ARGV.shift
    ARGV.each do |arg|
        puts  "#{greet} #{arg}"
    end
#Spent 30 minutes troubleshooting to realize I put the above in a function and when doing the test ruby greeting.rb ____ commands it wasn't returning anything. Because I'm not calling the function. Fun times.