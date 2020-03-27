# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/24 13:13:52 by mli               #+#    #+#              #
#    Updated: 2020/03/27 23:20:13 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

ASMC = nasm

ASMFLAGS = -f macho64

SRCS = ft_strlen.s ft_write.s ft_strcpy.s ft_strcmp.s ft_read.s ft_strdup.s
SRCS_BONUS = ft_list_size_bonus.s ft_list_push_front_bonus.s

OBJS = ${SRCS:.s=.o}
OBJS_BONUS = ${SRCS_BONUS:.s=.o}

${NAME}: ${OBJS}
	ar rcs ${NAME} ${OBJS}

bonus: ${OBJS} ${OBJS_BONUS}
	ar rcs ${NAME} ${OBJS} ${OBJS_BONUS}

.s.o:
	${ASMC} ${ASMFLAGS} $< -o ${<:.s=.o}

all : ${NAME}

clean:
	rm -rf ${OBJS} ${OBJS_BONUS}

fclean: clean
	rm -rf ${NAME}

re: fclean all

work: all clean

.PHONY: all clean fclean re work
