FROM mcr.microsoft.com/devcontainers/base:trixie

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
