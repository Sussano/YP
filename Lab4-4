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
    friend std::istream& operator>>(std::istream& is, String& str) {
    is >> str.m_data;
    for (int i = 0; str.m_data[i] != '\0'; i++) {
        str.m_size += 1;
    }
    return is;
}

    // Перегрузка оператора присваивания
    String& operator=(const String& other) {
        if (this != &other) { // игнорировать присваивания вида a = a
            delete[] m_data; // удаляем старое значение
            m_size = other.m_size; // длина строки
            m_data = new char[m_size + 1]; // выделить память под новый буфер
            std::strcpy(m_data, other.m_data); // скопировать строку в новый буфер
        }
        return *this;
    }

    // Перегрузка унарного минуса
    String operator-() const {
        String ret; // временный объект
        ret.m_size = m_size; // длина строки
        delete[] ret.m_data; // освободить старый буфер
        ret.m_data = new char[m_size + 1]; // буфер под строку
        for (std::size_t i = 0; i < m_size; i++) { // копируем в обратном порядке
            ret.m_data[i] = m_data[m_size - i - 1];
        }
        ret.m_data[m_size] = '\0'; // нулевое окончание строки
        return ret; // возвращаем временный объект
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
    String s1("Hello");
    String s2 = s1; // использование конструктора копирования
    String s3;
    s3 = s1; // использование перегруженного оператора присваивания

    std::cout << "s1: " << s1 << ", size: " << s1.size() << '\n';
    std::cout << "s2: " << s2 << ", size: " << s2.size() << '\n';
    std::cout << "s3: " << s3 << ", size: " << s3.size() << '\n';

    // Демонстрация перегруженного оператора унарного минуса
    String s4("World");
    String s5 = -s4;

    std::cout << "s4: " << s4 << ", size: " << s4.size() << '\n';
    std::cout << "-s4: " << s5 << ", size: " << s5.size() << '\n';

    return 0;
}
