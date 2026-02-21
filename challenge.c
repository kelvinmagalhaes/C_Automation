#include<stdio.h>
#include<stdlib.h>
#include<limits.h>

int define_N(){
    int n;
    printf("Insert the number of values: ");
    fflush(stdout);
    
    scanf("%d", &n);

    if ((n < 0) && (n != -1))
    {
        printf("Invalid entry.");
        return 1;
    }
    else if(n == -1 ){
        printf("You exit the program");
        exit(0);
    }

    return n;
}

int* define_vector(int n){
    
    // 1. Validação robusta (melhor fazer isso antes de chamar a função)
    if (n <= 1) {
        printf("Error: n must be greater than 1\n");
        return NULL; 
    }

    // 2. Alocação no HEAP (esta memória persiste até você dar free())
    int *vector = (int *) malloc(n * sizeof(int));

    // 3. Verificação de segurança
    if (vector == NULL) {
        printf("Memory allocation failed!");
        return NULL;
    }

    // 4. Preenchimento
    for (int i = 0; i < n; i++) {
        printf("Value [%d]: ", i);
        scanf("%d", &vector[i]);
    }

    // 5. Retorna o ponteiro para a memória que VOCÊ alocou
    return vector;
}

void Sort(int n, int *vector)
{
    int max = vector[0];
    int min = vector[0];
    int media=0;

    for (int i = 0; i < n; i++)
    {
        media += vector[i];
    }
    float med = media/n;

    for (int j = 0; j < n; j++)
    {
        if (min > vector[j])
        {
            min = vector[j];
        }
    }
    
    for (int j = 0; j < n; j++)
    {
        if (max < vector[j])
        {
            max = vector[j];
        }
    }

    printf("Min: %d | Max: %d | Avg: %.2f",min,max,med);

    free(vector);

}

int main(void){
    setbuf(stdout, NULL);
    int N = define_N();
    int *vector = define_vector(N);

    Sort(N, vector);

    return 0;
}
