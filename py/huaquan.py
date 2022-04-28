import random
while 1:
    s=int(random.randint(1,3))
    if s==1:
        ind="石头"
    elif s==2:
        ind="剪刀"
    elif s==3:
        ind="布" 
    m=input('输入石头，剪刀，布，输入end结束游戏：')
    
    blist=['石头','剪刀','布']
    
    if(m not in blist) and (m!='end'):
        print("输入错误，重试：")
    elif(m=='end')and(m not in blist):
        print(ind)
        print("\n游戏退出")
        break
    elif m==ind:
        print("平")
    elif (m == '石头' and ind =='剪刀') or (m == '剪刀' and ind =='布') or (m == '布' and ind =='石头'):
        print ("电脑出了： " + ind +"，你赢了！")
    else:
        print ("电脑出了： " + ind +"，你输了！")