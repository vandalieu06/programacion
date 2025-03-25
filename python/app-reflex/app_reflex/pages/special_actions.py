import reflex as rx

class ListState(rx.State):
  items: list[str] = ["Apple", "Banana", "Watermelon"]

class LoginState(rx.State):
  logged_in: bool = False

  @rx.event
  def toggle_login(self):
    self.logged_in = not self.logged_in

def show_login():
  return rx.box(
    rx.cond(
      LoginState.logged_in,
      rx.heading("Logged IN"),
      rx.heading("NOT Logged IN"),
    ),
    rx.button(
      "Toggle Login",
      on_click=LoginState.toggle_login,
    )
  )

def render_item(item: rx.Var[str]):
  return rx.list.item(item)

def show_fruits():
  return rx.foreach(ListState.items, render_item),
