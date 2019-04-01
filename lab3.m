function Lab3()
	Psi2 = csvread("factorT");
	Y = csvread("respY");
	 
	N = length(Psi2)
	Psi1(1:N, 1)  =  1;
	 
	Psi3 = Psi2
	for i = 1:1:N
	    Psi3(i) = Psi3(i)*Psi2(i)
	end
	    
	Psi = horzcat(Psi1,  transpose(Psi2),  transpose(Psi3));
	 
	param = inv(transpose(Psi)*Psi) * transpose(Psi)  *  transpose(Y);
	Yt = param(1)  +  param(2)  *  Psi2  +  param(3)  *  Psi3;
	delta = sqrt(sum((Y  -  Yt).^2));
	fprintf("%.2f\n%.2f,  %.2f,  %.2f\n",  delta,  param(1),  param(2),  param(3));
	plot(Psi2,  Y, ".b");
	hold on;
	plot(Psi2,  Yt, "k");
	hold off;
	grid on;
	deltaS = sprintf('\\Delta = %.5f\n', delta);
	text(20, 240, deltaS, 'Units', 'pixels');
	par1 = sprintf('\\theta(1) = %.5f\n', param(1));
	text(20, 300, par1, 'Units', 'pixels');
	par2 = sprintf('\\theta(2) = %.5f\n', param(2));
	text(20, 280, par2, 'Units', 'pixels');
	par3 = sprintf('\\theta(3) = %.5f\n', param(3));
	text(20, 260, par3, 'Units', 'pixels');
	 
	xlabel('T');
	ylabel('Y');
end
