from telnetlib import FORWARD_X

from cv2 import bilateralFilter


# languages = ["C","C++","Perl","Python"]
# for x in languages:
#     print(x)

# sites = ["Baidu", "Google","Runoob","Taobao"]
# for site in sites:
#     if site == "Runoob":
#         print("菜鸟教程!")
#         break
#     print("循环数据 " + site)
# else:
#     print("没有循环数据!")
# print("完成循环!\n")

# for x in range(len(sites)):
#     print(x,sites[x])


# n=5
# while n>0:
#     n-=1
#     if n == 2:
#         break
#     print(n)
# print("over")

# for letter in 'Runoob':     # 第一个实例
#    if letter == 'o':
#       break
#    print ('当前字母为 :', letter)
  
# var = 10                    # 第二个实例
# while var > 0:              
#    print ('当前变量值为 :', var)
#    var = var -1
#    if var == 5:
#       break
 
# print ("Good bye!")

n = 0
sum = 0
for n in range(101):
    sum += n
print(sum)
