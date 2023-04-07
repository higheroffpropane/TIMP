#include <iostream>
#include <string>
using namespace std;

extern "C" string decrypt(string, int*, int);

int main()
{
    // ���������� � ������������� ���������� � ������� ���������
    string ciphertext = "������������� �����";
    int fib[] = { 0, 1, 1, 2, 3, 5, 8, 13, 21 };
    int n = sizeof(fib) / sizeof(int);

    // ������������� ������ � �������������� ������� �� ����� ����������
    string plaintext = decrypt(ciphertext, fib, n);

    // ����� ��������������� ������ �� �����
    cout << "�������������� �����: " << plaintext << endl;

    return 0;
}