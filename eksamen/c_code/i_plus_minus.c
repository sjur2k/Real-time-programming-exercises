#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <string.h>

int b = 0;
typedef struct{
        int value;
        pthread_mutex_t m;
}protectedInteger;

void* getAndPrint(void *input){
    protectedInteger *pInt = (protectedInteger*)input;
    pthread_mutex_lock(&pInt->m);
    printf("Value is: %d\n",pInt->value);
    pthread_mutex_unlock(&pInt->m);
    return NULL;
}

void* f1(void *input){
    protectedInteger *pInt = (protectedInteger*)input;
    for (int i = 0; i<1.0E6; i++){
        b=b+1;
        pthread_mutex_lock(&pInt->m);
        pInt->value++;
        pthread_mutex_unlock(&pInt->m);
    }

    return NULL;
}
void* f2(void *input){
    protectedInteger *pInt = (protectedInteger*)input;
        for (int i = 0; i<1.0E6; i++){
        b=b-1;
        pthread_mutex_lock(&pInt->m);
        pInt->value--;
        pthread_mutex_unlock(&pInt->m);
    }
    return NULL;
}

int main(){
    protectedInteger a;
  
    a.value = 0;
    pthread_mutex_init(&a.m, NULL);

    pthread_t t1,t2;
    int err1 = pthread_create(&t1,NULL,f1,&a);
    int err2 = pthread_create(&t2,NULL,f2,&a);
    if (err1!=0){
        fprintf(stderr, "Failed to create thread t1: %s\n", strerror(err1));
        exit(1);
    } else if (err2 != 0){
        fprintf(stderr, "Failed to create thread t2: %s\n", strerror(err2));
        exit(1);
    }
    
    pthread_join(t1,NULL);
    pthread_join(t2,NULL);

    pthread_mutex_destroy(&a.m);
    printf("Final value of a: %d\n",a.value);
    printf("Final value of b: %d\n",b);
    return 0;
}