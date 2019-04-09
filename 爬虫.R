library(rvest)
library(xml2)
library(dplyr)
filename<-"E:\\工作簿2.csv"    #如果不存在这个文件，会自动创建新文件
url_<-"https://search.51job.com/list/020000,000000,0000,00,9,99,%25E6%2595%25B0%25E5%25AD%25A6,2,1.html?lang=c&stype=&postchannel=0000&workyear=99&cotype=99&degreefrom=99&jobterm=99&companysize=99&providesalary=99&lonlat=0%2C0&radius=-1&ord_field=0&confirmdate=9&fromType=&dibiaoid=0&address=&line=&specialarea=00&from=&welfare="
link<-web%>%html_nodes('div.p_in li.bk a')%>%html_attr("href") 
for(i in 1:151){
  
  if(i==1){
    
    web<-read_html(url_,encoding = "GBK")    #注意网页编码为'GBK'，不是常用的'utf-8'，可以右击编码(E)
    
    title<-html_text(html_nodes(web,'p.t1 a'))    #职位名根据网页结构剖析，下同
    
    location<-html_text(html_nodes(web,'span.t3'))    #工作地域
    
    location<-location[2:length(location)]
    
    salary<-html_text(html_nodes(web,'span.t4'))
    
    salary<-salary[2:length(salary)]
    
    Time<-html_text(html_nodes(web,'span.t5'))
    
    Time<-Time[2:length(Time)]
    companies<-html_text(html_nodes(web,'span.t2'))
    companies<-companies[2:length(companies)]
    url_<-link[1]
    
    Data<-data.frame(title,companies,location,salary,Time)    #拼接成数据框
    
  }
  
  else{    #不是第一页时，前面解释过
    
    web<-read_html(url_,encoding = "GBK")
    
    title<-html_text(html_nodes(web,'p.t1 a'))
    
    web<-read_html(url_,encoding = "GBK")
    
    title<-html_text(html_nodes(web,'p.t1 a'))
    
    location<-html_text(html_nodes(web,'span.t3'))
    
    location<-location[2:length(location)]
    
    salary<-html_text(html_nodes(web,'span.t4'))
    
    salary<-salary[2:length(salary)]
    
    Time<-html_text(html_nodes(web,'span.t5'))
    
    Time<-Time[2:length(Time)]
    
    companies<-html_text(html_nodes(web,'span.t2'))
    
    companies<-companies[2:length(companies)]
    
    link<-web%>%html_nodes('div.p_in li.bk a')%>%html_attr("href") 
    
    # 从当前页面获取下一页网址，审查元素【下一页】那个按钮
    
    url_<-link[2]   
    
    Data<-rbind(Data,data.frame(title,companies,location,salary,Time))    #每次循环都拼接数据框Data，直到把48个页面所有数据拼接在一个数据框里
    
  }
 
    }



################将数据框以csv格式写入本地文件##################

write.csv(Data,file = filename,row.names = FALSE)
