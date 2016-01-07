# Code Book

## Study Design

The datasets here are tidy datasets prepared from raw data from the below study. The details of this study are as follows:

### Human Activity Recognition Using Smartphones Dataset Version 1.0  
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.  
Smartlab - Non Linear Complex Systems Laboratory  
DITEN - Università degli Studi di Genova.  
Via Opera Pia 11A, I-16145, Genoa, Italy.  
activityrecognition@smartlab.ws  
www.smartlab.ws

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

The raw data as included in the directory './Raw Data' is made up as follows:

For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.  
* Triaxial Angular velocity from the gyroscope.  
* A 561-feature vector with time and frequency domain variables.  
* Its activity label.  
* An identifier of the subject who carried out the experiment.

The dataset includes the following files:

* 'README.txt'  
* 'features_info.txt': Shows information about the variables used on the feature vector.  
* 'features.txt': List of all features.  
* 'activity_labels.txt': Links the class labels with their activity name.  
* 'train/X_train.txt': Training set.  
* 'train/y_train.txt': Training labels.  
* 'test/X_test.txt': Test set.  
* 'test/y_test.txt': Test labels.  

The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.  
* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis.  
* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.  
* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

Notes: 

* Features are normalized and bounded within [-1,1]  
* Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

### Analysis

This raw data was then used as input to the R script run_analysis.R and the outputs are the tidy data sets, provided here as tidyx.txt and summarydata.txt. 

* tidyx.txt was prepared by combining the data for the feature vectors from the training and test sets (X_train.txt and X_test.txt). From this, the elements representing the mean and standard deviation of each of the 33 variables were selected. This data is then combined with the variables for activity label and subject id to prepare a complete dataset. The names of the variables were also updated to be more readable and in line with the concepts of tidy data. The final data set is included as tidyx.txt

* summarydata.txt was then prepared from tidyx.txt, with the mean for each subject and for each activity calculated for all of the 66 feature variables in tidyx.txt. The variable names were also upadted to reflect this summarisation. The tidy data set is presented as summarydata.txt

## Code Book

### tidyx

The features in tidyx are taken directly from the original data provided from the aforementioned study. In total there are 10,299 observations of the 68 features. The features from the study come from accelerometer and gyroscope 3-axial raw signals time domain accelerometer x, y and z components and time domain gyroscope x, y and z components. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (time domain body acceleration x, y and z components and time domain gravity acceleration x, y and z components) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (time domain body acceleration jerk x, y and z components and time domain body gyroscope jerk x, y and z components). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (time domain body acceleration magnitude, time domain gravity acceleration magnitude, time domain body acceleration jerk magnitude, time domain body gyroscope magnitude, time domain body gyroscope jerk magnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing frequency domain body acceleration x, y and z components, frequency domain body acceleration jerk x, y and z components, frequency domain body gyroscope x, y and z components, frequency domain body acceleration jerk magnitude, frequency domain body gyroscope magnitude, frequency domain body gyroscope jerk magnitude. (Note the frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern, and tidyx contains the estmates for the mean and standard deviations of these variables for each pattern.


In order, the features contained in tidyx.txt are:

1. **subject**  
The unique number of the subject for each pattern  
Ranges from 1-30

2. **activity**  
The label of the activity for the given observation, taking the values:  
		laying  
		sitting  
		standing  
		walking  
		walking downstairs  
		walking upstairs  
         
3. **time domain body acceleration mean in x direction**  
	estimate of mean of body acceleration in x direction in the time domain  
	Normalised acceleration in range [-1,1]  
                     
4. **time domain body acceleration mean in y direction**  
	estimate of mean of body acceleration in y direction in the time domain  
		Normalised acceleration in range [-1,1] 
                        
5. **time domain body acceleration mean in z direction**  
	estimate of mean of body acceleration in z direction in the time domain  
		Normalised acceleration in range [-1,1]
                      
6. **time domain body acceleration standard deviation in x direction**  
	estimate of standard deviation of body acceleration in x direction in the time domain  
		Normalised acceleration in range [-1,1] 
         
7. **time domain body acceleration standard deviation in y direction**  
	estimate of standard deviation of body acceleration in y direction in the time domain  
		Normalised acceleration in range [-1,1]        
 
8. **time domain body acceleration standard deviation in z direction**  
	estimate of standard deviation of body acceleration in z direction in the time domain  
		Normalised acceleration in range [-1,1]     
  
9. **time domain gravity acceleration mean in x direction**  
        estimate of mean of gravitational acceleration in x direction in the time domain  
		Normalised acceleration in range [-1,1]  
         
10. **time domain gravity acceleration mean in y direction**  
	estimate of mean of gravitational acceleration in y direction in the time domain  
		Normalised acceleration in range [-1,1] 
                    
11. **time domain gravity acceleration mean in z direction**  
	estimate of mean of gravitational acceleration in z direction in the time domain  
		Normalised acceleration in range [-1,1]
                    
12. **time domain gravity acceleration standard deviation in x direction**  
	estimate of standard deviation of gravitational acceleration in x direction in the time domain  
		Normalised acceleration in range [-1,1] 
       
13. **time domain gravity acceleration standard deviation in y direction**  
	estimate of standard deviation of gravitational acceleration in y direction in the time domain  
		Normalised acceleration in range [-1,1]  

14. **time domain gravity acceleration standard deviation in z direction**
	estimate of standard deviation of gravitational acceleration in z direction in the time domain  
		Normalised acceleration in range [-1,1]
       
15. **time domain body acceleration jerk mean in x direction**  
	estimate of mean of body acceleration jerk in x direction in the time domain  
		Normalised jerk in range [-1,1]
                    
16. **time domain body acceleration jerk mean in y direction**  
	estimate of mean of body acceleration jerk in y direction in the time domain  
		Normalised jerk in range [-1,1]   
                
17. **time domain body acceleration jerk mean in z direction**  
	estimate of mean of body acceleration jerk in z direction in the time domain  
		Normalised jerk in range [-1,1] 
                 
18. **time domain body acceleration jerk standard deviation in x direction**  
	estimate of standard deviation of body acceleration jerk in x direction in the time domain  
		Normalised jerk in range [-1,1]  
   
19. **time domain body acceleration jerk standard deviation in y direction**  
	estimate of standard deviation of body acceleration jerk in y direction in the time domain  
		Normalised jerk in range [-1,1]       

20. **time domain body acceleration jerk standard deviation in z direction**  
	estimate of standard deviation of body acceleration jerk in y direction in the time domain  
		Normalised jerk in range [-1,1]
       
21. **time domain body gyroscope mean in x direction**  
	estimate of mean of body gyroscope acceleration in x direction in the time domain  
		Normalised acceleration in range [-1,1]
                           
22. **time domain body gyroscope mean in y direction**  
	estimate of mean of body gyroscope acceleration in y direction in the time domain  
		Normalised acceleration in range [-1,1]  
                       
23. **time domain body gyroscope mean in z direction**  
	estimate of mean of body gyroscope acceleration in z direction in the time domain  
		Normalised acceleration in range [-1,1]  
                         
24. **time domain body gyroscope standard deviation in x direction**  
	estimate of standard deviation of body gyroscope acceleration in x direction in the time domain  
		Normalised acceleration in range [-1,1]
             
25. **time domain body gyroscope standard deviation in y direction**  
	estimate of standard deviation of body gyroscope acceleration in y direction in the time domain  
		Normalised acceleration in range [-1,1] 
            
26. **time domain body gyroscope standard deviation in z direction**  
	estimate of standard deviation of body gyroscope acceleration in z direction in the time domain  
		Normalised acceleration in range [-1,1]         
   
27. **time domain body gyroscope jerk mean in x direction**  
	estimate of mean of body gyroscope acceleration jerk in x direction in the time domain  
		Normalised jerk in range [-1,1]
	                      
28. **time domain body gyroscope jerk mean in y direction**  
	estimate of mean of body gyroscope acceleration jerk in y direction in the time domain  
		Normalised jerk in range [-1,1]
                      
29. **time domain body gyroscope jerk mean in z direction**  
	estimate of mean of body gyroscope acceleration jerk in z direction in the time domain  
		Normalised jerk in range [-1,1]
                      
30. **time domain body gyroscope jerk standard deviation in x direction**  
	estimate of standard deviation of body gyroscope acceleration jerk in x direction in the time domain  
		Normalised jerk in range [-1,1]        

31. **time domain body gyroscope jerk standard deviation in y direction**  
	estimate of standard deviation of body gyroscope acceleration jerk in y direction in the time domain  
		Normalised jerk in range [-1,1]
        
32. **time domain body gyroscope jerk standard deviation in z direction**  
	estimate of standard deviation of body gyroscope acceleration jerk in z direction in the time domain  
		Normalised jerk in range [-1,1] 
      
33. **time domain body acceleration mean of magnitude**  
	estimate of mean of body acceleration magnitude in the time domain  
		Normalised acceleration in range [-1,1]     
                     
34. **time domain body acceleration standard deviation of magnitude**  
	estimate of standard deviation of body acceleration magnitude in the time domain  
		Normalised acceleration in range [-1,1]
            
35. **time domain gravity acceleration mean of magnitude**  
	estimate of mean of gravitational acceleration magnitude in the time domain  
		Normalised acceleration in range [-1,1]	
                       
36. **time domain gravity acceleration standard deviation of magnitude**  
	estimate of standard deviation of gravitational acceleration magnitude in the time domain  
		Normalised acceleration in range [-1,1] 
        
37. **time domain body acceleration jerk mean of magnitude**  
	estimate of mean of body acceleration jerk magnitude in the time domain  
		Normalised jerk in range [-1,1]   
                     
38. **time domain body acceleration jerk standard deviation of magnitude**  
	estimate of standard deviation of body acceleration jerk magnitude in the time domain  
		Normalised jerk in range [-1,1]
          
39. **time domain body gyroscope mean of magnitude**  
	estimate of mean of body gyroscope acceleration magnitude in the time domain  
		Normalised acceleration in range [-1,1]
                             
40. **time domain body gyroscope standard deviation of magnitude**  
	estimate of standard deviation of body gyroscope acceleration magnitude in the time domain  
		Normalised acceleration in range [-1,1]
               
41. **time domain body gyroscope jerk mean of magnitude**  
	estimate of mean of body gyroscope acceleration jerk magnitude in the time domain  
		Normalised jerk in range [-1,1]

42. **time domain body gyroscope jerk standard deviation of magnitude**  
	estimate of standard deviation of body gyroscope acceleration jerk magnitude in the time domain  
		Normalised jerk in range [-1,1]

43. **frequency domain body acceleration mean in x direction**  
	estimate of mean of body acceleration in x direction in the frequency domain  
		Normalised acceleration in range [-1,1]

44. **frequency domain body acceleration mean in y direction**  
	estimate of mean of body acceleration in y direction in the frequency domain  
		Normalised acceleration in range [-1,1]

45. **frequency domain body acceleration mean in z direction**  
	estimate of mean of body acceleration in z direction in the frequency domain  
		Normalised acceleration in range [-1,1]    
               
46. **frequency domain body acceleration standard deviation in x direction**  
	estimate of standard deviation of body acceleration in x direction in the frequency domain  
		Normalised acceleration in range [-1,1]


47. **frequency domain body acceleration standard deviation in y direction**
	estimate of standard deviation of body acceleration in y direction in the frequency domain  
		Normalised acceleration in range [-1,1]

48. **frequency domain body acceleration standard deviation in z direction**  
	estimate of standard deviation of body acceleration in z direction in the frequency domain  
		Normalised acceleration in range [-1,1]

49. **frequency domain body acceleration jerk mean in x direction**  
	estimate of mean of body acceleration jerk in x direction in the frequency domain  
		Normalised jerk in range [-1,1]    

50. **frequency domain body acceleration jerk mean in y direction**  
	estimate of mean of body acceleration jerk in y direction in the frequency domain  
		Normalised jerk in range [-1,1]    

51. **frequency domain body acceleration jerk mean in z direction**  
	estimate of mean of body acceleration jerk in z direction in the frequency domain  
		Normalised jerk in range [-1,1]    

52. **frequency domain body acceleration jerk standard deviation in x direction**  
	estimate of standard deviation of body acceleration jerk in x direction in the frequency domain  
		Normalised jerk in range [-1,1] 
   
53. **frequency domain body acceleration jerk standard deviation in y direction**  
	estimate of standard deviation of body acceleration jerk in y direction in the frequency domain  
		Normalised jerk in range [-1,1]    

54. **frequency domain body acceleration jerk standard deviation in z direction**  
	estimate of standard deviation of body acceleration jerk in z direction in the frequency domain  
		Normalised jerk in range [-1,1]
    
55. **frequency domain body gyroscope mean in x direction**  
	estimate of mean of body gyroscope acceleration in x direction in the frequency domain  
		Normalised acceleration in range [-1,1]    

56. **frequency domain body gyroscope mean in y direction**  
	estimate of mean of body gyroscope acceleration in y direction in the frequency domain  
		Normalised acceleration in range [-1,1]

57. **frequency domain body gyroscope mean in z direction**  
	estimate of mean of body gyroscope acceleration in z direction in the frequency domain  
		Normalised acceleration in range [-1,1]

58. **frequency domain body gyroscope standard deviation in x direction**  
	estimate of standard deviation of body gyroscope acceleration in x direction in the frequency domain  
		Normalised acceleration in range [-1,1]

59. **frequency domain body gyroscope standard deviation in y direction**  
	estimate of standard deviation of body gyroscope acceleration in y direction in the frequency domain  
		Normalised acceleration in range [-1,1]

60. **frequency domain body gyroscope standard deviation in z direction**  
	estimate of standard deviation of body gyroscope acceleration in z direction in the frequency domain  
		Normalised acceleration in range [-1,1]

61. **frequency domain body acceleration mean of magnitude**  
	estimate of mean of body acceleration magnitude in the frequency domain  
		Normalised acceleration in range [-1,1]	
                     
62. **frequency domain body acceleration standard deviation of magnitude**
	estimate of standard deviation of body acceleration magnitude in the frequency domain  
		Normalised acceleration in range [-1,1]	

63. **frequency domain body acceleration jerk mean of magnitude**  
	estimate of mean of body acceleration jerk magnitude in the frequency domain  
		Normalised jerk in range [-1,1]	

64. **frequency domain body acceleration jerk standard deviation of magnitude**  
	estimate of standard deviation of body acceleration jerk magnitude in the frequency domain  
		Normalised jerk in range [-1,1]	

65. **frequency domain body gyroscope mean of magnitude**  
	estimate of mean of body gyroscope acceleration magnitude in the frequency domain  
		Normalised acceleration in range [-1,1]	

66. **frequency domain body gyroscope standard deviation of magnitude**  
	estimate of standard deviation of body gyroscope acceleration magnitude in the frequency domain  
		Normalised acceleration in range [-1,1]

67. **frequency domain body gyroscope jerk mean of magnitude**  
	estimate of mean of body gyroscope acceleration jerk magnitude in the frequency domain  
		Normalised jerk in range [-1,1]

68. **frequency domain body gyroscope jerk standard deviation of magnitude**  
	estimate of standard deviation of body gyroscope acceleration jerk magnitude in the frequency domain  
		Normalised jerk in range [-1,1]

### summarydata

This data set contains a summary of the 68 variables in tidyx above. Each variable is summarised by activity and by subject, taking the mean across all observations in tidyx. Hence each row in summarydata.txt contains the mean of the variables across all observations for the given activity and subject.

**Note** In this data set, the first variable is activity, and the second is subject. Other than this, the variables are all in the same order as before (now being averages, not individual observations)


## References

* Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012