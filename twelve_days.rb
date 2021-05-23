require 'humanize'
require "hundredth"
require 'byebug'

class TwelveDays
  FIRST_LINE = "day of Christmas my true love gave to me:" 
  WORDS = [
    "Drummers Drumming",
    "Pipers Piping",
    "Lords-a-Leaping",
    "Ladies Dancing",
    "Maids-a-Milking",
    "Swans-a-Swimming",
    "Geese-a-Laying",
    "Gold Rings",
    "Calling Birds",
    "French Hens",
    "Turtle Doves",
    "a Partridge in a Pear Tree"
  ]
  def self.song
    WORDS.reverse.each_with_index.inject([]) do |acc, (el, index)|
      if (index < WORDS.size)
        if acc[-1] == nil
          previous_line = ""
          acc << ("#{el}.")
        elsif (index == 1)
          previous_line = "and #{acc[-1]}"
          acc << ("#{(index + 1).humanize} #{el}, #{previous_line}")
        else
          previous_line = acc[-1]
          acc << ("#{(index + 1).humanize} #{el}, #{previous_line}")
        end
        # acc << (previous_line + "On the #{Hundredth.ordinal(index + 1)} #{FIRST_LINE} #{(index + 1).humanize} #{el}.")
        acc
      end
    end.each_with_index.inject([]) do |acc, (el, index)|
      acc << "On the #{Hundredth.ordinal(index + 1)} #{FIRST_LINE} #{el}"
      acc
    end.join("\n\n")
  end
end
