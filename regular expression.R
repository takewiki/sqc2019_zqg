#正则表达式regular expression----
s<-c('123abc456','abc123123def')
#查找 ‘ abc’在s中的位置
grep('abc',s)
#查找 ‘ abc’在s中是否存在
grepl('ac',s)
#替换第一个找到的 模式 sub(p,replace,s)
sub('def','ddd',s)
sub('ddd','def',s)
#gsub对查找到的所有内容进行替换
ss<-c('abc123def','abcabc123123')
gsub('123','$$$',ss)
sub('123','$$$',s)

#正则表达式----
grepl('\\d',s)
grepl('[0-9]',s)
grepl('\\D',s)
grepl('[^0-9]',s)
grepl('\\w',s)
grepl('[0-9^0-9]',s)
grepl('\\\\',s)

#stringr的正则表达式函数(比较重要的)----
library(stringr)
s<-'123abc456123a'
str_extract(s,'[0-9]+')
a<-str_extract_all(s,'[0-9]+')
a
unlist(a)[2]
str_locate(s,'[0-9]+')
str_locate_all(s,'[0-9]+')
str_replace(s,'123','$$$')
str_replace_all(s,'123','$$$')
str_split(s,'abc')
str_split_fixed(s,'abc',4)
str_count(s,'123')

#用的比较多的正则表达式
s<-'工资12.67千/月'
str_extract(s,'\\d+\\.\\d+')

#其他重要的函数----
str_sub(s,4,8)
str_dup(s,2)
str_length(s)
s<-'  123abc456123a  '
str_trim(s)
str_c('a','b','1')
