const priceCalculation = () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput) return;

  priceInput.addEventListener("input", () => {
    const price = Number(priceInput.value);
    const taxPrice = document.getElementById("add-tax-price");
    const profit = document.getElementById("profit");

    if (price >= 300 && price <= 9999999) {
      const tax = Math.floor(price * 0.1);
      taxPrice.innerHTML = tax;
      profit.innerHTML = price - tax;
    } else {
      taxPrice.innerHTML = "";
      profit.innerHTML = "";
    }
  });
};

window.addEventListener("turbo:load", priceCalculation);
window.addEventListener("turbo:render", priceCalculation);