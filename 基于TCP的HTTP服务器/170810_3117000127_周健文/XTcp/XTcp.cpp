//  XTcp.cpp
//  TcpPackage
//
//  Created by 170810_3117000127_周健文 on 2018/4/23.
//  Copyright © 2018年 Clement. All rights reserved.
//  TARGET_OS_X _WIN32 _WIN64 Linux


//#ifndef XTcp_CPP
//#define XTcp_CPP
#include "XTcp.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <errno.h>
#ifdef WIN32
#include <windows.h>
#define socklen_t int
#else
#include <sys/types.h>   //基本系统数据类型
#include <sys/socket.h>  
#include <unistd.h>     //标准的输入输出,如read/write等
#include <arpa/inet.h>   //信息转换，如网络字节序转换本地字节序
#include <fcntl.h>   //用来操作文件描述符的一些特性
#define closesocket close
#endif

XTcp::XTcp()
{
#ifdef WIN32
    static bool flag = 1;
    if(flag)
    {
        WSADATA ws;
        WSAStartup(MAKEWORD(2,2),&ws);
        flag = 0;
    }
    
#endif
}

XTcp::~XTcp()
{

}

int XTcp::CreateSocket()
{
    sock = socket(AF_INET,SOCK_STREAM,0);  //SOCK_DGRAM
    if(sock == -1)
    {
        printf("create socket failed!\n");
    }
    return sock;
}


bool XTcp::Bind(unsigned short port)
{
    if(sock<=0)
        CreateSocket();
    sockaddr_in saddr;
    saddr.sin_family = AF_INET;
    saddr.sin_port = htons(port);
    saddr.sin_addr.s_addr = (0);
    //bind 服务器端口
    if(::bind(sock,(sockaddr*)&saddr,sizeof(saddr))!=0)
    {
        printf("bind port %d failed!\n",port);
        return false;
    }
    printf("bind port %d success!\n",port);
    //listen 从服务器指定端口开始监听
    /*
     listen 的第二个参数是该套接字使用的队列长度，指定在请求队列中允许的最大请求数。并不是指并发数量的多少。每接收一个连接队列长度就加一，若连接数量超出1000个就会将之前暂存的连接放弃。只有接收到连接并accept成功，队列的长度就会减一。
     */
    listen(sock,1000);
    return true;
}

XTcp XTcp::Accept()
{
    XTcp tcp;
    
    sockaddr_in caddr;
    socklen_t len = sizeof(caddr);
    //accept 读取用户的连接信息
    //此处是每来一个连接就创建一个线程，当然最好的方式是创建线程池，以下是创建单线程的测试。
    //int client = accept(sock,0,0);
    //三次握手并不是由accpet实现的，而是由系统内部已经完成的，accept只是读取三次握手之后的信息，是有本质的区别。
    int client = accept(sock,(sockaddr*)&caddr,&len);
    if(client<=0)return tcp;
    printf("accept client %d\n",client);
    //accept的返回值是从4开始，3是服务端，其中0，1，2代表标准的输入、输出和错误输出，属于保留使用。
    //取出连接客户端IP地址和端口号,TCP/IP协议传输数据时，字节序默认大端
    tcp.ip = inet_ntoa(caddr.sin_addr);//inet_ntoa在多线程下有可能会出现一些问题。
    tcp.port = ntohs(caddr.sin_port);
    tcp.sock = client;
    printf("client ip is %s,port is %d\n",tcp.ip.c_str(),tcp.port);
    return tcp;
}


bool XTcp::Connect(const char *ip,unsigned short port,int timeoutms)
{
    if(sock <=0)CreateSocket();
    sockaddr_in saddr;
    saddr.sin_family = AF_INET;
    saddr.sin_port = htons(port);
    saddr.sin_addr.s_addr = inet_addr(ip);
    SetBlock(false);//设置非阻塞模式
    fd_set set;//文件句柄数组(windows)，linux叫文件描述符，用来存放每一个文件句柄（socket）的状态
    if(connect(sock,(sockaddr*)&saddr,sizeof(saddr))!=0)
    {
        FD_ZERO(&set);//文件句柄数组置空
        FD_SET(sock,&set);//sock也是一个网络句柄，把它存放到set文件句柄数组。
        timeval tm;
        tm.tv_sec = 0;
        tm.tv_usec = timeoutms*1000;
        
        /*
         因为Select的第一个参数是所监听的最大描述符数，而描述符都是从0（标准输入）开始的，所以要在Open_listenfd(port) 所获取的监听描述符基础上加1。可参考网络并发编程-基于多路IO复用的并发编程。
         */
        /*当文件描述符达到一定数量级别，select反应速度就会下降，不妨考虑使用epoll，是Linux下多路复用IO接口select/poll的增强版本*/
        if(select(sock+1,0,&set,0,&tm) <= 0)//通过select监听set是否有可读或可写
        {
            printf("connect timeout or error!\n");
            printf("connect %s:%d failed!:%s\n",ip,port,strerror(errno));
            return false;
        }
    }
    SetBlock(true);//此处设置阻塞模式是为了方便后面建立发送与接收数据
    printf("connect %s:%d success!\n",ip,port);
    return true;
}

//设置阻塞或非阻塞模式
bool XTcp::SetBlock(bool isblock)
{
    if(sock<=0) return false;
    #ifdef WIN32
        unsigned long ul = 0;//控制为阻塞方式
        if(!isblock) ul = 1;//控制为非阻塞
        ioctlsocket(sock,FIONBIO,&ul); //FIONBIO 允许或禁止套接口sock的非阻塞模式
    #else
    int flags = fcntl(sock,F_GETFL,0);   //F_GETFL  取得sock的文件状态标志
        if(flags<0)
            return false;
        if(isblock)
        {
            flags = flags&~O_NONBLOCK;//将socket设置成为非阻塞模式
        }
        else
        {
            flags = flags|O_NONBLOCK;//将非阻塞的设置回阻塞模式
        }
        if(fcntl(sock,F_SETFL,flags)!=0)
            return false;
    #endif
    return true;
}

int XTcp::Send(const char *buf, int size)//循环发送
{
	int s = 0;
	while (s != size)
	{
		int len = send(sock, buf + s, size - s, 0);
		if (len <= 0)break;
		s += len;//用于计算已发buffer的偏移量
	}
	return s;
}



int XTcp::Recv(char *buf, int bufsize)
{
	return recv(sock, buf, bufsize, 0);
}

int XTcp::RecvAll(char *buf, int bufsize)
{
	//    while (bufsize>0)//剩余部分大于0
	//    {
	//        int RecvSize= recv(sock, buf, bufsize, 0);
	//        if(RecvSize<=0)break;
	//        bufsize = bufsize - RecvSize;
	//        buf+=RecvSize;
	//    }
	//    return buf;
	//功能尚未完成
	return 0;
}

void XTcp::Close()
{
	if (sock <= 0)return;
	closesocket(sock);
}


//#endif /* XTcp_CPP */
