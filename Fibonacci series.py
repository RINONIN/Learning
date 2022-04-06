from cgi import print_arguments


a,b=0,1
while b<10:
  print(b)
  a,b=b,a+b

i=256*256
print("i=\n",i)