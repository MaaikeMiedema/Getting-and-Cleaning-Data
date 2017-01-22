# Codebook

This code book describes the dataset summaryData.txt 

Data: 181 rows, 68 columns, the variable names are in the first row

## Variables

### Identifiers
| column | variable name | description | values |
| ------ | ------------- | ----------- | ------ | 
| 1 | subjectID | Identifies the subjects in study | 1 to 30 |
| 2 | activity | Activity the subject performs |walking, walking upstairs, walking downstairs, sitting, standing, laying|

### Measurements

#### Values 
Values are the means of the variable per subjectID and activity
All values are are normalized and bounded within [-1,1]

#### Meaning variable names
The measurement variable names are constructed and have the following meaning:

| name component| meaning |
|------------------|--------|
| time | time domain signal|
| frequency | frequency domain signal (after Fast Fourier transform) |
| Body | induced by body motion |
| Gravity | induced by gravity |
| Accelerator | linear acceleration measured by accelerator |
| Gyroscope | angular velocity measured by gyroscope |
| Jerk | calculated jerk |
| XYZ | X-,Y-, or Z component of measurement |
| Magnitude | calculated magnitude from X,Y,Z values (Euclidian) |
| Mean | mean value of measurements (on original data) |
| StdDev | standard deviation of measurements |

#### Measurement variable names
All measurement variables and their position is given in the table below:

| column | variable name |
|----------|-----------------|
| 3 | timeBodyAcceleratorMeanX |
| 4 | timeBodyAcceleratorMeanY |
| 5 | timeBodyAcceleratorMeanZ |
| 6 | timeBodyAcceleratorStdDevX |
| 7 | timeBodyAcceleratorStdDevY |
| 8 | timeBodyAcceleratorStdDevZ |
| 9 | timeGravityAcceleratorMeanX |
| 10 | timeGravityAcceleratorMeanY |
| 11 | timeGravityAcceleratorMeanZ |
| 12 | timeGravityAcceleratorStdDevX | 
| 13 | timeGravityAcceleratorStdDevY |
| 14 | timeGravityAcceleratorStdDevZ |
| 15 | timeBodyAcceleratorJerkMeanX |
| 16 | timeBodyAcceleratorJerkMeanY |
| 17 | timeBodyAcceleratorJerkMeanZ |
| 18 | timeBodyAcceleratorJerkStdDevX |
| 19 | timeBodyAcceleratorJerkStdDevY |
| 20 | timeBodyAcceleratorJerkStdDevZ |
| 21 | timeBodyGyroscopeMeanX |
| 22 | timeBodyGyroscopeMeanY |
| 23 | timeBodyGyroscopeMeanZ |
| 24 | timeBodyGyroscopeStdDevX |
| 25 | timeBodyGyroscopeStdDevY |
| 26 | timeBodyGyroscopeStdDevZ |
| 27 | timeBodyGyroscopeJerkMeanX |
| 28 | timeBodyGyroscopeJerkMeanY |
| 29 | timeBodyGyroscopeJerkMeanZ |
| 30 | timeBodyGyroscopeJerkStdDevX |
| 31 | timeBodyGyroscopeJerkStdDevY |
| 32 | timeBodyGyroscopeJerkStdDevZ |
| 33 | timeBodyAcceleratorMagnitudeMean |
| 34 | timeBodyAcceleratorMagnitudeStdDev |
| 35 | timeGravityAcceleratorMagnitudeMean |
| 36 | timeGravityAcceleratorMagnitudeStdDev |
| 37 | timeBodyAcceleratorJerkMagnitudeMean |
| 38 | timeBodyAcceleratorJerkMagnitudeStdDev |
| 39 | timeBodyGyroscopeMagnitudeMean |
| 40 | timeBodyGyroscopeMagnitudeStdDev |
| 41 | timeBodyGyroscopeJerkMagnitudeMean |
| 42 | timeBodyGyroscopeJerkMagnitudeStdDev |
| 43 | frequencyBodyAcceleratorMeanX |
| 44 | frequencyBodyAcceleratorMeanY |
| 45 | frequencyBodyAcceleratorMeanZ |
| 46 | frequencyBodyAcceleratorStdDevX |
| 47 | frequencyBodyAcceleratorStdDevY |
| 48 | frequencyBodyAcceleratorStdDevZ |
| 49 | frequencyBodyAcceleratorJerkMeanX |
| 50 | frequencyBodyAcceleratorJerkMeanY |
| 51 | frequencyBodyAcceleratorJerkMeanZ |
| 52 | frequencyBodyAcceleratorJerkStdDevX |
| 53 | frequencyBodyAcceleratorJerkStdDevY |
| 54 | frequencyBodyAcceleratorJerkStdDevZ |
| 55 | frequencyBodyGyroscopeMeanX |
| 56 | frequencyBodyGyroscopeMeanY |
| 57 | frequencyBodyGyroscopeMeanZ |
| 58 | frequencyBodyGyroscopeStdDevX |
| 59 | frequencyBodyGyroscopeStdDevY |
| 60 | frequencyBodyGyroscopeStdDevZ |
| 61 | frequencyBodyAcceleratorMagnitudeMean |
| 62 | frequencyBodyAcceleratorMagnitudeStdDev |
| 63 | frequencyBodyAcceleratorJerkMagnitudeMean |
| 64 | frequencyBodyAcceleratorJerkMagnitudeStdDev |
| 65 | frequencyBodyGyroscopeMagnitudeMean |
| 66 | frequencyBodyGyroscopeMagnitudeStdDev |
| 67 | frequencyBodyGyroscopeJerkMagnitudeMean |
| 68 | frequencyBodyGyroscopeJerkMagnitudeStdDev |

