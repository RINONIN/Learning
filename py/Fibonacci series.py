
# a,b=0,1
# while b<10:
#   print(b)
#   a,b=b,a+b

# i=256*256
# print("i=\n",i)

# a, b = 0, 1
# while b < 1000:
#     print(b, end=',')
#     a, b = b, a+b

# def fab(n):
#     if n<1:
#         print('输入有误！')
#         return -1    
#     if n==1 or n==2:
#         return 1    
#     else:
#         return fab(n-1)+fab(n-2)


# print(fab(2)) #num

# n=int(input('请输入一个整数:'))
# def fab(n):
#     if n<1:
#         print('输入有误！')
#         return -1    
#     if n==1 or n==2:
#         return 1
#     else:
#         return fab(n-1)+fab(n-2)
# result=[]
# for i in range(1,n+1):
#     result.append(fab(i))

# print(result)

# n=int(input('请输入一个整数:')) 
# dic = {0:0,1:1}
# def fib(n):
#     if n in dic:
#         return dic[n]
#     else:
#         temp = fib(n-1)+fib(n-2)
#         dic[n] = temp
#         return temp
# for i in range(n):
#     print(fib(i+1),end=" " )

# # r.py
# import sys,getopt

# #递归算法 填充斐波拉契数列
# x,y=0,1
# f_len,f_max=[],[]
# f_len.append(x);f_len.append(y)
# f_max.append(x);f_max.append(y)

# #按最大个数填充
# def Fsqe_Len(n):
#     if len(f_len)<n:
#         Fsqe_Len(n-1)
#     m=f_len[n-1]+f_len[n-2]
#     f_len.append(m)
    
# #按最大值填充
# def Fsqe_Max(fmx):
#     fmlen=len(f_max)-1
#     if f_max[fmlen]>fmx:
#         del f_max[fmlen]
#     else:
#         m=f_max[fmlen-1]+f_max[fmlen]
#         f_max.append(m)
#         Fsqe_Max(fmx)
    
# lens=int(input('Fsqe_Len 输入最大个数：'))
# maxs=int(input('Fsqe_Max 输入最大值：'))
# if __name__ == '__main__':
#     Fsqe_Len(lens)
#     Fsqe_Max(maxs)
#     print(f_len)
#     print(f_max)

import time
#计算递归斐波那契时间消耗
n=int(input('请输入一个整数:'))
start = time.time()
def fab(n):
    if n<1:
        print('输入有误！')
        return -1    
    if n==1 or n==2:
        return 1    
    else:
        return fab(n-1)+fab(n-2)
print(fab(n))
end = time.time()
print("运行时间:%.2f秒"%(end-start))
#计算两个变量时间消耗
start = time.time()
a, b = 0, 1
cn = 1
while cn < n:
    a, b = b, a+b
    cn += 1
print(b)
end = time.time()
print("运行时间:%.2f秒"%(end-start))