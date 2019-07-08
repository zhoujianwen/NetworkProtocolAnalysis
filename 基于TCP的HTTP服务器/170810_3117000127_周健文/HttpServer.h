//  
//  XHttpServer.h
//  httpserver
//
//  Created by 170810_3117000127_周健文 on 2018/5/19.
//  Copyright © 2018年 Clement. All rights reserved.
//

//#ifndef HttpServer_h
//#define HttpServer_h
#pragma once
#include "XTcp/XTcp.h"
class HttpServer
{
public:
    bool Start(unsigned short port);
    HttpServer();
    ~HttpServer();
    XTcp server;
    void Main();
    void Stop();
    bool isexit = false;
};
//#endif /* HttpServer_h */
