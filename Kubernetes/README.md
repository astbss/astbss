https://discuss.kubernetes.io/t/kubectl-tips-and-tricks/192/19

List all the pods showing name and namespace with a json path expression

kubectl get pods -o=jsonpath="{.items[*]['metadata.name', 'metadata.namespace']}"

k delete pod pod1 --force --grace-period 0

kubectl get all
kubectl get all -A

Here is how we could get only that pod that uses most CPU:
k top pod -n kube-system --sort-by=cpu | head -2 | tail -n 1

Another is using labels with logs. Especially nice if you have a bunch of pods using the same label

kubectl -n <namespace> logs -l label=somename



you can delete the non-running pods with the following command without using grep and awk. as kubectl provide this functionality natively

kubectl delete $(kubectl get pod --no-headers --field-selector=status.phase!=Running -o name )

================
I find this combo very helpful, a fuzzy finder fzf 23 + kubectl + some bash/zsh function.

Examples:
exec into a pod

kx () {
	local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
	local cmd=${@:-"bash"}

	echo kubectl exec -it --namespace $pod[1] $pod[2] $cmd
	kubectl exec -it --namespace $pod[1] $pod[2] $cmd
}
logs

kl () {
	local pod=($(kubectl get pods --all-namespaces -owide | fzf | awk '{print $1, $2}'))
	local attr=${@:-""}

	echo kubectl logs -f $attr --namespace $pod[1] $pod[2]
	kubectl logs -f $attr --namespace $pod[1] $pod[2]
}
================
Retrieving Pod Name

Often times you need to get the name of a pod. We can easily retrieve this and store it into a shell variable. In this case we’ll retrieve a pod by it’s label:

kubectl get pods --all-namespaces -lapp=my-awesome-app -o jsonpath='{.items[0].metadata.name}

Now you can take the output of this command and store it in a variable like:

MY_POD=$(kubectl get pods --all-namespaces -lapp=my-awesome-app -o jsonpath='{.items[0].metadata.name})

So later you can run commands like:

kubectl logs -f $MY_POD
kubectl exec -it $MY_POD sh
================


Run a shell in a new pod (to examine the kubernetes environment from the inside):

alias kshell='kubectl run -it shell --image giantswarm/tiny-tools --restart Never --rm -- sh'


Fuzzy search kube contexts and easily switch. (Requires fzf 9)

alias kctx='kubectl config use-context $(kubectl config get-contexts -o=name | fzf)'

I found a little useful tool : shows kubernetes secret with values base64 decoded
kubectl get secret my-secret -o yaml | ksd

Update all files stored in ConfigMap at once (Slack #kubernetes-user, thanks @liggitt):

kubectl create configmap your_configmap_here --from-file=/path/to/dir --dry-run -o yaml | kubectl replace -f -

A very usefull tool to get logs in realtime and in color.
https://github.com/wercker/stern


Port scan a service using nmap:
$ kubectl run --image=mateothegreat/docker-alpine-nmap \
              --rm -i -t nm -- \
              -Pn -p9200,9300 elasticsearch


I’m a big fan of using kubectl explain <object> for getting information about k8s objects. This is very helpful when dealing with objects you don’t use often and forget certain properties.

you can delete the non-running pods with the following command without using grep and awk. as kubectl provide this functionality natively

kubectl delete $(kubectl get pod --no-headers --field-selector=status.phase!=Running -o name )
