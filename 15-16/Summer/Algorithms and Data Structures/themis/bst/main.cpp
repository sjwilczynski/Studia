#include <cstdio>
#include <cstdlib>
#include <string>
#include <iostream>
#include <vector>

using namespace std;

# define rozmiar 1000000
# define inf 2000000

class node
{
public:
    int val;
    node* left;
    node* right;
    node* parent;
    node():
        val{inf},left{NULL},right{NULL},parent{NULL}{}
    node(int v):
        val{v},left{NULL},right{NULL},parent{NULL}{}
    node(int v, node* u):
        val{v},left{NULL},right{NULL},parent{u}{}
    node(node* u):
        val{u->val},left{u->left},right{u->right},parent{u->parent}{}

    void operator = ( const node& v )
    {
        *this = node(v);
        std::cout << "assingment\n";
    }
    ~node()
    {
        delete left;
        delete right;
        delete parent;
    }
};

node* root;
vector< int > vec;

int min(int a, int b)
{
    if(a<b)return a;
    else return b;
}

void insert(int klucz, node* u)
{
    if(klucz > u->val)
    {
        if(u->right == NULL)
        {
            node* v = new node(klucz,u);
            u->right = v;
        }
        else insert(klucz,u->right);
    }
    else
    {
        if(u->left == NULL)
        {
            node* v = new node(klucz,u);
            u->left = v;
        }
        else insert(klucz,u->left);
    }
}

void dodaj(int lic, node* v)
{
    if( vec.size() == lic || v == NULL ) return;
    dodaj(lic,v->left);
    vec.push_back(v->val);
    dodaj(lic,v->right);
}

void next2(int lic, node* v)
{
    dodaj(lic,v->right);
    while( v != root )
    {
        int vm = v->val;
        int vp = v->parent->val;
        if(vm > vp) v = v->parent;
        else
        {
            v = v->parent;
            vec.push_back(vp);
            dodaj(lic,v->right);
        }
    }
}


void next(int klucz, int lic)
{
    node* v = root;
    while(v->val != klucz)
    {
        if(klucz > v->val) v = v->right;
        else v = v->left;
    }
    vec.resize(0);
    next2(lic,v);
    if(vec.size() == 0)cout << "nastepnik nie istnieje\n";
    else
    {
        int a = min(vec.size(),lic);
        for(int i = 0; i < a; i++) cout << vec[i] << " ";
        cout << endl;
    }

}

int poziom(int klucz)
{
    node* v = root;
    int k = 0;
    while(v->val != klucz)
    {
        if(klucz > v->val)
        {
            v = v->right;
            k++;
        }
        else
        {
            v = v->left;
            k++;
        }
    }
    return k;
}


int main()
{
    int k;
    int klucz,lic;
    root = new node();
    string s;
    cin >> k;
    cin >> s;
    cin >> klucz;
    root->val = klucz;
    for(int i = 1; i < k; i++)
    {
        cin >> s;
        if(s == "wstaw")
        {
            cin >> klucz;
            insert(klucz,root);
        }
        if(s == "nastepnik")
        {
            cin >> klucz;
            cin >> lic;
            next(klucz,lic);
        }
        if(s == "poziom")
        {
            cin >> klucz;
            cout << poziom(klucz) << endl;
        }
    }
    return 0;
}
