# class for simple numbers

class Prime

  attr_accessor :primes

  def initialize
    self.primes = Array.new
  end

  def checkPrime(n)
    root = Math.sqrt(n).floor
    (2..root).each do |i|
      if (n % i) == 0
        false
      end
    end
    true
  end

  def returnPrimes()
    self.primes.join(', ')
  end

  def getFirstPrimes(max)
    i = 0
    until i >= max
      i += 1
      self.primes.push(i)
    end
    returnPrimes()
  end

  def getLastPrime()
    self.primes.last
  end

  def getNthPrime(n)
    n -= 1
    if (n < 1) 
      false
    end
    if (self.primes.length >= n)
      self.primes[n]
    else
      self.getPrimes(n+1)
      self.primes[n]
    end
  end

  def getPrimes(max)
    if (max < 4)
      getFirstPrimes(max)
    end
    if (self.primes.length == 0)
      self.primes = [1, 2, 3]
    end
    i = self.primes.last
    until self.primes.length >= max
      i += 1
      next unless (i % 2) != 0
      next unless (i % 3) != 0
      if (checkPrime(i))
        self.primes.push(i)
      end
    end

    returnPrimes()
  end
end

class ExtraPrimes < Prime
  def randomPrime(arr = self.primes)
    prng = Random.new
    random = prng.rand(arr.length)
    arr[random]
  end

  def randomPrimes(n = 2)
    if (n > self.primes.length)
      false
    else
      primes = self.primes
      random = Array.new
      (1..n).each do |i|
        item = self.randomPrime(primes)
        random.push(item)
        primes.delete(item)
      end
      random.join(', ')
    end
  end
end

myPrime = ExtraPrimes.new
puts "get primes: " + myPrime.getPrimes(5)
puts "7th prime is " + myPrime.getNthPrime(7).to_s
puts "2nd prime is " + myPrime.getNthPrime(2).to_s
puts "last prime is " + myPrime.getLastPrime().to_s
puts "primes: #{myPrime.primes}"
puts "random prime: " + myPrime.randomPrime().to_s
puts "random prime: " + myPrime.randomPrimes(16).to_s


