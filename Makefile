TARGET = bin/dbview
SRC = $(wildcard src/*.c)
OBJ = $(patsubst src/%.c, obj/%.o, $(SRC))

.PHONY: clean default run

run: clean default
	./$(TARGET) -f ./mynewdb.db -n

default: $(TARGET)

clean:
	rm -f obj/*.o
	rm -f bin/*
	rm -f *.db

$(TARGET): $(OBJ)
	gcc -o $@ $^

obj/%.o : src/%.c
	gcc -c $< -o $@ -Iinclude
