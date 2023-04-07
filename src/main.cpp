#include <iostream>
#include <string>
namespace name_a
{
    void start_lib();
}
namespace name_b
{
    void start_lib();
}

int main()
{
    name_a::start_lib();
    name_b::start_lib();
    std::cout << "Press enter to exit" << std::endl;
    std::string s;
    std::getline(std::cin, s);
}
