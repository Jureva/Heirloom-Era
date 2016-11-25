module OrdersHelper

    def has_price(cost)
      if cost > 0.00
        true
      else
        false
      end
    end 

end
