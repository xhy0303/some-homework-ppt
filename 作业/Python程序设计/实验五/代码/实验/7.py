import numpy as np

matrix=np.random.rand(4,4)*10
a,c=np.split(matrix,2)
a,b=np.split(a,2,1)
c,d=np.split(c,2,1)
print(matrix)

result=np.array([np.mean(a),np.mean(b),np.mean(c),np.mean(d)])
result=np.reshape(result,(2,2))
print(result)