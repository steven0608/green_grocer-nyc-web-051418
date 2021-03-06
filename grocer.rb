def consolidate_cart(cart)
  # code here
  cart.each_with_object({}) do |key,value|
    key.each do |item,item_info|
      if value[item]
      item_info[:count] +=1
    else
    item_info[:count] = 1
      value[item]=item_info
    end
    end
  end
end

def apply_coupons(cart, coupons)
  # code here
coupons.each do |coupon|
  coupon_name = coupon[:item]
  if cart[coupon_name] && cart[coupon_name][:count] >= coupon[:num]
    if cart["#{coupon_name} W/COUPON"]
cart["#{coupon_name} W/COUPON"][:count] += 1

else
  cart["#{coupon_name} W/COUPON"] = {:price => coupon[:cost],:count => 1, :clearance => cart[coupon_name][:clearance]}
end
cart[coupon_name][:count] -= coupon[:num]
end
end
cart
end

def apply_clearance(cart)
  # code here
  cart.each do |item,item_info|
    if item_info[:clearance]
      discount=item_info[:price] * 0.80
      item_info[:price] = discount.round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
  consolidate_cart = consolidate_cart(cart)
  after_coupon = apply_coupons(consolidate_cart,coupons)
  cart_checkout = apply_clearance(after_coupon)
  total = 0
  cart_checkout.each do |item, item_info|
    total += item_info[:price] * item_info[:count]
  end
  if total >= 100
    total *=0.90
  end
  total
end
