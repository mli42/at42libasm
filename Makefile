# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/24 13:13:52 by mli               #+#    #+#              #
#    Updated: 2020/03/26 13:18:59 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

ASMC = nasm

ASMFLAGS = -f macho64

SRCS = ft_strlen.s ft_write.s

OBJS = ${SRCS:.s=.o}

${NAME}: ${OBJS}
	ar rcs ${NAME} ${OBJS}

.s.o:
	${ASMC} ${ASMFLAGS} $< -o ${<:.s=.o}

all : ${NAME}

clean:
	rm -rf ${OBJS}

fclean: clean
	rm -rf ${NAME}

re: fclean all

work: all clean

.PHONY: all clean fclean re work
