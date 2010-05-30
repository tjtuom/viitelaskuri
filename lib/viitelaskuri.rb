# A collection of methods for calculating
# bank references for finnish invoices.
module Viitelaskuri
  autoload :Version, 'viitelaskuri/version'

  extend self

  # Calculates the bank reference for a given number
  #
  # @param [Number, String] seed The number to calculate the check number for. For instance in invoice number.
  # @return [Integer] The bank reference calculated.
  # @raise [ArgumentError] Raises an error if the seed is less than 3 or more than 19 digits.
  def calculate(seed)
    str = seed.to_s

    if str.length < 3
      raise ArgumentError.new('The seed must be at least 3 digits.')
    end

    if str.length > 19
      raise ArgumentError.new('The seed must not be more than 19 digits.')
    end

    reversed = str.reverse
    sum = 0
    coefficients = [7, 3, 1]
    i = 0
    reversed.each_char do |c|
      n = c.to_i
      sum += n * coefficients[i % 3]
      i += 1
    end
    # sum -> nearest full ten - sum
    check = sum % 10 == 0 ? 0 : ((sum / 10).to_i + 1) * 10 - sum
    str = str + check.to_s
    str.to_i
  end

  # Formats a given number into five digit groups starting from the right
  #
  # @param [Number, String] ref The number to format.
  # @return [String] The formatted string.
  # @raise [ArgumentError] Raises an error if the ref is less than 4 or more than 20 digits.
  def format(ref)
    str = ref.to_s

    if str.length < 4
      raise ArgumentError.new('The seed must be at least 4 digits.')
    end

    if str.length > 20
      raise ArgumentError.new('The seed must not be more than 20 digits.')
    end

     # organize in five letter groups starting from the right
    in_groups_of(str.reverse.split(''), 5, false).map { |e| e.join('')  }.join(' ').reverse
  end

  # Checks if a given number is a valid bank reference
  #
  # @param [Number, String] ref The number to check.
  # @return [Boolean] True if the ref is valid, false if not.
  def valid?(ref)
    if ref.to_s.length < 4 || ref.to_s.length > 20
      return false
    end

    str = ref.to_s[0...-1]
    calculate(str) == ref.to_i
  end

  # Generates an almost certainly unique bank reference.
  # Uses a timestamp (10 digits) and a random number (9 digits)
  # and adds the check number.
  #
  # @return [Integer] the generated bank reference.
  def generate
    time = Time.now.utc.to_i
    random = 9.times.map { rand(10) }
    calculate(time.to_s + random.to_s)
  end

  private

  # borrowed from rails
  def in_groups_of(array, number, fill_with = nil)
    if fill_with == false
      collection = array
    else
      # size % number gives how many extra we have;
      # subtracting from number gives how many to add;
      # modulo number ensures we don't add group of just fill.
      padding = (number - array.size % number) % number
      collection = array.dup.concat([fill_with] * padding)
    end

    if block_given?
      collection.each_slice(number) { |slice| yield(slice) }
    else
      groups = []
      collection.each_slice(number) { |group| groups << group }
      groups
    end
  end

end
