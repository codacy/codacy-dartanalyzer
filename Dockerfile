FROM dart:2.15.1

COPY docs /docs
COPY target/graalvm-native-image/codacy-dartanalyzer /workdir/
RUN chmod 755 /usr/lib/dart && adduser --uid 2004 --disabled-password --gecos "" docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-dartanalyzer"]
