# 使用

## 创建镜像

```sh
docker build -t statsvn:20211224 .
```

## 创建项目配置

配置目录 /statsvn/conf  
工作目录 /statsvn/work

# /statsvn/conf/index.html
使用docker-index.html做示例，放置所有项目的跳转

# /statsvn/conf/statsvn.sh
使用docker-statsvn.sh做示例，放置所有项目的定义



## 镜像使用

```yaml
version: '2'
services:
    statsvn:
      image: statsvn:20211224
      ports:
        - "80:80"
      volumes:
        - /statsvn/conf/index.html:/usr/share/nginx/html/index.html
        - /statsvn/conf/statsvn.sh:/app/statsvn.sh
        - /statsvn/work:/app/work

```

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: statsvn
  labels:
    app: statsvn
spec:
  replicas: 1
  selector:
    matchLabels:
      app: statsvn
  template:
    metadata:
      labels:
        app: statsvn
    spec:
      restartPolicy: Always
      containers:
        - name: statsvn
          image: 'statsvn:latest'
          imagePullPolicy: Always
          resources:
            requests:
              memory: 4Gi
            limits:
              memory: 5Gi
          volumeMounts:
            - name: config
              mountPath: /usr/share/nginx/html/index.html
              subPath: index.html
            - name: config
              mountPath: /app/statsvn.sh
              subPath: statsvn.sh
            - name: statsvn
              mountPath: /app/work
      volumes:
        - name: config
          configMap:
            name: statsvn
            defaultMode: 420
        - name: statsvn
          persistentVolumeClaim:
            claimName: statsvn
---
apiVersion: v1
kind: Service
metadata:
  name: statsvn
spec:
  ports:
    - name: statsvn
      port: 80
      protocol: TCP
      targetPort: 80
  selector:
    app: statsvn
  type: ClusterIP
---
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  annotations:
    nginx.ingress.kubernetes.io/ssl-redirect: 'true'
  generation: 1
  name: statsvn
spec:
  rules:
    - host: statsvn.sample.net
      http:
        paths:
          - backend:
              serviceName: statsvn
              servicePort: 80
            path: /

```