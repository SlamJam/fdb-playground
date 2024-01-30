FROM fedora:40 as base

FROM base as build
    WORKDIR /build

    RUN dnf install -y \
        cmake \
        mono-core \
        ninja-build \
        clang \
        lz4-devel \
        lz4-static \
        git \
        patch \
        libcxx-devel \
        libcxx-static \
        which \
        jemalloc-devel \
        ccache \
        openssl-devel \
        rpm-build \
        boost-devel \
        toml11-devel \
        && dnf clean all \
        && rm -rf /var/cache/*

    ENV NPROC=2

FROM base as server
    ARG FDB_VERSION

    RUN test -n "$FDB_VERSION" || (echo "FDB_VERSION is not set" && false)

    COPY packages/* /tmp/packages/
    COPY --chmod=+x fdb.bash /var/fdb/scripts/fdb.bash

    RUN (test -f /tmp/packages/foundationdb-clients-${FDB_VERSION}-1.el7.aarch64.rpm \
        || (echo "absent foundationdb-clients-${FDB_VERSION}-1.el7.aarch64.rpm" && false)) \
        && (test -f /tmp/packages/foundationdb-server-${FDB_VERSION}-1.el7.aarch64.rpm \
        || (echo "absent foundationdb-server-${FDB_VERSION}-1.el7.aarch64.rpm" && false)) \
        && dnf localinstall -y \
        /tmp/packages/foundationdb-clients-${FDB_VERSION}-1.el7.aarch64.rpm \
        /tmp/packages/foundationdb-server-${FDB_VERSION}-1.el7.aarch64.rpm \
        && rm -rf /tmp/packages \
        && dnf install -y \
            tini \
            hostname \
        && dnf clean all \
        && rm -rf /var/cache/* \
        && mkdir -p /var/fdb/{logs,tmp,lib}

    WORKDIR /var/fdb
    VOLUME /var/fdb/data

    ENV FDB_PORT 4500
    ENV FDB_CLUSTER_FILE /var/fdb/fdb.cluster
    ENV FDB_NETWORKING_MODE container
    ENV FDB_COORDINATOR ""
    ENV FDB_COORDINATOR_PORT 4500
    ENV FDB_CLUSTER_FILE_CONTENTS ""
    ENV FDB_PROCESS_CLASS unset

    ENTRYPOINT ["/usr/bin/tini", "-g", "--", "/var/fdb/scripts/fdb.bash"]
