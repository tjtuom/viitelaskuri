require File.join(File.dirname(__FILE__), %w[spec_helper])

describe Viitelaskuri do

  context "#calculate" do

    it "calculates bank references" do
      seeds = [100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 403, 693, 193626, 5926038623]
      refs = [1009, 1012, 1025, 1038, 1041, 1054, 1067, 1070, 1083, 1096, 4035, 6936, 1936267, 59260386230]
      seeds.each_with_index do |seed, i|
        Viitelaskuri.calculate(seed).should == refs[i]
      end
    end

    it 'raises an error if given a number less than 3 digits long' do
      lambda { Viitelaskuri.calculate(10) }.should raise_error(ArgumentError)
    end

    it 'raises an error if given a number more than 19 digits long' do
      lambda { Viitelaskuri.calculate(12345678901234567890) }.should raise_error(ArgumentError)
    end

  end

  context "#format" do

    it 'formats bank references' do
      refs = [[1009, '1009'], [1936267, '19 36267'], [59260386230, '5 92603 86230']]
      refs.each do |ref|
        Viitelaskuri.format(ref.first).should == ref.last
      end
    end

    it 'raises an error if given a number less than 4 digits long' do
      lambda { Viitelaskuri.format(100) }.should raise_error(ArgumentError)
    end

    it 'raises an error if given a number more than 20 digits long' do
      lambda { Viitelaskuri.format(123456789012345678901) }.should raise_error(ArgumentError)
    end


  end

  context "#valid?" do

    it 'validates references' do
      refs = [[1009, true], [1008, false], ['19 36267', true], [100, false], [123456789012345678901, false]]
      refs.each do |ref|
        Viitelaskuri.valid?(ref.first).should == ref.last
      end
    end

  end

  context "#generate" do

    it 'generates a random reference with almost certain uniqueness' do
      ref = Viitelaskuri.generate
      Viitelaskuri.valid?(ref).should be_true
      ref.to_s.length.should == 20
    end

  end

end
