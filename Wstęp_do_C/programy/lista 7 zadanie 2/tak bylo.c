typedef float TYP;

void QuickSort(TYP *T, int Lo, int Hi)
{
   int i,j;
   TYP x;
   x = T[(Lo+Hi)>>1];       //mo�na wylosowa� element dziel�cy, np: x=T[rand%(Hi-Lo)+Lo+1], dzi�ki temu zabezpieczymy si� do�� skutecznie przed ukwadratowieniem.
   i = Lo;
   j = Hi;
   do
   {
      while (T[i] < x) ++i;
      while (T[j] > x) --j;
      if (i<=j)
      {
         TYP tmp = T[i];
         T[i] = T[j];
         T[j] = tmp;
         ++i; --j;
      }
   } while(i < j);
   if (Lo < j) QuickSort(T, Lo, j);
   if (Hi > i) QuickSort(T, i, Hi);
}
