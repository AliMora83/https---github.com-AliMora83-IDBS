import { idbs } from "../../declarations/idbs";

window.addEventListener("load", async function(){
  // console.log("Finished loading Boss");
update();
});

document.querySelector("form").addEventListener("submit", async function(event) {
  event.preventDefault();
  // console.log("Submitted Boss");

    const button = event.target.querySelector("#submit-btn");

    const inputAmount = parseFloat(document.getElementById("input-amount").value);
    const outputAmount = parseFloat(document.getElementById("withdrawal-amount").value);

    button.setAttribute("disabled", true);

    if (document.getElementById("input-amount").value.length != 0) {
      await idbs.topUp(inputAmount);
    }

    if (document.getElementById("withdrawal-amount").value.length != 0) {
      await idbs.withdraw(outputAmount);
    }

    await idbs.compound();

    update();
    document.getElementById("input-amount").value = "";
    document.getElementById("withdrawal-amount").value = "";

    //button.removeAtrribute("disabled");
});

async function update() {
  const currentAmount = await idbs.checkBalance();
  document.getElementById("value").innerText = Math.round(currentAmount * 100) / 100;
};