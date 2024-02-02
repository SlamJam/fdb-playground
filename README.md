# FoundationDB Docker Playground

For automation used [just](https://just.systems) as a more human-oriented `make`. You can get it from [brew](https://brew.sh/).

To run a test cluster you first need to build a docker image of FoundationDB. Look [here](./docker-image-build/README.md).

After the image is assembled we can run `docker-compose`:

```bash
> just up
> just cli
```

And init our database:

```bash
fdb> configure new single ssd-redwood-1-experimental
fdb> status
```

> Redwood’s storage engine name is is ssd-redwood-1-experimental in FDB 7.1 and 7.2. Despite the “experimental” label, this version of Redwood is production-ready and Snowflake has been using it in production for about 6 months.
>
> We will be dropping the -experimental suffix soon on the main branch, and starting with FDB 7.3 the name will just be ssd-redwood-1 but for backward compatibility the ssd-redwood-1-experimental name will still be supported as an alias.

[link](https://forums.foundationdb.org/t/redwood-storage-engine-documentation-for-7-1-is-missing/3575/7)
