require 'pry'

class CashRegister

  attr_accessor :total, :discount, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items_arr = []
  end


  def add_item(title, price, quantity=1)
    self.total += price * quantity
      quantity.times do
        @items_arr << title
      end
      self.last_transaction = price * quantity
  end

  def apply_discount
    if self.discount > 0
      self.total = self.total - self.total * self.discount / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items_arr
  end

  def void_last_transaction
    self.total = self.total - last_transaction
  end

end
