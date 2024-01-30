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
fdb> configure new single ssd
fdb> status
```
