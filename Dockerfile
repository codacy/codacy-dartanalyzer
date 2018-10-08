FROM norionomura/swiftlint:0.27.0_swift-4.2.0 as build

RUN strip -s /usr/bin/swiftlint && \
    strip -s /usr/lib/swift/linux/*.so && \
    strip -s /usr/lib/libsourcekitdInProc.so /usr/lib/x86_64-linux-gnu/libBlocksRuntime.so.0

RUN chmod a+x /usr/lib/libsourcekitdInProc.so /usr/lib/x86_64-linux-gnu/libBlocksRuntime.so.0


FROM openjdk:8-jre-slim

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends libatomic1 libcurl3 libbsd0 libxml2 wget && \
    wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu55_55.1-7ubuntu0.4_amd64.deb && \
    dpkg -i libicu55_55.1-7ubuntu0.4_amd64.deb && \
    apt-get remove --purge -y wget && \
    apt-get clean && \
    rm -rf libicu55_55.1-7ubuntu0.4_amd64.deb /var/lib/apt/lists/*

COPY --from=build /usr/lib/swift/linux /usr/lib/swift/linux/
COPY --from=build /usr/bin/swiftlint /usr/bin/
COPY --from=build /usr/lib/libsourcekitdInProc.so /usr/lib/
COPY --from=build /usr/lib/x86_64-linux-gnu/libBlocksRuntime.so.0 /usr/lib/x86_64-linux-gnu/

CMD [swiftlint, version]
