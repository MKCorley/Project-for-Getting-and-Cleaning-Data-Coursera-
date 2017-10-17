This code book pertains to the dataset located in the TidyData.txt file of this repository.
Background information on this data set is provided in the README.md file in this repository.

The structure of this code book is divided into 3 sections. 
1.	The DATASET section describes the structure of the dataset
2.	The VARIABLES section lists and describes the variables
3.	The TRANSFORMATIONS section describes the transformations that were carried out to obtain the data set based on the source data, found here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# DATA 
The TidyData.txt data file is a text file, containing space-separated values.
The variable names are contained in the first row; these are listed and described in the VARIABLES. The rows following the 1st row contain the values of these variables.


# VARIABLES
Each row contains, for a given subject and activity, 79 signal measurements. There are 2 identifiers.

## Identifiers
    Subject - subject identifier. Integer, ranging from 1 to 30.
    Activity - activity identifier. String with 6 possible values:
      o	WALKING: the subject was walking
      o	WALKING_UPSTAIRS: the subject was walking upstairs
      o	WALKING_DOWNSTAIRS: the subject was walking downstairs
      o	SITTING: the subject was sitting
      o	STANDING: the subject was standing
      o	LAYING: the subject was lying down

## Average and Standard Deviation of Measurements
- Acceleration measurements (variables containing Accelerometer) were made in g's (9.81 m.s⁻²)
- Gyroscope measurements (variables containing Gyroscope) were made in radians per second (rad.s⁻¹).
Features were normalized and bounded within [-1,1].

The measurements are classified in two Domains: 
  1.	Time-domain signals (variables prefixed by TimeDomain), resulting from the capture of accelerometer and gyroscope raw signals.
  2.	Frequency-domain signals (variables prefixed by FrequencyDomain), resulting from the application of a Fast Fourier Transform            (FFT) to some of the time-domain signals.

### Time-domain signals

### Frequency-domain signals


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

