require "idle-gc"

class MyApp
  def initialize
    IdleGC.start # Run garbage collection while idle
  end

  def main
    # Your code here.
    10.times do |n|
      puts "(#{n}) Hello world! The current time is #{Time.utc.to_rfc3339(fraction_digits: 9)}"
      sleep(1.seconds)
    end
  end
end

MyApp.new.main
