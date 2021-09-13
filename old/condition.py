temp = input("numbers")
guess= int(temp)
while guess != 8:
    temp=input("once again")
    guess=int(temp)
    if guess == 8:
      print("you are right")
      print("no wards")
    else:
      if guess > 8:
        print("bigger!")
      else:
        print("smaller!")
print("game over")