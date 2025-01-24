def get-kubeconfig [] {
    ls ~/.kube/config.d/**/*.config | get name
}

export def --env main [
    config: string@get-kubeconfig
] {
    $env.KUBECONFIG = $config
}