//
//  main.cpp //服务器主启动文件
//  httpserver
//
//  Created by 170810_3117000127_周健文 on 2018/5/27.
//  Copyright © 2018年 Clement. All rights reserved.
//

#include <stdlib.h>
#include "XTcp/XTcp.h"
#include "HttpServer.h"
using namespace std;
#include <signal.h>
int main(int argc, char *argv[])
{
    /*SIGCHLD信号是子进程结束时，向内核发送的信号。
     无论进程是正常终止，还是不正常终止，都会向内核发送SIGCHLD信号。
     如果父进程不等待子进程结束，子进程将有可能成为僵尸进程（zombie）从而占用系统资源。
     因此需要对SIGCHLD信号做出处理，回收僵尸进程的资源，避免造成不必要的资源浪费。*/
#ifdef __Linux
	signal(SIGPIPE, SIG_IGN);
#endif // __Linux

    unsigned short port = 8080;//默认启动8081端口
    if (argc > 1)
    {
        port = atoi(argv[1]);
    }
    HttpServer server;
    server.Start(port);
    getchar();
    return 0;
}
