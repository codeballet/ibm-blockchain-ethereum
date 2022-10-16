FROM ethereum/client-go:alltools-stable

WORKDIR /root/my_network

COPY ./my_network/CustomGenesis.json .
