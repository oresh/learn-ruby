# class for simple numbers

class Prime

  attr_accessor :primes

  def initialize
    @primes = Array.new
  end

  def checkPrime(n)
    root = Math.sqrt(n).floor
    (2..root).each do |i|
      return false unless (n % i) != 0
    end
    true
  end

  def returnPrimes()
    @primes.join(', ')
  end

  def getFirstPrimes(max)
    i = 0
    until i >= max
      @primes << i += 1
    end
    returnPrimes()
  end

  def getLastPrime()
    @primes.last
  end

  def getNthPrime(n)
    n -= 1
    return false unless n >= 1
    if (@primes.length >= n)
      @primes[n]
    else
      self.getPrimes(n+1)
      @primes[n]
    end
  end

  def getPrimes(max)
    if (max < 4)
      getFirstPrimes(max)
    end

    if (@primes.length == 0)
      @primes = [1, 2, 3]
    end

    i = @primes.last
    until @primes.length >= max
      i += 1
      next unless (i % 2) != 0
      next unless (i % 3) != 0
      if (checkPrime(i))
        @primes << i
      end
    end

    returnPrimes()
  end
end

class ExtraPrimes < Prime
  def randomPrime(arr = @primes)
    prng = Random.new
    random = prng.rand(arr.length)
    arr[random]
  end

  def randomPrimes(n = 2)
    return false unless n <= @primes.length
    primes = self.primes
    random = Array.new
    (1..n).each do |i|
      item = self.randomPrime(primes)
      random << item
      primes.delete(item)
    end
    random.join(', ')
  end
end

myPrime = ExtraPrimes.new
puts "get primes: " + myPrime.getPrimes(5)
puts "7th prime is " + myPrime.getNthPrime(7).to_s
puts "2nd prime is " + myPrime.getNthPrime(2).to_s
puts "last prime is " + myPrime.getLastPrime().to_s
puts "primes: #{myPrime.primes}"
puts "random prime: " + myPrime.randomPrime().to_s
puts "random prime: " + myPrime.randomPrimes(4).to_s
puts myPrime.primes


