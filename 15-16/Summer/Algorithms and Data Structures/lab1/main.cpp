#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <algorithm>

using namespace std;

pair< long long, long long > tab[1000001];

bool compare(pair< long long, long long > a, pair< long long, long long > b)
{
    return a.first < b.first;
}

long long bit_count(long long a)
{
    long long res = 0;
    while(a > 0)
    {
        if(a%2 == 1) res += 1;
        a = a/2;
    }
    return res;
}

int main()
{
    int m;
    long long suma = 0;
    long long d,nd;
    scanf("%d",&m);
    for(int i = 0; i < m; i++)
    {
        scanf("%lld %lld",&d,&nd);
        while(d%2 == 0)
        {
            d = d/2;
            nd = nd*2;
        }
        tab[i] = pair< long long, long long >(d,nd);
    }
    tab[m] = pair< long long, long long >(0,0);
    sort(tab,tab+m,compare);

    int j = 0;
    while(j < m)
    {
        while(tab[j].first == tab[j+1].first)
        {
            tab[j+1].second += tab[j].second;
            j++;
        }
        suma += bit_count(tab[j].second);
        j++;
    }
    printf("%lld\n",suma);
    return 0;
}
