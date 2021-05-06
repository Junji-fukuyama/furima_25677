window.addEventListener("load", function(){
 const priceInput = document.getElementById("item-price")
  priceInput.addEventListener("input", function(){
  const price = document.getElementById("item-price").value
    const tax = price * 0.1
    const profit = price - tax
    const taxForm = document.getElementById("add-tax-price")
    taxForm.textContent = Math.floor(tax)  
    const profitForm = document.getElementById("profit")
    profitForm.textContent = Math.floor(profit)  
  })
});