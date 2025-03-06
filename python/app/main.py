import tkinter as tk

ventana = tk.Tk()
ventana.title("Sistema de Ventanas Python")

#cliente
etiqueta_cliente = tk.Label(ventana, text="Nombre del Cliente")
etiqueta_cliente.pack()
entrada_cliente = tk.Entry(ventana)
entrada_cliente.pack()

# Agregar un botón para confirmar la venta
boton_confirmar = tk.Button(ventana, text="Confirmar Venta", command=lambda: print("Venta realizada"))
boton_confirmar.pack()

# Iniciar la ventana
ventana.mainloop()