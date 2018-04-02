#include <R.h>
#include <R.h>
#include <Rdefines.h>
#include <stdio.h>

void subdiag(double *m, int *n, int *k, double *result)
{
	int nval = *n, kval = *k;
	int stride = nval + 1;
	for (int i = 0, j = kval; i < nval-kval; ++i,j+= stride)
		result[i] = m[j];
}