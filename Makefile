CC=clang
CFLAGS=-Wall -Wextra -Werror
NAME=libftprintf.a
HEADER=ft_printf.h
SOURCES= ft_strlen.c ft_putchar_fd.c ft_putstr_fd.c ft_putnbr_fd.c ft_putnbr_unsigned_fd.c ft_printf.c ft_put_hexa_MAJ.c ft_put_hexa_min.c ft_pointer_hexa.c
OBJECTS=$(SOURCES:.c=.o) 

$(NAME): $(OBJECTS) 
	ar -rcs $(NAME) $(OBJECTS) 

%.o : %.c $(HEADER)
	$(CC) $(CFLAGS) $< -c -o $@

all: $(NAME)

re: fclean all

fclean : clean
	rm -f $(NAME)

clean :
	rm -f $(OBJECTS) 

.PHONY: all fclean re
