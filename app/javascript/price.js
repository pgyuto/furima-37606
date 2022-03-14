function price () {
  const itemPrice = document.getElementById("item-price");
  itemPrice.addEventListener('input', () => {
    const itemPriceValue = itemPrice.value;
    const addTaxPrice = document.getElementById("add-tax-price");
    addTaxPrice.innerHTML = Math.floor(itemPriceValue * 0.1);
    const profit = document.getElementById("profit");
    profit.innerHTML = Math.floor(itemPriceValue - addTaxPrice.innerHTML);
  });
};



window.addEventListener('load', price);