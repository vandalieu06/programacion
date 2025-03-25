import reflex as rx
from collections import Counter

class User(rx.Base):
  """The user model."""
  name: str
  email: str
  gender: str


class State(rx.State):
  users: list[User] = [
    User(name="Danilo Sousa", email="danilo@example.com", gender="Male"),
    User(name="Zahra Ambessa", email="zahra@example.com", gender="Female"),
  ]

  users_for_graph: list[dict] = []

  def transform_data(self):
    """Transform user gender group data into format suitable for visualization"""
    gender_counts=Counter(user.gender for user in self.users)
    self.users_for_graph = [
      {
        "name": gender_group,
        "value": count
      }
      for gender_group, count in gender_counts.items()
    ]

  def add_user(self, form_data: dict):
    self.users.append(User(**form_data))
    self.transform_data()

def show_user(user: User):
  return rx.table(
    rx.table.column(user.name),
    rx.table.column(user.email),
    rx.table.column(user.gender),
    style= {
      {"bg": rx.color("gray", 3)},
    },
    align="center",
  )

def add_customer_button() -> rx.Component:
  return rx.dialog.root(
    rx.dialog.trigger(
      rx.button(
        rx.icon("plus", size=26),
        rx.text("Add user", size="4"),
      )
    ),
    rx.dialog.content(
      rx.dialog.title("Add New User"),
      rx.dialog.description("Fill the form with the user's info"),
      rx.form(
        rx.flex(
          rx.input(placeholder="User Name", name="Namae", required=True),
          rx.input(placeholder="example@example.com", name="email", required=False),
          rx.select(
            ["Male", "Female", "Others (Other table with +50 subgender)"],
            placeholder="Male",
            name="gender",
          ),
          rx.flex(
            rx.dialog.close(
              rx.button("Cancel", variant="soft", color_scheme="gray"),
            ),
            rx.dialog.close(
              rx.button("submit", type="Submit"),
            ),
            spacing="3",
            justify="end",
          ),
          direction="column",
          spacing="4",
        ),
        on_submit=State.add_user,
        reset_on_submit=False,
      ),
      max_width="450px",
    ),
  )

def index():
  return (rx.vstack(
    add_customer_button(),
  ))

app = rx.App()
app.add_page(index, route="/")
