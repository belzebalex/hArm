CC=g++
CFLAGS= -Wall -ansi -pedantic -g3 -O0 -c -std=c++11  `pkg-config --cflags /home/alex/opencvinstall/installation/OpenCV-3.4/lib/pkgconfig/opencv.pc`
LDFLAGS= -lsfml-graphics -lsfml-window -lsfml-system  -lsfml-network  `pkg-config --libs tbb` `pkg-config --libs /home/alex/opencvinstall/installation/OpenCV-3.4/lib/pkgconfig/opencv.pc` -pthread
EXEC=harm
SRCDIR=src
ODIR=obj
INCLUDEDIR=include
SRC= $(wildcard $(SRCDIR)/*.cpp)
OBJ= $(subst $(SRCDIR),$(ODIR),$(SRC:.cpp=.o))


all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) -o $@ $^ $(LDFLAGS)


$(ODIR)/%.o: $(SRCDIR)/%.cpp
	$(CC)  -I $(INCLUDEDIR) -cpp -o $@ $< $(CFLAGS)
.PHONY: clean mrproper

clean:
	rm -rf $(ODIR)/*.o

mrproper: clean
	rm -rf $(EXEC)

rebuild: mrproper harm
