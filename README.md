run_analysis.R
============
This R code creates a tidy dataset from the "Human Recognition Using Smartphones Data Set" provided by the UCI Machine Learnings Respository (see http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The code will work if the source data zip file is first opened in the researcher's working directory. The tidy dataset merges the test and training datasets from the source data (details below). From that combined data, it extracts a subset of vectors from the 561 feature vectors with time and frequency domain variables. The subsetted vectors are in two groups: means and standard deviations. For the means data the code extracts the 46 vectors with "mean" in the column name. For the standard deviation data it extracts the 33 vectors with "std" in the column name. We then have a 10299x46 dataframe of mean data and a 10299x33 dataframe of standard deviation data. The code then cleans the column names so that the names are all lowercase, alphabetic, and as intuitive as possible. (See codebook for details). 

Finally, the code creates files with the averages of the means for each of the 46 vectors sorted by participant (filename: meanmeanbyparticipant.txt); the averages of the means for each of the 46 vectors sorted by activity (filename: meanmeanbyactivity.txt); the average of the standard deviations for each of the 33 vectors sorted by participant (filename: meansdbyparticipant.txt); the average of the standard deviation for each of the 33 vectors sorted by activity (filename: meansdbyactivity.txt). 

ORIGINAL SOURCE DATA INFORMATION (from URL above) 

The original data source is: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 

Source Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Check the README.txt file for further details about this dataset.

Source Attribute Information:

For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
- 
Source Citation Request:

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
