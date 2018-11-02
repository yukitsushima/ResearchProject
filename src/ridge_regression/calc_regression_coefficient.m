function theta = calc_regression_coefficient(X, y, alpha)
    [c1, r1] = size(X); % N * K
    [c2, ~] = size(y); % N * 1
    assert(c1 == c2, 'input dimension might be different');
    
    Xt = transpose(X);
    theta = (Xt * X + alpha * eye(r1)) \ Xt * y;
end