def kubectl-contexts [] {
	open $env.KUBECONFIG | from yaml | get contexts.name
}

def kubectl-resources [] {
	kubectl api-resources -o name | lines
}

def kubectl-namespaces [] {
	kubectl get ns -o name | lines | split column '/' | get column2 
}

def kubectl-outputs [] {
	"json|yaml|name|go-template|go-template-file|template|templatefile|jsonpath|jsonpath-as-json|jsonpath-file|custom-columns|custom-columns-file|wide" | split row '|'
}

export extern "get" [
	resource: string@kubectl-resources          # name of Kubernetes resource
	--namespace(-n): string@kubectl-namespaces  # show resources from specific Kubernetes namespace
	--all-namespaces(-A)                        # show resources all Kubernetes namespaces
	--context: string@kubectl-contexts          # context from your kubernetes configuration file
	--output(-o): string@kubectl-outputs        # output format
]