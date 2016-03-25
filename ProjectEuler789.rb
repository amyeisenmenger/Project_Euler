require 'prime'
require 'pry'
# Problem 7
# 10001st prime
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
# we can see that the 6th prime is 13.

# What is the 10001st prime number?
# OMG THIS METHOD IS SO SLOW
# Needed to move sqrt.ceil out of the @primes.each loop!
# Still pretty slow though!
# Added in else break (if prime > @sqrt_num )statement, much faster
# does @list_length calculation make it faster?
def find_nth_prime(nth)
  @primes = [2, 3, 5, 7, 11, 13]
  @list_length = 6
  @num = 15
  while @list_length != nth
    @sqrt_num = Math.sqrt(@num).ceil
    count = 0 
    @primes.each do |prime|
      if prime <= @sqrt_num
        if @num % prime == 0 
          count += 1
          break
        end
      else
        break
      end
    end
    if count == 0
      @primes << @num 
      @list_length += 1
    end
    @num += 2
  end
  puts "10001st prime is : #{@primes.last}"
  # puts "Primes list length is: #{@primes.length}"
end
# puts Prime.first(10001).last
# puts @primes_list.length
# find_nth_prime(10001)


# Largest product in a series
# Problem 8
# The four adjacent digits in the 1000-digit number that
#  have the greatest product are 9 × 9 × 8 × 9 = 5832.

@thousand_digit_number = 7316717653133062491922511967442657474235534919493496983520312774506326239578318016984801869478851843858615607891129494954595017379583319528532088055111254069874715852386305071569329096329522744304355766896648950445244523161731856403098711121722383113622298934233803081353362766142828064444866452387493035890729629049156044077239071381051585930796086670172427121883998797908792274921901699720888093776657273330010533678812202354218097512545405947522435258490771167055601360483958644670632441572215539753697817977846174064955149290862569321978468622482839722413756570560574902614079729686524145351004748216637048440319989000889524345065854122758866688116427171479924442928230863465674813919123162824586178664583591245665294765456828489128831426076900422421902267105562632111110937054421750694165896040807198403850962455444362981230987879927244284909188845801561660979191338754992005240636899125607176060588611646710940507754100225698315520005593572972571636269561882670428252483600823257530420752963450

# Find the thirteen adjacent digits in the 1000-digit number
# that have the greatest product. What is the value of this product?
def find_n_adjacent_digits_with_greatest_product(n)
  @greatest_product = 0
  @number_array = []
  @starting_index = 0
  @string_number = @thousand_digit_number.to_s.split('')
  while @string_number.length > n
    @current_product = 1
    @string_number.slice(0, n)
    (0...n).each do |index|
      @current_product = @string_number[index].to_i * @current_product
    end 
    if @current_product > @greatest_product
      @greatest_product = @current_product
      @number_array = @string_number.slice(0, n).each {|num| num.to_i}
    end
    @string_number.shift
  end
  puts "Greatest Product: #{@greatest_product}"
  puts "Adjacent Numbers: #{@number_array}"
end

# Problem 9
# Special Pythagorean triplet
# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

# a2 + b2 = c2

# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.
def find_pythagorean_abc_product(target_value)
  possible_as = []
  (2..995).each do |a|
    possible_as << a
  end
  while @real_a.nil? == true
    (3..996).each do |b|
      possible_as.each do |a|
        if a < b
          c = Math.sqrt(a**2 + b**2)
          if a + b + c == target_value
            @real_a = a
            @real_b = b
            @real_c = c
            break
          end
        else
          break
        end
      end
    end
  end
  @product = @real_a*@real_b*@real_c
  puts "a: #{@real_a}, b: #{@real_b}, c:#{@real_c}"
  puts "sum : #{@real_a + @real_b + @real_c}"
  puts "product: #{@product}"
end
find_pythagorean_abc_product(1000)

