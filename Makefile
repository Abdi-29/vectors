NAME = vector

SRC = 	vector.c

INCLUDE = -I ./includes
OBJ = $(SRC:%.c=%.o)

LIBFT_DIR = ./libft

LIBFT = $(LIBFT_DIR)/libft.a

CFLAGS = -Wall -Werror -Wextra
DEBUG =  -fsanitize=address -g 

all: $(NAME)

$(NAME): $(OBJ) $(LIBFT)
	gcc -g $(OBJ) $(LIBFT) $(DEBUG) -o $(NAME) 

%.o: %.c
	gcc -c -g $(INCLUDE) $(CFLAGS) $(DEBUG) $< -o $@

$(LIBFT): 
	$(MAKE) -C $(LIBFT_DIR)

clean:
	$(MAKE) fclean -C $(LIBFT_DIR)
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re:	fclean all