
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <fcntl.h>
#include<string.h>
#include<stdio.h>
int main()
{
  char arr1[]="abc";
  //"abc"='a' 'b' 'c' '/0'
  char arr2[]={'a','b','c',0};
  printf("%s\n",arr1);
  printf("%s\n",arr2);
  printf("%d\n",strlen(arr1));
  printf("%d\n",strlen(arr2));
  return 0;
}
