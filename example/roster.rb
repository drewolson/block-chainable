require 'rubygems'
require 'need'
need{"../lib/block_chainable"}

class Roster
  include BlockChainable
  
  def initialize(subject)
    @subject = subject
    @students = []
  end
  
  def add_student_to_class student
    @students << student
  end
  
  def print_roster
    puts "Roster for #{@subject}:"
    @students.each{|s| puts "  #{s}"}
  end
end