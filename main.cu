#include <stdio.h>
#include<stdlib.h>

char* readFile(char* url){

    int fileSize, readCount;
    char* buffer;

    FILE *filePointer;
    filePointer = fopen(url, "r");

    if(filePointer == NULL){
        printf("failed to open the file");
    }

    else{
        printf("opened the file successfully");

// use pointer to find the fileSize by going to the end and rewind it to the start of the file
//after work is done

        fseek(filePointer, 0, SEEK_END);
        fileSize = ftell(filePointer);
        rewind(filePointer);

//we wanted that size to allocate a memory for a string of that size, which is job 
//of buffer

//i am adding one more character size to add /0 at the end
    buffer = (char*) malloc(sizeof(char) * (fileSize + 1));

    readCount = fread(buffer, sizeof(char), fileSize, filePointer);

    buffer[fileSize] = '\0';

    if(fileSize  != readCount){
        free(buffer);
        printf("there was some errror reading the file, please try again");
    }

    fclose(filePointer);

    }

    return buffer;

    }


int main(){

    char *fileString = readFile("raw file");



}







