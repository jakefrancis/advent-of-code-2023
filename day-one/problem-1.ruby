
def isInt?(val)
    Integer(val)
    true
rescue
    false
end

def extract_numbers(line)
    chars = line
    # left right pointers
    l = 0
    r = chars.length - 1

    # left right digits
    ld = nil
    rd = nil

    #sweep inward from both sides
    while ld.nil? || rd.nil? do
        ld = chars[l] if ld.nil? && isInt?(chars[l])
        rd = chars[r] if rd.nil? && isInt?(chars[r])

        l += 1
        r -= 1
    end
    num = ld + rd
    num.to_i
end

sum = 0

File.foreach('input.txt') do |line|
    sum += extract_numbers(line.strip)
end

puts sum