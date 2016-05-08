#######äëÿ Fly Elephant######
install.packages('sp', repos='http://cran.us.r-project.org', lib= "~/")
install.packages('ade4', repos='http://cran.us.r-project.org', lib= "~/")
install.packages('adehabitatMA', repos='http://cran.us.r-project.org', lib= "~/")
install.packages('CircStats', repos='http://cran.us.r-project.org', lib= "~/")
install.packages('deldir', repos='http://cran.us.r-project.org', lib= "~/")
install.packages('adehabitatHR', repos='http://cran.us.r-project.org', lib= "~/")
install.packages('adehabitatLT', repos='http://cran.us.r-project.org', lib= "~/")
library("sp",lib.loc = "~/")
library("ade4",lib.loc = "~/")
library("adehabitatMA",lib.loc = "~/")
library("CircStats",lib.loc = "~/")
library("deldir",lib.loc = "~/")
library("adehabitatLT",lib.loc = "~/")
library("adehabitatHR",lib.loc = "~/")

all_6_from_rt_adj_2<-dget(file='~/workdir/all_6_from_rt_adj_2')
###çàãðóæàþ òðàåêòîðèè
all.traj_adj<-as.ltraj(xy = all_6_from_rt_adj_2[,c("x.smooth","y.smooth")], 
                date = all_6_from_rt_adj_2$date_time,id=as.character(all_6_from_rt_adj_2$id)) 

kernel_Brownian_list<-list()
a<-as.numeric()
for (i in seq(0.5,2.5,by=0.5)) {
a=a+1
kernel_Brownian_list[[a]]<-kernelbb(all.traj_adj, sig1=i, sig2=15, grid = 900, same4all = TRUE, 
  byburst = TRUE,extent = 0.1, nalpha = 25)
}
save(kernel_Brownian_list, file='~/workdir/kernel_Brownian_list')
