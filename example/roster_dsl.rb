require 'rubygems'
require 'need'
need{"roster"}
need{"student"}

Roster :Math do
  Student do
    first_name "Drew"
    last_name "Olson"
    age 25
    
    add_to_roster
  end
  
  Student do
    first_name "John"
    last_name "Doe"
    age 17
    
    add_to_roster
  end    

  Student do
    first_name "Jane"
    last_name "Doe"
    age 19
    
    add_to_roster
  end
  
  print_roster
end