From ubuntu:18.04

RUN apt-get update && apt-get install -y npm git sudo \
    && npm install -g npx \
    && git clone https://github.com/DelphinusLab/rapidsnark.git \
# dependencies
    && apt install -y build-essential \
    && apt-get install -y libgmp-dev \
    && apt-get install -y libsodium-dev \
    && apt-get install -y nasm \
    && cd ./rapidsnark \
# compile prover
    && npm install \
    && git submodule init \
    && git submodule update \
    && npx task createFieldSources \
    && npx task buildProver
