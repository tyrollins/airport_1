class Plane

  def initialize
    @flying = true
  end

  def flying
    @flying
  end

  def flying=(str)
    @flying=str
  end

  def flying?
    flying == true
  end

  def take_off
    @flying = true
  end

  def land
    @flying = false
  end

  def landed
    land
  end

end