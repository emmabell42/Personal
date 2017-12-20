# Should I buy an annual travelcard?
# An annual zone 1-2 travelcard costs £1,320, which works out as £110 per month. Therefore if I'm spending £110+ per month on public transport then it's worth buying an annual travelcard.
# To work out what I'm spending on public transport I created a TfL online account, registered my debit card to it and downloaded the payment history data associated with that card.

# Read in payment history csvs
setwd("\\\\icnas2.cc.ic.ac.uk\\eb2012\\Oyster")
toRead <- list.files()
toName <- sapply(strsplit(gsub('This', 'December', toRead), " "), function(a) a[5])
charges <- c()
for(i in 1:length(toRead)){
tmp <- read.csv(toRead[i])
assign(toName[i],tmp)
charges <- rbind(charges,tmp)
}
rm(tmp)
rm(i)
# Format the dates as R dates
charges[,1] <- as.Date(charges[,1],format='%d/%m/%Y')
charges <- charges[order(charges[,1]),]
charges[,2] <- charges[,2]*-1
plot(charges,pch=20)
months <- unique(sapply(strsplit(as.character(charges[,1]),"-"),function(a) a[2]))
# Calculate how much I'm spending on public transport per month
monthly <- c()
for(i in 1:12){
month <- paste0("-",months[i],"-")
chargesThisMonth <- charges[grep(month,charges[,1]),2]
totalThisMonth <- sum(chargesThisMonth)
monthly <- c(monthly,totalThisMonth)
}
png("Annual_travelcard.png",h=6,w=6,unit="in",res=300)
barplot(monthly,pch=20,names=1:12,ylim=c(0,120),xlab="Month",ylab="Cost (£)",main="TfL expenditure (2017)")
abline(h=110,lty=2)
dev.off()
# Should I buy an annual travelcard? No.