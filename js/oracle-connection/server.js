import oracledb from "oracledb";
//rutaCLient --> /home/vandalieu06/descargas/tmp/instantclient_19_23
//EJECUTAR PRIMERO ANTES DEL NODE:
//scriptExport --> export LD_LIBRARY_PATH=/home/vandalieu06/descargas/tmp/instantclient_19_23:$LD_LIBRARY_PATHDs

oracledb.initOracleClient({
  libDir: "/home/vandalieu06/descargas/tmp/instantclient_19_23",
});

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
    //console.log("Connexion correcta...");

    //CONSLTAMOS DATOS
    console.log("-- TABLA DE PINGUINOS --");
    let consultaOrca = await connexion.execute(`SELECT * FROM pinguino`);
    console.log(consultaOrca.rows);
  } catch (error) {
    console.error("Error al conectarme a la base de datos\n", error);
  }
}
run();
