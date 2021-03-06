## k8s-aws-inspector
This project helps to run the AWSAgent in k8s as a daemon set, test project.

## awsagent as a daemon set in k8s
You can find more about awsagent and AWS Inspector in the user guide by this link: https://docs.aws.amazon.com/inspector/latest/userguide/
inspector_introduction.html.

## usage
```
k exec $NS_NAME-awsagent-xccb6 -n $NS_NAME /etc/init.d/awsagent status
```

## Build image, publishing 
To build the image and publishing it on Quay registry, the tag and namespace should be filled in ./charts/k8s-aws-inspector/values.yaml
```
cd k8s-aws-inspector;
. ops/env.sh; ops/docker-build.sh; ops/docker-stage.sh
```
## Installing the Chart
```
cd k8s-aws-inspector;
./ops/helm-package.sh; helm install charts/$NS_NAME-$APP_VERSION.tgz --name $NS_NAME --namespace=$NS_NAME -f helm/$NS_NAME/values.yaml
```
## Upgrade installed Chart
```
cd k8s-aws-inspector;
ops/helm-package.sh; helm upgrade $NS_NAME -f helm/$NS_NAME/values.yaml charts/$NS_NAME-$APP_VERSION.tgz
```
## Delete Chart
```
helm delete --purge $NS_NAME;
```
## List deployed Charts
```
helm list
```
or all
```
helm list -a
```
## Misc
This app runs in the root of the project dir.
The deployment script will create the namespace or you can create it by the: `kubectl create -f helm/namespace.yaml`.

To get the the deployment status.
```
helm status $NS_NAME 
```

## ---
The result is the root`\` and core from CoreOS(node-k8s) are not supportable because of last is encrypted, but we only used the Amazon Linux as the image in docker.
And finally, possible it only supports `Network Reachability-1.1`,.

##  
If we still want to use the CoreOS possible next step is to dive into the project by the link below:
https://gist.github.com/jwieringa/9c8879d8c136979ef8e75a7aa05a3195
