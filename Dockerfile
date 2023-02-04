# FROM openfaas/classic-watchdog:0.18.1 as watchdog

FROM nodered/node-red:1.3.5-12-minimal-arm64v8 as target-arm64

FROM nodered/node-red:1.3.5-12-minimal-arm32v7 as target-armv7

FROM target-$TARGETARCH$TARGETVARIANT

#USER root

#RUN mkdir -p /home/app

#COPY --from=watchdog /fwatchdog /usr/bin/fwatchdog
#RUN chmod +x /usr/bin/fwatchdog

# Add non root user
#RUN addgroup -S app && adduser app -S -G app
#RUN chown app /home/app

#WORKDIR /home/app

# Populate example here - i.e. "cat", "sha512sum" or "node index.js"
ENV fprocess="cat"
# Set to true to see request in function logs
ENV write_debug="false"

#EXPOSE 8080

#HEALTHCHECK --interval=3s CMD [ -e /tmp/.lock ] || exit 1

#CMD ["fwatchdog"]
