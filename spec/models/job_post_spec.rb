require 'spec_helper'

describe JobPost do

  describe "#parse_source" do
    let(:mock_parser) { double('MonsterParser', parse: {}) }
    let(:monster_source) { 'http://jobview.monster.com/Senior-Developer-C-Visual-Studio-C-XML-WEB-Job-New-York-City-NY-131020401.aspx' }
    let(:expected_html) { '<html>some text</html>' }
    let(:expected_results) { {short_description: 'Some description',
                              full_profile: 'here comes the full profile',
                              industry: 'Meat industry',
                              location: 'nether',
                              experience: '100+ years',
                              company: 'Kramerica'} }

    before do
      MonsterParser.stub(:new).and_return(mock_parser)
    end

    it 'uses the monster parser if the source if from such page' do
      job_post = JobPost.new(source: monster_source)
      job_post.stub(:read_source).and_return(expected_html)
      MonsterParser.should_receive(:new).with(expected_html).and_return(mock_parser)
      job_post.parse_source
    end

    it 'assigns the values from the parser to the job post' do
      mock_parser.stub(:parse).and_return(expected_results)
      job_post = JobPost.new(source: monster_source)
      job_post.stub(:read_source).and_return(expected_html)
      job_post.parse_source
      job_post.description.should == 'Some description'
      job_post.full_profile.should == 'here comes the full profile'
      job_post.industry.should == 'Meat industry'
      job_post.location.should == 'nether'
      job_post.experience.should == '100+ years'
      job_post.company.should == 'Kramerica'
    end
  end

end
