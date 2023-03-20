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

    // Перегрузка оператора >>
    ffriend std::istream& operator>>(std::istream& is, String& str) {
    is >> str.m_data;
    for (int i = 0; str.m_data[i] != '\0'; i++) {
        str.m_size += 1;
    }
    return is;
}

    // Перегрузка оператора присваивания
    String& operator=(const String& other) {
        if (this != &other) {
            delete[] m_data;
            m_size = other.m_size;
            m_data = new char[m_size + 1];
            std::strcpy(m_data, other.m_data);
        }
        return *this;
    }

    // Перегрузка унарного минуса
    String operator-() const {
        String ret;
        ret.m_size = m_size;
        delete[] ret.m_data;
        ret.m_data = new char[m_size + 1];
        for (int i = 0; i < m_size; i++) {
            ret.m_data[i] = m_data[m_size - i - 1];
        }
        ret.m_data[m_size] = '\0';
        return ret;
    }

    // Перегрузка бинарного плюса
    String operator+(const String& other) const {
        String ret;
        ret.m_size = m_size + other.m_size;
        delete[] ret.m_data;
        ret.m_data = new char[ret.m_size + 1];
        std::strcpy(ret.m_data, m_data);
        std::strcat(ret.m_data, other.m_data);
        return ret;
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
    // Создание объектов
    String s1("Hello"), s2("World"), s3;

    // Вывод строк
    std::cout << "s1: " << s1 << ", size: " << s1.size() << '\n';
    std::cout << "s2: " << s2 << ", size: " << s2.size() << '\n';

    // Присваивание s1 в s3
    s3 = s1;
    std::cout << "s3: " << s3 << ", size: " << s3.size() << '\n';

    // Присваивание s2 в s3 и инвертирование
    s3 = -s2;
    std::cout << "s3: " << s3 << ", size: " << s3.size() << '\n';

    // Конкатенация s1 и s2 в s3
    s3 = s1 + s2;
    std::cout << "s3: " << s3 << ", size: " << s3.size() << '\n';

    return 0;
}
