ARG TOOL_VERSION

FROM dart:${TOOL_VERSION}

COPY docs /docs
COPY target/graalvm-native-image/codacy-dartanalyzer /workdir/
RUN chmod 755 /usr/lib/dart && adduser --uid 2004 --disabled-password --gecos "" docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-dartanalyzer"]
