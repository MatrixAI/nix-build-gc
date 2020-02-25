# nix-build-gc

Given a directory, this command will delete all symlinks that point to the `/nix/store` and garbage collect the associated objects in the store. This is useful after using `nix-build` to manually clean up the built artifacts. Otherwise you will leak objects into the `/nix/store` requiring a complicated garbage collecting operation. Run this before running `nix-build` again.
