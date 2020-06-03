
#include "libasm.h"
#include <errno.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

int		main(int argc, char **argv)
{
	(void)argc; (void)argv;

	int old;
	char *hey;

	hey = ft_strdup("HEYHO\n");
	old = errno;
	printf("%d\t%s\n", old, hey);
	printf("%d\t%d\n", old, errno);
	perror(NULL);
}
