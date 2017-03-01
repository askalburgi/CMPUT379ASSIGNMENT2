CC=gcc 
cCAT=./dependencies/clientConnectAndTalk/connectAndTalk.c
sCAT=./dependencies/serverConnectAndTalk/connectAndTalk.c
sT=./dependencies/serverConnectAndTalk/talk.c
encryp=./dependencies/encryption/cryption.c
base=./dependencies/encryption/base64enc-dec.c


all: client server

clean: 
	@rm -f client
	@rm -f server

client: client.c $(cCAT) cryption.o base64.o
	$(CC) $< $(cCAT) cryption.o base64enc-dec.o -lcrypto -o client 

server: server.c $(sCAT) $(sT) cryption.o base64.o 
	$(CC) $< $(sCAT) $(sT) cryption.o base64enc-dec.o -pthread -lcrypto -o server

cryption.o: $(encryp)
	$(CC) $< -c

base64.o: $(base)
	$(CC) $< -c