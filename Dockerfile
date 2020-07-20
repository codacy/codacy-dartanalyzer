FROM norionomura/swiftlint:0.39.2 as build

WORKDIR /src
COPY docs /docs
COPY target/graalvm-native-image/codacy-swiftlint /workdir/
RUN adduser --uid 2004 --disabled-password --gecos "" docker
USER docker
ENTRYPOINT ["/workdir/codacy-swiftlint"]
