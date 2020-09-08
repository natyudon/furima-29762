function calc(){
  const itemprice = document.getElementById("item-price")
    if (itemprice == null){
      return null;
    }
    itemprice.addEventListener("input", ()=>{
    const price = itemprice.value
    let feeprice = price * 0.1
    const calcprice = Math.floor(price - feeprice)
    feeprice = Math.floor(feeprice)
    
    const addtaxprice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    addtaxprice.innerHTML = feeprice.toLocaleString()
    profit.innerHTML = calcprice.toLocaleString()
  });
}
setInterval(calc, 1000);