#include <iostream>
#include <thread>
#include <chrono>
#include "sub.hpp"
namespace LIBNS
{
    void lib_thread_main()
    {
        std::cout << "Thread " << std::this_thread::get_id() << std::endl;
        while (1)
        {
            print_hello();
            std::this_thread::sleep_for(std::chrono::seconds(5));
        }
    }
    void start_lib()
    {
        std::thread t(lib_thread_main);
        t.detach();
    }
}
