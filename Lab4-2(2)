#include <iostream>
#include <cstring>

class String {
private:
    char* m_data;
    std::size_t m_size;

public:
    // Конструктор по умолчанию
    String() : m_data(new char[1]), m_size(0) {
        m_data[0] = '\0';
    }

    // Конструктор копирования
    String(const String& other) : m_data(new char[other.m_size + 1]), m_size(other.m_size) {
        std::strcpy(m_data, other.m_data);
    }

    // Конструктор инициализации Си-строкой
    String(const char* data) : m_data(new char[std::strlen(data) + 1]), m_size(std::strlen(data)) {
        std::strcpy(m_data, data);
    }

    // Деструктор
    ~String() {
        delete[] m_data;
    }

    // Перегрузка оператора <<
    friend std::ostream& operator<<(std::ostream& os, const String& str) {
        return os << str.m_data;
    }

    // Методы для работы со строками
    std::size_t size() const {
        return m_size;
    }

    const char* c_str() const {
        return m_data;
    }
};
int main() {
    String s1; // Пустая строка
    std::cout << "s1: " << s1 << ", size: " << s1.size() << '\n';

    String s2("Hello"); // Строка "Hello"
    std::cout << "s2: " << s2 << ", size: " << s2.size() << '\n';

    String s3 = s2; // Копирование s2 в s3
    std::cout << "s3: " << s3 << ", size: " << s3.size() << '\n';

    String s4 = "World"; // Инициализация Си-строкой
    std::cout << "s4: " << s4 << ", size: " << s4.size() << '\n';

    return 0;
}
