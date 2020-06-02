#include <assert.h>
#include <errno.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include "libasm.h"

#define MAKEITABORT 0
// Globals
int g_all = 2, g_done = 0, g_wr = 0;

void	__attribute__((destructor)) ft_destructor();

void	ft_destructor(void)
{
	printf("\n");
	printf("\033[0;94mTests finished!\n");
	printf("\033[0;96mTotal:\033[0;91m%d\033[0;1m/\033[92m%d\n", g_done, g_all);
	printf("\033[0;96mft_write: \033[92m%d\n", g_wr);

	printf("\033[0m");
}

void	ft_signal(int sign)
{
	(void)sign;
	exit(1);
}

void	truefalse(const int eq[2])
{
	printf("\033[0;93m[%d]" \
			"\033[0;95mReturn \033[0;%s " \
			"\033[0;94mErrno \033[0;%s\033[0m\n", ++g_done,
			eq[0] ? "92mTrue" : "91mFalse", eq[1] ? "92mTrue" : "91mFalse");
}

int		test_write(const int fd,const char * const str, const int size)
{
	int err;
	int ret[2];
	int eq[2];

	ret[0] = ft_write(fd, str, size);
	err = errno;
	ret[1] = write(fd, str, size);
	eq[0] = ret[0] == ret[1]; eq[1] = err == errno;
	truefalse(eq);
	g_wr++;
	return (eq[0] && eq[1] ? 1 : 0);
}

int		main(void)
{
	if (!MAKEITABORT)
		signal(SIGABRT, ft_signal);
	assert(test_write(9, "Hello", 4));
}
