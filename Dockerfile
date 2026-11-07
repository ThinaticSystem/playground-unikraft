# Use musl
FROM rust:1.99.1-alpine3.24 AS builder

WORKDIR /repo

COPY Cargo.toml Cargo.lock \
	/repo/
COPY src/ \
	/repo/src/

RUN set -xe; \
	cargo build \
		--release \
		--locked

FROM scratch

COPY --from=builder /repo/target/release/playground-unikraft /playground-unikraft
