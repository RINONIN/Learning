#!/usr/bin/python
x = ["-θ","-θ","-θ","-θ","-θ","-θ","-θ","-θ","-θ"]
y = ["—","—","—","—","—","—","—","—","—"]
def down(n, l): #拆解
    v = len(l) #计算数列个数用于改变数列对应位置
    if n>2:
        down(n-2, l) #拆下n-2的环
        l[v-n] = "—" #将v-n位"-θ"改为"—" 表示拆下
        for x in l:  #输出列表每一个元素
            print(x,end=' ')
        print() #换行
        up(n-2, l) #装上n-2位
        down(n-1, l)#拆下n-1位， 后面同理
    if n==2:
        l[v-2], l[v-1] ="—","—"
        for x in l:
            print(x,end=' ')
        print()
    if n<2:
        l[v-1] = "—"
        for x in l:
            print(x,end=' ')
        print()
def up(n, l):
    v = len(l)
    if n>2:
        up(n-1, l)
        down(n-2, l)
        l[v-n] = "-θ"
        for x in l:
            print(x,end=' ')
        print()
        up(n-2, l)
    if n==2:
        l[v-2], l[v-1] = "-θ","-θ"
        for x in l:
            print(x,end=' ')
        print()
    if n<2:
        l[v-1] ="-θ"
        for x in l:
            print(x,end=' ')
        print()

print("拆解\n")
for i in x:
    print(i,end=' ')
print()
down(9, x)
print('---------------------------------\n','装上\n')
for i in y:
    print(i,end=' ')
print()
up(9, y)
print("结束")