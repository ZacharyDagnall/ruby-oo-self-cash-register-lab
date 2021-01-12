require 'pry'

class CashRegister
    attr_accessor :total, :prev_total, :discount, :items #employee discount
    
    def initialize(discount=0)
        @total = 0
        @prev_total = 0
        @discount = discount
        @items = []
    end

    def add_item(title,price,quantity=1)
        @prev_total = @total
        @total+=price*quantity
        for i in 1..quantity
            @items.push(title)
        end
    end

    def apply_discount
       if discount==0
        return "There is no discount to apply."
       else
        @total = (@total*(1.0-@discount/100.0)).round(2)
        return "After the discount, the total comes to $#{@total.round(0)}."
       end
    end

    def void_last_transaction
        @total = @prev_total
    end



end
