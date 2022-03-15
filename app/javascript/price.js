function price () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', () => {
    const itemPriceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    const tax_price = Math.floor(itemPriceValue * 0.1);
    addTaxPrice.innerHTML = tax_price.toLocaleString();
    const profit = document.getElementById("profit");
    const profit_value = Math.floor(itemPriceValue - tax_price);
    profit.innerHTML = profit_value.toLocaleString();
  });
};



window.addEventListener('load', price);