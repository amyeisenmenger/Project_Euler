require 'pry'
require 'prime'
# project Euler
# 4: largest palindrome project
# A palindromic number reads the same both ways. 
# The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.

# Find the largest palindrome made from the product of two 3-digit numbers.
def find_largest_palindrome_of_three_digit_numbers
  @largest_product = 0
  999.downto(100).each do |number|
    999.downto(100).each do |second_number|
      product = (number * second_number).to_s
      # puts product
      if product[0] == product[-1] && product[1] == product[-2] && product[2] == product[-3]
        if product.to_i >@largest_product
          @largest_product = product.to_i
          # puts "factors are #{number} and #{second_number}"
        end
      end
    end
  end
  puts @largest_product
end

# Problem 5: smallest multiple
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 
# without any remainder.

# What is the smallest positive number that is evenly divisible by 
# all of the numbers from 1 to 20?

def lcd_of_one_to_number(number)
  lcd = 1
  Prime.each(number) do |prime|
    value = prime
    while value < number
      if value * prime > number
        lcd = lcd * value
        break
      else
        value = value * prime
      end
    end
  end
  puts lcd
end

# Problem 6:
# Sum square difference
# The sum of the squares of the first ten natural numbers is,

# 1**2 + 2**2 + ... + 10**2 = 385
# The square of the sum of the first ten natural numbers is,

# (1 + 2 + ... + 10)**2 = 55**2 = 3025
# Hence the difference between the sum of the squares of the first
#  ten natural numbers and the square of the sum is 3025 − 385 = 2640.

# Find the difference between the sum of the squares of the first one hundred
#  natural numbers and the square of the sum.
def sum_square_difference(num1, num2)
  square_this_sum = 0
  sum_of_squares = 0
  (num1..num2).each do |number|
    sum_of_squares += number**2
    square_this_sum += number
  end
  puts square_this_sum**2 - sum_of_squares
end

