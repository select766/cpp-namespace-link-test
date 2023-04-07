#include <iostream>
#include "sub.hpp"

namespace LIBNS
{
#define IDENT_NAME_(x) #x
#define IDENT_NAME(x) IDENT_NAME_(x)
    void print_hello()
    {
        std::cout << "Hello from " << IDENT_NAME(LIBNS) << std::endl;
    }
}
