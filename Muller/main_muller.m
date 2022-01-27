datos=""
f = @(x) x.^2 - 0*x + 12
xr = -2; 
h = 6;
a = -5; 
b = 0;
delta=1;

[raiz,datos,iter] = muller (f, xr, h);

  y=raiz;
  h=figure(1);
  x = a-delta:0.1:b+delta;
  plot (x, f(x), "linewidth", 4);
  hold on;
  plot([a a], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (a+0.1, 1, "a");
  plot([b b], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (b+0.1, 1, "b");
  plot([y y], [f(a-delta) -(f(a-delta))], 'k-', "linewidth", 2);
  text (y+0.1, 1, "y");
  
  legend ("f(x)");
  xlabel ("x");
  ylabel ("f(x)");
  set(gca, "linewidth", 2, "fontsize", 12)
  #set(gca, "xaxislocation", "zero");
  set(gca, "xaxislocation", "origin")
  #set(gca, "yaxislocation", "zero");
  set(gca, "yaxislocation", "origin");
  set(gca, "box", "on")
  
  [n,m] = size(datos);
  fprintf('Iter\tx0\tx1\tx2\traiz\t\ta\t\tb\tc\n');
  for i=1:n
    fprintf('%d\t',i);
    for j=1:m
      fprintf('%d\t',datos(i,j));
    endfor
    fprintf('\n');
  endfor