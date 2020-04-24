class CashRegister
    attr_accessor :total, :titles, :price, :items
    attr_reader :discount

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @titles = []
        @items = []
    end
    
    def add_item(title, price, quantity=1)
        @price = price
        @items = [title, price, quantity]
        if quantity > 0
            count = 0
            while count < quantity
                @titles << title
                count += 1
            end
        end
        @total += price * quantity
    end

    def apply_discount
        if discount > 0
            self.total -= self.total * discount / 100
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @titles
    end

    def void_last_transaction
        if @items[2] > 1
            @total = 0.0
        else
            @total -= @price
        end
    end
end
