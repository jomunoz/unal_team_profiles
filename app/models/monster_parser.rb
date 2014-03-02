class MonsterParser

  def initialize(html_string)
    @doc = Nokogiri::HTML(html_string)
  end

  def parse
    { short_description: short_description,
      industry: industry,
      experience: experience,
      full_profile: full_profile,
      company: company }
  end

  def short_description 
    @doc.at_css("[itemprop='title']").text
  end
  private :short_description

  def industry
    @doc.at_css("[itemprop='industry']").text
  end
  private :industry

  def experience
    @doc.at_css("[itemprop='experienceRequirements']").text
  end
  private :experience

  def full_profile
    @doc.at_css("#TrackingJobBody").text
  end
  private :full_profile

  def company
    @doc.at_css("[itemprop='hiringOrganization']").text
  end
  private :company
end
