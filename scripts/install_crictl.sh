. /sv/scripts/errorHandler.sh
. /sv/scripts/variables.sh

current_crictl_version=$(crictl --version 2> /dev/null || true)
crictl_version_expected="crictl version $crictl_version"

if [ "$current_crictl_version" != "$crictl_version_expected" ]; then
	cd /tmp
	curl -Lo crictl.tar.gz  https://github.com/kubernetes-sigs/cri-tools/releases/download/v1.27.0/crictl-$crictl_version-linux-${PLATFORM}.tar.gz
	tar zxvf crictl.tar.gz -C /bin
	rm -f crictl.tar.gz
fi
