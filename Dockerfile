# This had to be changed to ubuntu:20.04, as the vulnerabilities for
# curl were not yet fixed for debian 11 (the base image used by dart)
FROM ubuntu:20.04

ARG TOOL_VERSION
ARG DEBIAN_FRONTEND=noninteractive

# -------------------------------------------------------
# --------------------- HACK CONFIG ---------------------
# -------------------------------------------------------
# This is a copy of the original docker file provided by
# dart. We are only adding this here temporarily to run with
# the ubuntu base image, which solves all the critical
# vulnerabilities

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        dnsutils \
        git \
        openssh-client \
        unzip \
    ; \
    rm -rf /var/lib/apt/lists/*

# Create a minimal runtime environment for executing AOT-compiled Dart code
# with the smallest possible image size.
RUN set -eux; \
    case "$(dpkg --print-architecture)" in \
        amd64) \
            TRIPLET="x86_64-linux-gnu" ; \
            FILES="/lib64/ld-linux-x86-64.so.2" ;; \
        armhf) \
            TRIPLET="arm-linux-gnueabihf" ; \
            FILES="/lib/ld-linux-armhf.so.3 \
                /lib/arm-linux-gnueabihf/ld-linux-armhf.so.3";; \
        arm64) \
            TRIPLET="aarch64-linux-gnu" ; \
            FILES="/lib/ld-linux-aarch64.so.1 \
                /lib/aarch64-linux-gnu/ld-linux-aarch64.so.1" ;; \
        *) \
            echo "Unsupported architecture" ; \
            exit 5;; \
    esac; \
    FILES="$FILES \
        /etc/nsswitch.conf \
        /etc/ssl/certs \
        /usr/share/ca-certificates \
        /lib/$TRIPLET/libc.so.6 \
        /lib/$TRIPLET/libdl.so.2 \
        /lib/$TRIPLET/libm.so.6 \
        /lib/$TRIPLET/libnss_dns.so.2 \
        /lib/$TRIPLET/libpthread.so.0 \
        /lib/$TRIPLET/libresolv.so.2 \
        /lib/$TRIPLET/librt.so.1"; \
    for f in $FILES; do \
        dir=$(dirname "$f"); \
        mkdir -p "/runtime$dir"; \
        cp --archive --link --dereference --no-target-directory "$f" "/runtime$f"; \
    done


# This gets the SDK version 2.17.0, which is the current
# one we are using to get dartanalyzer, while maintaining
# the latest docker base image
ENV DART_SDK /usr/lib/dart
ENV PATH $DART_SDK/bin:$PATH
ENV DART_VERSION ${TOOL_VERSION}

WORKDIR /root
RUN set -eux; \
    case "$(dpkg --print-architecture)" in \
        amd64) \
            DART_SHA256=57b8fd964e47c81d467aeb95b099a670ab7e8f54a1cd74d45bcd1fdc77913d86; \
            SDK_ARCH="x64";; \
        armhf) \
            DART_SHA256=c522ca1744de506276d19c1a5c120526daec142d2d7595d6915f77838066c2e8; \
            SDK_ARCH="arm";; \
        arm64) \
            DART_SHA256=05a1db0fd84585877d6180858346d7c53c7ef89433667db3b85f3f2e5fa7036b; \
            SDK_ARCH="arm64";; \
    esac; \
    SDK="dartsdk-linux-${SDK_ARCH}-release.zip"; \
    BASEURL="https://storage.googleapis.com/dart-archive/channels"; \
    URL="$BASEURL/stable/release/$DART_VERSION/sdk/$SDK"; \
    echo "SDK: $URL" >> dart_setup.log ; \
    curl -fLO "$URL"; \
    echo "$DART_SHA256 *$SDK" \
        | sha256sum --check --status --strict -; \
    unzip "$SDK" && mv dart-sdk "$DART_SDK" && rm "$SDK" \
        && chmod 755 "$DART_SDK" && chmod 755 "$DART_SDK/bin";


# ------------------------------------------------------
# --------------------- OUR CONFIG ---------------------
# ------------------------------------------------------

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
