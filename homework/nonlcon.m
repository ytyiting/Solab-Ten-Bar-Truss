function [g, geq] = nonlcon(x)
  [sigma, Q] = sol_TenBarTruss(x(1),x(2));
    g(1) = max(sigma) - 250 * 10.^6;
    g(2) = -min(sigma) - 250 * 10.^6;
    g(3) = (Q(3,1).^2+Q(4,1).^2).^0.5 - 0.02;
    geq = [];
    
