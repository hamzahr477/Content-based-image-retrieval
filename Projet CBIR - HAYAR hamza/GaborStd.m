function GStd=GaborStd(image, gamma, psi, theta, bw, lambda, pi)
currentGabor = myGabor(image, gamma, psi, theta, bw, lambda, pi);
GStd = std(currentGabor);
end