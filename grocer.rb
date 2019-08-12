require "pry"

def consolidate_cart(cart)
#   # turn cart that is an array into a hash that includes the counts for each item

  organized_cart = {}
  cart.each_with_index do |item, i|
    
    if organized_cart.key?(item.keys[0])
      organized_cart[item.keys[0]][:count] += 1
      # hash.update(hash) { |key, value| value + 1 }
    else
      organized_cart[item.keys[0]] = item.values[0]
      organized_cart[item.keys[0]][:count] = 1
    end 
  end
  organized_cart
end 

def apply_coupons(cart, coupons=nil) #consolidated cart hash and an array of coupons
  # adds a new key, value pair to the cart hash called 'ITEM NAME W/COUPON'
  if cart.key?(coupons[0][:item])#if the item in the array is equal to the key in the cart 
   
    discounted_item = coupons[0][:item]
    num_discounted = coupons[0][:num]
    discounted_price = coupons[0][:cost]
    
    cart["#{discounted_item} W/COUPON"] = {:price => discounted_price, :clearance => true, :count => num_discounted} 
    
    if num_discounted > 1
      cart[discounted_item][:count] -= num_discounted #subtract the number of discounted items from the original item count
      cart["#{discounted_item} W/COUPON"][:price] /= num_discounted
    end
  else
    coupons
  end
  cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  #calculates total cost of a cart's items with discounts/coupons if applicable
  #consolidate_cart
  #apply_coupons
  #apply_clearance
  
  # if, after all coupons and discounts, the cart's total is over $100, the customer gets an additional 10% off. Apply this discount when appropriate.
end
