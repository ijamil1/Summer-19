function result = logLikelihood3(N, mu, f, t_b, data)
  Psub2 = model2(N,f, mu, t_b);
  [rows, cols] = size(Psub2);
  result = 0;
  for i = 1:rows
      for j = 1:cols
          result = result - (data(i,j) * log(Psub2(i,j)));
      end
  end
end