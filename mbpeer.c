#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <assert.h>

#include <zmq.h>

//	********************************************************************************
//	utility
//	********************************************************************************

void *zmq_endpoint ( void *context, int type, char *url, char *comment ) {
	void *result = zmq_socket(context,type);
	assert(result != NULL);
	int rc = zmq_bind(result,url);
	assert(rc == 0);
	printf("New endpoint for %s at <%s>\n",comment,url);
	return result;
}

void failure ( char *comment ) {
	fprintf(stderr,"%s. Exiting ...\n",comment);
	exit(-1);
}

//	********************************************************************************
//	Packing and unpacking
//	********************************************************************************

struct mbJob {
	double x;
	double dx;
	double y;
	double dy;
	long resolution;
};

void pack_and_send ( void *s, char *identifier, long value, int flags ) {
	static char buffer[1024];
	sprintf(buffer,"%s %ld",identifier,value);
	// printf("SEND: %s\n",buffer);
	int len = strlen(buffer)+1;
	zmq_msg_t m;
	zmq_msg_init_size(&m,len);
	memcpy(zmq_msg_data(&m),buffer,len);
	zmq_msg_send(&m,s,flags);
	zmq_msg_close(&m);
}

void recv_and_unpack ( void *s, char **identifier, long *value ) {
	zmq_msg_t m;
	zmq_msg_init(&m);
	int len = zmq_msg_recv(&m,s,0);
	if (len == -1) {
		*identifier = NULL;
		*value = 0;
	}
	else {
		static char buffer[1024];
		sscanf((char *) zmq_msg_data(&m),"%s %ld",buffer,value);
		int identifier_len = strlen(buffer)+1;
		*identifier = malloc(identifier_len);
		memcpy(*identifier,buffer,identifier_len);
		// printf("RECV: %s %ld\n",*identifier,*value);
	}
	zmq_msg_close(&m);
}

//	********************************************************************************
//	The maths
//	********************************************************************************

long mb ( double x, double y, long depth ) {
	double r = x;
	double i = y;
	long loops = 0;
	while ((loops++ < depth) && (r*r + i*i < 8)) {
		double rnext = r*r - i*i + x;
		i = 2*r*i + y;
		r = rnext;
	}
	return loops;
}

void mbtest () {
	printf("\nThe neat mandelbrot set in ASCII art ... prouldy presented by this program :-)\n");
	for (double y=-1.2; y<1.2; y +=0.1) {
		for (double x=-2.05; x<0.55; x += 0.05) {
			if (mb(x,y,10) > 9) printf("*"); else printf(".");
		}
		printf("\n");
	}
}

//	********************************************************************************
//	mbpeer_worker
//	********************************************************************************

void mbpeer_worker ( int ac, char **av ) {
	if (ac < 5) failure("dispatch needs: <x> <dx> <y> <dy> <resolution>");

	struct mbJob job;
	sscanf(av[0],"%lf",&job.x);
	sscanf(av[1],"%lf",&job.dx);
	sscanf(av[2],"%lf",&job.y);
	sscanf(av[3],"%lf",&job.dy);
	sscanf(av[4],"%ld",&job.resolution);

	printf("dispatch: got x=%f, dx=%f, y =%f, dy=%f, resolution=%ld\n",
		job.x,job.dx,job.y,job.dy,job.resolution);

	void *context = zmq_ctx_new();

	zmq_ctx_destroy(context);
}

//	********************************************************************************
//	mbpeer_dispatch
//	********************************************************************************
void mbpeer_dispatch ( int ac, char **av ) {
	if (ac < 5) failure("dispatch needs: <x> <dx> <y> <dy> <resolution>");

	struct mbJob job;
	sscanf(av[0],"%lf",&job.x);
	sscanf(av[1],"%lf",&job.dx);
	sscanf(av[2],"%lf",&job.y);
	sscanf(av[3],"%lf",&job.dy);
	sscanf(av[4],"%ld",&job.resolution);

	printf("dispatch: got x=%f, dx=%f, y =%f, dy=%f, resolution=%ld\n",
		job.x,job.dx,job.y,job.dy,job.resolution);

	void *context = zmq_ctx_new();

	zmq_ctx_destroy(context);
}

//	********************************************************************************
//	main and it's helper functions
//	********************************************************************************
bool isRole ( char *role, char *value ) {
	return strcmp(role,value) == 0;
}

int main ( int ac, char **av ) {
	int major, minor, patch;
	zmq_version (&major, &minor, &patch);
	printf ("Current 0MQ version is %d.%d.%d\n", major, minor, patch);

	if (ac < 2) failure("usage: mbpeer <role=dispatch|worker|test>");
	
	if (isRole("dispatch",av[1]))
		mbpeer_dispatch(ac-2, &av[2]);
	else if (isRole("worker",av[1]))
		mbpeer_worker(ac-2, &av[2]);
	else if (isRole("test",av[1]))
		mbtest();
	else
		failure("Unkown role");

	exit(0);
}