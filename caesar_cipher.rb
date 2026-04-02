def shift_letter(character_code, key, mode)
  sum = character_code + key
  lower_bound = mode == :upper ? "A".ord : "a".ord
  upper_bound = mode == :upper ? "Z".ord : "z".ord
  if sum > upper_bound
    (sum - upper_bound + lower_bound - 1).chr
  elsif sum < lower_bound
    (sum - lower_bound + upper_bound + 1).chr
  else
    sum.chr
  end
end

def caesar_cipher(string, key) 
  result = ""
  unless string.is_a?(String) && key.is_a?(Integer)
    puts "Wrong input!"
    return
  end
  effective_key = key.remainder(26)
  string.each_char do |character|
    if character.upcase != character.downcase # Check if character is alphabetic
      if character == character.upcase # Check if character is uppercased
        result << shift_letter(character.ord,effective_key,:upper)
      else
        result << shift_letter(character.ord,effective_key,:lower)
      end
    else
      result << character
    end
  end
  result
end
