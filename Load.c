#include "Load.h"
#include "func.h"
#include <stdio.h>
#ifdef WIN32
#include <windows.h>
#else
#include <dlfcn.h>
#endif

void LoadRun(const char* const s)
{
    void *lib;
    void (*fun)(void);
    #ifdef WIN32
    lib = LoadLibrary(s);
    #else
    lib = dlopen(s, RTLD_LAZY);
    #endif
    if (!lib)
    {
        printf("connot open library '%s'\n", s);
        return;
    }
    #ifdef WIN32
    fun = (void(*)(void))GetProcAddress((HINSTANCE)lib, "func");
    #else
    fun = (void (*)(void))dlsym(lib, "run");
    #endif
    if (fun == NULL)
    {
        printf("cannot load function func\n");
    }
    else
    {
        fun();
    }
    #ifdef WIN32
    FreeLibrary((HINSTANCE)lib);
    #else
    dlclose(lib);
    #endif
}
