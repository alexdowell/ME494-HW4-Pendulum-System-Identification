# ME494 HW4: Pendulum System Identification  

## Description  
This repository contains the fourth homework assignment for **ME494**, focusing on system identification using a pendulum with a motor-driven hinge. The homework involves stepwise regression, input design for PID controller estimation, and verification using new data. The repository includes MATLAB scripts, datasets, and a PDF containing problem descriptions.  

## Files Included  

### **Part 1: Stepwise Regression for System Identification**  
- **File:** SID_HW4.m  
- **File:** qube_data_multistep.mat  
- **Topics Covered:**  
  - Forward selection OLS for pendulum dynamics  
  - Model selection based on R² values  
  - F-statistics for regressor selection  
  - Analysis of model accuracy for increasing regressors  

### **Part 2: Input Design for PID Controller Estimation**  
- **File:** pend_input_design_sample.m  
- **File:** pend.m  
- **Topics Covered:**  
  - Frequency sweep input generation  
  - Proportional-Integral-Derivative (PID) control analysis  
  - Model fitting using measured and desired pendulum states  
  - Calculation of estimated PID gains and confidence intervals  

### **Part 3: Verification and Model Evaluation**  
- **File:** mksqw.m  
- **File:** mksswp.m  
- **Topics Covered:**  
  - Creating step input and frequency sweep signals  
  - Simulating pendulum response to designed inputs  
  - Model validation using independent datasets  
  - Comparison of predicted vs. actual motor command signals  

### **Homework Assignment Document**  
- **File:** SID_HW4_2022.pdf  
- **Contents:**  
  - Problem descriptions and equations  
  - MATLAB implementation steps  
  - Expected results and discussion points  

## Installation  
Ensure MATLAB is installed before running the scripts. No additional toolboxes are required.  

## Usage  

### **Performing Stepwise Regression on Pendulum Data**  
1. Open MATLAB.  
2. Load `qube_data_multistep.mat` into the workspace.  
3. Run the script:  
   ```SID_HW4```  
4. View the estimated parameters and R² values for different model configurations.  

### **Designing and Running Frequency Sweep Input for PID Estimation**  
1. Open MATLAB.  
2. Run the script:  
   ```pend_input_design_sample```  
3. Observe the generated frequency sweep and the corresponding pendulum response.  

### **Verifying Model Performance with Step Input Data**  
1. Open MATLAB.  
2. Run the script:  
   ```SID_HW4```  
3. View validation plots comparing predicted and actual motor command signals.  

## Example Output  

- **Stepwise Regression Results**  
  - Increasing R² values with additional regressors  
  - F-statistics for each regressor during model selection  

- **PID Controller Model Estimation**  
  - Estimated Parameters: `[Kp, Ki, Kd]` values computed from step input data  
  - Comparison plot of measured vs. modeled motor commands  

- **Model Verification Results**  
  - Validation using independent step input dataset  
  - Residual analysis and error assessment  

## Contributions  
This repository is intended for academic research and educational use. Contributions and modifications are welcome.  

## License  
This project is open for research and educational purposes.  

---  
**Author:** Alexander Dowell  

