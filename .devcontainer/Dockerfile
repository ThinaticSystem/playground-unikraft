FROM mcr.microsoft.com/devcontainers/base:trixie

RUN rm --force /etc/apt/apt.conf.d/docker-clean \
	&& echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' \
	> /etc/apt/apt.conf.d/keep-cache

RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
	--mount=type=cache,target=/var/lib/apt,sharing=locked \
	apt-get update \
	&& apt-get install \
		--yes \
		--no-install-recommends \
			qemu-system-x86

RUN curl \
		--silent \
		--show-error \
		--fail \
		--location \
		--proto '=https' \
		--tlsv1.2 \
		-- \
		https://get.kraftkit.sh \
	| sudo sh -s -- \
		-y
