library(RCurl)

url.exists("https://www.baidu.com")
d= debugGatherer();
temp<- getURI("http://www.dataguru.cn/",debugfunction=d$update,verbose=T)
cat(d$value()[3])#提交给服务器的头信息
cat(d$value()[1])#服务器的地址以及端口号
cat(d$value()[2])#服务器端返回的头信息

curl=getCurlHandle();
dd=getURI("http://www.dataguru.cn/",curl = curl)
getCurlInfo(curl)$response.code
getCurlInfo(curl)

#武装header----
myheader<-c("User-Agent"="Mozilla/5.0 (iPhone; U; CPU iPhone OS 2_0 like Mac OS X; ja-jp) AppleWebKit/525.18.1 (KHTML, like Gecko) Version/3.1.1 Mobile/5A347 Safari/52",
            "Accept"="text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
            "Accept-Language"="en-us",
            "Connection"="keep-alive",
            "Accept-Charset"="GB2312,utf-8;q=0.7,*;q=0.7")
#确认header被武装----
dd=debugGatherer()
temp2<-getURI("http://www.dataguru.cn/",httpheader=myheader,headerfunction=dd$update,verbose=T)
cat(dd$value()[3])#提交给服务器的头信息  

#拆分地址----
character<-c("https://www.baidu.com/s?ie=utf-8&f=3&rsv_bp=1&rsv_idx=2&ch=&tn=baiduhome_pg&bar=&wd=555&rsv_spt=1&oq=useragent%2520iphone&rsv_pq=838a87160000b6fe&rsv_t=ea57G2yAdcAtfdM9gwwBgshll6Y3gr9PxMA%2F0IOxzU5FBN%2FH7%2FUl0agj1eiuDO2CawZl&rqlang=cn&rsv_enter=1&prefixsug=555&rsp=0&inputT=1165")
getFormParams(character)

url=getForm("http://www.baidu.com/s",ie="utf-8",f="3",rsv_bp="1",rsv_idx ="2" ,ch ="" ,tn ="baiduhome_pg",bar="" ,wd ="电影团购" ,rsv_spt ="1" ,oq ="useragent%2520iphone" ,rsv_pq="838a87160000b6fe",rsv_t="ea57G2yAdcAtfdM9gwwBgshll6Y3gr9PxMA%2F0IOxzU5FBN%2FH7%2FUl0agj1eiuDO2CawZl" ,rqlang ="cn",rsv_enter ="1" ,prefixsug ="555" ,rsp ="0" ,inputT ="1165" )
write.table(url,"url.text")  
#getBinaryURL()----
url="http://download.jsgwyw.org/P020190225524246703740.xlsx"
temp<-getBinaryURL(url)
note<-file("namelist.xlsx",open="wb")
writeBin(temp,note)
close(note)
#strsplit的使用（切割字符串）----
Sys.time()
class(Sys.time())

unlist(strsplit(as.character(Sys.time()),' '))[1]
unlist(strsplit(as.character(Sys.time()),' '))[2]
#切分字符串
#取出路径 dirlistonly=T
url="ftp.wcc.nrcs.usda.gov/data/snow/snow_course/table/history/idaho/"
filename=getURL(url,dirlistonly=T)
filename

strsplit(filename,"\r\n")
#lapply----
#批量下载----
#爬到 数据
html=getURI("http://rfunction.com/code/1202/")
html2=strsplit(html,"<td><a href=\"")[[1]]
files=strsplit(html2,"\"")
files=lapply(files,function(x){x[1]})
files=unlist(files)
files=files[-(1:2)]
#批量下载
base="http://rfunction.com/code/1202/";

for (i in 1:length(files)){
  url=paste(base,files[i],sep='')
  temp<-getBinaryURL(url)
  note<-file(paste("1202",files[i],sep='.'),open="wb")
  writeBin(temp,note)
  close(note)
  Sys.sleep(2) 
}