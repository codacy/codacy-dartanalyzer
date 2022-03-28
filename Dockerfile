ARG TOOL_VERSION

FROM dart:${TOOL_VERSION}

WORKDIR /
#Set dart pub cache location to root
ENV PUB_CACHE=/

#Create development context (Create or copy necessary dart development files)
RUN mkdir .dart_tool
COPY docs/dartanalyzer/.packages /
COPY docs/dartanalyzer/pubspec.yaml /
COPY docs/dartanalyzer/pubspec.lock /

#Install supported lints
RUN dart pub add lints --dev
RUN dart pub add flutter_lints --dev


COPY docs /docs
COPY target/graalvm-native-image/codacy-dartanalyzer /workdir/
RUN chmod 755 /usr/lib/dart && adduser --uid 2004 --disabled-password --gecos "" docker
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-dartanalyzer"]
