library("arules")
testdata <- read.csv("Marketing campaign4.csv",header = TRUE,",")
testdata[,1] <- factor(testdata[,1])
answer <- testdata[["answered"]]
knowanswer <- answer > 0
testdata[["answered"]] <- knowanswer
ages <- testdata[["age"]]
knowages <- ages > 1
testdata[["age"]] <- knowages
sex1 <- testdata[["sex"]]
ses <- sex1 > 0
testdata[["sex"]] <- ses
child <- testdata[["children"]]
childs <- child > 0
testdata[["children"]] <- childs
dist <- testdata[["distance"]]
dista <- dist > 1
testdata[["distance"]] <- dista
pet <- testdata[["pets"]]
peta <- pet > 0
testdata[["pets"]] <- peta
testset1 <- as(testdata, "transactions")
rules <-apriori(testset1,parameter = list(confidence = 0.65))
rules1 <- rules
#hiddenitem <- array(c("age", "distance"),dim =c(1,2,1))
minsup <- 0.5
minconf <- 0.6
list = items(rules)
rulesub<- subset(rules, quality(rules)$confidence < 0.69)
f <- 0;
i <- length(rulesub)
j <- 9;
while(j <= 9)
{
  rhs1 <- LIST(rhs(rulesub[j]))
  rhs2 <- unlist(rhs1)
  column1 <- array()
  a <- LIST(lhs(rulesub[j]))
  b <- unlist(a)
  len <- length(b)
  columnrhs <- 0
  jr1 = 1
  while(jr1 <= 7)
  {
    if(rhs2[1]== colnames(testdata)[jr1])
    {
      columnrhs = jr1;
    }
    jr1 =jr1 + 1;
  }
  j3 <- 1;
  while(j3 <= len)
  {
    j1 <- 1
    while(j1 <= 7)
    {
      if(b[j3]== colnames(testdata)[j1])
      {
        column1[j3] = j1;
      }
      j1 =j1 + 1;
    }
    j3 = j3+1
  }
  t4 = 1;
  l <- vector()
  while(t4 < nrow(testdata)) #nrow(testdata)
  {
    #print(t4)
    bool1 <- array()
    column1len = length(column1)
    col1 = 1
    counter <- 0
    while(col1 <= column1len)
    {
      if(testdata[t4,column1[col1]]== "TRUE")
      {
        counter = counter+1;
      }
      col1 =col1 + 1
    }
    if(counter == 0)
    {
      
    }
    else if(counter == column1len)
    {
      
    }
    else
    {
    
      if(testdata[t4,columnrhs] == FALSE)
      {
        
        #y =  testdata[t4,1]
       # y = as.double(y)
       # print(y)
       # z <-which(testdata== y, arr.ind = TRUE)
        l <- append(l,testdata[t4,1])
      }
     
      # print(testdata[t4,)
    }
    # if(testdata[t4,column1[2]]== "TRUE" | testdata[t4,column1[1]]== "TRUE"  )
    #  {
    #   print(testdata[t4,])
    #}
    t4 =t4 +1;
  }
  lensuptran <- length(l)
  j2 <- 1
  itemcount <- vector()
  while(j2 <=lensuptran)
  {
    j11 <- 2;
    countitem <- 0
    while(j11 <= 7)
    {
      if(testdata[(l[j2]),j11] == "TRUE")
      {
        countitem =  countitem + 1;
      }
      j11 = j11 + 1
    }
    
    itemcount <- append(itemcount,countitem )
    j2 = j2 + 1
  }
  
  j22 <- 1
  while ( j22 <= lensuptran )
  {
    counter1 <- 1
    while ( counter1 <= (lensuptran-j22) )
    {
      temp <- 0
      temp1 <- 0
      
      if ( itemcount[counter1] > itemcount[counter1+1] )
      {
        temp = l[counter1]
        l[counter1] = l[counter1+1]
        l[counter1+1] = temp
        
        
        temp1 = itemcount[counter1]
        itemcount[counter1] = itemcount[counter1+1]
        itemcount[counter1+1] = temp1
        
      }
      counter1 = counter1+1
    }
    j22 = j22 + 1
    
  }
  j55 <- 1
  print(l)
  while(j55 <= lensuptran)
  {
    j44 <- 1
    lengthruleinit = length(rules)
    
    column2 =array()
    countcol = 1
    while(j44 <= column1len)
    {
      
      if(testdata[(l[j55]),(column1[j44])] == FALSE)
      {
        
        column2[countcol] = column1[j44]
        countcol = countcol + 1
        testdata[(l[j55]),(column1[j44])] = TRUE
      }
      j44= j44 + 1;
    }
    testset1 <- as(testdata, "transactions")
    countrule = countrule +1;
    print("anish avinash")
    rules <-apriori(testset1,parameter = list(confidence = 0.69))
    lengthrulefinal = length(rules)
   # if(lengthrulefinal > lengthruleinit)
    #{
     # print(lengthrulefinal)
      #print(lengthruleinit)
      #collllen = length(column2)
      #j222 = 1
      #while(j222 <= collllen)
      #{
        
       # testdata[(l[j55]),(column2[j222])] = FALSE
      #  j222 = j222 + 1
      #}
      #j55 = j55 + 1;
      #testset1 <- as(testdata, "transactions")
      #rules <-apriori(testset1,parameter = list(support = 0.2,confidence = 0.5))
      #  print("funnnnnnnnnnnnnnn")
      #lengthruleinit = length(rules)
      #print(lengthruleinit)
      #print(column2)
      #print(column1)
      #print(l[j55])
      #print(column1len)
      #  print(j)
      #next
    #}
    rulecheck <- rulesub[j] %in% rules
    if(is.na(rulecheck))
    {
      break;
    }
    if(j55 == lensuptran)
    {
      print("loop did not break for")
      print(j)
    }
    j55 = j55 + 1;
  }
  
  j =j+1;
  
}
