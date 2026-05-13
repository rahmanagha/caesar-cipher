def shift_letter(character, key)
  sum = character.downcase.ord + key
  result = if sum > 'z'.ord
             (sum - 'z'.ord + 'a'.ord - 1).chr
           elsif sum < 'a'.ord
             (sum - 'a'.ord + 'z'.ord + 1).chr
           else
             sum.chr
           end
  return result.upcase if uppercase?(character)

  result
end

def valid_inputs?(string, key)
  return true if string.is_a?(String) && key.is_a?(Integer)

  puts 'Wrong input!'
  false
end

def uppercase?(character)
  character == character.upcase
end

def alphabetic?(character)
  character.ord.between?(65, 90) || character.ord.between?(97, 122)
end

def caesar_cipher(string, key)
  result = ''
  return unless valid_inputs?(string, key)

  effective_key = key.remainder(26)
  string.each_char do |character|
    result << if alphabetic?(character)
                shift_letter(character, effective_key)
              else
                character
              end
  end
  result
end
