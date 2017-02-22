class Cheese

  def self.text
    "<p>I love cheese, especially cow cheese slices. Cheese on toast halloumi cheesy feet cauliflower cheese cheesy grin hard cheese pecorino when the cheese comes out everybody's happy. Fromage macaroni cheese port-salut pecorino bocconcini melted cheese the big cheese parmesan.</p>"
  end

  def self.set_number(num)
    [1, num.to_i, 1000].sort[1]
  end

  def self.call(num = 1)
    text * set_number(num)
  end

end
