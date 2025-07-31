#include <pthread.h>
#include <semaphore.h>
#include <stdio.h>
#include <stdlib.h>

sem_t t1_arrived;
sem_t t2_arrived;
pthread_t t1,t2;
int* intList;
const int listLength = 100;

void* f1(){
    for (int i=0; i<listLength; i++){
        if (i%2 != 0){
            continue;
        }
        for (int j=i; j>=1; j--){
            intList[j]=intList[j-1];
        }
        intList[0]=listLength-i;
        sem_post(&t1_arrived);
        if (i!=(listLength-1-(listLength%2==0))){
            sem_wait(&t2_arrived);
        }
    }
    return NULL;
}
void* f2(){    
    sem_wait(&t1_arrived);
    for (int i=1; i<listLength; i++){
        if (i%2 == 0){
            continue;
        }
        for (int j=i; j>=1; j--){
            intList[j]=intList[j-1];
        }
        intList[0]=listLength-i;
        if (listLength%2 == 0 && i == listLength-1){
            continue;
        } else {
            sem_post(&t2_arrived);
            sem_wait(&t1_arrived);
        }
    }
    return NULL;
}

int main(void){
    intList = malloc(listLength*sizeof(int));
    for (int i=0; i<listLength; i++){
       intList[i]=0; 
    }
    sem_init(&t1_arrived,0,0);
    sem_init(&t2_arrived,0,0);
    pthread_create(&t1,NULL,f1,NULL);
    pthread_create(&t2,NULL,f2,NULL);
    pthread_join(t1,NULL);
    pthread_join(t2,NULL);
    sem_destroy(&t1_arrived);
    sem_destroy(&t2_arrived);
    for (int i=0; i<listLength; i++){
        if (i==0){
            printf("[%d, ",intList[0]);
        } else if (i==listLength-1){
            printf("%d]\n",intList[listLength-1]);
        } else {
            printf("%d, ",intList[i]);
        }
    }
    free(intList);
}