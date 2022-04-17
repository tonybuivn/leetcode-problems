# frozen_string_literal: true

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  res = []
  i = 1
  while i <= n
    if (i % 15).zero?
      res << 'FizzBuzz'
    elsif (i % 5).zero?
      res << 'Buzz'
    elsif (i % 3).zero?
      res << 'Fizz'
    else
      res << i.to_s
    end
    i += 1
  end

  res
end

def fizz_buzz_v2(n)
  res = []
  i = 1
  fizz = 0
  buzz = 0
  while i <= n
    fizz += 1
    buzz += 1
    if fizz == 3 && buzz == 5
      res << 'FizzBuzz'
      fizz = 0
      buzz = 0
    elsif fizz == 3
      res << 'Fizz'
      fizz = 0
    elsif buzz == 5
      res << 'Buzz'
      buzz = 0
    else
      res << i.to_s
    end
    i += 1
  end
  res
end

result = fizz_buzz_v2(15)
result.each { |el| puts el }
