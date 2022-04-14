import random
a = 0
while True:    
    x = random.choice(range(10))
    y = random.choice(range(10))
    a = a+1    
    if x > y:        
        print(x,'>',y)
    elif x < y:        
        print(x,'<',y)
    else:        
        print('x=y=', x, 'total cal ', a, 'times')
        break