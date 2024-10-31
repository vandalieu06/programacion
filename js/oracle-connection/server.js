import oracledb from "oracledb";
async function run() {
  let connexion;
  try {
    //INICIAR CONNEXION
    connexion = await oracledb.getConnection({
      user: "daw25",
      password: "1234",
      connectString: "localhost:1521",
    });

    //IMPRIMIOS QUE LA CONNEXION ES CORRTA
    console.log("Connexion correcta...");

    //CONSLTAMOS DATOS
    let consultaOrca = await connexion.execute(`SELECT * FROM orca`);
    console.log(consultaOrca.rows);
  } catch (error) {
    console.error("Error al conectarme a la base de datos\n", error);
  }
}
run();
