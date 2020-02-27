function [A_k S] = cerinta4(image, k)
	A = double(imread(image));
	miu = [];
	[m n] = size(A);
	% cerinta 4, pasul 1
	for i = 1 : m
		val_miu = 0;
		for j = 1 : n
			val_miu = val_miu + A(i,j);
		endfor
		val_miu = val_miu / n;
		miu = [miu; val_miu];
	endfor
	
	% cerinta 4, pasul 2
	for i = 1 : m
		A(i, :) = A(i, :) - miu(i);
	endfor

	% cerinta 4, pasul 3
	Z = 1 / (n-1) * A * A';

	% cerinta 4, pasul 4
	[V S] = eig(Z);

	% cerinta 4, pasul 5
	W = V(:, 1:k);

	% cerinta 4, pasul 6
	Y = W' * A;

	% cerinta 4, pasul 7
	A_k = W * Y + miu;
	
endfunction