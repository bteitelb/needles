# find . -type f -print0 | xargs -0 grep -l 'needle' 

require 'fileutils'
require 'securerandom'

ROOT = "haystacks"

needle_locations = {
  'n' => 1, 
  'i' => 4, 
  'c' => 9, 
  'e' => 16, 
  'j' => 25, 
  'o' => 36, 
  'b' => 49
}

(0..99).each do |number|
  ('a'..'z').each do |letter|
    dir =  "./#{ROOT}/#{number}/#{letter}"
    FileUtils.mkdir_p dir
    File.open("#{dir}/haystack", 'w') do |file| 
      junk = SecureRandom.hex(rand(20) + 5)
      if needle_locations[letter] == number
        junk.insert(rand(junk.length), 'needle')        
      end
      file.write(junk)
    end
  end
end
