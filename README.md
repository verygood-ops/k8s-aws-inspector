## k8s-aws-inspector
This project helps to run the AWSAgent in k8s as a daemonset.

## awsagent as a geamon set in k8s
You can find more about awsagent and AWS Inspector in the user guide by this link: https://docs.aws.amazon.com/inspector/latest/userguide/inspector_introduction.html.

## Build image, publishing 
To build the image and publishing it on Quay registry, the tag and namespace should be filled in ./charts/k8s-aws-inspector/values.yaml
```
cd k8s-aws-inspector;
. ops/env.sh; ops/docker-build.sh; ops/docker-stage.sh
```

## Installing the Chart
```
cd k8s-aws-inspector;
./ops/helm-package.sh; helm install charts/$APP_NAME-$APP_VERSION.tgz --name $APP_NAME --namespace=$APP_NAME -f helm/$APP_NAME/values.yaml
```

## Upgrade installed Chart
```
cd verygood.charts;
ops/helm-package.sh; helm upgrade $APP_NAME -f helm/$APP_NAME/values.yaml charts/$APP_NAME-$APP_VERSION.tgz
```

## Delete Chart
```
helm delete --purge $APP_NAME;
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
These app runs in root of the project dir.
The deployment script will create the namespace or you can create it by the: `kubectl create -f helm/namespace.yaml`.


To get the the deployment status.
```
helm status $APP_NAME 
```

