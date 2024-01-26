#include "selection_sort_c.h"

void selection_sort(int arr[], int length) {
    int min;
    for (int i = 0; i < length - 1; i++ ) {
        min = i;
        for(int j = i+1; j < length; j++) {
            if (arr[j] < arr[min]) {
                min = j;
            }

            if (min != i) {
                int tmp = arr[min];
                arr[min] = arr[i];
                arr[i] = tmp;
            }
        }
    }
}