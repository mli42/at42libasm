# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mli <mli@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/03/24 13:13:52 by mli               #+#    #+#              #
#    Updated: 2020/07/09 15:29:48 by mli              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

ASMC = nasm

ASMFLAGS = -f macho64

SRCS = ft_strlen.s ft_write.s ft_strcpy.s ft_strcmp.s ft_read.s ft_strdup.s
SRCS_BONUS = ft_list_size_bonus.s ft_list_push_front_bonus.s ft_atoi_base.s \
			 ft_list_remove_if.s ft_list_sort.s

OBJ_PATH = ./obj/
OBJS = ${addprefix ${OBJ_PATH}, ${SRCS:.s=.o}}
OBJS_BONUS = ${addprefix ${OBJ_PATH}, ${SRCS_BONUS:.s=.o}}

${NAME}: ${OBJ_PATH} ${OBJS}
	ar rcs ${NAME} ${OBJS}

bonus: ${OBJ_PATH} ${OBJS} ${OBJS_BONUS}
	ar rcs ${NAME} ${OBJS} ${OBJS_BONUS}

${OBJ_PATH}:
	mkdir -p ${OBJ_PATH}

${OBJ_PATH}%.o:%.s
	${ASMC} ${ASMFLAGS} $< -o $@

all : ${NAME}

clean:
	rm -rf ${OBJ_PATH}

fclean: clean
	rm -rf ${NAME}

re: fclean all

work: all clean

.PHONY: all clean fclean re work
