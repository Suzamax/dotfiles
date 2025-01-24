# dotfiles
My custom dotfiles, Kubernetes-centric.

# Nushell

Add this to the end of your `$nu.config-path` file:
```shell
mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

use ~/.config/nushell/kubeswitcher.nu
use ~/.config/nushell/kubectl.nu
```