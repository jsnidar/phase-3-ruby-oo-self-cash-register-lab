
class CashRegister 
    attr_accessor :total, :discount, :items, :last_transaction_price, :last_transaction_items
    def initialize(discount = 0)
        @total = 0
        @discount = discount 
        @items = []
    end

    def add_item item, price, quantity=1
        self.last_transaction_price = price * quantity
        self.total += price * quantity
        self.last_transaction_items = []
        quantity.times do
            self.items << item
            self.last_transaction_items << item
        end
    end

    def apply_discount
        if self.discount != 0
            self.total = total - (total * self.discount / 100)
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= last_transaction_price
        self.items.slice!(0, -last_transaction_items.length)
    end

end
