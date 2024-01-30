# FoundationDB Docker Playground

To run a test cluster you first need to build a docker image of FoundationDB. Look here [здесь](./docker-image-build/README.md).

After image build we can run `docker-compose`:

```bash
> just up
> just cli
```

And init our database:

```bash
fdb> configure new single ssd
fdb> status
```
