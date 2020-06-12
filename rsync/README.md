# Client Side YAML example

```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: rsync-client
  namespace: rsync
  labels:
    app: rsync-cient
spec:
  storageClassName: nfs
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Secret
metadata:
  name: rsync-password
  namespace: rsync
type: Opaque
stringData:
  password: "123456"
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rsync-client
  namespace: rsync
  labels:
    app: rsync
    tier: client
spec:
  selector:
    matchLabels:
      app: rsync
      tier: client
  template:
    metadata:
      name: rsync-client
      labels:
        app: rsync
        tier: client
    spec:
      containers:
      - name: rsync-client
        image: dyadin/rsync-client:latest
        imagePullPolicy: IfNotPresent
        env:
        - name: crontab
          value: "* * * * * /backup.sh>>/var/log/rsync.log"
        - name: rsync_server
          value: "rsync-server-svc"
        - name: username
          value: "backupuser"
        - name: backup_path
          value: "/root/backup/"
        - name: dstconfig
          value: "common"
        - name: password
          valueFrom:
            secretKeyRef:
              name: rsync-password
              key: password
        volumeMounts:
        - mountPath: /root/backup/
          name: rsync-client
      volumes:
      - name: rsync-client
        persistentVolumeClaim:
          claimName: rsync-client
```

# server side YAML example
```yaml
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: rsync-backup
  namespace: rsync
  labels:
    app: rsync-backup
spec:
  storageClassName: nfs
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 1Gi
---
apiVersion: v1
kind: Secret
metadata:
  name: rsync-password
  namespace: rsync
type: Opaque
stringData:
  password: "123456"
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rsync-server
  namespace: rsync
  labels:
    app: rsync
    tier: server
spec:
  selector:
    matchLabels:
      app: rsync
      tier: server
  template:
    metadata:
      name: rsync-server
      labels:
        app: rsync
        tier: server
    spec:
      containers:
      - name: rsync-server
        image: dyadin/rsync-server
        imagePullPolicy: IfNotPresent
        ports:
        - name: rsync
          containerPort: 873
        env:
        - name: username
          value: "backupuser"
        - name: backup_path
          value: "/backup/"
        - name: password
          valueFrom:
            secretKeyRef:
              name: rsync-password
              key: password
        volumeMounts:
        - mountPath: /backup
          name: rsync-backup
        livenessProbe:
          tcpSocket:
            port: 873
          initialDelaySeconds: 5
          timeoutSeconds: 5
        readinessProbe:
          tcpSocket:
            port: 873
          initialDelaySeconds: 5
          timeoutSeconds: 5
      volumes:
      - name: rsync-backup
        persistentVolumeClaim:
          claimName: rsync-backup
---
apiVersion: v1
kind: Service
metadata:
  name: rsync-server-svc
  namespace: rsync
  labels:
    tier: rsync
    app: server
spec:
  ports:
    - name: rsync
      port: 873
      protocol: TCP
      targetPort: 873
  selector:
    app: rsync
    tier: server
  ```

# Service side configuration (on vms or bare metal)

/etc/rsyncd.conf
```
motd file = /etc/rsyncd.motd
transfer logging = yes
log file = /var/log/rsyncd.log
port = 873
address = 0.0.0.0
uid = root
gid = root
use chroot = no
read only = no
max connections = 10
[common]
comment = rsync server
path = /backup/
ignore errors
auth users = rsync
secrets file = /etc/rsyncd.secrets
hosts allow = 172.0.0.0/255.255.255.0
hosts deny = *
list = false
```

/etc/rsyncd.motd
```
welcome to rsync server!
```


 /etc/rsyncd.secrets
```
rsync:123456
```

```bash
chmod  600  /etc/rsyncd.secrets
rsync  --daemon
echo  "rsync  --daemon"  >>  /etc/rc.local
```



