class DiceParser

  def initialize(html_string)
    @doc = Nokogiri::HTML(html_string)
  end

  def parse
    { short_description: short_description,
      industry: '',
      experience: '',
      full_profile: full_profile,
      company: company,
      location: location }
  end

  def short_description 
    @doc.at_css("meta[name='twitter:title']")['content']
  end
  private :short_description

  def full_profile
    @doc.at_css("meta[name='twitter:description']")['content']
  end
  private :full_profile

  def company
    @doc.at_css("meta[name='twitter:company']")['content']
  end
  private :company

  def location
    @doc.at_css("meta[name='twitter:city']")['content'] + ', ' + @doc.at_css("meta[name='twitter:state']")['content']
  end
  private :location

end
