//
//  HttpResponse.cpp
//  httpserver
//
//  Created by 170810_3117000127_周健文 on 2018/5/25.
//  Copyright © 2018年 Clement. All rights reserved.
//

#include "HttpResponse.h"
#include <string>
#include <regex>
#include <stdlib.h>

using namespace std;
bool HttpResponse::SetRequest(std::string request)
{
    string src = request;
    //    /index.html /ff
   //GET /index.html HTTP/1.1
    string pattern = "^([A-Z]+) /([a-zA-Z0-9]*([.][a-zA-Z]*)?)[?]?(.*) HTTP/1";
    regex r(pattern);
    smatch mas;
    regex_search(src,mas,r);
    if(mas.size() == 0)
    {
        printf("%s failed!\n",pattern.c_str());
        return false ;
    }
    string type = mas[1];   //匹配请求类型，GET|POST
    string path = "/";//默认访问目录
    path += mas[2]; //请求目录路径
    string filetype = mas[3];
    string query = mas[4];  //GET请求参数
    
    if(type != "GET")
    {
        printf("Not GET!!!\n");
        return false;
    }
    string filename = path;
    string filepath = "wwwroot";//默认访问目录
    if(path == "/")
    {
        filename = "/index.html";
        
    }
    
    filepath += filename;
    
    //php-cgi www/index.php id=1 name=wyu >  www/index.php.html
    if(filetype == ".php")
    {
        string cmd = "php-cgi ";
        cmd += filepath;
        cmd += " ";
        //query id=1&name=wyu
        for(unsigned int i =0; i< query.size(); i++)
        {
            if(query[i] == '&') query[i] = ' ';
        }
        cmd += query;
        
        cmd += " > ";
        filepath += ".html";
        cmd += filepath;
        
        //printf("%s\n",cmd.c_str());
        system(cmd.c_str());    //required include "stdlib.h"
    }
    
    
    fp = fopen(filepath.c_str(),"rb");
    if(fp == NULL)  //不存在目录或文件的异常处理
    {
        printf("open file %s failed!\n",filepath.c_str());
        filepath = "wwwroot/404.html";
        fp = fopen(filepath.c_str(),"rb");
        //return false;
    }
    //获取文件大小
    fseek(fp,0,SEEK_END);
    filesize = ftell(fp);
    fseek(fp,0,0);
    printf("file size is %d\n",filesize);
    
    if(filetype == ".php")  //处理php-cgi编译生成的index.php.html文件（包含消息头和消息正文）
    {
        char c = 0;
        //\r\n\r\n
        int headsize = 0;
        while(fread(&c,0,1,fp) > 0)
        {
            headsize++;
            if(c=='\r')
            {
                fseek(fp,3,SEEK_CUR);//设置文件指针stream的位置，偏移offset（指针偏移量）个字节的位置
                headsize += 3;
                break;
            }
        }
        filesize = filesize - headsize;
    }
   // fclose(fp);
    return true;
}

//响应Http Client GET请求
//消息头，协议约定的规则，\r\n也在规则定义范围内。
std::string HttpResponse::GetHead()
{
    string RequestHeaders = "HTTP/1.1 200 OK\r\n"
    "Server: Http\r\n"
    "Content-Type: text/html\r\n"
    "Content-Length: %d"
    "\r\n\r\n";
    char bsize[128] = { 0 };
    //sprintf(bsize, "%d", filesize);
    sprintf(bsize,RequestHeaders.c_str(),filesize);
    return bsize;
}

int HttpResponse::Read(char *buf, int bufsize)
{
    return fread(buf, 1, bufsize, fp);
}

HttpResponse::HttpResponse(){}

HttpResponse::~HttpResponse(){}
