function GMean=GaborMean(image, gamma, psi, theta, bw, lambda, pi)
currentGabor = myGabor(image, gamma, psi, theta, bw, lambda, pi);
GMean = mean(currentGabor);
end