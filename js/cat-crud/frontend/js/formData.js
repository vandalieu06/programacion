const btn1 = document.querySelectorAll(".btn-database");
btn1[0].addEventListener("click", PrintConsole)

async function PrintConsole () {
  const api = await fetch("/api/mongodb");
  const response = await api.json();

  for (let i = 0; i < response.length; i++){
    console.log(response[i].name)
  }
}

const inputBtn = document.querySelector(".input-submit")
inputBtn.addEventListener("click", enviarDatos)

async function enviarDatos () {
  const name = document.querySelector(".input-name").value
  const cats = {name}
  console.log(JSON.stringify(cats))
  try {
    const response = await fetch("/api/mongodb", {
      method: "POST",
      headers: {
        "Content-Type": "application/json"
      },
      body: JSON.stringify(cats)
    });

    const data = await response.json();
    console.log(data)
  }
  catch(err){
    console.log(err)
  }
}
