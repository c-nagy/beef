Docker for BeEF
---------------

## Usage

### Build

```sh
docker build -t beef https://github.com/c-nagy/beef.git
```

### Run

Run pre-built image from the docker hub:
```sh
docker run -itd \
           --name=beef \
           -p 3000:3000 \
           -p 6789:6789 \
           -p 61985:61985 \
           -p 61986:61986 \
           c-nagy/beef
```

BeEF will be available at `http://localhost:3000/ui/panel`. By default the user
is `beef` and the password is randomly generated. You can see the actual
credentials when container starts and with `docker logs beef`.
