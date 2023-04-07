#include <iostream>
#include <string>
using namespace std;

extern "C" string decrypt(string, int*, int);

int main()
{
    // объявление и инициализация переменных и массива фибоначчи
    string ciphertext = "зашифрованный текст";
    int fib[] = { 0, 1, 1, 2, 3, 5, 8, 13, 21 };
    int n = sizeof(fib) / sizeof(int);

    // расшифрование текста с использованием функции на языке ассемблера
    string plaintext = decrypt(ciphertext, fib, n);

    // вывод расшифрованного текста на экран
    cout << "Расшифрованный текст: " << plaintext << endl;

    return 0;
}