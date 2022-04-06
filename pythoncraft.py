students= {}
write = 1
while write :
    name = str(input('输入名字:'))
    grade = int(input('输入分数:'))
    students[str(name)] = grade
    write= int(input('继续输入？\n 1/继续  0/退出'))
print('name  rate'.center(20,'-'))
for key,value in students.items():
    if value >= 90:
        print('%s %s  A'.center(20,'-')%(key,value))
    elif 89 > value >= 60 :
        print('%s %s  B'.center(20,'-')%(key,value))
    else:
        print('%s %s  C'.center(20,'-')%(key,value))