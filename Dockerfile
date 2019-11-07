FROM norionomura/swiftlint:0.36.0_swift-5.1.0 as build

RUN strip -s /usr/bin/swiftlint && \
    strip -s /usr/lib/swift/linux/*.so && \
    strip -s /usr/lib/libsourcekitdInProc.so /usr/lib/libBlocksRuntime.so

RUN chmod a+x /usr/lib/libsourcekitdInProc.so /usr/lib/libBlocksRuntime.so

RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends openjdk-8-jre libatomic1 libcurl3 libbsd0 libxml2 wget && \
    wget http://security.ubuntu.com/ubuntu/pool/main/i/icu/libicu55_55.1-7ubuntu0.4_amd64.deb && \
    dpkg -i libicu55_55.1-7ubuntu0.4_amd64.deb && \
    apt-get remove --purge -y wget && \
    apt-get clean && \
    rm -rf libicu55_55.1-7ubuntu0.4_amd64.deb /var/lib/apt/lists/*

CMD swiftlint version
