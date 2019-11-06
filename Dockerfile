FROM norionomura/swiftlint:0.36.0_swift-5.1.0 as build

RUN strip -s /usr/bin/swiftlint && \
    strip -s /usr/lib/swift/linux/*.so && \
    strip -s /usr/lib/libsourcekitdInProc.so /usr/lib/libBlocksRuntime.so

RUN chmod a+x /usr/lib/libsourcekitdInProc.so /usr/lib/libBlocksRuntime.so

FROM openjdk:8-jre-slim

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends libatomic1 libcurl4 libbsd0 libxml2 wget && \
    wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu55_55.1-7ubuntu0.4_amd64.deb && \
    dpkg -i libicu55_55.1-7ubuntu0.4_amd64.deb && \
    apt-get remove --purge -y wget && \
    apt-get clean && \
    rm -rf libicu55_55.1-7ubuntu0.4_amd64.deb /var/lib/apt/lists/*

COPY --from=build /usr/lib/swift/linux /usr/lib/swift/linux/
COPY --from=build /usr/bin/swiftlint /usr/bin/
COPY --from=build /usr/lib/libsourcekitdInProc.so /usr/lib/
COPY --from=build /usr/lib/libBlocksRuntime.so /usr/lib/

CMD [swiftlint, version]
