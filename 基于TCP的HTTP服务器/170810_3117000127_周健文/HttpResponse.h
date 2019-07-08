//
//  HttpResponse.h
//  httpserver
//
//  Created by 170810_3117000127_周健文 on 2018/5/25.
//  Copyright © 2018年 Clement. All rights reserved.
//

//#ifndef HttpResponse_h
//#define HttpResponse_h
#pragma once
#include <string>
class HttpResponse
{
public:
    bool SetRequest(std::string request);
    std::string GetHead();
    int Read(char *buf, int bufsize);
    HttpResponse();
    ~HttpResponse();
private:
    int filesize = 0;
    FILE *fp = NULL;
};

//#endif /* HttpResponse_h */
