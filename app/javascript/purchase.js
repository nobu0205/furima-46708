const pay = () => {
  const form = document.getElementById("charge-form");
  if (!form) return;

  Payjp.setPublicKey("pk_test_e9881b051a743ab7de83178a");

  form.addEventListener("submit", (e) => {
    e.preventDefault();

    const card = {
      number: document.getElementById("card-number").value,
      cvc: document.getElementById("card-cvc").value,
      exp_month: document.getElementById("card-exp-month").value,
      exp_year: document.getElementById("card-exp-year").value,
    };

    Payjp.createToken(card, (status, response) => {
      if (status === 200) {
        document.getElementById("token").value = response.id;
        form.submit();
      } else {
        alert("カード情報が正しくありません");
      }
    });
  });
};

window.addEventListener("turbo:load", pay);