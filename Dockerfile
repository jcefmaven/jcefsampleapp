#Step 1: Use debian
FROM debian:bookworm-slim

#Required packages
ENV TOOLS ca-certificates curl jq openjdk-17-jdk maven

#Step 2: Install tools
RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends $TOOLS
    
#Copy scripts, sources and templates
COPY scripts scripts
COPY src src
COPY pom.xml pom.xml
RUN chmod +x scripts/*

