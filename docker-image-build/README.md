# FoundationDB Docker Images for Aarch64

The images are based on `Fedora:40'.

Inspired by images from the repository [FoundationDB/fdb-build-support](https://github.com/FoundationDB/fdb-build-support/blob/main/docker/centos7/Dockerfile) and [FreeBSD port](https://github.com/freebsd/freebsd-ports/blob/main/databases/foundationdb/Makefile).

The build is very memory-intensive. On Macbook Pro M2 Max, I allocated 16GB and 6 cores for Docker, the build takes about 50 minutes.

You can see very very long paths this is due to the following:

> Source dir path must be longer than debuginfo sources dir path.  Set
> CPACK_RPM_BUILD_SOURCE_DIRS_PREFIX variable to a shorter value or make
> source dir path longer.  Required for debuginfo packaging.  See
> documentation of CPACK_RPM_DEBUGINFO_PACKAGE variable for details.
> Default "/usr/src/debug/<CPACK_PACKAGE_FILE_NAME>" and
>     for component packaging "/usr/src/debug/<CPACK_PACKAGE_FILE_NAME>-<component>"
> Example: '/usr/src/debug/foundationdb-7.1.53-Linux/clients-el7/src_0'

First of all, you need to create an image with assembly dependencies:

`> just make_build_container`

Next we checked out foundationds sources and run buld:

`> git clone https://github.com/apple/foundationdb.git`

`> just build_packages ./foundationdb`

And finally build container with `FoundationDB`:

`> just make_fdb_container`
