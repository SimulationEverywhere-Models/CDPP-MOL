n = 20;
m = 200;

xf = 1;
tf = 0.25;

dx = xf / (n - 1)
dt = tf / (m - 1)

cell = zeros(n,m);

% valores iniciales (el ultimo se fuerza por error numerico de sin(pi)
for i=1:n
  cell(i,1) = 100 * sin(pi * (i-1) * dx);  
end
cell(n,1) = 0;

dx2 = dx^2
r = dt/dx2    

alpha = 1

% computo
for j = 2:m
  for i = 1:n    
    if (i == 1)
      %cell(i,j) = cell(i,j-1) + alpha * dt * ((cell(i+1,j-1) - cell(i,j-1))/dx2);
      cell(i,j) = 0;
    elseif (i == n)
      cell(i,j) = 0;
      %cell(i,j) = cell(i,j-1) + alpha * dt * ((cell(i-1,j-1) - cell(i,j-1))/dx2);
    else
      cell(i,j) = cell(i,j-1) + alpha * dt * ((cell(i+1,j-1) - 2 * cell(i,j-1) + cell(i-1,j-1))/dx2);
    end                
  end
end

%cell
figure
mesh(cell)
