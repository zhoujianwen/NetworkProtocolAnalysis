//
//  HttpClient.cpp
//  httpserver
//
//  Created by 170810_3117000127_周健文 on 2018/5/25.
//  Copyright © 2018年 Clement. All rights reserved.
//

#include "HttpClient.h"
#include <thread>
using namespace std;
HttpClient::HttpClient(){}
HttpClient::~HttpClient(){}

bool HttpClient::Start(XTcp client)
{
    this->client = client;
    thread sth(&HttpClient::Main, this);
    sth.detach();
    return true;
}

void HttpClient::Main()
{
    char buf[65536] = { 0 };//recvbuf
    for (;;)//HTTP1.1 单次连接，多次访问
    {
        //接收http客户端请求报文头
        int len = client.Recv(buf, sizeof(buf)-1);
        
        /*while(client.Recv(buf,sizeof(buf)-1)>0)
        {   如果要接收客户端上传大文件数据就要循环接收。
            需要解决：1、数据粘包   2、数据包格式  3、多线程优化处理
            recvLen += strlen(buf);
            cachebuf.append(buf);
            printf("%s",cachebuf.c_str());
        }*/
        
        if (len <= 0)
        {
            break;
        }
        buf[len] = '\0';
        printf("=======recv=========\n%s===================\n",buf);
        
        //recv来自客户端的协议请求消息头内容
        //GET /index.html HTTP/1.1
        //Host: 192.168.3.69
        //User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:51.0) Gecko/20100101 Fi
        //Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
        //Accept-Language: zh-CN,zh;q=0.8,en-US;q=0.5,en;q=0.3
        //Accept-Encoding: gzip, deflate
        //DNT: 1
        //Connection: keep-alive
        //Upgrade-Insecure-Requests: 1
        
        if (!res.SetRequest(buf))//处理客户端请求数据（消息头）
        {
            break;
        }
        string head = res.GetHead();//获取已定义好的响应消息头
        if (client.Send(head.c_str(), head.size())<=0)//发送响应消息头
        {
            break;
        }
        int size = sizeof(buf);
       
        for (;;)
        {
            int len = res.Read(buf, size);
            if (len <= 0){  break;}
            if (client.Send(buf, len) <= 0)
            {
                break;
            }
        }
        /*if(system("sh tarobj.sh")<0)//压缩命令
         {
         printf("error");
         }*/
    }

    client.Close();
    delete this;
}

