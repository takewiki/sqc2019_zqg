library(rvest)
url="https://www.icourse163.org/"
#取出网址
web=read_html(url,encoding = "utf-8")

#获取大类名称
title<-web%>%html_nodes('div.u-cateItem-container div.u-cateItem-txt span')%>%html_text()
title<-title[-9]

#获取大类链接
index_info<-web%>%html_nodes('div.u-cateItem-container a')%>%html_attrs()
index_info2<-c(1:(length(index_info)))
for (i in index_info2 ) {
  index_info2[i]<-index_info[[i]][1]
}
index_info2<-index_info2[-9]

#选择一个大类，爬取大类里的内容
web2=read_html(index_info2[1],encoding = "utf-8")
title2<-web2 %>% html_nodes("div.cnt f-pr span.u-course-name f-thide") %>% html_text()
