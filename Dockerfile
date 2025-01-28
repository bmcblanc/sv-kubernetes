FROM ubuntu:22.04

# Variables
ENV KUBECONFIG=/.kube/config

COPY scripts/platform_lookup.sh scripts/requireRoot.sh scripts/errorHandler.sh scripts/variables.sh /sv/scripts/
COPY internal/ /sv/internal/

# Intsall dependencies
COPY scripts/install_misc.sh /sv/scripts/install_misc.sh
RUN bash /sv/scripts/install_misc.sh

# Install Github
COPY scripts/install_github.sh /sv/scripts/install_github.sh
RUN bash /sv/scripts/install_github.sh

# Install GCloud
COPY scripts/install_gcloud.sh /sv/scripts/install_gcloud.sh
RUN bash /sv/scripts/install_gcloud.sh

# Install Docker
COPY scripts/install_docker.sh /sv/scripts/install_docker.sh
RUN bash /sv/scripts/install_docker.sh

# Install kubectl
COPY scripts/install_kubectl.sh /sv/scripts/install_kubectl.sh
RUN bash /sv/scripts/install_kubectl.sh

# Install Helm
COPY scripts/install_helm.sh /sv/scripts/install_helm.sh
RUN bash /sv/scripts/install_helm.sh

# Install kubesec
COPY scripts/install_kubesec.sh /sv/scripts/install_kubesec.sh
RUN bash /sv/scripts/install_kubesec.sh

# Install SV CLI
COPY sv/ /sv/sv/
COPY scripts/install_sv.sh /sv/scripts/install_sv.sh
RUN bash /sv/scripts/install_sv.sh

COPY docker/docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "sleep", "infinity" ]
