def consolidate_cart(cart)
  # code here
  cart.each_with_object({}) do |key,value|
    key.each do |item,item_info|
      if value[item]
      item_info[:count] +=1
    # else
    #
    #   value[item]=item_info
    end
    end
  end
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
