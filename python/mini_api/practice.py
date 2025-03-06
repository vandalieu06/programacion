class Number:
  def __init__(self, value):
    self.value = value

print(Number(52).__dict__)
print(Number(43).__dict__)

class Hello:
  def __init__ (self, value):
    self.value = value
    print(self.value)
    print(type(self))

Hello(10)