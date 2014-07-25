# Codebook.

## Variable Names.

The output from "names(reduceddataFrame)" gives the following list:

1. "Subject" -- Integer from 1 - 30 representing the individual test subject.
2. "Activity" -- Six level factor:
  * Walking;
  * Walking Upstairs;
  * Walking Downstairs;
  * Sitting;
  * Standing;
  * Laying down.
3. "timeBodyAcceleration.mean...X"
4. "timeBodyAcceleration.mean...Y"                    
5. "timeBodyAcceleration.mean...Z"
6. "timeBodyAcceleration.std...X"                     
7. "timeBodyAcceleration.std...Y"
8. "timeBodyAcceleration.std...Z"                     
9. "timeGravityAcceleration.mean...X" 
10. "timeGravityAcceleration.mean...Y"                 
11. "timeGravityAcceleration.mean...Z"
12. "timeGravityAcceleration.std...X"                  
13. "timeGravityAcceleration.std...Y"    
14. "timeGravityAcceleration.std...Z"                  
15. "timeBodyAccelerationJerk.mean...X"  
16. "timeBodyAccelerationJerk.mean...Y"                
17. "timeBodyAccelerationJerk.mean...Z"  
18. "timeBodyAccelerationJerk.std...X"                 
19. "timeBodyAccelerationJerk.std...Y"   
20. "timeBodyAccelerationJerk.std...Z"                 
21. "timeBodyGyro.mean...X"                          
22. "timeBodyGyro.mean...Y"                            
23. "timeBodyGyro.mean...Z"                           
24. "timeBodyGyro.std...X"                             
25. "timeBodyGyro.std...Y"                            
26. "timeBodyGyro.std...Z"                             
27. "timeBodyGyroJerk.mean...X"                       
28. "timeBodyGyroJerk.mean...Y"                        
29. "timeBodyGyroJerk.mean...Z"                       
30. "timeBodyGyroJerk.std...X"                         
31. "timeBodyGyroJerk.std...Y"                       
32. "timeBodyGyroJerk.std...Z"                         
33. "timeBodyAccelerationMagnitude.mean.."           
34. "timeBodyAccelerationMagnitude.std.."              
35. "timeGravityAccelerationMagnitude.mean.."        
36. "timeGravityAccelerationMagnitude.std.."           
37. "timeBodyAccelerationJerkMagnitude.mean.."        
38. "timeBodyAccelerationJerkMagnitude.std.."          
39. "timeBodyGyroMagnitude.mean.."                    
40. "timeBodyGyroMagnitude.std.."                      
41. "timeBodyGyroJerkMagnitude.mean.."                
42. "timeBodyGyroJerkMagnitude.std.."                  
43. "frequencyBodyAcceleration.mean...X"              
44. "frequencyBodyAcceleration.mean...Y"               
45. "frequencyBodyAcceleration.mean...Z"              
46. "frequencyBodyAcceleration.std...X"                
47. "frequencyBodyAcceleration.std...Y"                
48. "frequencyBodyAcceleration.std...Z"                
49. "frequencyBodyAcceleration.meanFreq...X"         
50. "frequencyBodyAcceleration.meanFreq...Y"           
51. "frequencyBodyAcceleration.meanFreq...Z"          
52. "frequencyBodyAccelerationJerk.mean...X"           
53. "frequencyBodyAccelerationJerk.mean...Y"          
54. "frequencyBodyAccelerationJerk.mean...Z"           
55. "frequencyBodyAccelerationJerk.std...X"           
56. "frequencyBodyAccelerationJerk.std...Y"            
57. "frequencyBodyAccelerationJerk.std...Z"           
58. "frequencyBodyAccelerationJerk.meanFreq...X"       
59. "frequencyBodyAccelerationJerk.meanFreq...Y"     
60. "frequencyBodyAccelerationJerk.meanFreq...Z"       
61. "frequencyBodyGyro.mean...X"                      
62. "frequencyBodyGyro.mean...Y"                       
63. "frequencyBodyGyro.mean...Z"                       
64. "frequencyBodyGyro.std...X"                        
65. "frequencyBodyGyro.std...Y"                        
66. "frequencyBodyGyro.std...Z"                        
67. "frequencyBodyGyro.meanFreq...X"                   
68. "frequencyBodyGyro.meanFreq...Y"                   
69. "frequencyBodyGyro.meanFreq...Z"                   
70. "frequencyBodyAccelerationMagnitude.mean.."        
71. "frequencyBodyAccelerationMagnitude.std.."         
72. "frequencyBodyAccelerationMagnitude.meanFreq.."    
73. "frequencyBodyAccelerationJerkMagnitude.mean.."    
74. "frequencyBodyAccelerationJerkMagnitude.std.."     
75. "frequencyBodyAccelerationJerkMagnitude.meanFreq.."
76. "frequencyBodyGyroMagnitude.mean.."                
77. "frequencyBodyGyroMagnitude.std.."                 
78. "frequencyBodyGyroMagnitude.meanFreq.."            
79. "frequencyBodyGyroJerkMagnitude.mean.."       
80. "frequencyBodyGyroJerkMagnitude.std.."             
81. "frequencyBodyGyroJerkMagnitude.meanFreq.." 

## Variables 3--81:

The variable name is built up as follows:  
* time -- the variable is a time series measurement;  
* frequency -- a frequency domain variable computed from the time series measurements using the Fast Fourier Transform technique.  
* Body/Gravity --- the readings, after processing were split into two components, a Body acceleration and a Gravity accleration;  
* Accleration -- linear acceleration readings;  
* Jerk -- accelerations were differentiated with respect to time to give a Jerk reading;  
* Magnitude -- the magnitude of the three dimensional readings using the Euclidean normm;  
* XYZ -- the x, y, and z components of the acceleration and gyroscope readings.  

## Reducing the data.

The original data file comprised 10299 rows and 561 variables measured for each of six activities performed by 30 test subjects grouped into a training set and a test set.
The test (/test/X_test.txt) and training (train/X_test.txt) sets were combined with their corresponding subject (test/subject_test.txt & train/subject_test.txt) and activity (test/y_test.txt & train/y_test.txt).
The two data sets were combined and a descriptive activity name replaced the integers 1--6.

The dataset was then reduced by removing most of the 561 variables to leave 79 columns of data that related to mean or standard deviation readings.

The mean value of each variable for each of the 30 subjects and 6 activity levels was then computed using tapply to leave a reduced dataset of 180 rows and 81 columns.