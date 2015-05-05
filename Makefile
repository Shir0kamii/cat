NAME			= cat

COMPILER		= nasm -f elf

LINKER			= ld -m elf_i386

RM			= rm -f

SRC			= src/cat_fd.s \
			  src/cat_file.s \
			  src/main.s

OBJ			= $(SRC:.s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(LINKER) -o $@ $(OBJ)

%.o: %.s
	$(COMPILER) -o $@ $<

clean:
	-$(RM) $(OBJ)

fclean: clean
	-$(RM) $(NAME)

re: fclean all

ac: all clean

.PHONY: all clean fclean re ac
