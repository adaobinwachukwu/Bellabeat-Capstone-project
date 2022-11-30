Bellabeat Case Study



INTRODUCTION
Bellabeat is a high-tech manufacturer of health focused products for women. They offer different smart devices that
enable users collect data on their activity, sleep, stress, reproductive health and mindfulness habits. This data can
help users better understand their current habits and make healthy decisions.

The task is to analyze smart devices fitness data to gain insight into how consumers are using their smart devices
and establish how it could help unlock new growth opportunities. The focus is on analyzing one of Bellabeat’s
products,Bellabeat app. The insights discovered will help guide marketing strategy for the company. 


ASK PHASE

Bellabeat’s cofounder asks for smart device usage data to be analyzed in order to gain insight into how consumers use
non-Bellabeat smart devices. This will establish some trends in smart device usage, how these trends apply to
Bellabeat customers and how these trends help influence Bellabeat marketing strategy.

Stakeholders
•	Urska Srsen- Bellabeat’s cofounder and Chief Creative Officer
•	Sando Mur- Mathematician and Bellabeat’s cofounder
•	Bellabeat marketing team

Business Task
Analyze smart device usage data to gain insights into how people are using their smart devices and use the
information to make high level recommendations on how the trends can improve Bellabeat marketing strategy.



PREPARE PHASE

The data source used for this case study is the Fitbit Fitness tracker data, it is stored in Kaggle and was made
available through Mobius. Its open source, the owner dedicated the work to open domain.


Loading packages

install.packages("tidyverse")
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)

> library(tidyverse)
── Attaching packages ────────────────────────────────────────── tidyverse 1.3.2 ──
✔ ggplot2 3.4.0      ✔ purrr   0.3.5 
✔ tibble  3.1.8      ✔ dplyr   1.0.10
✔ tidyr   1.2.1      ✔ stringr 1.4.1 
✔ readr   2.1.3      ✔ forcats 0.5.2 
── Conflicts ───────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
> library(lubridate)
Loading required package: timechange

Attaching package: ‘lubridate’

The following objects are masked from ‘package:base’:
  
  date, intersect, setdiff, union

> library(dplyr)
> library(ggplot2)
> library(tidyr)


PROCESS PHASE


Importing datasets
For this project the Fitbit Fitness Tracker Data set which is a public dataset will be used. 
I have imported the datasets which will be relevant for the analysis I want to carry out.



library(readr)
daily_Activity_merged <- read_csv("daily_Activity_merged.csv")

library(readr)
daily_Calories_merged <- read_csv("daily_Calories_merged.csv")

library(readr)
daily_Intensities_merged <- read_csv("daily_Intensities_merged.csv")

library(readr)
sleep_Day_merged <- read_csv("sleep_Day_merged.csv")

library(readr)
weight_LogInfo_merged <- read_csv("weight_LogInfo_merged.csv")


CREATING DATA FRAMES

activity <- read-csv("daily_Activity_merged.csv")

calories <- read_csv("daily_Calories_merged.csv")

intensities <- read_csv("daily_Intensities_merged.csv")

sleep_day <- read_csv("sleep_Day_merged.csv")

weight_loginfo <- read_csv("weight_LogInfo_merged.csv")


To preview the dataframe and get a summary of each column  I used the head() function
and str() function to confirm all data were properly loaded.

head(activity)
str(activity)

head(calories)
str(calories)

head(intensities)
str(intensities)

head(sleep_day)
str(sleep_day)

head(weight_loginfo)
str(weight_loginfo)

head(activity)
# A tibble: 6 × 15
Id Activ…¹ Total…² Total…³ Track…⁴ Logge…⁵ VeryA…⁶ Moder…⁷ Light…⁸ Seden…⁹
<dbl> <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
  1 1503960366 4/12/2…   13162    8.5     8.5        0    1.88   0.550    6.06       0
2 1503960366 4/13/2…   10735    6.97    6.97       0    1.57   0.690    4.71       0
3 1503960366 4/14/2…   10460    6.74    6.74       0    2.44   0.400    3.91       0
4 1503960366 4/15/2…    9762    6.28    6.28       0    2.14   1.26     2.83       0
5 1503960366 4/16/2…   12669    8.16    8.16       0    2.71   0.410    5.04       0
6 1503960366 4/17/2…    9705    6.48    6.48       0    3.19   0.780    2.51       0
# … with 5 more variables: VeryActiveMinutes <dbl>, FairlyActiveMinutes <dbl>,
#   LightlyActiveMinutes <dbl>, SedentaryMinutes <dbl>, Calories <dbl>, and
#   abbreviated variable names ¹​ActivityDate, ²​TotalSteps, ³​TotalDistance,
#   ⁴​TrackerDistance, ⁵​LoggedActivitiesDistance, ⁶​VeryActiveDistance,
#   ⁷​ModeratelyActiveDistance, ⁸​LightActiveDistance, ⁹​SedentaryActiveDistance
# ℹ Use `colnames()` to see all variable names


str(activity)
spc_tbl_ [940 × 15] (S3: spec_tbl_df/tbl_df/tbl/data.frame)
$ Id                      : num [1:940] 1.5e+09 1.5e+09 1.5e+09 1.5e+09 1.5e+09 ...
$ ActivityDate            : chr [1:940] "4/12/2016" "4/13/2016" "4/14/2016" "4/15/2016" ...
$ TotalSteps              : num [1:940] 13162 10735 10460 9762 12669 ...
$ TotalDistance           : num [1:940] 8.5 6.97 6.74 6.28 8.16 ...
$ TrackerDistance         : num [1:940] 8.5 6.97 6.74 6.28 8.16 ...
$ LoggedActivitiesDistance: num [1:940] 0 0 0 0 0 0 0 0 0 0 ...
$ VeryActiveDistance      : num [1:940] 1.88 1.57 2.44 2.14 2.71 ...
$ ModeratelyActiveDistance: num [1:940] 0.55 0.69 0.4 1.26 0.41 ...
$ LightActiveDistance     : num [1:940] 6.06 4.71 3.91 2.83 5.04 ...
$ SedentaryActiveDistance : num [1:940] 0 0 0 0 0 0 0 0 0 0 ...
$ VeryActiveMinutes       : num [1:940] 25 21 30 29 36 38 42 50 28 19 ...
$ FairlyActiveMinutes     : num [1:940] 13 19 11 34 10 20 16 31 12 8 ...
$ LightlyActiveMinutes    : num [1:940] 328 217 181 209 221 164 233 264 205 211 ...
$ SedentaryMinutes        : num [1:940] 728 776 1218 726 773 ...
$ Calories                : num [1:940] 1985 1797 1776 1745 1863 ...
- attr(*, "spec")=
  .. cols(
    ..   Id = col_double(),
    ..   ActivityDate = col_character(),
    ..   TotalSteps = col_double(),
    ..   TotalDistance = col_double(),
    ..   TrackerDistance = col_double(),
    ..   LoggedActivitiesDistance = col_double(),
    ..   VeryActiveDistance = col_double(),
    ..   ModeratelyActiveDistance = col_double(),
    ..   LightActiveDistance = col_double(),
    ..   SedentaryActiveDistance = col_double(),
    ..   VeryActiveMinutes = col_double(),
    ..   FairlyActiveMinutes = col_double(),
    ..   LightlyActiveMinutes = col_double(),
    ..   SedentaryMinutes = col_double(),
    ..   Calories = col_double()
    .. )
- attr(*, "problems")=<externalptr>
  
  
  
  CLEANING AND FORMATTING DATA

Before going ahead, i would like to verify the number of participants that are on each data frame.

Verifying number of participants

> n_distinct(activity$Id)
[1] 33
> n_distinct(calories$Id)
[1] 33
> n_distinct(intensities$Id)
[1] 33
> n_distinct(sleep_day$Id)
[1] 24
> n_distinct(weight_loginfo$Id)
[1] 8

This tells us that there are 33 participants in the activity,calories and intensities dataset, 24 participants
in the sleep day dataset and 8 participants in the weight_loginfo dataset.


CHECKING FOR DUPLICATES 

> sum(duplicated(activity))
[1] 0
> sum(duplicated(intensities))
[1] 0
> sum(duplicated(calories))
[1] 0
> sum(duplicated(sleep_day))
[1] 3
sum (duplicated(weight_loginfo))
[1] 0

I see there are duplicates only in the sleep_day dataset.


REMOVING DUPLICATES AND NA

activity <- activity %>%
  distinct()%>%
  drop_na()

calories <- calories %>%
  distinct()%>%
  drop_na()

intensities <- intensities %>%
  distinct()%>%
  drop_na()

sleep_day <- sleep_day %>%
  distinct() %>%
  drop_na()

weight_loginfo <- weight_loginfo %>%
  distinct()%>%
  
  Please note: I decided not to remove the NA in the weight_loginfo dataset because the dataset has only 8 partcipants,
removing the entire rows with NA will leave me with only 2 participants for my analysis. In addition, i do not
necessarily need the "fat" column for my analysis,this is the column with NA.


TO VERFIY THAT THE DUPLICATE IN THE sleep_day DATASET HAS BEEN REMOVED

sum(duplicated(sleep_day))
[1] 0



CLEAN AND RENAME COLUMNS

Cleaning and renaming of columns will be done to ensure the column names are unique and consistent with
only characters, numbers and underscores. I will also convert the format of all the columns to lowercase.This is 
important because i will be merging some of the columns later and its very important that all the column names are
in the same format.



clean_names(activity)
activity <- rename_with(activity, tolower)
clean_names(calories)
calories <- rename_with(calories, tolower)
clean_names(intensities)
intensities <- rename_with(intensities, tolower)
clean_names(sleep_day)
sleep_day <- rename_with(sleep_day, tolower)
clean_names(weight_loginfo)
weight_loginfo <- rename_with(weight_loginfo, tolower)




clean_names(activity)
# A tibble: 940 × 15
id activ…¹ total…² total…³ track…⁴ logge…⁵ very_…⁶ moder…⁷ light…⁸ seden…⁹
<dbl> <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
  1    1.50e9 4/12/2…   13162    8.5     8.5        0    1.88   0.550    6.06       0
2    1.50e9 4/13/2…   10735    6.97    6.97       0    1.57   0.690    4.71       0
3    1.50e9 4/14/2…   10460    6.74    6.74       0    2.44   0.400    3.91       0
4    1.50e9 4/15/2…    9762    6.28    6.28       0    2.14   1.26     2.83       0
5    1.50e9 4/16/2…   12669    8.16    8.16       0    2.71   0.410    5.04       0
6    1.50e9 4/17/2…    9705    6.48    6.48       0    3.19   0.780    2.51       0
7    1.50e9 4/18/2…   13019    8.59    8.59       0    3.25   0.640    4.71       0
8    1.50e9 4/19/2…   15506    9.88    9.88       0    3.53   1.32     5.03       0
9    1.50e9 4/20/2…   10544    6.68    6.68       0    1.96   0.480    4.24       0
10    1.50e9 4/21/2…    9819    6.34    6.34       0    1.34   0.350    4.65       0
# … with 930 more rows, 5 more variables: very_active_minutes <dbl>,
#   fairly_active_minutes <dbl>, lightly_active_minutes <dbl>,
#   sedentary_minutes <dbl>, calories <dbl>, and abbreviated variable names
#   ¹​activity_date, ²​total_steps, ³​total_distance, ⁴​tracker_distance,
#   ⁵​logged_activities_distance, ⁶​very_active_distance,
#   ⁷​moderately_active_distance, ⁸​light_active_distance, ⁹​sedentary_active_distance
# ℹ Use `print(n = ...)` to see more rows, and `colnames()` to see all variable names
> activity <- rename_with(activity, tolower)


clean_names(calories)
# A tibble: 940 × 3
id activityday calories
<dbl> <chr>          <dbl>
  1 1503960366 4/12/2016       1985
2 1503960366 4/13/2016       1797
3 1503960366 4/14/2016       1776
4 1503960366 4/15/2016       1745
5 1503960366 4/16/2016       1863
6 1503960366 4/17/2016       1728
7 1503960366 4/18/2016       1921
8 1503960366 4/19/2016       2035
9 1503960366 4/20/2016       1786
10 1503960366 4/21/2016       1775
# … with 930 more rows
# ℹ Use `print(n = ...)` to see more rows
> calories <- rename_with(calories, tolower)

clean_names(intensities)
# A tibble: 940 × 10
id activ…¹ seden…² light…³ fairl…⁴ verya…⁵ seden…⁶ light…⁷ moder…⁸ verya…⁹
<dbl> <chr>     <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
  1    1.50e9 4/12/2…     728     328      13      25       0    6.06   0.550    1.88
2    1.50e9 4/13/2…     776     217      19      21       0    4.71   0.690    1.57
3    1.50e9 4/14/2…    1218     181      11      30       0    3.91   0.400    2.44
4    1.50e9 4/15/2…     726     209      34      29       0    2.83   1.26     2.14
5    1.50e9 4/16/2…     773     221      10      36       0    5.04   0.410    2.71
6    1.50e9 4/17/2…     539     164      20      38       0    2.51   0.780    3.19
7    1.50e9 4/18/2…    1149     233      16      42       0    4.71   0.640    3.25
8    1.50e9 4/19/2…     775     264      31      50       0    5.03   1.32     3.53
9    1.50e9 4/20/2…     818     205      12      28       0    4.24   0.480    1.96
10    1.50e9 4/21/2…     838     211       8      19       0    4.65   0.350    1.34
# … with 930 more rows, and abbreviated variable names ¹​activityday,
#   ²​sedentaryminutes, ³​lightlyactiveminutes, ⁴​fairlyactiveminutes,
#   ⁵​veryactiveminutes, ⁶​sedentaryactivedistance, ⁷​lightactivedistance,
#   ⁸​moderatelyactivedistance, ⁹​veryactivedistance
# ℹ Use `print(n = ...)` to see more rows
> intensities <- rename_with(intensities, tolower)

clean_names(sleep_day)
# A tibble: 410 × 5
id sleepday       totalsleeprecords totalminutesasleep totaltimeinbed
<dbl> <chr>                      <dbl>              <dbl>          <dbl>
  1 1503960366 4/12/2016 0:00                 1                327            346
2 1503960366 4/13/2016 0:00                 2                384            407
3 1503960366 4/15/2016 0:00                 1                412            442
4 1503960366 4/16/2016 0:00                 2                340            367
5 1503960366 4/17/2016 0:00                 1                700            712
6 1503960366 4/19/2016 0:00                 1                304            320
7 1503960366 4/20/2016 0:00                 1                360            377
8 1503960366 4/21/2016 0:00                 1                325            364
9 1503960366 4/23/2016 0:00                 1                361            384
10 1503960366 4/24/2016 0:00                 1                430            449
# … with 400 more rows
# ℹ Use `print(n = ...)` to see more rows
> sleep_day <- rename_with(sleep_day, tolower)

clean_names(weight_loginfo)
# A tibble: 67 × 8
id date                  weight_kg weight_p…¹   fat   bmi is_ma…²  log_id
<dbl> <chr>                     <dbl>      <dbl> <dbl> <dbl> <lgl>     <dbl>
  1 1503960366 5/2/2016 11:59:59 PM       52.6       116.    22  22.6 TRUE    1.46e12
2 1503960366 5/3/2016 11:59:59 PM       52.6       116.    NA  22.6 TRUE    1.46e12
3 1927972279 4/13/2016 1:08:52 AM      134.        294.    NA  47.5 FALSE   1.46e12
4 2873212765 4/21/2016 11:59:59 PM      56.7       125.    NA  21.5 TRUE    1.46e12
5 2873212765 5/12/2016 11:59:59 PM      57.3       126.    NA  21.7 TRUE    1.46e12
6 4319703577 4/17/2016 11:59:59 PM      72.4       160.    25  27.5 TRUE    1.46e12
7 4319703577 5/4/2016 11:59:59 PM       72.3       159.    NA  27.4 TRUE    1.46e12
8 4558609924 4/18/2016 11:59:59 PM      69.7       154.    NA  27.2 TRUE    1.46e12
9 4558609924 4/25/2016 11:59:59 PM      70.3       155.    NA  27.5 TRUE    1.46e12
10 4558609924 5/1/2016 11:59:59 PM       69.9       154.    NA  27.3 TRUE    1.46e12
# … with 57 more rows, and abbreviated variable names ¹​weight_pounds,
#   ²​is_manual_report
# ℹ Use `print(n = ...)` to see more rows
> weight_loginfo <- rename_with(weight_loginfo, tolower)


TO GET A SUMMARY OF THE COLUMNS NEEDED FOR MY ANALYSIS.
I will use the select()function and summary()function


# ACTIVITY DATASET
activity %>%  
  select(totalsteps,totaldistance,veryactiveminutes,fairlyactiveminutes,
         lightlyactiveminutes,sedentaryminutes, calories) %>%
  summary()

totalsteps    totaldistance    veryactiveminutes fairlyactiveminutes
Min.   :    0   Min.   : 0.000   Min.   :  0.00    Min.   :  0.00     
1st Qu.: 3790   1st Qu.: 2.620   1st Qu.:  0.00    1st Qu.:  0.00     
Median : 7406   Median : 5.245   Median :  4.00    Median :  6.00     
Mean   : 7638   Mean   : 5.490   Mean   : 21.16    Mean   : 13.56     
3rd Qu.:10727   3rd Qu.: 7.713   3rd Qu.: 32.00    3rd Qu.: 19.00     
Max.   :36019   Max.   :28.030   Max.   :210.00    Max.   :143.00     
lightlyactiveminutes sedentaryminutes    calories   
Min.   :  0.0        Min.   :   0.0   Min.   :   0  
1st Qu.:127.0        1st Qu.: 729.8   1st Qu.:1828  
Median :199.0        Median :1057.5   Median :2134  
Mean   :192.8        Mean   : 991.2   Mean   :2304  
3rd Qu.:264.0        3rd Qu.:1229.5   3rd Qu.:2793  
Max.   :518.0        Max.   :1440.0   Max.   :4900

# CALORIES DATAET
calories %>%
  select(calories) %>%
  summary()


calories   
Min.   :   0  
1st Qu.:1828  
Median :2134  
Mean   :2304  
3rd Qu.:2793  
Max.   :4900

# INTENSITIES DATASET
intensities %>%
  select(-id,activityday) %>%
  summary()

activityday        sedentaryminutes lightlyactiveminutes fairlyactiveminutes
Length:940         Min.   :   0.0   Min.   :  0.0        Min.   :  0.00     
Class :character   1st Qu.: 729.8   1st Qu.:127.0        1st Qu.:  0.00     
Mode  :character   Median :1057.5   Median :199.0        Median :  6.00     
Mean   : 991.2   Mean   :192.8        Mean   : 13.56     
3rd Qu.:1229.5   3rd Qu.:264.0        3rd Qu.: 19.00     
Max.   :1440.0   Max.   :518.0        Max.   :143.00     
veryactiveminutes sedentaryactivedistance lightactivedistance
Min.   :  0.00    Min.   :0.000000        Min.   : 0.000     
1st Qu.:  0.00    1st Qu.:0.000000        1st Qu.: 1.945     
Median :  4.00    Median :0.000000        Median : 3.365     
Mean   : 21.16    Mean   :0.001606        Mean   : 3.341     
3rd Qu.: 32.00    3rd Qu.:0.000000        3rd Qu.: 4.782     
Max.   :210.00    Max.   :0.110000        Max.   :10.710     
moderatelyactivedistance veryactivedistance
Min.   :0.0000           Min.   : 0.000    
1st Qu.:0.0000           1st Qu.: 0.000    
Median :0.2400           Median : 0.210    
Mean   :0.5675           Mean   : 1.503    
3rd Qu.:0.8000           3rd Qu.: 2.053    
Max.   :6.4800           Max.   :21.920

#SLEEP_DAY DATASET
sleep_day %>%
  select(totalsleeprecords, totalminutesasleep, totaltimeinbed) %>%
  summary()

totalsleeprecords totalminutesasleep totaltimeinbed 
Min.   :1.00      Min.   : 58.0      Min.   : 61.0  
1st Qu.:1.00      1st Qu.:361.0      1st Qu.:403.8  
Median :1.00      Median :432.5      Median :463.0  
Mean   :1.12      Mean   :419.2      Mean   :458.5  
3rd Qu.:1.00      3rd Qu.:490.0      3rd Qu.:526.0  
Max.   :3.00      Max.   :796.0      Max.   :961.0  

#WEIGHT_LOGINFO DATASET
weight_loginfo %>%
  select(weightkg, bmi) %>%
  summary()

weightkg           bmi       
Min.   : 52.60   Min.   :21.45  
1st Qu.: 61.40   1st Qu.:23.96  
Median : 62.50   Median :24.39  
Mean   : 72.04   Mean   :25.19  
3rd Qu.: 85.05   3rd Qu.:25.56  
Max.   :133.50   Max.   :47.54


FINDINGS FROM THE SUMMARY OF THE DATASETS

• Average BMI of all participants is 25.19, which is high. According to my CDC research, the healthy range for
BMI is 18.5 to 24.9. A BMI of 25.0 is overweight.

• Average sleep in minutes is 419.2minutes(6.99hrs) while the total time in bed is 458.5 minutes(7.64hrs).
The CDC recommends minimum of 8hrs sleep for adults

• The average sedentary minutes is 991.2minutes, lightly active minutes is 192.8minutes and very active minutes 
is 21.6 minutes. The sedentary minutes needs to be reduced while the active steps is very low and needs to increase.

• Average total daily steps is 7638 steps. My CDC research revealed that taking 8,000 steps per day is highly 
recommended as this was associated with a 51% lower risk for all=cause mortality (or death from all causes).




FORMATTING DATE COLUMNS FOR CONSISTENCY

I noticed that the format of the date column for the five data frames is not consistent, while some of the 
dataframes include slashes in the date colums, others include time. I will format them to remove the time and slashes
because i will merge the activity data frame with the sleep_day data frame, activity data frame and calories data
frame.

activity <- activity %>%
  rename(date = activitydate) %>%
  mutate(date = as.Date(date, format = "%m/%d/%Y"))

# A tibble: 6 × 15
id date       totalst…¹ total…² track…³ logge…⁴ verya…⁵ moder…⁶ light…⁷ seden…⁸ verya…⁹ fairl…˟ light…˟
<dbl> <date>         <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
  1 1503960366 2016-04-12     13162    8.5     8.5        0    1.88   0.550    6.06       0      25      13     328
2 1503960366 2016-04-13     10735    6.97    6.97       0    1.57   0.690    4.71       0      21      19     217
3 1503960366 2016-04-14     10460    6.74    6.74       0    2.44   0.400    3.91       0      30      11     181
4 1503960366 2016-04-15      9762    6.28    6.28       0    2.14   1.26     2.83       0      29      34     209
5 1503960366 2016-04-16     12669    8.16    8.16       0    2.71   0.410    5.04       0      36      10     221
6 1503960366 2016-04-17      9705    6.48    6.48       0    3.19   0.780    2.51       0      38      20     164


sleep_day <- sleep_day %>%
  rename(date = sleepday) %>%
  mutate(date = as.Date(date,format ="%m/%d/%Y %H" , tz=Sys.timezone()))

# A tibble: 6 × 5
id date       totalsleeprecords totalminutesasleep totaltimeinbed
<dbl> <date>                 <dbl>              <dbl>          <dbl>
  1 1503960366 2016-04-12                 1                327            346
2 1503960366 2016-04-13                 2                384            407
3 1503960366 2016-04-15                 1                412            442
4 1503960366 2016-04-16                 2                340            367
5 1503960366 2016-04-17                 1                700            712
6 1503960366 2016-04-19                 1                304            320


intensities <- intensities %>%
  rename(date = activityday) %>%
  mutate(date = as.Date(date, format = "%m/%d/%Y"))

# A tibble: 6 × 10
id date       seden…¹ light…² fairl…³ verya…⁴ seden…⁵ light…⁶ moder…⁷ verya…⁸
<dbl> <date>       <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
  1  1.50e9 2016-04-12     728     328      13      25       0    6.06   0.550    1.88
2  1.50e9 2016-04-13     776     217      19      21       0    4.71   0.690    1.57
3  1.50e9 2016-04-14    1218     181      11      30       0    3.91   0.400    2.44
4  1.50e9 2016-04-15     726     209      34      29       0    2.83   1.26     2.14
5  1.50e9 2016-04-16     773     221      10      36       0    5.04   0.410    2.71
6  1.50e9 2016-04-17     539     164      20      38       0    2.51   0.780    3.19


calories <- calories %>%
  rename(date = activityday) %>%
  mutate(date = as.Date(date, format = "%m/%d/%Y"))

# A tibble: 6 × 3
id date       calories
<dbl> <date>        <dbl>
  1 1503960366 2016-04-12     1985
2 1503960366 2016-04-13     1797
3 1503960366 2016-04-14     1776
4 1503960366 2016-04-15     1745
5 1503960366 2016-04-16     1863
6 1503960366 2016-04-17     1728


weight_loginfo <- weight_loginfo %>%
  mutate(date = as.Date(date,format ="%m/%d/%Y %H", tz=Sys.timezone()))

# A tibble: 6 × 8
id date       weightkg weightpounds   fat   bmi ismanualreport       logid
<dbl> <date>        <dbl>        <dbl> <dbl> <dbl> <lgl>                <dbl>
  1 1503960366 2016-05-02     52.6         116.    22  22.6 TRUE               1.46e12
2 1503960366 2016-05-03     52.6         116.    NA  22.6 TRUE               1.46e12
3 1927972279 2016-04-13    134.          294.    NA  47.5 FALSE              1.46e12
4 2873212765 2016-04-21     56.7         125.    NA  21.5 TRUE               1.46e12
5 2873212765 2016-05-12     57.3         126.    NA  21.7 TRUE               1.46e12
6 4319703577 2016-04-17     72.4         160.    25  27.5 TRUE               1.46e12


# A tibble: 6 × 15
id date       totalst…¹ total…² track…³ logge…⁴ verya…⁵ moder…⁶ light…⁷ seden…⁸ verya…⁹ fairl…˟ light…˟
<dbl> <date>         <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
  1 1503960366 2016-04-12     13162    8.5     8.5        0    1.88   0.550    6.06       0      25      13     328
2 1503960366 2016-04-13     10735    6.97    6.97       0    1.57   0.690    4.71       0      21      19     217
3 1503960366 2016-04-14     10460    6.74    6.74       0    2.44   0.400    3.91       0      30      11     181
4 1503960366 2016-04-15      9762    6.28    6.28       0    2.14   1.26     2.83       0      29      34     209
5 1503960366 2016-04-16     12669    8.16    8.16       0    2.71   0.410    5.04       0      36      10     221
6 1503960366 2016-04-17      9705    6.48    6.48       0    3.19   0.780    2.51       0      38      20     164


# A tibble: 6 × 5
id date       totalsleeprecords totalminutesasleep totaltimeinbed
<dbl> <date>                 <dbl>              <dbl>          <dbl>
  1 1503960366 2016-04-12                 1                327            346
2 1503960366 2016-04-13                 2                384            407
3 1503960366 2016-04-15                 1                412            442
4 1503960366 2016-04-16                 2                340            367
5 1503960366 2016-04-17                 1                700            712
6 1503960366 2016-04-19                 1                304            320


# A tibble: 6 × 10
id date       seden…¹ light…² fairl…³ verya…⁴ seden…⁵ light…⁶ moder…⁷ verya…⁸
<dbl> <date>       <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>   <dbl>
  1  1.50e9 2016-04-12     728     328      13      25       0    6.06   0.550    1.88
2  1.50e9 2016-04-13     776     217      19      21       0    4.71   0.690    1.57
3  1.50e9 2016-04-14    1218     181      11      30       0    3.91   0.400    2.44
4  1.50e9 2016-04-15     726     209      34      29       0    2.83   1.26     2.14
5  1.50e9 2016-04-16     773     221      10      36       0    5.04   0.410    2.71
6  1.50e9 2016-04-17     539     164      20      38       0    2.51   0.780    3.19


# A tibble: 6 × 3
id date       calories
<dbl> <date>        <dbl>
  1 1503960366 2016-04-12     1985
2 1503960366 2016-04-13     1797
3 1503960366 2016-04-14     1776
4 1503960366 2016-04-15     1745
5 1503960366 2016-04-16     1863
6 1503960366 2016-04-17     1728


# A tibble: 6 × 8
id date       weightkg weightpounds   fat   bmi ismanualreport       logid
<dbl> <date>        <dbl>        <dbl> <dbl> <dbl> <lgl>                <dbl>
  1 1503960366 2016-05-02     52.6         116.    22  22.6 TRUE               1.46e12
2 1503960366 2016-05-03     52.6         116.    NA  22.6 TRUE               1.46e12
3 1927972279 2016-04-13    134.          294.    NA  47.5 FALSE              1.46e12
4 2873212765 2016-04-21     56.7         125.    NA  21.5 TRUE               1.46e12
5 2873212765 2016-05-12     57.3         126.    NA  21.7 TRUE               1.46e12
6 4319703577 2016-04-17     72.4         160.    25  27.5 TRUE               1.46e12


MERGING DATA FRAMES

Before visualizing the data i will merge(inner join) the activity & sleep_day data frames, activity & 
  weight_loginfo data frames and activity & calories data frames to see any correlation between variables using the id and date columns which is common to both
data frames (primary keys).


activity_sleep_daily <- merge(activity,sleep_day, by=c ("id", "date"))


> head(activity_sleep_daily)
id       date totalsteps totaldistance trackerdistance loggedactivitiesdistance
1 1503960366 2016-04-12      13162          8.50            8.50                        0
2 1503960366 2016-04-13      10735          6.97            6.97                        0
3 1503960366 2016-04-15       9762          6.28            6.28                        0
4 1503960366 2016-04-16      12669          8.16            8.16                        0
5 1503960366 2016-04-17       9705          6.48            6.48                        0
6 1503960366 2016-04-19      15506          9.88            9.88                        0
veryactivedistance moderatelyactivedistance lightactivedistance sedentaryactivedistance
1               1.88                     0.55                6.06                       0
2               1.57                     0.69                4.71                       0
3               2.14                     1.26                2.83                       0
4               2.71                     0.41                5.04                       0
5               3.19                     0.78                2.51                       0
6               3.53                     1.32                5.03                       0
veryactiveminutes fairlyactiveminutes lightlyactiveminutes sedentaryminutes calories
1                25                  13                  328              728     1985
2                21                  19                  217              776     1797
3                29                  34                  209              726     1745
4                36                  10                  221              773     1863
5                38                  20                  164              539     1728
6                50                  31                  264              775     2035
totalsleeprecords totalminutesasleep totaltimeinbed
1                 1                327            346
2                 2                384            407
3                 1                412            442
4                 2                340            367
5                 1                700            712
6                 1                304            320

activity_weight_loginfo <- merge(activity,weight_loginfo, by=c ("id", "date"))

head(activity_weight_loginfo)
id       date totalsteps totaldistance trackerdistance loggedactivitiesdistance
1 1503960366 2016-05-02      14727          9.71            9.71                        0
2 1503960366 2016-05-03      15103          9.66            9.66                        0
3 1927972279 2016-04-13        356          0.25            0.25                        0
4 2873212765 2016-04-21       8859          5.98            5.98                        0
5 2873212765 2016-05-12       7566          5.11            5.11                        0
6 4319703577 2016-04-17         29          0.02            0.02                        0
veryactivedistance moderatelyactivedistance lightactivedistance sedentaryactivedistance
1               3.21                     0.57                5.92                    0.00
2               3.73                     1.05                4.88                    0.00
3               0.00                     0.00                0.25                    0.00
4               0.13                     0.37                5.47                    0.01
5               0.00                     0.00                5.11                    0.00
6               0.00                     0.00                0.02                    0.00
veryactiveminutes fairlyactiveminutes lightlyactiveminutes sedentaryminutes calories
1                41                  15                  277              798     2004
2                50                  24                  254              816     1990
3                 0                   0                   32              986     2151
4                 2                  10                  371             1057     1970
5                 0                   0                  268              720     1431
6                 0                   0                    3             1363     1464
weightkg weightpounds fat   bmi ismanualreport        logid
1     52.6     115.9631  22 22.65           TRUE 1.462234e+12
2     52.6     115.9631  NA 22.65           TRUE 1.462320e+12
3    133.5     294.3171  NA 47.54          FALSE 1.460510e+12
4     56.7     125.0021  NA 21.45           TRUE 1.461283e+12
5     57.3     126.3249  NA 21.69           TRUE 1.463098e+12
6     72.4     159.6147  25 27.45           TRUE 1.460938e+12


activity_calories_daily <- merge(activity,calories, by=c ("id", "date"))

head(activity_calories_daily)
id       date totalsteps totaldistance trackerdistance loggedactivitiesdistance
1 1503960366 2016-04-12      13162          8.50            8.50                        0
2 1503960366 2016-04-13      10735          6.97            6.97                        0
3 1503960366 2016-04-14      10460          6.74            6.74                        0
4 1503960366 2016-04-15       9762          6.28            6.28                        0
5 1503960366 2016-04-16      12669          8.16            8.16                        0
6 1503960366 2016-04-17       9705          6.48            6.48                        0
veryactivedistance moderatelyactivedistance lightactivedistance sedentaryactivedistance
1               1.88                     0.55                6.06                       0
2               1.57                     0.69                4.71                       0
3               2.44                     0.40                3.91                       0
4               2.14                     1.26                2.83                       0
5               2.71                     0.41                5.04                       0
6               3.19                     0.78                2.51                       0
veryactiveminutes fairlyactiveminutes lightlyactiveminutes sedentaryminutes calories.x
1                25                  13                  328              728       1985
2                21                  19                  217              776       1797
3                30                  11                  181             1218       1776
4                29                  34                  209              726       1745
5                36                  10                  221              773       1863
6                38                  20                  164              539       1728
calories.y
1       1985
2       1797
3       1776
4       1745
5       1863
6       1728




ANALYSE PHASE

CORRELATIONS

We will determine if there is a correlation between the following variables:
  1.Total steps and calories
2. Daily steps and sleep
3.Average daily steps and BMI





1. I will be using visulizations to show correlation between total steps and calories

ggplot(data=activity, aes(x=totalsteps, y=calories)) + 
  geom_point() + geom_smooth() + labs(title="total steps vs. calories")

`geom_smooth()` using method = 'loess' and formula = 'y ~ x'


https://6fabb64006ad4dc5b8a216b719de2d1f.app.posit.cloud/graphics/plot.png?width=652&height=518&randomizer=-1233584153


I see a positive correlation between total steps and calories, the more steps we take, the more calories
we burn.

2. Correlation between  daily steps and sleep

ggplot(data=activity_sleep_daily, aes(x=totalsteps, y=totalminutesasleep)) + 
  geom_point() + geom_smooth(color="orange") + labs(title="total steps vs. calories")

From the scatterplot and the trend line, I do not see any correlation between daily steps and sleep


3. Average daily steps and BMI 

I will have to categorize the users into types based on the article from National Library of Medicine 
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5488109/
  
  
  Steps per day	Classification
<5000	Sedentary lifestyle
5000–7499	Physically inactive
7500–9999	Moderately active
≥10,000	Physically active
≥12,500	Very active

I will get the average steps per participant and the BMI per partcipant by calculating mean steps and grouping
by id


average_steps_bmi <- activity_weight_loginfo %>%
  group_by(id) %>%
  summarise (mean_daily_steps = mean(totalsteps), mean_bmi = mean(bmi))


# A tibble: 8 × 3
id mean_daily_steps mean_bmi
<dbl>            <dbl>    <dbl>
  1 1503960366           14915      22.6
2 1927972279             356      47.5
3 2873212765            8212.     21.6
4 4319703577            5229      27.4
5 4558609924            7961      27.2
6 5577150313           12231      28  
7 6962181067            9774.     24.0
8 8877689391           17022.     25.5



Now, we will classify our users by the daily average steps


user_type <- average_steps_bmi %>%
  mutate(user_type = case_when(
    mean_daily_steps < 5000 ~ "sedentary",
    mean_daily_steps >= 5000 & mean_daily_steps <= 7499 ~ "physically inactive", 
    mean_daily_steps >= 7500 & mean_daily_steps <= 9999 ~ "moderately active", 
    mean_daily_steps >= 10000 & mean_daily_steps<= 12499 ~"physically active",
    mean_daily_steps >= 12500 ~ "very active"
  ))     


head(user_type,8)
# A tibble: 8 × 4
id mean_daily_steps mean_bmi user_type          
<dbl>            <dbl>    <dbl> <chr>              
  1 1503960366           14915      22.6 very active        
2 1927972279             356      47.5 sedentary          
3 2873212765            8212.     21.6 moderately active  
4 4319703577            5229      27.4 physically inactive
5 4558609924            7961      27.2 moderately active  
6 5577150313           12231      28   physically active  
7 6962181067            9774.     24.0 moderately active  
8 8877689391           17022.     25.5 very active  


ggplot(data=user_type, aes(x=user_type, y=mean_bmi)) + 
  geom_bar(stat = "identity", fill='orange') +
  labs(title="Average_daily_steps vs Average_bmi")


ggplot(data=user_type, aes(x=mean_daily_steps, y=mean_bmi)) + 
  geom_point() + geom_smooth() + labs(title="Average_daily_steps vs. Average_bmi")


From the scatter plot and trend line,there is no correlation between average bmi and average daily steps, 
we see that some of the participants who are physically active and very active have their bmi much above the CDC 
recommended range of 18.5 to 24.9. This is abnormal,all things being equal, higher number of steps should result in 
weight loss and a correspondent reduction in BMI.


TOTAL MINUTES ASLEEP AND TOTAL TIME IN BED

We will be computing the average daily minutes asleep and the average daily time in bed for each participant. We will
also get the difference between the time they are in bed and the time they are asleep, this will enable us know how
long they stay in bed without sleeping. From the summary we created above, we discovered that the partcipants do not
get up to 8 hours sleep daily as recommended by CDC. 


sleep_time <- sleep_day %>%
  group_by(id) %>%
  summarise (mean_totaltime_inbed = mean(totaltimeinbed), mean_total_minutesasleep
             = mean(totalminutesasleep))


head(sleep_time)
# A tibble: 6 × 3
id mean_totaltime_inbed mean_total_minutes_asleep
<dbl>                <dbl>                     <dbl>
  1 1503960366                 383.                      360.
2 1644430081                 346                       294 
3 1844505072                 961                       652 
4 1927972279                 438.                      417 
5 2026352035                 538.                      506.
6 2320127002                  69                        61 


TIME USERS STAY IN BED BUT NOT ASLEEP

sleep <- sleep_time %>%
  mutate(sleep_difference = mean_totaltime_inbed - mean_total_minutes_asleep)


head(sleep)
# A tibble: 6 × 4
id mean_totaltime_inbed mean_total_minutes_asleep sleep_difference
<dbl>                <dbl>                     <dbl>            <dbl>
  1 1503960366                 383.                      360.             22.9
2 1644430081                 346                       294              52  
3 1844505072                 961                       652             309  
4 1927972279                 438.                      417              20.8
5 2026352035                 538.                      506.             31.5
6 2320127002                  69                        61               8  

We will use the max()function to see the maximum time a user spent in bed without sleeping


max(sleep$sleep_difference)
[1] 309

We see from the max() function that a user spent up to 309 minutes (5hrs) in bed without sleeping.


We will use visualization(Histogram) to clearly show that users spent lots of time in bed without sleeping


ggplot(data=sleep, aes(x=sleep_difference)) + geom_histogram( fill='red') +
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title="Sleep diff")


INTENSITIES 

In order to find out how active the users are daily , we will compute the average sedentary minutes,average lightly 
active minutes,average fairly active minutes and average very active minutes for each user. We will also extract the
maximum minutes for each category

active_minutes <- activity %>%
  group_by(id) %>%
  summarise (mean_sedentary_minutes = mean(sedentaryminutes), mean_lightlyactive_minutes
             = mean(lightlyactiveminutes), mean_fairlyactive_minutes = mean(fairlyactiveminutes),
             mean_veryactive_minutes=mean(veryactiveminutes))

head(active_minutes)
# A tibble: 6 × 5
id mean_sedentary_minutes mean_lightlyactive_minutes mean_fairlyactive_minu…¹ mean_…²
<dbl>                  <dbl>                      <dbl>                    <dbl>   <dbl>
  1 1503960366                   848.                      220.                    19.2    38.7  
2 1624580081                  1258.                      153.                     5.81    8.68 
3 1644430081                  1162.                      178.                    21.4     9.57 
4 1844505072                  1207.                      115.                     1.29    0.129
5 1927972279                  1317.                       38.6                    0.774   1.32 
6 2022484408                  1113.                      257.                    19.4    36.3  
# … with abbreviated variable names ¹​mean_fairlyactive_minutes, ²​mean_veryactive_minutes


max(active_minutes$mean_sedentary_minutes)
[1] 1317.419
> max(active_minutes$mean_lightlyactive_minutes)
[1] 327.9
> max(active_minutes$mean_fairlyactive_minutes)
[1] 61.26667
> max(active_minutes$mean_veryactive_minutes)
[1] 87.33333

Here, we see the maximum sedentary minutes for users is 1317.419(21.9 hrs), this shows that a particular user is
sedentary for nearly 22 hours in a day, the maximum lightly active minutes is 327.9minutes(5.4hrs), the maximum
fairly active minutes in 61.27 minutes(1 hr), and the maximum very active minutes is 87.3 minutes(1.45hrs)


WE WILL LIKE TO KNOW HOW OFTEN USERS MAKE USE OF THEIR DEVICES

We will create three categories of device usage based on number of days partcipants use their devices

1-11 days    low use
12-21 days   moderate use
22-31 days   high use

We will create a new data frame named device_use_frequency and a new column to show usage



Daily smart device usage.
We want to look at how often the participants wear their devices, this will enable us plan our marketing
strategy with a possibility of adding features which will encourage device use.


device_use_frequency <- activity %>%
  group_by(id) %>%
  summarize(days_used=sum(n())) %>%
  mutate(usage = case_when(
    days_used >= 1 & days_used <= 11 ~ "low use",
    days_used >= 12 & days_used <= 21 ~ "moderate use", 
    days_used >= 22 & days_used <= 31 ~ "high use", 
  ))



head(device_use_frequency, 20)
# A tibble: 20 × 3
id days_used usage       
<dbl>     <int> <chr>       
  1 1503960366        31 high use    
2 1624580081        31 high use    
3 1644430081        30 high use    
4 1844505072        31 high use    
5 1927972279        31 high use    
6 2022484408        31 high use    
7 2026352035        31 high use    
8 2320127002        31 high use    
9 2347167796        18 moderate use
10 2873212765        31 high use    
11 3372868164        20 moderate use
12 3977333714        30 high use    
13 4020332650        31 high use    
14 4057192912         4 low use     
15 4319703577        31 high use    
16 4388161847        31 high use    
17 4445114986        31 high use    
18 4558609924        31 high use    
19 4702921684        31 high use    
20 5553957443        31 high use   



daily_use_percent <- daily_use_frequency %>%
  group_by(usage) %>%
  summarise(total = n()) %>%
  mutate(totals = sum(total)) %>%
  group_by(usage) %>%
  summarise(total_percent = total / totals) %>%
  mutate(labels = scales::percent(total_percent))

daily_use_percent$usage <- factor(daily_use_percent$usage, levels = c("high use", "moderate use", "low use"))

head(daily_use_percent)
# A tibble: 3 × 3
usage        total_percent labels
<fct>                <dbl> <chr> 
  1 high use            0.879  87.9% 
2 low use             0.0303 3.0%  
3 moderate use        0.0909 9.1% 

Now, we will use the new table to create a pie chart


daily_use_percent %>%
  ggplot(aes(x="",y=total_percent, fill=usage, color="black")) +
  geom_bar(stat = "identity", width = 1)+
  coord_polar("y", start=0)+
  theme_minimal()+
  theme(axis.title.x= element_blank(),
        axis.title.y = element_blank(),
        panel.border = element_blank(), 
        panel.grid = element_blank(), 
        axis.ticks = element_blank(),
        axis.text.x = element_blank(),
        plot.title = element_text(hjust = 0.5, size=14, face = "bold")) +
  geom_text(aes(label = labels),
            position = position_stack(vjust = 0.5))+
  scale_fill_manual(values = c("#006633","#00e673","#80ffbf"),
                    labels = c("High use - 22 to 31 days",
                               "Moderate use - 12 to 21 days",
                               "Low use - 1 to 11 days"))+
  labs(title="Daily use of smart device")

From the pie chart we can wee that 87.9% of users use their devices between 22 and 31 days in the month, 9.1% of 
users use their devices between 12 and 21 days in the month while 3% of users use their devices between 1 and 11
days in the month.

CONCLUSION (ACT PHASE)

The datasets provided have small sample size and may not give a true reflection of the users habits since we do not
have enough demographics from a much larger sample size.

Summary of High level recommendation to Executive Management and marketing team of Bellabeat


1.	On the average, Bellbeat users take 7,638 steps which is lower than the CDC recommended daily steps of 8,000.

From our analysis we discovered a positive correlation between the total number of steps taken and the number of 
calories burnt. The marketing team should encourage potential users to purchase bellbeat device. 
This will count their daily steps and enable them ensure they reach the 8,000 CDC recommended daily steps, in
order to stay healthy and reduce the risk of mortality from all causes diseases by 51%.

2.	On the average, users of Bellabeat products sleep for 419.2minutes(6.99hrs), while their total time in bed 
is 458.5 minutes(7.64hrs). The CDC recommends minimum of 8 hours sleep for adults. From my analysis, we also
discovered that a particular user stayed in bed for 309 minutes(5hrs) without sleeping. I recommend that the
marketing team should input sleep alerts into the Bellabeat app, this will serve as a reminder to users to leave
whatever they are doing while in bed and sleep in order to stay healthy.

3.	From my analysis, we discovered a negative correlation between total steps and BMI in some users. We discovered
that those who are very active and physically active, have their BMI above the CDC recommended range of 18.5 to 24.9. In two instances we discovered a user who took 12,231 steps, categorized as physically active but with a BMI of 28 and another user who is very active, took 17,022 steps but has a BMI of 25.5.
Based on this,  Bellabeat marketing team should encourage the users of the Bellabeatapp  to watch their diet in 
order to loose weight, stay healthy and avoid health related issues which may arise due to overweight.


4.	We discovered that the average sedentary daily minutes is 991.2 minutes(16.5hrs) while the average very 
active minutes is 21.16 minutes. We also discovered that for one of the users sedentary minutes was as high as 
1317.41 minutes(21.9hrs).Bellabeat app users should be encouraged to take advantage of the fact that the Bellabeat
app keeps record of their activity level and reduce the sedentary minutes of 16.5 hours as well as increase
the active minutes which is too low, in order to stay healthy. 

Bellabeat app usage
5.	We observed from our analysis that 87.9% of the Bellabeat app users make frequent use of their app, 9.1% use the
app moderately while 3% use the app sparingly. Considering all the advantages highlighted above which making use of
the app offers such as:
  •	monitoring daily steps to ensure it meets up to the 8,000 steps recommended by CDC.
•	monitoring total time asleep to ensure users get at least 8 hrs sleep daily.
•	Reducing daily diet to ensure BMI stays within the CDC recommended BMI range of 18.5 to 24.9
•	monitoring daily activity level to ensure sedentary minutes is reduced and active minutes is increased 
significantly.

Users of Bellabeat app are encouraged to ensure constant use of the app in order to take advantage of these benefits
and stay healthy. 
The founders of Bellabeat app are advised to embed all the features in the bellabeat app into a well designed all 
purpose wrist watch which the users will love to wear frequently.
