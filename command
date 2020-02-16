

kubectl get pod                                    get all information
kubectl describe pod <POD>                         describe about pod
kubectl expose pod <POD> --port=444 --name=front   Expose the port of a pod (creates a new service)
kubectl port-forward <POD> 8080                    Port forward the exposed pod port to your local machine
kubectl attach <PODNAME> -i                        Attach to the pod
kubectl exec <POD> -i -t -- /bin/bash                     Execute a command on the pod
kubectl label pods <POD> mylabel=awesome           Add a new lable to pod
kubectl run -i -tty busybox --image=busybox --restart=Never -- sh   Run a shell in a pod -very useful for debuging (telnet containerIP PORT)
examples
kubectl attach nodehelloworld.example.com
kubectl delete pod nodehelloworld.example.com      delete pod 
kubectl create -f  /root/kubernetes-course/first-app/helloworld.yml
kubectl port-forward nodehelloworld.example.com 8081:3000
kubectl expose pod nodehelloworld.example.com --type=NodePort  --name=hello-service
kubectl exec nodehelloworld.example.com -- sed 's/Hello World!/Hello IRAJ/g' /app/index.js
kubectl get service                                show the service kubernetes
kubectl describe service hello-service
kubectl delete node sysadmin
kubectl scale --replicas=4 -f /root/kubernetes-course/replication-controller/helloworld-repl-controller.yml 
kubectl get rc       show replication control

kubectl scale --replicas=2  rc/helloworld-controller #scale with rc (replication control)

deployments 
kubectl get deployments                           #get information about current deployments
kubectl get rs                                    #get about replica set
kubectl get pods  --show-labels                   #get show labels
kubectl create -f deployment/helloworld.yml --record
kubectl rollout status deploymne/helloworld-deployment  # get deployments status
kubectl set image deployment/helloworld-deployment k8s-demo=k8s-demo:2 
kubectl rollout status deploymne/helloworld-deployment 
kubectl edit deployment/helloworld-deployment  #revisionHistoryLimit: 100
kubectl rollout history deployments/helloworld-deployment
kubectl rollout undo deployments/helloworld-deployment   #rollback to previos version
kubectl rollout undo deployments/helloworld-deployment --to-revision=n 	 #rollback to n version
kubectl expose deployment helloworld-deployment --type=NodePort 
kubectl set image deployment/helloworld-deployment k8s-demo=wardviaene/k8s-demo:2
##############################################################################################
kubectl get nodes --show-labels
sample1:
      nodeSelector:
        hardware: high-spec
sample2:
      nodeSelector:
        kubernetes.io/hostname: docker3

kubectl label nodes docker4 hardware=high-spec

#############################################################################################
Secret
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.

You can also use a shorthand alias for kubectl that also works with completion:

alias k=kubectl
echo -n username | base64
echo -n password | base64
sample1:
apiVersion: v1
kind: Secret
metadata:
  name: db-secrets
type: Opaque
data:
  username: cm9vdA==
  password: cGFzc3dvcmQ=


sample2:
        volumeMounts:
        - name: cred-volume
          mountPath: /etc/creds
          readOnly: true
      volumes:
      - name: cred-volume
        secret: 
          secretName: db-secrets

##########################################################
Dashboard
ssh -L8001:localhost:8001  10.11.12.74
https://github.com/kubernetes/dashboard
https://gist.github.com/iraj-norouzi/168a786947964336f3bb2bd6878b62b8
##############################################################
pod logs crash
kubectl --v=8 logs kube-flannel-ds-amd64-8n6zp --namespace=kube-system -p
#########################################################################
(Autocpmplete)
source <(kubectl completion bash) # setup autocomplete in bash into the current shell, bash-completion package should be installed first.
echo "source <(kubectl completion bash)" >> ~/.bashrc # add autocomplete permanently to your bash shell.

You can also use a shorthand alias for kubectl that also works with completion:

alias k=kubectl
