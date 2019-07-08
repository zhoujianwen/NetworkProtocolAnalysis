//  基于多线程的http服务器，能运行在Linux(centos)、Windows、Mac osx
//  XTcp.h
//  TcpPackage
//
//  Created by 170810_3117000127_周健文 on 2018/4/23.
//  Copyright © 2018年 Clement. All rights reserved.
//
#pragma once
//#ifndef XTcp_h
//#define XTcp_h
#include <string>
class XTcp
{
public:
    int CreateSocket();
    bool Bind(unsigned short port);
    void Close();
    XTcp Accept();
    bool Connect(const char *ip,unsigned short port,int timeoutms=1000);
    bool SetBlock(bool isblock);//在连接成功或超时失败时就设置阻塞模式，这样可以进行下一次的连接。
    int Recv(char *buf,int bufsize);
    int RecvAll(char *buf,int bufsize);
    int Send(const char *buf,int sendsize);
    XTcp();
    virtual ~XTcp();
    int sock = 0;
    unsigned short port = 0;
    std::string ip;
};
//#endif /* XTcp_h */
