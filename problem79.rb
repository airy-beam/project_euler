#Problem 79
#
#A common security method used for online banking is to ask the user for 
#three random characters from a passcode. For example, if the passcode was 
#531278, they may asked for the 2nd, 3rd, and 5th characters; 
#the expected reply would be: 317.
#
#The text file, keylog.txt, contains fifty successful login attempts.
#
#Given that the three characters are always asked for in order, 
#analyse the file so as to determine the shortest possible secret 
#passcode of unknown length.

@@digits =     [ 0, 1, 2, 3, 6, 7, 8, 9 ]
@@digit_took = [ 0, 0, 0, 0, 0, 0, 0, 0 ]
PASS_LEN = 8

def fits(s)
  @@patterns.each do |pattern| 
    pat = ".*"+pattern[0,1]+".*"+pattern[1,1]+".*"+pattern[2,1]+".*"
    r = Regexp.new(pat)
    if !(s =~ r)
      return false
    end
  end
  return true
end

def permute
  if ( @@pass.length == PASS_LEN ) 
    if fits(@@pass) then 
      @@found_pass = @@pass
      @@success = true
    end
  else
    i = 0
    while ( ( !@@success ) && ( i < PASS_LEN ) )
      if ( @@digit_took[i] == 0 )
        @@digit_took[i] = 1
        @@pass = @@pass + @@digits[i].to_s
        permute()
        @@digit_took[i] = 0
        if ( 1 == @@pass.length )
          @@pass = ""
        else
          @@pass = @@pass[0..@@pass.length - 2]
        end
      end
      i += 1    
    end
  end
end

@@patterns = []
fkeylog = File.new("input/keylog.txt")
until fkeylog.eof do
  line = fkeylog.gets
  @@patterns << line[0..2]
end

@@success = false
@@pass = ""

permute()
if (@@success) then
  print @@found_pass, "\n"
else
  print "Password not found"
end

