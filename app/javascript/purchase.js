const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  // すでに初期化済みなら何もしない
  if (form.dataset.initialized === "true") return;
  form.dataset.initialized = "true";

  const publicKey = form.dataset.publicKey;

  const payjp = Payjp(publicKey);
  const elements = payjp.elements();

  const numberElement = elements.create("cardNumber");
  const expiryElement = elements.create("cardExpiry");
  const cvcElement = elements.create("cardCvc");

  numberElement.mount("#number-form");
  expiryElement.mount("#expiry-form");
  cvcElement.mount("#cvc-form");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        alert(response.error.message);
      } else {
        document.getElementById("token").value = response.id;
        form.submit();
      }
    });
  });
};

window.addEventListener("turbo:load", pay);
window.addEventListener("turbo:render", pay);