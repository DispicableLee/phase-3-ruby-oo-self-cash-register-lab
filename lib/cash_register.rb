class CashRegister
    attr_accessor :discount, :total, :cart, :last_transaction
    def initialize(discount=0)
        @discount = discount
        @total = 0
        @cart = []
        @last_transaction = 0
    end

    def add_item(title, price, quantity=1)
        self.total += (price*quantity)
        quantity.times do
            self.cart << title
        end
        self.last_transaction = price*quantity
    end

    def apply_discount
        if discount === 0
            "There is no discount to apply"
        else
            self.total = (self.total - discount.to_f/100)
        end
    end

    def items
        @cart
    end

    def void_last_transaction
        self.total -= self.last_transaction
    end
end

nreg = CashRegister.new(3)

puts nreg.add_item("Gummi Worms", 5, 5)

nreg.apply_discount

puts nreg.total

