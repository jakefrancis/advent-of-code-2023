num_strings = %w(one two three four five six seven eight nine ten)

num_hash = num_strings.inject({
    cur_index: 1
}) do | hash, item |
    hash[item] = hash[:cur_index].to_s
    hash[:cur_index] += 1
    hash
end

first_hash = num_strings.inject({}) do | hash, item |
    hash[item[0]] = true
    hash
end

def isInt?(val)
    Integer(val)
    true
rescue
    false
end

def parse_nums(str, num_hash, first_hash)
    min = nil
    max = nil

    chars = str
    
    cur_index = 0

    while cur_index <= chars.length
        char = chars[cur_index]
        min = char if min.nil? && isInt?(char)
        max = char if isInt?(char)

        if first_hash[char]
            for i in 3..5
                word = chars.slice(cur_index, i)

                min = num_hash[word] if min.nil? && num_hash.has_key?(word)
                max = num_hash[word] if num_hash.has_key?(word)
            end
        end
        cur_index += 1
    end
    val = min + max
    val.to_i
end

sum = 0

File.foreach('input.txt') do |line|
  sum += parse_nums(line.strip, num_hash, first_hash)
end

puts sum

