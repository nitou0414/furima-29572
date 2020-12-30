window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)
    const addPrfDom = document.getElementById("profit");
    addPrfDom.innerHTML = inputValue-Math.floor(inputValue * 0.1)
  });
});