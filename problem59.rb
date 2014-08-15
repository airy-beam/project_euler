#Problem 59
#
#Each character on a computer is assigned a unique code and the preferred 
#standard is ASCII (American Standard Code for Information Interchange). 
#For example, uppercase A = 65, asterisk (*) = 42, and lowercase k = 107.
#
#A modern encryption method is to take a text file, convert the bytes to ASCII, 
#then XOR each byte with a given value, taken from a secret key. The advantage 
#with the XOR function is that using the same encryption key on the cipher 
#text, restores the plain text; for example, 65 XOR 42 = 107, then 107 XOR 42 = 65.
#
#For unbreakable encryption, the key is the same length as the plain text 
#message, and the key is made up of random bytes. The user would keep the 
#encrypted message and the encryption key in different locations, and 
#without both "halves", it is impossible to decrypt the message.
#
#Unfortunately, this method is impractical for most users, so the modified 
#method is to use a password as a key. If the password is shorter than the 
#message, which is likely, the key is repeated cyclically throughout the 
#message. The balance for this method is using a sufficiently long password key 
#for security, but short enough to be memorable.
#
#Your task has been made easy, as the encryption key consists of three 
#lower case characters. Using cipher1.txt (right click and 'Save Link/Target As...'), 
#a file containing the encrypted ASCII codes, and the knowledge that the plain 
#text must contain common English words, decrypt the message and find 
#the sum of the ASCII values in the original text.

class String
  
  def decipher(password)
    self.cipher(password)
  end
  
  def cipher(password)
    cipherText = ''
    pass_pos = 0
    self.each_byte do |byte| 
      cipherText << (byte ^ password[pass_pos])
      pass_pos += 1
      if pass_pos > 2 then pass_pos = 0 end
    end
    cipherText
  end
  
end

fcipher = File.new("input/cipher1.txt")
cipher = fcipher.gets.split(/[,]+/)
cipherText = ""
cipher.each { |c| cipherText = cipherText << c.to_i }

alphabet = 'abcdefghijklmnopqrstuvwxyz'
alphabet.scan(/./).each do |p1|
  alphabet.scan(/./).each do |p2|
    alphabet.scan(/./).each do |p3|
      pass = p1 + p2 + p3
      plainText = cipherText.decipher(pass)
      if (!(plainText =~ /[^[:print:]]/) &&
           (plainText.index("the ") ||
            plainText.index("to ") ||
            plainText.index("and ") ||
            plainText.index("is "))) then 
        print plainText, "\n"
        sum = 0
        plainText.each_byte { |byte| sum += byte }
        print sum, "\n"
      end
    end
  end
end
