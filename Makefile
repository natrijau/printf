# ╔═══════════════════════════════════════════════════════════════════════════╗
# ║                                                                           ║
# ║                        LIBFTPRINTF MAKEFILE                               ║
# ║                                                                           ║
# ║  A custom implementation of printf handling c, s, d, i, u, x, X, p, %.    ║
# ║                                                                           ║
# ║  By: natrijau                                                             ║
# ║  Created: 2026/09/29                                                      ║
# ║                                                                           ║
# ╚═══════════════════════════════════════════════════════════════════════════╝

# ═════════════════════════════════════════════════════════════════════════════
#                            COLORS & FORMATTING
# ═════════════════════════════════════════════════════════════════════════════

RED			= \033[0;31m
GREEN		= \033[0;32m
YELLOW		= \033[0;33m
BLUE		= \033[0;34m
MAGENTA		= \033[0;35m
CYAN		= \033[0;36m
WHITE		= \033[0;37m
BOLD		= \033[1m
DIM			= \033[2m
RESET		= \033[0m

# ═════════════════════════════════════════════════════════════════════════════
#                           CONFIGURATION
# ═════════════════════════════════════════════════════════════════════════════

NAME		= libftprintf.a
HEADER		= ft_printf.h
CC			= gcc
CFLAGS		= -Wall -Wextra -Werror -g -I.
AR			= ar
ARFLAGS		= rcs
RM			= rm -f
MKDIR		= mkdir -p

# ═════════════════════════════════════════════════════════════════════════════
#                        DIRECTORIES STRUCTURE
# ═════════════════════════════════════════════════════════════════════════════

SRC_DIR		= src
OBJ_DIR		= obj

SUBDIRS		= main output convert format

SRC_SUBDIRS	= $(addprefix $(SRC_DIR)/,$(SUBDIRS))
OBJ_SUBDIRS	= $(addprefix $(OBJ_DIR)/,$(SUBDIRS))

# ═════════════════════════════════════════════════════════════════════════════
#                        SOURCE FILES ORGANIZATION
# ═════════════════════════════════════════════════════════════════════════════

# main parsing / dispatch logic
SRC_MAIN		=	ft_printf.c

# Low level output primitives
SRC_OUTPUT		=	ft_putchar.c \
					ft_putstr.c \
					ft_putnbr.c

# Numeric / hexadecimal / pointer conversions
SRC_CONVERT		=	ft_nbr_unsigned.c \
					ft_hexa_min.c \
					ft_hexa_maj.c \
					ft_pointer_hexa.c \
					ft_float.c

# Special format handling (%%)
SRC_FORMAT		=	ft_percent.c

# ═════════════════════════════════════════════════════════════════════════════
#                        SOURCES WITH PATHS
# ═════════════════════════════════════════════════════════════════════════════

SOURCES_FULL	=	$(addprefix $(SRC_DIR)/main/,$(SRC_MAIN)) \
					$(addprefix $(SRC_DIR)/output/,$(SRC_OUTPUT)) \
					$(addprefix $(SRC_DIR)/convert/,$(SRC_CONVERT)) \
					$(addprefix $(SRC_DIR)/format/,$(SRC_FORMAT))

OBJECTS_FULL	=	$(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCES_FULL))

# ═════════════════════════════════════════════════════════════════════════════
#                              BUILD RULES
# ═════════════════════════════════════════════════════════════════════════════

.PHONY: all clean fclean re help directories

# Default target
all: header directories $(NAME) footer

# Create necessary directories
directories:
	@$(MKDIR) $(OBJ_SUBDIRS)

# Build the static library
$(NAME): $(OBJECTS_FULL)
	@echo "$(BOLD)$(MAGENTA)[Linking]$(RESET) $(CYAN)$(NAME)$(RESET)"
	@$(AR) $(ARFLAGS) $(NAME) $(OBJECTS_FULL)
	@echo "$(GREEN)[OK] Library created successfully$(RESET)"

# Compile each .c file into .o object file
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(HEADER)
	@echo "$(YELLOW)[Compiling]$(RESET) $(CYAN)$<$(RESET)"
	@$(CC) $(CFLAGS) -c $< -o $@

# Remove object files
clean:
	@echo "$(BOLD)$(RED)[Cleaning]$(RESET) Object files..."
	@$(RM) -r $(OBJ_DIR)
	@echo "$(GREEN)[OK] Object files removed$(RESET)"

# Remove everything (objects + library)
fclean: clean
	@echo "$(BOLD)$(RED)[Deep Cleaning]$(RESET) Library and objects..."
	@$(RM) $(NAME)
	@echo "$(GREEN)[OK] Library removed$(RESET)"

# Rebuild everything from scratch
re: fclean all

# Display help
help:
	@echo ""
	@echo "$(BOLD)$(CYAN)╔════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(CYAN)║             LIBFTPRINTF BUILD SYSTEM - HELP                 ║$(RESET)"
	@echo "$(BOLD)$(CYAN)╚════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""
	@echo "$(BOLD)Available targets:$(RESET)"
	@echo "  $(GREEN)make$(RESET)          Build the library (default target)"
	@echo "  $(GREEN)make all$(RESET)      Same as 'make'"
	@echo "  $(GREEN)make clean$(RESET)    Remove object files (.o)"
	@echo "  $(GREEN)make fclean$(RESET)   Remove object files and library"
	@echo "  $(GREEN)make re$(RESET)       Rebuild everything from scratch"
	@echo "  $(GREEN)make help$(RESET)     Display this help message"
	@echo ""
	@echo "$(BOLD)Project Structure:$(RESET)"
	@echo "  $(MAGENTA)main (parsing/dispatch)$(RESET)  : 2 functions"
	@echo "  $(MAGENTA)Output functions$(RESET)         : 2 functions"
	@echo "  $(MAGENTA)Conversion functions$(RESET)     : 5 functions"
	@echo "  $(MAGENTA)Format functions$(RESET)         : 1 function"
	@echo "  $(DIM)────────────────────────────$(RESET)"
	@echo "  $(BOLD)Total: 10 functions$(RESET)"
	@echo ""
	@echo "$(BOLD)Directory Layout:$(RESET)"
	@echo "  $(CYAN)src/$(RESET)               Source files organized by category"
	@echo "  $(CYAN)obj/$(RESET)               Compiled object files (generated)"
	@echo "  $(CYAN)libftprintf.a$(RESET)      Final static library"
	@echo ""
	@echo "$(BOLD)Compilation flags:$(RESET)"
	@echo "  $(CYAN)$(CFLAGS)$(RESET)"
	@echo ""

# Display header during build
header:
	@echo ""
	@echo "$(BOLD)$(CYAN)╔════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(CYAN)║                Building LIBFTPRINTF                        ║$(RESET)"
	@echo "$(BOLD)$(CYAN)╚════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""

# Display footer after successful build
footer:
	@echo ""
	@echo "$(BOLD)$(GREEN)╔════════════════════════════════════════════════════════════╗$(RESET)"
	@echo "$(BOLD)$(GREEN)║            BUILD COMPLETE - ALL READY!                     ║$(RESET)"
	@echo "$(BOLD)$(GREEN)╚════════════════════════════════════════════════════════════╝$(RESET)"
	@echo ""