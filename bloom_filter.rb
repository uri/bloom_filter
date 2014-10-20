require 'digest'

class BloomFilter
  def initialize
    @sectors = Array.new(3) { self.class.random_sector }
    @bit_array = 0
    @array = []
  end

  def add str
    @bit_array |= mask(str)
    @array << str
  end

  def query str
    m = mask(str)
    @bit_array & m == m
  end

  private

  def self.hash str
    Digest::SHA256.hexdigest(str)
  end

  def self.random_sector
    (rand * 63).to_i
  end

  def mask str
    hash = self.class.hash(str)
    @sectors.inject(0) do |mask, sector|
      hit = "#{hash[sector]}#{hash[sector + 1]}".to_i
      mask |= (1 << hit)
    end
  end
end
