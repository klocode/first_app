class Future

  def self.text
    "<p>Marty, I'm sorry, but the only power source capable of generating one point twenty-one gigawatts of electricity is a bolt of lightning. Yeah I know, If you put your mind to it you could accomplish anything. I don't wanna know your name. I don't wanna know anything anything about you.</p>"
  end

  def self.set_number(num)
    [1, num.to_i, 1000].sort[1]
  end

  def self.call(num = 1)
    text * set_number(num)
  end

end
