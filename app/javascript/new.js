window.addEventListener('load', function(){
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price") 
  const profit = document.getElementById("profit")
  
  price.addEventListener('keyup', function(){
    price_value  = price.value
    tax_value = parseInt(price_value * 0.1)
    tax.innerHTML = tax_value
    profit_value = price_value - tax_value
    profit.innerHTML = profit_value
  })

})