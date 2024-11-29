/*
  Exercici 1:  Programa cost d’un pacient
  Fes un programa que calculi el cost d'un pacient a un hospital. Les variables necessàries per al càlcul són les següents.
    - Nombre de dies en l'hospital
    - Cost de consulta
    - Preu dels medicaments
    - Costos diversos extra
    - Preu per dia hospitalitzat
    - Deducció́ per l’assegurança

  El resultat dels següents costos s'ha de calcular fent servir funcions (no s’han d’utilitzar punters):
    - Cost total: serà̀ la suma del cost de la consulta, del preu del medicament, costos diversos i el preu de cada dia a l'hospital.
    - Cost assegurança: serà̀ el cost total menys la deducció́ de l’assegurança, s'ha de fer servir la funció́ de Cost total.
    - Cost reduït: Ha de ser el cost d'assegurança menys el preu dels medicaments.
*/
#include <stdio.h>

struct Pacient {
  int     iDias;
  float   fCostConsulta;
  float   fCostMedicaments;
  float   fCostExtra;
  float   fPreuDia;
  float   fAsseguranza;
};

float costTotal (struct Pacient pacient){
  float iTotal = pacient.fCostConsulta + pacient.fCostMedicaments + pacient.fCostExtra + (pacient.fPreuDia * pacient.iDias);
  return iTotal;
}
float costAsseguranza(struct Pacient pacient, float costTotal){
  float iTotal = costTotal - pacient.fAsseguranza;
  return iTotal;
}
float costReduit(struct Pacient pacient, float costAsseguranza){
  float iTotal = costAsseguranza - pacient.fCostMedicaments;
  return iTotal;
}

int main (){
  struct Pacient pacient;
  printf("-- PACIENT --\n");
  printf("Introdueix el nombre de dies: ");
  scanf("%d", &pacient.iDias);
  printf("Introdueix el cost de la consulata: ");
  scanf("%f", &pacient.fCostConsulta);
  printf("Introdueix el preu dels medicaments: ");
  scanf("%f", &pacient.fCostMedicaments);
  printf("Introdueix el preu de costs diversos: ");
  scanf("%f", &pacient.fCostExtra);
  printf("Introdueix el preu per dia: ");
  scanf("%f", &pacient.fPreuDia);
  printf("Introdueix la deducio de l'assegurança: ");
  scanf("%f", &pacient.fAsseguranza);

  printf("\n--RESULTAT\n");

  float costTotalPacient = costTotal(pacient);
  float costAsseguranzaPacient = costAsseguranza(pacient, costTotalPacient);
  float costReduitPacient = costReduit(pacient, costAsseguranzaPacient);

  printf("El cost total és de %.2f euros.\n", costTotalPacient);
  printf("El cost total menys l'assegurança es de %.2f euros.\n", costAsseguranzaPacient);
  printf("El cost reduit es de %.2f euros.\n", costReduitPacient);

}
