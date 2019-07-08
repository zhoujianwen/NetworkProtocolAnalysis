//
//  XHttpServer.cpp
//  httpserver
//
//  Created by 170810_3117000127_周健文 on 2018/5/19.
//  Copyright © 2018年 Clement. All rights reserved.
//

#include "HttpServer.h"
#include "HttpClient.h"
#include <thread>
using namespace std;
HttpServer::HttpServer(){}
HttpServer::~HttpServer(){}

void HttpServer::Stop()
{
    isexit = true;
}
void HttpServer::Main()
{
    while (!isexit)
    {
        XTcp client = server.Accept();
        if (client.sock <= 0)continue;
        HttpClient *th = new HttpClient();
        th->Start(client);
    }
}
bool HttpServer::Start(unsigned short port)
{
    isexit = false;
    server.CreateSocket();
    if (!server.Bind(port)) return false;
    thread sth(&HttpServer::Main, this);
    sth.detach();
    return true;
}

