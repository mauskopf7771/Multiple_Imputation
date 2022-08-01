# Import/load dataset
library(stats)
library(base)
library(mice)
# Import Dataset
df <- read_excel("REDACTED.xlsx")
# View Dataset
View(df)
#Deleting pairwise/listwise - pairwise excludes when they have missing data - so N is different for different variables
#Listwise is they just remove participant altogether if they have any missing data. Pairwise is more powerful. 
#Mean imputation reduces variance so it increases type 1 error so makes it easier to get a significant result. 

#Should find a way to remove categorical variables automatically and make this an actual piece of software.

# Create function to identify the amount of mising data as a percentage
percentmiss = function(x) { sum(is.na(x)) / length(x) * 100 } #Even though this is kind of irrelevant but I would like to keep this for later use.
apply(df, 2, percentmiss) #Displays missing data by columns
apply(df, 1, percentmiss) #Displays missing data by rows


# This section would be to remove rows with more than 5% data and basically split the dataset but given we're imputing literally everything, this is all hashed out
### replacepeople = df
### dontpeople = Nicky_G_MI #Ignore this line of code - it's relevant for other general functions.

# Breaks up data so we have columns we can replace, and columns we can't replace with imputed data. 
### replacecolumn = replacepeople
### dontcolumn = replacepeople

tmpdf = mice(df, method = 'cart') #Creates a temporary dataframe with like loads of versions of imputed dataframes
#method used is 'cart' - this was used because there are singular variables so rather than using regression (where singularity just does not work)
#classification algorithms and regression trees are used instead. Regression trees are used as a non-parametric alternative to linear regression. 

imputed_data = complete(tmpdf, 1) #Takes the first version of the imputated dataset
summary(nomiss) #Views it 

write.csv(imputed_data, file = "REDACTED.csv") #Exports the dataframe as a .csv file
 
#filledin_none = cbind(dontcolumn, nomiss)
#filledin_missing = rbind(filledin_none, dontpeople)


