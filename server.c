#include "./dependencies/server.h"

int main() {
	char str[100];
	int	snew, fromlength;
	struct	sockaddr_in	from;

	int sock = connect_socket(); 
	connection_established(sock); 
	talk(sock); 
	printf("DONE!\n");

}