The structure of this code book is divided into 3 sections. 
1.	The DATASET section describes the structure of the dataset
2.	The VARIABLES section lists and describes the variables
3.	The TRANSFORMATIONS section describes the transformations that were carried out to obtain the data set in the TidyData.txt file.


# DATASET
This code book pertains to the dataset located in the TidyData.txt file of this repository. 
The TidyData.txt data file is a text file, containing space-separated values. 
Background information on this data set is provided in the README.md file in this repository. The source data can be found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
The variable names are contained in the first row; these are listed and described in the VARIABLES. The rows following the 1st row contain the values of these variables.


# VARIABLES
There are 81 columns in total - 2 are identifiers. 
In each row, for each subject and activity, there are 79 signal measurements (representing means or standard deviations).

## Identifiers
    Subject - Integer, ranging from 1 to 30.
    Activity - Factor with 6 possible values. Possible values are
      o	WALKING: the subject was walking
      o	WALKING_UPSTAIRS: the subject was walking upstairs
      o	WALKING_DOWNSTAIRS: the subject was walking downstairs
      o	SITTING: the subject was sitting
      o	STANDING: the subject was standing
      o	LAYING: the subject was lying down

## Average and Standard Deviation of Measurements
- Acceleration measurements (variables containing Accelerometer) were made in g's (9.81 m.s⁻²)
- Angular velocity measurements (variables containing Gyroscope) were made in radians per second (rad.s⁻¹).
- X, Y, and Z are used to denote axial signals in the 3 directions: X, Y and Z.
- The magnitude of three-dimensional signals were calculated using the Euclidean norm.
- The body linear acceleration and angular velocity were derived in time to obtain "Jerk" signals.
Features were normalized and bounded within [-1,1].

The measurements are classified in two Domains: 
  1.	Time-domain signal variables begin with "TimeDomain"; these result from the capture of accelerometer and gyroscope raw 
        signals.
  2.	Frequency-domain signals begin with "FrequencyDomain"; these result from the application of a Fast Fourier 
        Transform (FFT) to some of the Time-domain signals.


### Time-domain signals include the following variables: 

#### Mean Time-domain body acceleration (in directions X, Y, & Z)
    TimeDomainBodyAccelerometerMeanX
    TimeDomainBodyAccelerometerMeanY
    TimeDomainBodyAccelerometerMeanZ
#### Standard deviation of Time-domain body acceleration (in directions X, Y, & Z)
    TimeDomainBodyAccelerometerStandardDeviationX
    TimeDomainBodyAccelerometerStandardDeviationY
    TimeDomainBodyAccelerometerStandardDeviationZ

#### Mean Time-domain gravity acceleration (in directions X, Y, & Z)
    TimeDomainGravityAccelerometerMeanX
    TimeDomainGravityAccelerometerMeanY
    TimeDomainGravityAccelerometerMeanZ
#### Standard deviation of Time-domain gravity acceleration (in directions X, Y, & Z)
    TimeDomainGravityAccelerometerStandardDeviationX
    TimeDomainGravityAccelerometerStandardDeviationY
    TimeDomainGravityAccelerometerStandardDeviationZ

#### Mean Time-domain body acceleration jerk (in directions X, Y, & Z)
    TimeDomainBodyAccelerometerJerkMeanX
    TimeDomainBodyAccelerometerJerkMeanY
    TimeDomainBodyAccelerometerJerkMeanZ
#### Standard deviation of Time-domain body acceleration jerk (in directions X, Y, & Z)
    TimeDomainBodyAccelerometerJerkStandardDeviationX
    TimeDomainBodyAccelerometerJerkStandardDeviationY
    TimeDomainBodyAccelerometerJerkStandardDeviationZ
    
#### Mean Time-domain body angular velocity (in directions X, Y, & Z)
    TimeDomainBodyGyroscopeMeanX
    TimeDomainBodyGyroscopeMeanY
    TimeDomainBodyGyroscopeMeanZ 
#### Standard deviation of Time-domain body angular velocity (in directions X, Y, & Z)
    TimeDomainBodyGyroscopeStandardDeviationX
    TimeDomainBodyGyroscopeStandardDeviationY
    TimeDomainBodyGyroscopeStandardDeviationZ

#### Mean Time-domain body angular velocity Jerk (in directions X, Y, & Z)
    TimeDomainBodyGyroscopeJerkMeanX
    TimeDomainBodyGyroscopeJerkMeanY
    TimeDomainBodyGyroscopeJerkMeanZ
#### Standard deviation of Time-domain body angular velocity Jerk (in directions X, Y, & Z)
    TimeDomainBodyGyroscopeJerkStandardDeviationX
    TimeDomainBodyGyroscopeJerkStandardDeviationY
    TimeDomainBodyGyroscopeJerkStandardDeviationZ

#### Time-domain body magnitude of acceleration (Mean and Standard Deviation)
    TimeDomainBodyAccelerometerMagnitudeMean
    TimeDomainBodyAccelerometerMagnitudeStandardDeviation
#### Time-domain gravity magnitude of acceleration (Mean and Standard Deviation)
    TimeDomainGravityAccelerometerMagnitudeMean
    TimeDomainGravityAccelerometerMagnitudeStandardDeviation
#### Time-domain body magnitude of acceleration jerk (Mean and Standard Deviation)
    TimeDomainBodyAccelerometerJerkMagnitudeMean
    TimeDomainBodyAccelerometerJerkMagnitudeStandardDeviation

#### Time-domain body magnitude of angular velocity (Mean and Standard Deviation)
    TimeDomainBodyGyroscopeMagnitudeMean
    TimeDomainBodyGyroscopeMagnitudeStandardDeviation
#### Time-domain body magnitude of angular velocity jerk (Mean and Standard Deviation)
    TimeDomainBodyGyroscopeJerkMagnitudeMean
    TimeDomainBodyGyroscopeJerkMagnitudeStandardDeviation

### Frequency-domain signals
#### Mean Frequency-domain body acceleration (in directions X, Y, & Z)
    FrequencyDomainBodyAccelerometerMeanX
    FrequencyDomainBodyAccelerometerMeanY
    FrequencyDomainBodyAccelerometerMeanZ
#### Standard deviation of Frequency-domain body acceleration (in directions X, Y, & Z)
    FrequencyDomainBodyAccelerometerStandardDeviationX
    FrequencyDomainBodyAccelerometerStandardDeviationY
    FrequencyDomainBodyAccelerometerStandardDeviationZ

#### 
    FrequencyDomainBodyAccelerometerMeanFrequencyX
    FrequencyDomainBodyAccelerometerMeanFrequencyY
    FrequencyDomainBodyAccelerometerMeanFrequencyZ

# TRANSFORMATIONS
The following transformations were applied to the source data:
- training and test data sets were merged.
- measurements of the means and standard deviations were extracted, and other columns were discarded.
- activity identifying numbers were replaced with descriptive names (listed in "Identifiers" in VARIABLES section)
- variable names were replaced with more descriptive names by expanding abbreviations and removing special characters. The list of 
  abbreviations expanded are as follows: 
    f changed to "FrequencyDomain",
    t changed to "TimeDomain",
    mean changed to "Mean", 
    std changed to "StandardDeviation",
    Acc changed to "Accelerometer",
    Gryo changed to "Gyroscope",
    Mag changed to "Magnitude",
    Freq changed to "Frequency"
- a final data set (TidyData.txt), containing the average of each variable for each activity and each subject, was created.

