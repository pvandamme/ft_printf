# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tduval <tduval@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/11/15 20:08:30 by tduval            #+#    #+#              #
#    Updated: 2018/11/30 17:41:45 by pvandamm         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libftprintf.a

CFLAGS	=	-Wall -Werror -Wextra -I./includes

SRCS	=	./libft/ft_putchar.c		\
			./libft/ft_putstr.c			\
			./libft/ft_strlen.c			\
			./padding/print_d_option.c	\
			./padding/print_x_option.c	\
			./padding/print_p_option.c	\
			./padding/print_u_option.c	\
			./padding/print_o_option.c	\
			./padding/print_bx_option.c	\
			./srcs/ft_printf.c 			\
			./srcs/fill_struct.c		\
			./srcs/print_arg.c			\
			./srcs/print_p.c			\
			./srcs/print_o.c			\
			./srcs/print_c.c			\
			./srcs/print_x.c			\
			./srcs/print_s.c			\
			./srcs/print_bx.c			\
			./srcs/print_d.c			\
			./srcs/print_u.c			\
			./srcs/print_nb.c			\
			./srcs/print_percent.c		\
			./srcs/utils.c				\
			./srcs/get_arg.c

OBJS = $(SRCS:.c=.o)

all : $(NAME)

$(NAME) : $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "\x1b[32;01m[LIBFTPRINTF COMPILED]"

clean :
	rm -f $(OBJS)

fclean : clean
	rm -f $(NAME)

re : fclean all

.PHONY : all clean fclean re
