window.addEventListener('load', function(){
  const price = document.getElementById("item-price")
  const tax = document.getElementById("add-tax-price") //反映させたい要素を取得
  const profit = document.getElementById("profit")
  
  price.addEventListener('keyup', function(){
    //priceの値を取得して、変数に代入
    price_value  = price.value
    //計算した値を変数に代入
    tax_value = parseInt(price_value * 0.1)
    tax.innerHTML = tax_value
    profit_value = price_value - tax_value
    profit.innerHTML = profit_value
  })

})