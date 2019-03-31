n=int(input())
l = []
cnt = 1
while (n != 0):
    if (n%10 == 0):
        cnt = cnt * 10
    l.append(n%10)
    n //= 10
l.sort()
res = 0
print(l)
for x in l:
    if x != 0 and res == 0:
        res = (res * 10) + x
    elif cnt > 1 and res > 0:
        res = (res * cnt * 10) + x
        cnt = 1
    else:
        res = (res * 10) + x
print(res)