BIN_DIR=~/bin
LIB_DIR=~/lib

SRC_DIR=$(PWD)
SRC=trie.c
BINARY_NAME=trie_test
LIB_NAME=libtrie.so
MAJ=1
MIN=0
OBJ_NAME=trie.o
INC_FLAG=-I$(SRC_DIR)

BIN=$(BIN_DIR)/$(BINARY_NAME)
LIB=$(LIB_DIR)/$(LIB_NAME)

#WL_SONAME=-Wl,-soname,$(LIB).$(MAJ) -o $(LIB).$(MAJ).$(MIN) $(OBJ_NAME)
#WL_RPATH=-Wl,-rpath=$(LIB_DIR)
#WL=$(WL_SONAME) $(WL_RPATH)

#LDFLAGS=-shared

$(LIB): $(SRC)
	mkdir -p $(LIB_DIR)
	$(CC) -o $(OBJ_NAME) -c $(SRC) $(INC_FLAG)
	$(CC) -shared -o $(LIB) $(OBJ_NAME)
	#ln -s $(LIB).$(MAJ).$(MIN) $(LIB).$(MAJ)
	#ln -s $(LIB).$(MAJ) $(LIB)

(BIN): $(SRC) main.c
	$(CC) -o $@ $^ $(INC_FLAG)

clean:
	rm -f $(BIN) $(LIB)* $(SRC_DIR)/*.o

.PHONY:  clean
