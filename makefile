CC = clang++
LD = Ld 
CFLAGS = -g -c -Wall -framework Foundation -stdlib=libc++ -std=gnu++11 
LDFLAG = -lc++ -framework Foundation 
TARGET = main
OBJS = main.o TestEngine.o Node.o LockFreeStack.o LockFreeQueue.o
all: $(TARGET)

$(OBJS): %.o: %.mm
	$(CC) -c $(CFLAGS) $< -o $@

$(TARGET):$(OBJS)
	$(CC) $(LDFLAG) -o $(TARGET) $(OBJS)

.PHONY: clean

clean:
	rm -f $(OBJS) $(TARGET)

