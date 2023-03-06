#include <iostream>
using namespace std;
#include "string2.h"

int main()
{
    String s1(" and I am a C++ student.");
    String s2 = "Please enter your name: ";
    String s3;
    cout << s2;
    cin >> s3;
    s2 = "My name is " + s3;
    cout << s2 << ".\n";
    s2 = s2 + s1; //тут программа завершается
    s2.stringup();
    cout << "The string\n" << s2 << "\ncontains " << s2.has('A')
         << " 'A' characters in it.\n";
    s1 = "red";

    String rgb[3] = { String(s1), String("green"), String("blue")};
    cout << "Enter the name of a primary color for mixing light: ";
    String ans;
    bool success = false;
    while(cin >> ans)
    {
        ans.stringlow();
        for(int i = 0; i < 3; ++i)
        {
            if(ans == rgb[i])
            {
                cout << "That's right!\n";
                success = true;
                break;
            }
        }
        if(success)
            break;
        else
            cout << "Try again!\n";
    }
    cout << "Bye\n";
    return 0;
}
      
      
      
      
      string2.ccp
#include <cstring>
#include "string2.h" 
#include <cctype>

using std::cin;
using std::cout;


int String::num_strings = 0;

int String::HowMany()
{
    return num_strings;
}

String::String(const char * s)     
{
    len = std::strlen(s);         
    str = new char[len + 1];   
    std::strcpy(str, s);        
    num_strings++;                 
}

String::String()                  
{
    len = 4;
    str = new char[1];
    str[0] = '\0';                 
    num_strings++;
}

String::String(const String & st)
{
    num_strings++;                 
    len = st.len;                   
    str = new char [len + 1];       
    std::strcpy(str, st.str);      
}

String::~String()                   
{
    --num_strings;                 
    delete [] str;                 
}


String & String::operator=(const String & st)
{
    if (this == &st)
        return *this;
    delete [] str;
    len = st.len;
    str = new char[len + 1];
    std::strcpy(str, st.str);
    return *this;
}

String & String::operator=(const char * s)
{
    delete [] str;
    len = std::strlen(s);
    str = new char[len + 1];
    std::strcpy(str, s);
    return *this;
}

void String::stringlow()
{
    for(int j = 0; j < len; ++j)
        str[j] = (char) tolower(str[j]);
}


void String::stringup()
{
    for(int j = 0; j < len; ++j)
        str[j] = (char) toupper(str[j]);
}

int String::has(char ch) const
{
    int counter = 0;
    for(int j = 0; j < len; ++j)
        if(str[j] == ch)
            ++counter;
    
    return counter;
}

char & String::operator[](int i)
{
    return str[i];
}

const char & String::operator[](int i) const
{
    return str[i];
}

bool operator<(const String &st1, const String &st2)
{
    return (std::strcmp(st1.str, st2.str) < 0);
}

bool operator>(const String &st1, const String &st2)
{
    return st2 < st1;
}

bool operator==(const String &st1, const String &st2)
{
    return (std::strcmp(st1.str, st2.str) == 0);
}


ostream & operator<<(ostream & os, const String & st)
{
    os << st.str;
    return os;
}

String operator+(const String& st1, const String& st2)
{
    String _temp;                         // временный объект
    delete[] _temp.str;                   // стираем строку, выделенную в конструкторе по умолчанию
    _temp.len = st1.len + st2.len;        // вычисляем длину будущей строки
    _temp.str = new char[_temp.len + 1];  // выделяем место под новую строку + нулевой символ
    
    std::strcpy(_temp.str, std::strcat(st1.str, st2.str)); // собственно, сцепляем и сохраняем в новый объект

    return _temp;
}

istream & operator>>(istream & is, String & st)
{
    char temp[String::CINLIM];
    is.get(temp, String::CINLIM);
    if (is)
        st = temp;
    while (is && is.get() != '\n')
        continue;
    return is;
}
      
      
      
      
      
      
      
  strin2.h
      
      #ifndef STRING1_H_
#define STRING1_H_
#include <iostream>
using std::ostream;
using std::istream;

class String
{
    private:
        char * str;     
        int len;                 
        static int num_strings;  
        static const int CINLIM = 80;  
    public:

        String(const char * s);    
        String();               
        String(const String &);  
        ~String();                
        int length() const { return len; }

        String & operator=(const String &);
        String & operator=(const char *);
        char & operator[](int i);
        const char & operator[](int i) const;
        void stringlow();
        void stringup();
        int has(char ch) const;

        friend bool operator<(const String &st, const String &st2);
        friend bool operator>(const String &st1, const String &st2);
        friend bool operator==(const String &st, const String &st2);
        friend ostream & operator<<(ostream & os, const String &st2);
        friend istream & operator>>(istream & is, String & st);
        friend String operator+(const String& st1, const String& st2);

        static int HowMany();
};
#endif
