module Weather
  
  def sunny?
    @sunny
  end

  def sunny
    @sunny = true
  end

  def storm
    @sunny = false
  end

  def generate_weather(odds=nil)
    odds ||= rand
    odds <= 0.2 ? storm : sunny
  end

end
