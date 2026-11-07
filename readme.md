# Unikraft on Dev Container on WSL2

## Run unikernel

```sh
kraft run \
	--plat qemu \
	--arch x86_64 \
	--rm \
	--port 3000:3000 \
	.
```
