import reflex as rx

class CounterState(rx.State):
  count: int = 0

  @rx.event
  def increment(self, num: int):
    self.count += num

  @rx.event
  def decrement(self, num: int):
    self.count -= num

def my_section():
  return (rx.flex(
  rx.button(
      "Up 1",
      height="auto",
      width="100px",
      border_radius="15px",
      font_size="0.8rem",
      background_color="pink",
      padding="4px 20px",
      on_click=CounterState.increment(1),
    ),
    rx.text(CounterState.count),
    rx.button(
      "Up 5",
      height="auto",
      width="100px",
      border_radius="15px",
      font_size="0.8rem",
      background_color="orange",
      padding="4px 20px",
      on_click=CounterState.increment(5),
    ),
    align="center",
    spacing="3",
    background_color="var(--plum-3)",
    padding="60px 20px",
    border_radius="5px",
  ))

class InputTextState(rx.State):
  text: str = ""
  @rx.event
  def update(self, new_text: str):
    self.text = new_text

def text_input():
  return rx.flex(
    rx.heading(
      InputTextState.text,
      font_size="1rem",
      color="red",
    ),
    rx.input(
      default_value=InputTextState.text,
      on_blur=InputTextState.update,
    ),
    padding="20px",
    direction="column",
    justify="center",
    align="center",
  )

def check_even(num: int):
  return num % 2 == 0

class MyState3(rx.State):
  count: int = 0
  text: str = "even"

  @rx.event
  def increment(self):
    if check_even(self.count):
      self.text = "even"
    else:
      self.text = "odd"
    self.count += 1

def show_numbers():
  return rx.flex(
    *[rx.hstack(i, rx.text(": "), check_even(i)) for i in range(10)],
    direction="column",
    align="center",
    padding="0 40px"
  )