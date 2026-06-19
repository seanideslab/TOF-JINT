# Covariance Initialization

`Sigma_xi` is initialized from static calibration sequences collected at representative hover thrust levels. Translation, rotation, extrinsic residual, and TOF depth residual variances define the baseline perturbation covariance blocks.

During operation, the covariance is updated from onboard pose-estimator outputs that fuse IMU measurements, visual odometry, flight-controller attitude estimates, and depth residuals. `Sigma_gimbal,k` is initialized from gimbal encoder and IMU angular-rate jitter and then scaled according to recent attitude-residual variance.
