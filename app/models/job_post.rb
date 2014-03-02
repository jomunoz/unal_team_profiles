require 'open-uri'

class JobPost < ActiveRecord::Base

  before_save :parse_source

  attr_accessible :source 

  def parse_source
    case host
      when 'jobview.monster.com' then parse_monster(read_source)
      when 'www.dice.com' then parse_dice(read_source)
      else
        raise "No parser created for #{host}"  
    end
  end

  def parse_monster(html_string)
    set_attributes(MonsterParser.new(html_string).parse)
  end

  def parse_dice(html_string)
    set_attributes(DiceParser.new(html_string).parse)
  end

  def set_attributes(results)
    self.description = results[:short_description]
    self.full_profile = results[:full_profile]
    self.industry = results[:industry]
    self.location = results[:location]
    self.experience = results[:experience]
    self.company = results[:company]
  end
  private :set_attributes

  def read_source
    open(self.source).read
  end
  private :read_source

  def host
    URI(self.source).host
  end

end
