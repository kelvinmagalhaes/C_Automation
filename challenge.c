#include <stdio.h>
#include <stdlib.h>

int define_N() {
    int n;
    scanf("%d", &n);

    if ((n < 0) && (n != -1)) {
        printf("Invalid entry.");
        return 1;
    } else if (n == -1) {
        exit(0);
    }

    return n;
}

int* define_vector(int n) {
    if (n <= 1) {
        return NULL;
    }

    int *vector = (int *) malloc(n * sizeof(int));
    if (vector == NULL) {
        return NULL;
    }

    for (int i = 0; i < n; i++) {
        scanf("%d", &vector[i]);  // Apenas lê o valor, sem imprimir prompt
    }

    return vector;
}

void Sort(int n, int *vector) {
    int max = vector[0];
    int min = vector[0];
    int sum = 0;

    for (int i = 0; i < n; i++) {
        sum += vector[i];
    }
    float avg = (float)sum / n;

    for (int i = 0; i < n; i++) {
        if (vector[i] < min) min = vector[i];
        if (vector[i] > max) max = vector[i];
    }

    printf("Min: %d | Max: %d | Avg: %.2f", min, max, avg);

    free(vector);
}

int main(void) {
    setbuf(stdout, NULL);
    int N = define_N();
    int *vector = define_vector(N);

    Sort(N, vector);

    return 0;
}