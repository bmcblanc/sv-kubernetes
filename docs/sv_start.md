Usage: sudo sv start [applicationName] [env]

Start an application from an application located in your /applications/ folder.

* If your application contains a 'values_[env].yaml' which corresponds with the env, it will add that file as a helm values file.
* The deployments have access to custom SV values to ease the building of deployments. See the [docs](https://github.com/simpleviewinc/sv-kubernetes/) for more info.

`sv start` is a wrapper for `helm upgrade`, any additional arguments will be passed to `helm upgrade`. Visit [helm upgrade](https://docs.helm.sh/helm/#helm-upgrade) for details.

Example:
```
# start an application
sudo sv start test-application local
# start an application but pass additional Helm arguments to help debug the config
sudo sv start test-application local --dry-run --debug
```