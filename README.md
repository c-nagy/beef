Docker for BeEF
---------------

## Usage

### Build

```sh
docker build -t beef --build-arg COMMIT=master https://github.com/c-nagy/beef.git
```

### Run

```sh
docker run -itd \
           --name=beef \
           -p 443:443 \
           -p 6789:6789 \
           -p 61985:61985 \
           -p 61986:61986 \
           beef
```

### Drop into a shell

```sh
docker exec -it beef /bin/bash
```

### If the shell keeps dying

```sh
docker run -it --entrypoint /bin/bash beef -s
```
