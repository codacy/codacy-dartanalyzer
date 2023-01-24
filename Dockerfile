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
COPY docs/dartanalyzer/analysis_options.yaml /

#Install supported lints
RUN dart pub add lints --dev
RUN dart pub add flutter_lints --dev


COPY docs /docs
COPY target/graalvm-native-image/codacy-dartanalyzer /workdir/
RUN chmod 755 /usr/lib/dart
RUN chmod 755 /analysis_options.yaml
RUN adduser --uid 2004 --disabled-password --gecos "" docker
RUN chown docker /analysis_options.yaml
USER docker
WORKDIR /src
ENTRYPOINT ["/workdir/codacy-dartanalyzer"]
