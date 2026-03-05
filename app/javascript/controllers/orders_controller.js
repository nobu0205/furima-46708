// app/javascript/controllers/orders_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const payForm = document.getElementById("charge-form");
    if (!payForm) return;

    const publicKey = payForm.dataset.publicKey;
    if (!publicKey) return;

    const payjp = Payjp(publicKey);
    const elements = payjp.elements();

    const numberElement = elements.create("cardNumber");
    const expiryElement = elements.create("cardExpiry");
    const cvcElement = elements.create("cardCvc");

    numberElement.mount("#number-form");
    expiryElement.mount("#expiry-form");
    cvcElement.mount("#cvc-form");

    payForm.addEventListener("submit", (e) => {
      e.preventDefault();
      payjp.createToken(numberElement).then((response) => {
        if (response.error) {
          alert(response.error.message);
        } else {
          document.getElementById("token").value = response.id;
          payForm.submit();
        }
      });
    });
  }
}