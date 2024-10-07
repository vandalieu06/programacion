// DIA 2
const form = document.querySelector(".form__box");

form.addEventListener("submit", async (e) => {
  e.preventDefault();

  const title = document.querySelector(".form__box--title").value;
  const portada = document.querySelector(".form__box--file").files[0];

  const formData = new FormData();
    formData.append("title", title);
    formData.append("portada", portada);

  try{
    const response = await fetch("/src/portadas", {
      method: "POST",
      body: formData
    })

    const result = await response.json();
    console.log(result)

  } catch (err) {
    console.error(err)
  }
});

