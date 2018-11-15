# sv-kubernetes changelog

## 11/15/2018

* sv-kubernetes system refactored to built on a Ubuntu box instead of Centos.
* Build scripts re-engineered so that the main `setup.sh` can be executed multiple times to update all necessary pieces.
* Build scripts split into sub-scripts to allow them to be executed individually when the time arises.
* `settings.yaml` file can now be placed in the root of your application helm repo and specify an array of containers. Each container will be cloned down on a `sv install`, in addition the containers can be auto-build when running `sv start`
* `sv restart` removed and replace with `--build`.
* `sv start app env --build` will now build all containers specified in the `settings.yaml` file.