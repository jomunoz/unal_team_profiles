require 'spec_helper'

describe DiceParser do

  let(:parser) { DiceParser.new( File.read(File.join('spec', 'fixtures', 'dice_example.html')) ) }

  describe '#parse' do
    let(:results) { parser.parse } 

    it 'returns a hash with the job short description' do
      results[:short_description].should == 'C++ Developer - Big Data, Analytics, Financial Data Solutions'
    end

    it 'returns a hash with the job industry' do
      results[:industry].should == ''
    end

    it 'returns a hash with the required experience' do
      results[:experience].should == ''
    end

    it 'returns a hash with the complete profile' do
      results[:full_profile].should include 'We are an up and coming Software Company in the Big Data'
    end

    it 'returns a hash with the company that published the ad' do
      results[:company].should == 'CyberCoders'
    end

    it 'returns a hash with the job location' do
      results[:location].should == 'Manhattan, NY'
    end
  end

end
