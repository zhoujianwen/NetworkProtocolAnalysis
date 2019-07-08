//
//  HttpClient.h
//  httpserver
//
//  Created by 170810_3117000127_周健文 on 2018/5/25.
//  Copyright © 2018年 Clement. All rights reserved.
//

//#ifndef HttpClient_h
//#define HttpClient_h
#pragma once
#include "XTcp/XTcp.h"
#include "HttpResponse.h"
class HttpClient
{
public:
    HttpClient();
    ~HttpClient();
    bool Start(XTcp client);
    void Main();
    XTcp client;
    HttpResponse res;
};
//#endif /* HttpClient_h */
