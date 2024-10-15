  printf("Que carpeta queires listar: "); 
  scanf("%d", &cParametro);
  strcat(command, cParametro);
  system(command);
}
