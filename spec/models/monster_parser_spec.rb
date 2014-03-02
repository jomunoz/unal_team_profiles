require 'spec_helper'

describe MonsterParser do

  let(:parser) { MonsterParser.new( File.read(File.join('spec', 'fixtures', 'monster_example.html')) ) }

  describe '#parse' do
    let(:results) { parser.parse } 

    it 'returns a hash with the job short description' do
      results[:short_description].should == 'Senior Developer-C++, Visual Studio, C#, XML, WEB'
    end

    it 'returns a hash with the job industry' do
      results[:industry].should == 'Energy and Utilities'
    end

    it 'returns a hash with the required experience' do
      results[:experience].should == '2+ to 5 Years'
    end

    it 'returns a hash with the complete profile' do
      results[:full_profile].should include 'Information Resources seeks to hire a highly motivated and dedicated professional'
    end

    it 'returns a hash with the company that published the ad' do
      results[:company].should == 'Infosys International'
    end
  end

end
