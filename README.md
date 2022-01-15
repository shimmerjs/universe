```sh
# i am using git-crypt to prevent my NCR hostname/id from being 
# exposed on the public internet.  it is not in fact sensitive
# and i am not leaking any secrets by checking in my git-crypt secret
just unlock
just build
```

- Assumes NixOS hosts are managed using `colmena`
- This repository can support multiple homies, by way of homie-specific directories under `homies/`.  The exact path, e.g. `homies/shimmerjs` is inferred by `hack/` scripts.  If the `$HOMIE` environment variable is set, that will be used.  The value of `whoami` is used by default if `$HOMIE` is unset.

## OSX

- Use `just home-build` / `just home-switch` to manage `home-manager` configuration.

