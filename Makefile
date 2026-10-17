CC := gcc

CFLAGS += -Wall -Wextra

CPPFLAGS +=	-I ./include

CSFML = -lcsfml-graphics -lcsfml-window -lcsfml-system -lcsfml-audio

MAIN	:= 	src/c/main.c	\

SRC_DIR	:=	src/

OBJ_DIR	:=	obj/

SRC		:=		

SRC		:=	$(addprefix $(SRC_DIR), $(SRC:=.c))

OBJ_MAIN :=	$(patsubst %.c, $(OBJ_DIR)%.o, $(MAIN))

OBJ		:=	$(patsubst $(SRC_DIR)%.c, $(OBJ_DIR)%.o, $(SRC))

NAME	:=	wolf3d

all: $(NAME)

$(NAME): $(OBJ_MAIN) $(OBJ)
	$(CC) -o $(NAME) $(OBJ_MAIN) $(OBJ) $(CSFML)

obj/%.o: %.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

obj/%.o: $(SRC_DIR)%.c
	mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	$(RM) -r $(OBJ_DIR)
	$(RM) $(OBJ) $(OBJ_MAIN)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all

.PHONY: all re clean fclean
