class Cupcake

  def self.text
    "Candy biscuit chocolate bar cookie sesame snaps cake cookie toffee. Cookie dessert tootsie roll gummi bears. Chocolate bar soufflé pastry soufflé dessert. Muffin gingerbread fruitcake."
  end

  def self.set_number(num)
    [1, num.to_i, 1000].sort[1]
  end

  def self.call(num = 1)
    text * set_number(num)
  end
end
