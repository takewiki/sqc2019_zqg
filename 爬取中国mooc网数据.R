library(rvest)
url="https://www.icourse163.org/"
#取出网址
web=read_html(url,encoding = "utf-8")

#获取大类名称
title<-web%>%html_nodes('div.u-cateItem-container div.u-cateItem-txt span')%>%html_text()
title<-title[-9]

title;

#获取大类链接
index_info<-web%>%html_nodes('div.u-cateItem-container a')%>%html_attrs()
index_info2<-c(1:(length(index_info)))
for (i in index_info2 ) {
  index_info2[i]<-index_info[[i]][1]
}
index_info2<-index_info2[-9]

index_info2[1];

#选择一个大类，爬取大类里的内容
#web2=read_html(index_info2[1],encoding = "utf-8")

#胡立磊修改后

web2=read_html('https://www.icourse163.org/category/computer#?type=30&orderBy=0&pageIndex=1',encoding = 'utf-8')

#朱同学原来的
# title2<-web2 %>% html_nodes("div.cnt f-pr span.u-course-name f-thide") %>% html_text()

# 胡立磊修改后

title2<-web2 %>% html_nodes(".u-course-name.f-thide") %>% html_text()



