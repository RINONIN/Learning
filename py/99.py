
# i=1
# while i<=9:
#      #里面一层循环控制每一行中的列数
#      j=1
#      while j<=i:
#           mut =j*i
#           print("%d*%d=%d"%(j,i,mut), end="  ")
#           j+=1
#      print("")
#      i+=1


print(sum(range(101)))

for i in range(9,0,-1):
    for j in range (1,i):
        print("\t",end="")
    for k in range (i,10):
        print("%dx%d=%d" % (i,k,k*i), end="\t")
    print()