summary(aug_train)

colSums(is.na(aug_train))*100/nrow(aug_train)

aug_train$company_size <- NULL
aug_train$company_type <- NULL
aug_train$gender <- NULL

library(DMwR)
library(rpart)
library(lattice)
library(grid)

ncols <- ncol(aug_train)

str(aug_train)

aug_train$city <- as.factor(aug_train$city)
aug_train$relevent_experience <- as.factor(aug_train$relevent_experience)
aug_train$enrolled_university <- as.factor(aug_train$enrolled_university)
aug_train$education_level <- as.factor(aug_train$education_level)
aug_train$major_discipline <- as.factor(aug_train$major_discipline)
aug_train$experience <- as.factor(aug_train$experience)
aug_train$last_new_job <- as.factor(aug_train$last_new_job)

aug_train_nomissing <- knnImputation(aug_train[, !names(aug_train)%in%"target"])

colSums(is.na(aug_train_nomissing))*100/nrow(aug_train_nomissing)

aug_train_nomissing$target <- aug_train$target

mod <- lm(target ~., data=aug_train_nomissing)
cooksd <- cooks.distance(mod)

plot( cooksd , pch ="*", cex =2, main="Influential Obs by Cooks distance")
abline(h = 4*mean(cooksd, na.rm=T), col="red ")
text(x=1:length(cooksd)+1, y=cooksd,labels=ifelse(cooksd>4*mean(cooksd,na.rm=T),names(cooksd),""), col="red")

influential <- as.numeric(names(cooksd)[(cooksd >4*mean(cooksd, na.rm=T))])
head(aug_train_nomissing[influential,])

copy <- aug_train_nomissing
aug_train_nomissing <- copy

aug_train_nomissing$id <- seq.int(nrow(aug_train_nomissing))

aug_train_nomissing <- aug_train_nomissing[c(influential), ]

b <- c(influential)
'%ni%' <- Negate('%in%')
aug_train_nomissing <- aug_train_nomissing[aug_train_nomissing$id %ni% b, ]
aug_train_nomissing$id <- NULL

write.csv(aug_train_nomissing, "C:\\Users\\Renzo Tello\\Desktop\\machine_learning\\hr_analytics\\aug_train_nomissing.csv", row.names=FALSE)
