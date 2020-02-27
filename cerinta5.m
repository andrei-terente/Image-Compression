function cerinta5()
	image_in = ['in/images/image1.gif' ; 'in/images/image4.gif'];
	for nr = 1 : 2
		figure;
	A = double(imread(image_in(nr, :)));
	[m n] = size(A);
	k = [1:19 20:20:99 100:30:min(m,n)];
	L = length(k);

	% k ales in mod aleator
	[A_k S] = cerinta3(image_in(nr, :), 40);
	v_s = diag(S);

	% generare grafic 1
	subplot(2, 2, 1);
	plot(diag(S), '.');
	title('grafic 1');

	% generare grafic 2
	subplot(2, 2, 2);
	info_k = [];
	for i = 1 : L
		info_k = [info_k sum(v_s(1:k(i))) / sum(v_s(1:min(m, n)))];
	endfor
	plot(k, info_k, '.');
	title('grafic 2');

	% generare grafic 3
	subplot(2, 2, 3);
	err_k = [];
	for l = 1 : length(k)
		[A_k S] = cerinta3(image_in(nr, :), k(l));
		val_sum = 0;
		for i = 1 : m
			for j = 1 : n
				val_sum = val_sum + ((A(i,j) - A_k(i,j)) ^ 2);
			endfor
		endfor
		val_sum = val_sum / (m * n);
		err_k = [err_k val_sum];
	endfor
	plot(k, err_k, '.');
	title('grafic 3');

	% generare grafic 4
	subplot(2, 2, 4);
	compression_rate = [];
	for i = 1 : length(k)
		val = (2 * k(i) + 1) / n;
		compression_rate = [compression_rate val];
	endfor
	plot(k, compression_rate, '.');
	title('grafic 4');
endfor

endfunction